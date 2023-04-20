#!/bin/bash
#SBATCH --job-name=netpyne-p
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=64
#SBATCH --time=3:00:00
#SBATCH -C cpu
#SBATCH -q regular
#SBATCH --account m2043
#SBATCH --mail-type=BEGIN,END
#SBATCH --mail-user=kaykaur@ucdavis.edu
#SBATCH --output logs_p/%A_%a
#SBTACH --image=kpkaur28/neuron:v3

# load required modules
# module load PrgEnv-gnu

# activate the conda environment
# For conda environment to work on Perlmutter, have to make new one netpyne-perlmutter
# conda activate netpyne

# run the srun command with mpi
# cd /global/homes/k/kpkaur28/BenShalomLab/BenShalomLab_M1_NetPyNE_CellReports_2023/sim
cd /global/homes/k/kpkaur28/Project/BenShalomLab/BenShalomLab_M1_NetPyNE_CellReports_2023/sim

# compile mod files
nrnivmodl mod

# run the srun command with mpi
# cd /global/homes/k/kpkaur28/BenShalomLab/BenShalomLab_M1_NetPyNE_CellReports_2023/sim
cd /global/homes/k/kpkaur28/Project/BenShalomLab/BenShalomLab_M1_NetPyNE_CellReports_2023/sim

# mpiexec equivalent command
# srun --mpi=pmi2 -n 64 -c 4 nrniv -python -mpi init.py

# using shifter image
# salloc -N 4 --image=kpkaur28/neuron:v3 -t 30 -C cpu -q interactive  #works
# srun -n 2 shifter python3 -m mpi4py.bench helloworld # works
# srun -n 4 -c 4 shifter nrniv -python -mpi init.py  #standard way to use shifter
srun -n 64 -c 4 shifter --image=kpkaur28/neuron:v3 nrniv -python -mpi init.py  #standard way to use shifter

# srun -n 1 -c 4 nrniv shifter -python3 -mpi init.py 
# srun --mpi=pmi2 -n 1 -c 4 nrniv -python -mpi init.py  #works
# srun --mpi=pmi2 -n 1 -c 4 nrniv shifter -python -mpi init.py #works
# srun -N 1 --mpi=pmi2 --module=gpu shifter -python -mpi init.py
# srun -N 1 --mpi=pmi2 --module=gpu nrniv shifter -python -mpi init.py