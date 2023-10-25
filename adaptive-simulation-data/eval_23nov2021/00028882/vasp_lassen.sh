#!/bin/bash
#BSUB -nnodes 6 #nodes
#BSUB -W 720 #walltime in min
#BSUB -G wsilver             #account
#BSUB -e run.err             #stderr
#BSUB -o run.out             #stdout
#BSUB -J vasp                #name of job
#BSUB -q pbatch              #queue to use

# Run info and srun job launch
echo "### Start"
date
t1=$(date -u +'%s')

b1path=/g/g90/samanta1/VASP_LASSEN/FromArtur_29may2019/PGI_ESSL

source ${b1path}/env1.sh
jsrun -n16 -a10 -c10 -g0 -E OMP_NUM_THREADS=1 ${b1path}/bin/vasp_std

echo "### Finish"
date 
t2=$(date -u +'%s')
t=$(echo $t2 $t1 | gawk '{printf "%.3f\n", ($1-$2)/3600.0}')
echo "### Elapsed: $t"

