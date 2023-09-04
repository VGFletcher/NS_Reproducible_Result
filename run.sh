#!/bin/bash

#Load Modules
module purge

module load GCCcore/10.2.0
module load Python/3.8.6
module load GCC/10.2.0
module load OpenMPI/4.0.5
module load OpenMPI/4.0.5
module load ASE/3.21.1

#Compile lammps
make -j 40 serial mode=shlib

#Create python package
make install-python

#Create link to python package
cd ../../
ln -s lammps/src/liblammps_serial.so ./liblammps_serial.so

#Install pymatnest
git clone https://github.com/libAtoms/pymatnest.git
