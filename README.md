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
Use salloc command to specify the shifter image and haswell compute resource: 
`salloc -N 1 --image=balewski/ubu20-neuron8:v5 -C haswell -q interactive -t 4:00:00`

Use srun command to run the parallel process:
`srun -k -n 4 /global/homes/k/kpkaur28/.local/bin/nrniv shifter -python3 -mpi init.py`

-----------------------------------------

### Installing NetPyNE on Cori

Installing NetPyNE on the Cori supercomputer system at the National Energy Research Scientific Computing Center (NERSC) can be done using the following steps:

1. Load the necessary modules: You will need to load the Python and NEURON modules on Cori. You can do this by running the following command:
`module load python/3.7-anaconda-2019.10`
`module load neuron/7.7-anaconda-2019.10`

2. Create a virtual environment: It is recommended that you create a virtual environment for your NetPyNE installation. You can do this by running the following command:
`conda create --name netpyne python=3.7`

3. Activate the virtual environment: Once the virtual environment is created, activate it by running the command:
`conda activate netpyne`

4. If there are no modules available on Cori for NEURON, then try installing it in virtual environment using the following command:
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

### Installation Issues

If the specific version of python is not available on the system, then try loading a different version of Python that is available on the system. You can check the available versions of Python by running the command:
`module avail python`

This will list all the available versions of Python that you can load on the Cori system. Once you have identified a suitable version, you can load it by running the command:
`module load python/[version]`

Another solution is to check if the version you are trying to load is deprecated or not available in the new version of Cori, maybe you need to use a different version of python that fits the Cori version you are using.

If you are still unable to load the correct version of Python, or if you are unsure which version to use, you should contact the Cori support team for further assistance.

Similarly, if specific version of neuron is not available on the system, then to try loading a different version of NEURON that is available on the system. You can check the available versions of NEURON by running the command:
`module avail neuron`

This will list all the available versions of NEURON that you can load on the Cori system. Once you have identified a suitable version, you can load it by running the command:
`module load neuron/[version]`

Another solution is to check if the version you are trying to load is deprecated or not available in the new version of Cori, maybe you need to use a different version of neuron that fits the Cori version you are using.

If you are still unable to load the correct version of NEURON, or if you are unsure which version to use, you should contact the Cori support team for further assistance.
It's also possible that the module is not installed on the system, in that case, you should check with the administrator or system support team.

If the command module avail neuron returns an empty list, it means that the NEURON module is not available on the Cori system you are using.

There are a few possible reasons for this:

NEURON is not installed on the system. In this case, you will need to contact the system administrator or support team to request that NEURON be installed.
NEURON is not supported on Cori.
The version of NEURON that you need is not compatible with the version of Cori that you are using.
If NEURON is not supported on the Cori system, you can try using a different neural simulator that is available on the system, such as NEST or Brian. But NEURON is widely used and it's possible that it's not supported by the system you are using, you should check with the administrator or support team for more information.

It's also possible that you have to run your simulation on a different cluster or on your personal computer that has the capability of running NEURON.
