#!/bin/bash

#Load Modules
module purge

module load GCCcore/10.2.0
module load Python/3.8.6
module load GCC/10.2.0
module load OpenMPI/4.0.5
module load OpenMPI/4.0.5
module load ASE/3.21.1

#Running the analysis feature in nested sampling the command is:
#mpirun -n 'number of threads' 'ns_analyse location' -M 'minimum temperature' -D 'temperature step K' -n 'number of temperature steps' > 'output file'
mpirun -n 40 ./pymatnest/ns_analyse mg16_1GPa.energies -M 200 -D 1 -n 10000 > analysis_data.dat