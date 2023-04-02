module load lib/openbabel/2.3.2/gnu
babel pep_5-1.pdb -O pep5.smi
babel pep5.smi cyclic_culled.sdf -ofpt -xfFP4 >> pep5_cyclicculledscores.txt
sort pep5_cyclicculledscores.txt | uniq >> temp.txt
mv temp.txt pep5_cyclicculledscores.txt 
babel pep5.smi cpp.sdf -ofpt -xfFP4 >> pep5_cppscores.txt
