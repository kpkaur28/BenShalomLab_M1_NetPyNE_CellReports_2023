
import pickle
from netpyne import sim
import numpy as np
import matplotlib.pyplot as plt
import csv

print("HELLOOOOO")

# define the path to the file
path = "../data/v56_manualTune-p3/v56_tune3_data.pkl"
path1 = "../data/v56_manualTune-p3/v56_tune3_node_data/v56_tun3_node_0.pkl"

#Open the pickle data file created from previous simulation
with open(path, 'rb') as f:
    data = pickle.load(f)

print("Data:", set(data.keys()))

#Open the pickle data file created from previous simulation
# with open(path, 'rb') as f:
#     data1 = pickle.load(f)

# print("Data1:", set(data1.keys()))

# cfg, netParams = sim.readCmdLineArgs()
# sim.initialize(
#     simConfig = cfg, 	
#     netParams = netParams)  # create network object and set cfg and net params

# sim.pc.timeout(300)                          # set nrn_timeout threshold to X sec (max time allowed without increasing simulation time, t; 0 = turn off)
# sim.net.createPops()               			# instantiate network populations
# sim.net.createCells()              			# instantiate network cells based on defined populations
#sim.net.connectCells()            			# create connections between cells based on params
#sim.net.addStims() 							# add network stimulation
#sim.setupRecording()              			# setup variables to record for each cell (spikes, V traces, etc

# Get the pop object for the PT5B population
#pt5b_pop = sim.net.pops['PT5B']
# Get the list of cell GIDs in the PT5B population
#pt5b_cell_gids = pt5b_pop.cellGids
# print(pt5b_cell_gids)

# simConfig data settings, or boolean values
# print("simConfig:", set(data['simConfig'].keys()))
# print("recordLFP:", data['simConfig']['recordLFP'])
# print("gatherOnlySimData:", data['simConfig']['gatherOnlySimData'])
# print("recordStim:", data['simConfig']['recordStim'])
# print("singleCellPops:", data['simConfig']['singleCellPops'])
# print("printRunTime:", data['simConfig']['printRunTime'])
# print("recordCellsSpikes:", data['simConfig']['recordCellsSpikes'])
# print("recordTime:", data['simConfig']['recordTime'])

# Get spike times and cell gids
#print("simData:", set(data['simData'].keys()))
# print("spkt:", len(data['simData']['spkt']))
#print("popRates:", data['simData']['popRates'])
#print("LFP:", data['simData']['LFP'])
#print("t:", data['simData']['t'])
#print("spkid:", (data['simData']['spkid']))
#print("avgRate:", data['simData']['avgRate'])
#print("V_soma:", data['simData']['V_soma'])

# for gid in spkid:
#     pop_val = data['net']['cells'][gid]['tags']['pop']

# Get PT5B data:
# print("net:", set(data['net'].keys()))
# print("PT5B:", set(data['net']['params']['popParams']['PT5B'].keys()))
# print("pop:", data['net']['params']['popParams']['PT5B']['pop'])
# print("density:", data['net']['params']['popParams']['PT5B']['density'])
# print("numCells:", data['net']['params']['popParams']['PT5B']['numCells'])
# print("cellType:", data['net']['params']['popParams']['PT5B']['cellType'])
# print("ynormRange:", data['net']['params']['popParams']['PT5B']['ynormRange'])
# print("cellModel:", data['net']['params']['popParams']['PT5B']['cellModel'])

#Extract the voltage data from the data dictionary using the sim.allSimData dictionary, which stores the simulation results:

# time = data['simData']['t']
# voltage = data['simData']['V_soma']
# print("time:", len(time))
# print("end")
# print("voltage:", len(voltage))
#Plot the voltage trace
# plt.plot(time, voltage)
# plt.xlabel('Time (ms)')
# plt.ylabel('Voltage (mV)')
# plt.title('Membrane potential trace for cell %d' % 5258)
# plt.show()
