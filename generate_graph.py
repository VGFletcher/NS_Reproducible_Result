#Import relevant packages
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
import scipy.signal as scp
import sys

percentile = float(sys.argv[1])

#Import data
dat = np.array(pd.read_csv(f"analysis_data.dat", delim_whitespace=True,skiprows=[0]))

#Extract relevant columns of data
temp = dat[:,0]
c = dat[:,4]

#Pick the peaks location from the data
peaks_i, heights = scp.find_peaks(c, np.percentile(c, percentile))
fwhm = (scp.peak_widths(c, peaks_i, rel_height=0.5)[0])/2

#Print the temperature of the peaks and their full width half maximum
peak_temps = []
for i in range(len(peaks_i)):
    t = temp[peaks_i[i]]
    peak_temps.append(t)
    print('Temp =', t, '±', fwhm[i], 'K')

#Plot the graph and save
plt.plot(temp, c, label='Heat Capacity')
plt.xlabel('Temperature [K]')
plt.ylabel('Heat Capacity, Cp')
plt.grid()
plt.legend()
plt.savefig('heat_capacity.png')
