#!/bin/bash
#SBATCH --nodes=3                    # number of nodes
#SBATCH --mem=4000M                  # memory per node
#SBATCH --gpus-per-node=<gpuType>:1  # GPUs per node
#SBATCH --time=0-01:00               # walltime
srun ./gpu_program
