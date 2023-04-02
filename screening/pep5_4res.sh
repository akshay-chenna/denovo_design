cd /home/chemical/phd/chz198152/scratch/vs/2dsimilarity
module load lib/openbabel/2.3.2/gnu
babel 4res_pep_5-1.pdb -O pep5_4res.smi
babel pep5_4res.smi cyclic_culled.sdf -ofpt -xfFP4 >> pep5_4res_cyclicculledscores.txt
sort pep5_4res_cyclicculledscores.txt | uniq >> temp.txt
mv temp.txt pep5_4res_cyclicculledscores.txt 
babel pep5_4res.smi cpp.sdf -ofpt -xfFP4 >> pep5_4res_cppscores.txt
