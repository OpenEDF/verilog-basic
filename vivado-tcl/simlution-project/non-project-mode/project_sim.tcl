###-----------------------------------------------------------------
### vivado tcl file for Project mode sim， only create project and 
### entry the sim gui
### Author: Macro
### Resources: Vivado Design Suite User Guide Design Flows Overview
### 

puts "-------------------------- Start --------------------------"
# create the output directory
set outputDir ./sim_output
file mkdir $outputDir
cd $outputDir

#simulate
exec xvlog ../sources/flowled.v
exec xvlog ../sources/flowled_tb.v
exec xelab -debug typical flowled_tb
exec xsim --tclbatch ../flowled_tb.tcl -gui flowled_tb

# Close the simulation windows
# close_sim -force
# stop_gui

###-----------------------------------------------------------------