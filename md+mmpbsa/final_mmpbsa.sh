sort -u mmpbsa.txt | column -t | sed '/^$/d' | sed "/.......................000/d" | sed "/nan/d" > uniq_mmpbsa.txt
sort -u bad_mmpbsa.txt | column -t | sed '/^$/d' | sed "/.......................000/d" | sed "/nan/d" >> uniq_mmpbsa.txt
sort -u miss_mmpbsa.txt | column -t | sed '/^$/d' | sed "/.......................000/d" | sed "/nan/d" >> uniq_mmpbsa.txt
awk '{ print $0, $2+$3+$4+$5 }' uniq_mmpbsa.txt | column -t | sort -rnk 6 > final_mmpbsa.txt
