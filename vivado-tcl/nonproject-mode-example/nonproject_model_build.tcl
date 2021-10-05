###-----------------------------------------------------------------
### vivado tcl file for Non-Project mode
### Author: Macro
### Resources: Vivado Design Suite User Guide Design Flows Overview
### 

puts "-------------------------- Start --------------------------"
# Set the FPGA chip
set xilinx_fpga_chip xc7a35tfgg484-2

# Set the output path
set outputDir ./output
file mkdir $outputDir

# Set bit file path
set bit_output_path $outputDir/flowled.bit

# Design sources file
set source_path ./sources
set design_verilog_file [list]

# add the verilog source file
lappend design_verilog_file flowled.v

# add the xdc file
set design_xdc_file flowled_xdc.xdc

# Setup design sources and constraints
for { set index 0} { $index < [llength $design_verilog_file]} {incr index} {
    set vfile [lindex $design_verilog_file $index]
    puts "verilog file: $index : $vfile"
    read_verilog  $source_path/$vfile
}
read_xdc $source_path/$design_xdc_file

# Run synthesis, report utilization and timing estimates, write checkpoint design
synth_design -top flowled -part $xilinx_fpga_chip
write_checkpoint -force $outputDir/post_synth
report_timing_summary -file $outputDir/post_synth_timing_summary.rpt
report_power -file $outputDir/post_synth_power.rpt

# Run placement and logic optimzation, report utilization and timing estimates, write checkpoint design
opt_design
place_design
phys_opt_design
write_checkpoint      -force $outputDir/post_place
report_timing_summary -file  $outputDir/post_place_timing_summary.rpt

# Run router, report actual utilization and timing, write checkpoint design, run drc, write verilog and xdc out
route_design
write_checkpoint -force $outputDir/post_route
report_timing_summary -file $outputDir/post_route_timing_summary.rpt
report_timing -sort_by group -max_paths 100 -path_type summary -file $outputDir/post_route_timing.rpt
report_clock_utilization -file $outputDir/clock_util.rpt
report_utilization -file $outputDir/post_route_util.rpt
report_power -file $outputDir/post_route_power.rpt
report_drc -file $outputDir/post_imp_drc.rpt
write_verilog -force $outputDir/bft_impl_netlist.v
write_xdc -no_fixed_only -force $outputDir/bft_impl.xdc

# Generate a timing and power reports and write to disk
report_timing_summary -delay_type max -report_unconstrained -check_timing_verbose -max_paths 10 -input_pins -file $outputDir/syn_timing.rpt
report_power -file $outputDir/syn_power.rpt

# Generate a bitstream
write_bitstream -force $bit_output_path

# Connect the device 
open_hw_manager
# disconnect_hw_server localhost:3121
connect_hw_server -allow_non_jtag
open_hw_target

# Programmed the device
set program_files [list]
lappend program_files $bit_output_path

set_property PROGRAM.FILE $program_files [get_hw_devices xc7a35t_0]
current_hw_device [get_hw_devices xc7a35t_0]
refresh_hw_device -update_hw_probes false [lindex [get_hw_devices xc7a35t_0] 0]
program_hw_devices [get_hw_devices xc7a35t_0]
refresh_hw_device [lindex [get_hw_devices xc7a35t_0] 0]

# Close the device
close_hw_target
close_hw_manager

# Close the project
close_project

# quit the tcl
quit
###-----------------------------------------------------------------
