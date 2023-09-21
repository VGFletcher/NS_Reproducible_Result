#!/bin/bash

#Load Modules
module purge

module load GCCcore/11.3.0
module load Python/3.10.4
module load GCC/11.3.0
module load OpenMPI/4.1.4
module load ASE/3.22.1

#Run pymatnest you may want/need to change the number of threads I've put 40
mpirun -n 40 ./pymatnest/ns_run <mg_stand.inp>> mg_stand.out
