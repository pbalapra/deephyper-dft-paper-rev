#!/bin/bash

#MSUB -l partition=ruby
#MSUB -l nodes=8
#MSUB -q pall
#MSUB -l walltime=12:00:00
#MSUB -l advres=dat_0924
#MSUB -l qos=exempt
#MSUB -A heas
#MSUB -j eo

srun -N8 -n448 /usr/gapps/qsg/VASP/bin/vasp_dev_quartz5_5.4.4_TST_new_xray_patched >& output.txt


