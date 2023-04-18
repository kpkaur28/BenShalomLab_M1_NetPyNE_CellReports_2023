from mpi4py import MPI
from neuron import h
pc = h.ParallelContext()
id = int(pc.id())
nhost = int(pc.nhost())
print("I am {} of {}".format(id, nhost))

# from mpi4py import MPI
# from neuron import h
# pc = h.ParallelContext()
# cw = MPI.COMM_WORLD
# print("mpi4py thinks I am %d of %d, NEURON thinks I am %d of %d\n",cw.rank, cw.size, pc.id(),pc.nhost())
# pc.done()