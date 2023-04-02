# Script to perform 10 ns MD of cyclotide protein complex
# 10-March-2022, IIT Delhi

cd $PBS_O_WORKDIR

# With topology generation, therefore use 2021 for handling cyclic backbones (of kb1)
nvidia-cuda-mps-control -d

md() {
	for i in {1..1} # Number of serial runs on each core
		do
		line=`sed "$1q;d" lists/x${j}`
		rm -rf md${line}
		mkdir md${line}
		cd md${line}
		#Always ensure that the cyclotide is before NSP7. This is necessary for recognizing that the protein is a cyclic by pdb2gmx
		cp ../cpp_designs/${line}.pdb .
		cp -r ../essentials/* .
		nohup bash simulation.sh
		cd .. 
	done
}

for task in {1..4} # Number of parallel runs
do
	md $task &
done
wait
