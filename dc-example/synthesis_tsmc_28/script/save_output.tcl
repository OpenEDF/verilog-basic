#=====================================================================
# Project   : Design Compiler tcl script
# File Name : save_output.scr
# Author    : Macro
# E-mail    : makermuyi@gmail.com
# Version   : 0.0.1
# Change Log:
#   1. 2022-08-08  Initial version
#
#====================================================================

#====================================================================
# 1.save the design database
#====================================================================
redirect -tee -file ${REPORT_PATH}/check_design.txt  {check_design}
redirect -tee -file ${REPORT_PATH}/check_timing.txt  {check_timing}
redirect -tee -file ${REPORT_PATH}/report_constraint.txt  {report_constraint -all_violators}
redirect -tee -file ${REPORT_PATH}/check_setup.txt  {report_timing -delay_type max}
redirect -tee -file ${REPORT_PATH}/check_hold.txt   {report_timing -delay_type min}
redirect -tee -file ${REPORT_PATH}/report_area.txt  {report_area}

#====================================================================
# 2. all end
#====================================================================

#====================================================================
