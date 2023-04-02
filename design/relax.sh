## design

cd ~/scratch/covid/rosettadesign_linearpep4/relax
module load apps/Rosetta/2020.03/intel2019

folder=outputs
nstruct=1

rm tracer*
rm -rf $folder
mkdir $folder

mpirun -np $PBS_NTASKS $ROSETTA_BIN/relax.mpi.linuxiccrelease -database $ROSETTA_DB \
-l list.txt \
-nstruct $nstruct \
-relax:fast \
-write_all_connect_info \
-out:path:pdb ./$folder/ \
-out:file:scorefile relax.fasc 
#-score:weights interface.wts \
