
import pickle
from netpyne import sim
import numpy as np
import matplotlib.pyplot as plt

print("HELLOOOOO")

# define the path to the file
path = "/global/homes/k/kpkaur28/BenShalomLab/BenShalomLab_M1_NetPyNE_CellReports_2023/data/v56_manualTune_Run1/v56_tune3_data.pkl"

#Open the pickle data file created from previous simulation
with open(path, 'rb') as f:
    data = pickle.load(f)

print(data['simData']['t'])

#Extract the voltage data from the data dictionary using the sim.allSimData dictionary, which stores the simulation results:
# print(set(data['simData'].keys()))
# cell_id = sim.net.getCellsList(pop_name='PT5B')[2]['gid']

# time = simData['simData']['t']
# voltage = simData['simData']['V_soma_ih']['cell_%d' % 5258]
# print(len(time))
# print("end")
# print(len(voltage))
#Plot the voltage trace
# plt.plot(time, voltage)
# plt.xlabel('Time (ms)')
# plt.ylabel('Voltage (mV)')
# plt.title('Membrane potential trace for cell %d' % 5258)
# plt.show()
