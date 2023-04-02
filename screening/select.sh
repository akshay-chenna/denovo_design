while read -r line
do
	grep -e "   1      " ../s1/$line > 4res_$line
	grep -e "   3      " ../s1/$line >> 4res_$line
	grep -e "   7      " ../s1/$line >> 4res_$line
	grep -e "  10      " ../s1/$line >> 4res_$line
	sed -i '/CONECT/d' 4res_$line
done < ../s1/pep.list
