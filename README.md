# NS_Reproducible_Result
This contains everything you need to reproduce the nested sampling result discussed in the paper.
Everything can be contained in a directory and deleted once finished. This will not change any of your existing software or settings.

1) First run the `installer_p1.sh` script. This will install all the required lammps files.

2) To be able to use the pymatnest package properly, you need to go to `lammps/src/MAKE/` and edit `Makefile.serial` so that `LMP_INC= -DLAMMPS_EXCEPTIONS -DLAMMPS_GZIP -DLAMMPS_MEMALIGN=64`

3) Next run the `installer_p2.sh` script. This will compile lammps and install pymatnest. Now the required programs are installed.

4) Modify the mg_stand.inp file with the settings from the paper. I have added comments to assist.
  
5) Run the script
7) 
