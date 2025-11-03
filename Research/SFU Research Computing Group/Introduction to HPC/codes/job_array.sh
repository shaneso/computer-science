#!/bin/bash
#SBATCH --array=1-30   # 30 jobs, other syntaxes: --array=1,2,3,5,7 --array=0-99%5
#SBATCH --job-name=myprog   # single job name for the array
#SBATCH --time=02:00:00     # maximum walltime per job
#SBATCH --mem=100           # maximum 100M per job
#SBATCH --output=myprog%A%a.out   # standard output
#SBATCH --error=myprog%A%a.err   # standard error
# in SBATCH lines %A" is replaced by jobID and "%a" with the array index
./myprogram input$SLURM_ARRAY_TASK_ID.dat
