cd /home/chemical/phd/chz198152/scratch/covid/nsp8-12/emposes/

	for ((z = 1; z<=9; z++)); do
		mv em000$z.log em$z.log
		mv em000$z.tpr em$z.tpr
		mv em000$z.gro em$z.gro
	done
	for ((z = 10; z<=99; z++)); do
		mv em00$z.log em$z.log
                mv em00$z.tpr em$z.tpr
                mv em00$z.gro em$z.gro
	done
	for ((z = 100; z<=999; z++)); do
		mv em0$z.log em$z.log
                mv em0$z.tpr em$z.tpr
                mv em0$z.gro em$z.gro
	done
