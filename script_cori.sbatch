#!/bin/bash
#SBATCH --job-name=netpyne-c
#SBATCH --nodes=1
#SBATCH --ntasks=64
#SBATCH --time=4:00:00
#SBATCH --partition=regular
#SBATCH -C haswell
#SBATCH --account m2043
#SBATCH --mail-type=BEGIN,END
#SBATCH --mail-user=kaykaur@ucdavis.edu
#SBATCH --output logs_c/%A_%a
#SBTACH --image=kpkaur28/neuron:v3

# load required modules
# module load intel
# module load impi
# module load openmpi/4.1.2
# module load gcc/10.3.0
# module load python

# activate the conda environment
# conda activate netpyne

# run the srun command with mpi
cd /global/homes/k/kpkaur28/Project/BenShalomLab/BenShalomLab_M1_NetPyNE_CellReports_2023/sim

#wrapper
#export LD_LIBRARY_PATH=/opt/cray/pe/mpt/7.7.19/gni/mpich-INTEL/16.0/lib/pkgconfig:/opt/cray/pe/mpt/7.7.19/gni/mpich-intel/16.0/lib:$LD_LIBRARY_PATH

# compile mod files
nrnivmodl mod

# run the srun command with mpi
cd /global/homes/k/kpkaur28/Project/BenShalomLab/BenShalomLab_M1_NetPyNE_CellReports_2023/sim

# mpiexec equivalent command
# srun --mpi=pmi2 -n 64 nrniv -python -mpi init.py

#running with openmpi in conda environment
srun --mpi=pmi2 -n 64 shifter --image=kpkaur28/neuron:v3 nrniv -python -mpi init.py # mpi works 1832679 numprocs=64

#running with shifter
#srun -n 64 -C haswell shifter --image=kpkaur28/neuron:v3 nrniv -python -mpi init.py # mpi does not work #1832586 numprocs=1
