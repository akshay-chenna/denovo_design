for i in {20..20}
do
	cd contacts${i}
	rm num*txt
	for j in {1..5000}
	do
	column -t m${i}-${j}.res.tsv | awk '{print $2}' | cut -d : -f 3 | sort -nu | sed '/^$/d' > m$i-${j}_nsp7rescontacts.txt
	done &
	cd ..
done
