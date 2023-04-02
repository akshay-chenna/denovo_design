mkdir scores_1
for ((i=1; i<=5; i++)); do
for ((j=i; j<=5; j++)); do
for k in {0001..2000}; do

./DockQ.py ../docking/hex/dock$i'_'$j'-'$k.pdb ../docking/models/ros_00001.pdb >> 1-$i'_'$j'_'$k.txt
a=`tail -1 1-$i'_'$j'_'$k.txt | awk '{print $2}'`
echo -e "1-$i'_'$j'_'$k \t $a" >> score1.sc
mv *.txt scores_1/.
done
done
done

