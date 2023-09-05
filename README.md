# NS_Reproducible_Result
This contains everything you need to reproduce the nested sampling result discussed in the paper.
Everything can be contained in a directory and deleted once finished. This will not change any of your existing software or settings.

1) First run the `installer_p1.sh` script. This will install all the required lammps files.

2) To be able to use the pymatnest package properly, you need to go to `lammps/src/MAKE/` and edit `Makefile.serial` so that `LMP_INC= -DLAMMPS_EXCEPTIONS -DLAMMPS_GZIP -DLAMMPS_MEMALIGN=64`

3) Next run the `installer_p2.sh` script. This will compile lammps and install pymatnest. Now the required programs are installed.

4) Modify the `mg_stand.inp` file with the settings from the paper. However change the number of atoms to 16 not 64. If you use 64 atoms the calculation will take around a day. I have added comments to assist.
  
5) Run the `run.sh` script to run the pymatnest code. This will take around 4 hours so take a break.
   
6) Run the `analysis.sh` script to get the heat capacity curve data. This will take a few minutes.

7) Finally, to plot the heat capacity curve, and output the peak location and full width half maximum, run the `generate_graph.py` script as `python3 generate_graph.py`.

You should have a heat capcity curve saved and the peak location and width is printed to the terminal. It should be around 912.0 K ± 233.3 K. You can see this result in figure 1 of the paper.
