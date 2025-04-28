#=====================================================================
# Project   : Design Compiler tcl script
# File Name : read_dile.scr
# Author    : Macro
# E-mail    : makermuyi@gmail.com
# Version   : 0.0.1
# Change Log:
#   1. 2022-05-06  Initial version
#   1. 2023-08-08  add 
#
#=====================================================================

#=====================================================================
# step 0: setup the environment
#=====================================================================
set UNMAPPED_FILE_PATH  $SYN_WORK_PATH/unmapped
set MAPPED_FILE_PATH    $SYN_WORK_PATH/mapped
set NETLIST_PATH        $SYN_WORK_PATH/netlist
set REPORT_PATH         $SYN_WORK_PATH/report

#=====================================================================
# step 1: sead & elaborate the RTL file list & check
#=====================================================================
set_svf         sequ_div.svf
set TOP_MODULE  sequ_div
analyze -format verilog [list sequ_div.v]
elaborate       $TOP_MODULE -architecture verilog
current_design  $TOP_MODULE

if {[list] == 0} {
    echo "Link with error!";
    exit;
}

if {[check_design] == 0} {
    echo "Check desing with error!";
    exit;
}

#=====================================================================
# step 2: reset the designi first
#=====================================================================
reset_design

#=====================================================================
# step 3: write the unmapped file
#=====================================================================
uniquify
set uniquify_name_style "%s_%d"
write_file -format ddc -hierarchy -output ${UNMAPPED_FILE_PATH}/${TOP_MODULE}.ddc

#=====================================================================
# step 4: define default constration
#=====================================================================
#source default_con.tcl

#=====================================================================
# step 5: check timing and design
#=====================================================================
#check_timing
#check_design

#=====================================================================
# step 6: compile
#=====================================================================
#source run_compile.tcl

#=====================================================================
# step 7: save report 
#=====================================================================
#source save_output.tcl

#=====================================================================
