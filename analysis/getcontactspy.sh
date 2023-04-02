#cd $PBS_O_WORKDIR

module load apps/gromacs/5.1.4/intel
#source ~/apps/source_conda.sh
#conda activate env1

gmx_mpi trjconv -f md_cluster.xtc -s md.tpr -o md_solute.xtc

get_dynamic_contacts.py --topology top_5.pdb --trajectory md_solute.xtc --output output.tsv --cores 1 --itypes all --sele "chain A" --sele2 "chain B" --distout
get_contact_frequencies.py --input_files output.tsv --itypes all --output_file p5-1_nsp7_frequencies.res.tsv
