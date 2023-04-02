## Relax the docked poses

cd $PBS_O_WORKDIR
module load apps/Rosetta/2021.38/gnu
j=98

folder=outputs${j}
nstruct=1

#rm tracer*
#rm -rf $folder
mkdir $folder

mpirun -np $PBS_NTASKS $ROSETTA_BIN/rosetta_scripts.mpi.linuxgccrelease -parser:protocol relax.xml \
-l missed.txt \
-nstruct $nstruct \
-linmem_ig 100 \
-overwrite -write_all_connect_info \
-jd2:failed_job_exception false \
-out:path:pdb ./$folder/ \
-overwrite \
-out:file:scorefile relax${j}.fasc \
-symmetric_gly_tables true #\-mpi_tracer_to_file tracer${j}.log 
#-out:file:silent pdbs.out 
