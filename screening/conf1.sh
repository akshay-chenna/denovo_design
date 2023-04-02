cd ~/scratch/vs_4res/cyclic2
source ~/.bashrc
loadalignit
mpirun -np 1 ~/scratch/apps/alignit/bin/align-it -r ../db/s1_4res/4res_pepconf51070.phar --refType PHAR -d ../db/cyclicm.phar --dbType PHAR -p 4res_pepconf51070_match90.phar -o 4res_pepconf51070_aligned90.pdb -s 4res_pepconf51070_score90.txt -e 0.90
