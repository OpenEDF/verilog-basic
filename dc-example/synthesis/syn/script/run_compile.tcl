#=====================================================================
# Project   : Design Compiler tcl script
# File Name : run_compiler.scr
# Author    : Macro
# E-mail    : makermuyi@gmail.com
# Version   : 0.0.1
# Change Log:
#   1. 2022-08-08  Initial version
#
#====================================================================
# Initial compile with estimated constraints
set_host_options -max_cores 2

#====================================================================
# 1. perform incremental synthesis
#====================================================================
compile_ultra -incremental -scan -timing -incremental

#====================================================================
# 2. check report
#====================================================================
report_constraint -all_violatiors
report_timing
report_area

#====================================================================
# 3. write post-process files
#====================================================================
change_names -rules verilog -hierarchy
write -f ddc     -hierarchy -output $MAPPED_FILE_PATH/${TOP_MODULE}.ddc
write -f verilog -hierarchy -output $NETLIST_PATH/${TOP_MODULE}.v
write_sdc -version 1.7 $MAPPED_FILE_PATH/${TOP_MODULE}.sdc
write_sdf -version 2.1 $MAPPED_FILE_PATH/${TOP_MODULE}.sdf

#====================================================================
