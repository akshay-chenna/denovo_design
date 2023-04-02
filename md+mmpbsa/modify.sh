#Always ensure that the cyclotide is before NSP7. This is necessary for recognizing that the protein is a cyclic by pdb2gmx
module load apps/gromacs/2021.4/gnu
# Keeping the indices ready for sasa and mmpbsa calculations. CAREFUL! HETATOMS are not considered part of "protein", therefore use "chain" and keep only the "system" group to make chain A as index 1 and chain B as index 2. 
gmx_mpi make_ndx -f relax_renum_0124.pdb -o ind.ndx << EOF
keep 0
chain A
chain B
q
EOF
# Make changes in the residue names so that charmm can recogize them. Also add the residue entires in merged.hdb (copy paste the L version and rename it to Deg take ALA entry and duplicate it and rename it to DALA)
sed -i "s/HETATM/ATOM  /g" relax_renum_0124.pdb
sed -i 's/DAS /DASP/g' relax_renum_0124.pdb
sed -i 's/DGN /DGLN/g' relax_renum_0124.pdb
sed -i 's/DAR /DARG/g' relax_renum_0124.pdb
sed -i 's/DAL /DALA/g' relax_renum_0124.pdb
sed -i 's/DGU /DGLU/g' relax_renum_0124.pdb
sed -i 's/DAN /DASN/g' relax_renum_0124.pdb
sed -i 's/DTH /DTHR/g' relax_renum_0124.pdb
sed -i 's/DIL /DILE/g' relax_renum_0124.pdb
sed -i 's/DME /DMET/g' relax_renum_0124.pdb
sed -i 's/DPH /DPHE/g' relax_renum_0124.pdb
sed -i 's/DTY /DTYR/g' relax_renum_0124.pdb
sed -i 's/DTR /DTRP/g' relax_renum_0124.pdb
sed -i 's/DLY /DLYS/g' relax_renum_0124.pdb
sed -i 's/DVA /DVAL/g' relax_renum_0124.pdb
sed -i 's/DLE /DLEU/g' relax_renum_0124.pdb
sed -i 's/DSE /DSER/g' relax_renum_0124.pdb
sed -i 's/DPR /DPRO/g' relax_renum_0124.pdb
sed -i 's/DHI /DHSE/g' relax_renum_0124.pdb
#Remove all chain labels. Else it will throw some errors.
echo 0 | gmx_mpi trjconv -f relax_renum_0124.pdb -s relax_renum_0124.pdb -o a.pdb
#But include TER.
line=`grep -n "N   LYS     1    " a.pdb | cut -d : -f 1`
sed -i "$((line))iTER" a.pdb
# THIS CHARMM IS MODIFIED FOR DEALING WITH D AMINO ACIDS
gmx_mpi pdb2gmx -f a.pdb -ignh << EOF
1
1
EOF
