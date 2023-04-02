## design

cd $PBS_O_WORKDIR
module load apps/Rosetta/2020.03/intel2019

folder=outputs
nstruct=1

rm tracer*
rm -rf $folder
mkdir $folder

mpirun -np $PBS_NTASKS $ROSETTA_BIN/rosetta_scripts.mpi.linuxiccrelease -parser:protocol moverddg.xml \
-s tat2_p401_nsp7_colabfold/tat2p401nsp7_c1220_relaxed_rank_1_model_5.pdb \
-nstruct $nstruct \
-write_all_connect_info \
-jd2:failed_job_exception false \
-out:path:pdb ./$folder/ \
-mpi_tracer_to_file tracer.log \
-out:file:scorefile moverddg.fasc
