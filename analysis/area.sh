# Script: finds sasa.
# 18-April-2022, IIT Delhi

cd $PBS_O_WORKDIR

module load apps/gromacs/2021.4/gnu
#mkdir areas
for j in {1..20} 
do
while read -r line
do
# Calculate SASA for dot products
gmx_mpi sasa -f outputs/m${j}-${line}_0001.pdb -s outputs/m${j}-${line}_0001.pdb -or areas/complex${j}_r${line} -oa areas/complex${j}_a${line} -o areas/complex${j}_t${line} -surface 0 -output 0 -ndots 200 -n data/ind${j}.ndx &
gmx_mpi sasa -f outputs/m${j}-${line}_0001.pdb -s outputs/m${j}-${line}_0001.pdb -or areas/nsp7${j}_r${line} -oa areas/nsp7${j}_a${line} -o areas/nsp7${j}_t${line} -surface 2 -output 2 -ndots 200 -n data/ind${j}.ndx &
gmx_mpi sasa -f outputs/m${j}-${line}_0001.pdb -s outputs/m${j}-${line}_0001.pdb -or areas/kb1${j}_r${line} -oa areas/kb1${j}_a${line} -o areas/kb1${j}_t${line} -surface 1 -output 1 -ndots 200 -n data/ind${j}.ndx &	
wait
done < list${j}.txt
done
