###-----------------------------------------------------------------
### vivado tcl file for Project mode
### Author: Macro
### Resources: Vivado Design Suite User Guide Design Flows Overview
### 

puts "-------------------------- Start --------------------------"
# Set sources file
set verilog_src [list]
lappend verilog_src ./sources/flowled.v

set sim_src ./sources/flowled_tb.v
set constrs_src ./sources/flowled_xdc.xdc
set output_dir ./output
set bit_output_path ./flowled.runs/impl_1/flowled.bit

# Set the jobs
set pros_jobs 2

# Set the FPGA chip
set xilinx_fpga_chip xc7a35tfgg484-2
set project_path [pwd]
set project_name "flowled"

# create project
create_project -part $xilinx_fpga_chip $project_name $project_path 
set_property DESIGN_MODE RTL [current_fileset]

# Add design source file
add_files -fileset sources_1 $verilog_src
add_files -fileset sim_1 $sim_src
add_files -fileset constrs_1 -norecurse $constrs_src
update_compile_order -fileset sources_1
update_compile_order -fileset sim_1

# Launch Synthesis
launch_runs -jobs $pros_jobs synth_1
wait_on_run synth_1
open_run synth_1 -name netlist_1

# Generate a timing and power reports and write to disk
file mkdir $output_dir
report_timing_summary -delay_type max -report_unconstrained -check_timing_verbose -max_paths 10 -input_pins -file $output_dir/syn_timing.rpt
report_power -file $output_dir/syn_power.rpt

# Launch Implementation
launch_runs impl_1 -to_step write_bitstream
wait_on_run impl_1 

# comment out the open_run for batch mode
open_run impl_1
report_timing_summary -delay_type min_max -report_unconstrained -check_timing_verbose -max_paths 10 -input_pins -file $output_dir/imp_timing.rpt
report_power -file $output_dir/imp_power.rpt

# comment out the for batch mode
# start_gui

# connect device
open_hw_manager
# disconnect_hw_server localhost:3121
connect_hw_server -allow_non_jtag
open_hw_target

# add the path for programmed file
set program_files [list]
lappend program_files $bit_output_path

set_property PROGRAM.FILE $program_files [get_hw_devices xc7a35t_0]
current_hw_device [get_hw_devices xc7a35t_0]
refresh_hw_device -update_hw_probes false [lindex [get_hw_devices xc7a35t_0] 0]

# write the bit file to device
program_hw_devices [get_hw_devices xc7a35t_0]
refresh_hw_device [lindex [get_hw_devices xc7a35t_0] 0]

# Close the connect
close_hw_manager

# quit the tcl
quit
###-----------------------------------------------------------------
