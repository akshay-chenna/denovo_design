cd /home/chemical/phd/chz198152/scratch/covid/kb1-chC1
module load apps/gromacs/5.1.4/intel

mkdir emposes

for i in {1..6000}
do

line=`sed "${i}q;d" names${j}.txt`

mkdir em$line
cd em$line
cp ../dockedposes/${line}.gro .
cp -r ../essentials/* .
mv topol.top dock${line}.top

gmx_mpi editconf -f ${line}.gro -o dock${line}_n.gro -bt cubic -d 1.5 -c
gmx_mpi solvate -cp dock$line'_'n.gro -cs spc216.gro -p dock${line}.top -o dock$line'_'s.gro
gmx_mpi grompp -f ions.mdp -c dock$line'_'s.gro -p dock$line.top -o ions$line.tpr 
echo 13 | gmx_mpi genion -s ions$line.tpr -o dock$line'_'i.gro -p dock$line.top -neutral -conc 0.15 
gmx_mpi grompp -f em.mdp -c dock$line'_'i.gro -p dock$line.top -o em$line.tpr
gmx_mpi make_ndx -f dock$line'_'i.gro -o dock${line}.ndx << EOF
q
EOF

export OMP_NUM_THREADS=10
time mpirun -np 1 gmx_mpi mdrun -v -s em$line.tpr -o em.trr -g em$line.log -c em$line.gro -ntomp 10
cp em$line.tpr em$line.log em$line.gro dock${line}.ndx ../emposes/.

cd ..

rm -rf em$line 

done
