## design
conda deactivate
#cd ~/scratch/covid/rosettadesign_linearpep4/tat2_pep_nsp7
module load apps/Rosetta/2020.03/intel2019

folder=outputs
nstruct=1

rm tracer*

mpirun -np $PBS_NTASKS $ROSETTA_BIN/rosetta_scripts.mpi.linuxiccrelease -parser:protocol filterddg.xml \
-s ../dockedposes/1-1.pdb \
-nstruct $nstruct \
-write_all_connect_info \
-jd2:failed_job_exception false \
-out:file:scorefile filterddg.fasc
