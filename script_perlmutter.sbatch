#!/bin/bash
#SBATCH --job-name=netpyne
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=64
#SBATCH --time=4:00:00
#SBATCH -C cpu
#SBATCH -q regular
#SBATCH --account m2043
#SBATCH --mail-type=BEGIN,END
#SBATCH --mail-user=kaykaur@ucdavis.edu

# load required modules
module load PrgEnv-gnu

# activate the conda environment 
# Recreate the conda environment on Perlmutter and rename
# conda activate netpyne-perlmutter
conda activate netpyne

# run the srun command with mpi
cd /global/homes/k/kpkaur28/BenShalomLab/BenShalomLab_M1_NetPyNE_CellReports_2023/sim

#set library path
export LD_LIBRARY_PATH=/opt/cray/pe/mpich/default/ofi/gnu/9.1/lib:/opt/cray/pe/mpich/default/gtl/lib:$LD_LIBRARY_PATH

# compile mod files
#nrnivmodl mod

# run the srun command with mpi
cd /global/homes/k/kpkaur28/BenShalomLab/BenShalomLab_M1_NetPyNE_CellReports_2023/sim

# mpiexec equivalent command
srun --mpi=pmi2 -n 64 -c 4 nrniv -python -mpi init.py

#using shifter image
# salloc -N 1 --image=balewski/ubu18-py3-mpich:v2 -t 30 -C cpu -q interactive
# srun -N 1 --mpi=pmi2 --module=gpu shifter python3 -mpi init.py
# srun -N 1 --mpi=pmi2 --module=gpu nrniv shifter python3 -mpi init.py