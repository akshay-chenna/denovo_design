for i in {1..20}
do
	cd contacts${i}
	for j in {1..5000}
	do
	cat m${i}-${j}_independent_allcommon_contacts.txt >> ../design${i}_independent_allcommon_contacts.txt
	done &
	cd ..
done
