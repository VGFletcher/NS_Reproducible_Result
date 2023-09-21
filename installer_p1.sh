#!/bin/bash

#Load Modules
module purge

module load GCCcore/11.3.0
module load Python/3.10.4
module load GCC/11.3.0
module load OpenMPI/4.1.4
module load ASE/3.22.1

#Download lammps
git clone -b release https://github.com/lammps/lammps.git

#Install Additional Packages
cd lammps/src/

make yes-EXTRA-COMPUTE
make yes-EXTRA-FIX
make yes-MANYBODY
make yes-MEAM
make yes-PYTHON
