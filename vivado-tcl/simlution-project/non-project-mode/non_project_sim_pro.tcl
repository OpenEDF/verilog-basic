###-----------------------------------------------------------------
### vivado tcl file for Project mode sim， only create project and 
### entry the sim gui
### Author: Macro
### Resources: Vivado Design Suite User Guide Design Flows Overview
### 

puts "-------------------------- Start --------------------------"
# Set the top module
set top_module flowled_tb

# Create the output directory
set outputDir ./sim_output
file mkdir $outputDir
cd $outputDir

# Add source
read_verilog ../sources/flowled.v

# Add Testbench file
read_verilog ../sources/flowled_tb.v

# Simulate
save_project_as sim -force
set_property top flowled_tb [get_fileset sim_1]
launch_simulation -simset sim_1 -mode behavioral

# open Gui
start_gui

# Close the simulation windows
# close_sim -force
# stop_gui
# close_project

###-----------------------------------------------------------------