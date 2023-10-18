# NS_Reproducible_Result
This contains everything you need to reproduce the nested sampling result discussed in the paper.
Everything can be contained in a directory and deleted once finished.

1) First run the `installer_p1.sh` script. This will install all the required lammps files.

2) To be able to use the pymatnest package properly with python, you need to go to `./lammps/src/MAKE/` and edit `Makefile.serial` so that `LMP_INC= -DLAMMPS_EXCEPTIONS -DLAMMPS_GZIP -DLAMMPS_MEMALIGN=64`

3) Next run the `installer_p2.sh` script. This will compile lammps and install pymatnest. Now the required programs are installed.

4) For pymatnest to work properly with lammps you need to copy the lammps shared object, `./lammps/src/liblammps_serial.so`, to your local python lammps directory that was just created, mine was at `~/.local/lib/python3.10/lammps/`.

5) Now modify the `mg_stand.inp` file with the settings from the paper. However change the number of atoms to 16 not 64, and the number of walkers from 1248 to 1240. If you use 64 atoms the calculation will take around a day, and you will not be able to use 1248 walkers with 40 cores. I have added comments to assist.
  
6) Run the `run.sh` script to run the pymatnest code. This will take around 6-7 hours so take a break. If at any point the run is interrupted once it has started running, you can just re-run the `run.sh` script and the calculation will pick up where it left off.
   
7) Run the `analysis.sh` script to get the heat capacity curve data from the nested sampling `.energies` file. From this the peak location and width will be picked to identify the transition point and give a measure of the uncertainty.

You should have a heat capcity curve `.png` saved and the peak location and width is printed to the terminal. It should be around 912.0 K ± 233.3 K. This is the melting temperature of pure magnesium at 1GPa predicted by the Zhou EAM potential. You can see this result in the left plot of figure 1 in the paper. Nested sampling is a stochastic process so there may be some slight difference (10s of K) in these values.
