#!/bin/bash
#SBATCH --ntasks=4   # number of MPI tasks
#SBATCH --cpus-per-task=12   # number of cores per task
#SBATCH --mem-per-cpu=3600   # memory per cpu
#SBATCH --time=2:00:00       # maximum walltime
if [ -n "$SLURM_CPUS_PER_TASK" ]; then
  omp_threads=$SLURM_CPUS_PER_TASK
else
  omp_threads=1
fi
export OMP_NUM_THREADS=$omp_threads
srun ./mpi_openmp_program
