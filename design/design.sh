## design

cd $PBS_O_WORKDIR
module load apps/Rosetta/2020.03/intel2019

folder=outputs
nstruct=9999

rm tracer*
rm -rf $folder
mkdir $folder

mpirun -np $PBS_NTASKS $ROSETTA_BIN/rosetta_scripts.mpi.linuxiccrelease -parser:protocol design_gkic.xml \
-s relax_renum.pdb \
-nstruct $nstruct \
-linmem_ig 100 \
-overwrite -write_all_connect_info \
-jd2:failed_job_exception false \
-out:path:pdb ./$folder/ \
-overwrite \
-out:file:scorefile design.fasc \
-symmetric_gly_tables true \
-mpi_tracer_to_file tracer.log 
#-out:file:silent pdbs.out 
