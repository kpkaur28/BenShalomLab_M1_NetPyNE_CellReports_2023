## Motivation

The original code is authored by Salvador: salvadordura@gmail.com
Github Repository Link: https://github.com/suny-downstate-medical-center/M1_NetPyNE_CellReports_2023

The M1 model (Mouse Primary Cortex Model) is described in the following paper:
Dura-Bernal S, Neymotin SA, Suter BA, Dacre J, Moreira JVS, Urdapilleta E, Schiemann J, Duguid I, Shepherd GMG, Lytton WW. Multiscale model of primary motor cortex circuits predicts in vivo cell type-specific, behavioral state-dependent dynamics. BioRxiv 2022.02.03.479040; doi: https://doi.org/10.1101/2022.02.03.479040. (Under review in Cell Reports)

Developed using NetPyNE (http://netpyne.org)

## M1_NetPyNE_CellReports_2023_BenShalomLab

- [Setup] (#Setup)
- [Installing NetPyNE on the Cori] (#Installing NetPyNE on Cori)
- [Installation Issues] (#Installation Issues]

### Setup 

Requires NEURON with Python and MPI support.

From /sim run `nrnivmodl ../mod`. This should create a directory called x86_64.
Then, to compile the mod files, from /sim run `nrnivmodl mod`
To run type: `./runsim [num_proc]` or the equivalent `mpiexec -np [num_proc] nrniv -python -mpi init.py`

On Cori, 

1. Interative node: Use salloc command to specify haswell compute resource to run for interactive node: 
`salloc --nodes=1 --ntasks=4 -C haswell -q interactive --time=4:00:00`
Use this environment to run interactive sessions for short time.

To run the model, use the following command to submit a batch job: 
`sbatch script.sbatch`

2. Activate python: 
`module load python`

3. Create a new virtual environment: 
`conda create --name netpyne python=3.7`

4. Activate the virtual environment:
`conda activate netpyne`

5. Make sure to compile the mod files:
Navigate to the `sim` directory, then run
`nrnivmodl mod` 
This will compile the .c files and create the directory based on the architecture.
Make sure to compile the newly generated mod files by running the command:
`nrnivmodl mod`

5. Use srun command to run the parallel process on 64 processors:
`srun -k -n 64 nrniv -python -mpi init.py`

6. After done running, deactivate the virtual environment: 
`conda deactivate netpyne`

-----------------------------------------

### Installing NetPyNE on Cori

Installing NetPyNE on the Cori supercomputer system at the National Energy Research Scientific Computing Center (NERSC) can be done using the following steps:

1. Load the necessary modules: You will need to load the Python and NEURON modules on Cori. You can do this by running the following command:
`module load python/3.7-anaconda-2019.07`

2. Create a virtual environment: It is recommended that you create a virtual environment for your NetPyNE installation. You can do this by running the following command:
`conda create --name netpyne python=3.7`

3. Activate the virtual environment: Once the virtual environment is created, activate it by running the command:
`conda activate netpyne`

4. Install NEURON: You can install NEURON using the following command:
`pip install neuron`

5. Install NetPyNE: You can install NetPyNE using the following command:
`pip install netpyne`

6. Test the installation: You can test the installation by running the following command:
`python -c "import netpyne"`

If there is no error message, it means the package has been successfully installed. 

7. Go to the ./sim directory, and run the following command: 
`python3 init.py`

To deactivate the virtual environment, use:
`conda deactivate`

-----------------------------------------

### Installation Issues

If the specific version of python is not available on the system, then try loading a different version of Python that is available on the system. You can check the available versions of Python by running the command:
`module avail python`

This will list all the available versions of Python that you can load on the Cori system. Once you have identified a suitable version, you can load it by running the command:
`module load python/[version]`

Another solution is to check if the version you are trying to load is deprecated or not available in the new version of Cori, maybe you need to use a different version of python that fits the Cori version you are using.

If you are still unable to load the correct version of Python, or if you are unsure which version to use, you should contact the Cori support team for further assistance.

-----------------------------------------

### Issuing automated batch Commands

`sqs` - list the jobs submitted to Cori
 `squeue --user=$USER` to list all jobs queued for the user
 
 To issue an sbatch command, first write a sbatch script. For this project, we are using the script.sbatch
 Run `sbatch script.sbatch`

-----------------------------------------

### Current Status: 

`srun --mpi=pmi2 -n 64 nrniv -python -mpi init.py` command returning 0's as part of Neuron package.
Debugging simulation run.



