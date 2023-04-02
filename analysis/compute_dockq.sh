# Script: finds dockq.
# 21-April-2022, IIT Delhi

cd $PBS_O_WORKDIR
source $HOME/apps/load_conda.sh
conda activate env1

mkdir dockq

for j in {1..1}
do
for line in {1..5000}
do
./DockQ.py outputs/m${j}-${line}_0001.pdb top_poses/${j}.pdb >> dockq/dockq${j}_${line}.txt 
done 
done
