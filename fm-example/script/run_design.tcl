#=====================================================================
# Project   : formality tcl script
# File Name : run_design.tcl
# Author    : Macro
# E-mail    : makermuyi@gmail.com
# Version   : 0.0.1
# Change Log:
#   1. 2023-08-13  Initial version
#
#====================================================================
set TOP_MODULE  sequ_div
set LIB_PATH /home/macro/synopsys/dc_pdk_lib/SMIC180/std/synopsys 
set FM_WORK_PATH /home/macro/github/verilog-basic/fm-example
set FM_SRC_PATH $FM_WORK_PATH/src
set FM_IMPL_PATH $FM_WORK_PATH/netlist

#====================================================================
# 1. setup the svf file
#====================================================================
set_svf -append  $FM_IMPL_PATH/sequ_div.svf  

#====================================================================
# 2. read src verilog file
#====================================================================
read_verilog -container r -libname WORK -01  $FM_SRC_PATH/sequ_div.v  
read_db -container r  $LIB_PATH/typical.db  
read_ddc -container r  $FM_IMPL_PATH/sequ_div.ddc  
set_top $TOP_MODULE 

#====================================================================
# 3. read netlist verilog file
#====================================================================
read_verilog -container i -libname WORK -01  $FM_IMPL_PATH/sequ_div.vg  
read_db  $LIB_PATH/typical.db  
set_top $TOP_MODULE 

#====================================================================
# 4. match and verify
#====================================================================
match
verify
remove_container r
remove_container i
remove_library -all

#====================================================================
# 5. quit
#====================================================================
exit
#====================================================================
