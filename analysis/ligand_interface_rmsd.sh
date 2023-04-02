cd $PBS_O_WORKDIR
module load apps/gromacs/2021.4/gnu
mkdir ligand_interface_rmsd

# Calculates the ligand interface RMSD

while read -r l
do
echo 6 5 | gmx_mpi rms -s top_poses/${i}.gro -f emposes/em${l}.gro -n emposes/${l}.ndx -o ligand_interface_rmsd/${l}.xvg
done < data/names${i}.txt 
