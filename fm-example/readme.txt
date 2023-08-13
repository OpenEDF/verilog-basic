fm_shell -f script/run_design.tcl | tee -i fm_start.log

                                 Formality (R)

               Version O-2018.06-SP1 for linux64 - Jul 18, 2018 

                    Copyright (c) 1988 - 2018 Synopsys, Inc.
   This software and the associated documentation are proprietary to Synopsys,
 Inc. This software may only be used in accordance with the terms and conditions
 of a written license agreement with Synopsys, Inc. All other use, reproduction,
            or distribution of this software is strictly prohibited.

  ** Highlights of Formality (R) Version O-2018.06 **
   - Improved default solver strategy for reducing inconclusive verifications
   - Automatic analysis to detect UPF issues before verification
   - Enhanced UPF features for consistency with the Synopsys low power flow
   - Improved GUI report display and filtering

   * Please refer to the Formality Release Notes for details and additional enhancements

Build: 5103612
Hostname: macro-ubuntu
Current time: Sun Aug 13 22:06:26 2023

Loading db file '/home/macro/synopsys/fm_2018/fm/O-2018.06-SP1/libraries/syn/gtech.db'
Warning: Cannot use command line editor for terminal type 'xterm'. (CLE-1)
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
sequ_div
set LIB_PATH /home/macro/synopsys/dc_pdk_lib/SMIC180/std/synopsys 
/home/macro/synopsys/dc_pdk_lib/SMIC180/std/synopsys
set FM_WORK_PATH /home/macro/github/verilog-basic/fm-example
/home/macro/github/verilog-basic/fm-example
set FM_SRC_PATH $FM_WORK_PATH/src
/home/macro/github/verilog-basic/fm-example/src
set FM_IMPL_PATH $FM_WORK_PATH/netlist
/home/macro/github/verilog-basic/fm-example/netlist
#====================================================================
# 1. setup the svf file
#====================================================================
set_svf -append  $FM_IMPL_PATH/sequ_div.svf  
SVF appended with '/home/macro/github/verilog-basic/fm-example/netlist/sequ_div.svf'.
1
#====================================================================
# 2. read src verilog file
#====================================================================
read_verilog -container r -libname WORK -01  $FM_SRC_PATH/sequ_div.v  
Loading verilog file '/home/macro/github/verilog-basic/fm-example/src/sequ_div.v'
Current container set to 'r'
1
read_db -container r  $LIB_PATH/typical.db  
Loading db file '/home/macro/synopsys/dc_pdk_lib/SMIC180/std/synopsys/typical.db'
1
read_ddc -container r  $FM_IMPL_PATH/sequ_div.ddc  
Loading ddc file '/home/macro/github/verilog-basic/fm-example/netlist/sequ_div.ddc'
No target library specified, default is WORK
Information: Loading new version of design '/WORK/sequ_div' into container 'r' (FM-548)
1
set_top $TOP_MODULE 
Setting top design to 'r:/WORK/sequ_div'
Status:  Implementing inferred operators...
Top design successfully set to 'r:/WORK/sequ_div'
Reference design set to 'r:/WORK/sequ_div'
1
#====================================================================
# 3. read netlist verilog file
#====================================================================
read_verilog -container i -libname WORK -01  $FM_IMPL_PATH/sequ_div.vg  
Loading verilog file '/home/macro/github/verilog-basic/fm-example/netlist/sequ_div.vg'
Current container set to 'i'
1
read_db  $LIB_PATH/typical.db  
Loading db file '/home/macro/synopsys/dc_pdk_lib/SMIC180/std/synopsys/typical.db'
Warning: The shared technology library 'TYPICAL' was not copied to container 'r'. A technology library by the same name already exists (FM-173)
1
set_top $TOP_MODULE 
Setting top design to 'i:/WORK/sequ_div'
Status:  Implementing inferred operators...
Top design successfully set to 'i:/WORK/sequ_div'
Implementation design set to 'i:/WORK/sequ_div'
1
#====================================================================
# 4. match and verify
#====================================================================
match
Reference design is 'r:/WORK/sequ_div'
Implementation design is 'i:/WORK/sequ_div'
Status:  Checking designs...
    Warning: 2 (2) undriven nets found in reference (implementation) design; see formality.log for list (FM-399)
Status:  Building verification models...
Status:  Processing Guide Commands...

***************************** Guidance Summary *****************************
                                         Status
Command                 Accepted   Rejected  Unsupported  Unprocessed  Total
----------------------------------------------------------------------------
change_names        :          1          6          0          0          7
environment         :          6          0          0          0          6
mark                :          2          0          0          0          2
replace             :          0          2          0          0          2

Note: If verification succeeds you can safely ignore unaccepted guidance commands.

SVF files read:
      /home/macro/github/verilog-basic/fm-example/netlist/sequ_div.svf

SVF files produced:
  /home/macro/github/verilog-basic/fm-example/formality_svf/
    svf.txt
****************************************************************************

Status:  Matching...
    
*********************************** Matching Results ***********************************    
 211 Compare points matched by name    
 0 Compare points matched by signature analysis    
 0 Compare points matched by topology    
 67 Matched primary inputs, black-box outputs    
 0(0) Unmatched reference(implementation) compare points    
 0(0) Unmatched reference(implementation) primary inputs, black-box outputs    
****************************************************************************************

1
verify
Reference design is 'r:/WORK/sequ_div'
Implementation design is 'i:/WORK/sequ_div'
    
*********************************** Matching Results ***********************************    
 211 Compare points matched by name    
 0 Compare points matched by signature analysis    
 0 Compare points matched by topology    
 67 Matched primary inputs, black-box outputs    
 0(0) Unmatched reference(implementation) compare points    
 0(0) Unmatched reference(implementation) primary inputs, black-box outputs    
****************************************************************************************

Status:  Verifying...

********************************* Verification Results *********************************
Verification SUCCEEDED
----------------------
 Reference design: r:/WORK/sequ_div
 Implementation design: i:/WORK/sequ_div
 211 Passing compare points
----------------------------------------------------------------------------------------
Matched Compare Points     BBPin    Loop   BBNet     Cut    Port     DFF     LAT   TOTAL
----------------------------------------------------------------------------------------
Passing (equivalent)           0       0       0       0      66     145       0     211
Failing (not equivalent)       0       0       0       0       0       0       0       0
****************************************************************************************
1
remove_container r
Cleared container 'r'
Information: Reference design is no longer set (FM-070)
1
remove_container i
Cleared container 'i'
Information: Implementation design is no longer set (FM-071)
1
remove_library -all
Removed shared technology library 'TYPICAL'
1
#====================================================================
# 5. quit
#====================================================================
exit

Maximum memory usage for this session: 359 MB
CPU usage for this session: 1.74 seconds ( 0.00 hours )
Current time: Sun Aug 13 22:06:29 2023
Elapsed time: 3 seconds ( 0.00 hours )

Thank you for using Formality (R)!
