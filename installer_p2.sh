#!/bin/bash

#Load Modules
module purge

module load GCCcore/11.3.0
module load Python/3.10.4
module load GCC/11.3.0
module load OpenMPI/4.1.4
module load ASE/3.22.1

#cd to lammps directory
cd lammps/src/

#Compile lammps
make -j 40 serial mode=shlib

#Create python package
make install-python

#Install pymatnest
git clone https://github.com/libAtoms/pymatnest.git
