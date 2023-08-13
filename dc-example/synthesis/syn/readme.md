dc_shell -f script/read_input.tcl | tee -i log/dc_start.log

                           Design Compiler Graphical 
                                 DC Ultra (TM)
                                  DFTMAX (TM)
                              Power Compiler (TM)
                                 DesignWare (R)
                                 DC Expert (TM)
                               Design Vision (TM)
                               HDL Compiler (TM)
                               VHDL Compiler (TM)
                                  DFT Compiler
                               Design Compiler(R)

               Version L-2016.03-SP1 for linux64 - Apr 18, 2016 

                    Copyright (c) 1988 - 2016 Synopsys, Inc.
   This software and the associated documentation are proprietary to Synopsys,
 Inc. This software may only be used in accordance with the terms and conditions
 of a written license agreement with Synopsys, Inc. All other use, reproduction,
            or distribution of this software is strictly prohibited.
Initializing...
*********************************** Setting **************************************
search_path:          . {. /home/macro/synopsys/dc_2016/syn/L-2016.03-SP1/libraries/syn /home/macro/synopsys/dc_2016/syn/L-2016.03-SP1/minpower/syn /home/macro/synopsys/dc_2016/syn/L-2016.03-SP1/dw/syn_ver /home/macro/synopsys/dc_2016/syn/L-2016.03-SP1/dw/sim_ver} /home/macro/synopsys/dc_pdk_lib/SMIC180/std/synopsys /home/macro/synopsys/dc_pdk_lib/SMIC180/io/symbol /home/macro/synopsys/dc_pdk_lib/SMIC180/std/symbols /home/macro/github/verilog-basic/dc-example/synthesis/src/work /home/macro/github/verilog-basic/dc-example/synthesis/syn/script /home/macro/github/verilog-basic/dc-example/synthesis/src
link_library:         * fast.db fasta.db slow.db typical.db
target_library:       typical.db
symbol_library:       smic18.sdb

*********************************** Ready ****************************************
Initializing gui preferences from file  /home/macro/.synopsys_dv_prefs.tcl
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
set UNMAPPED_FILE_PATH  $SYN_WORK_PATH/syn/unmapped
/home/macro/github/verilog-basic/dc-example/synthesis/syn/unmapped
set MAPPED_FILE_PATH    $SYN_WORK_PATH/syn/mapped
/home/macro/github/verilog-basic/dc-example/synthesis/syn/mapped
set NETLIST_PATH        $SYN_WORK_PATH/syn/netlist
/home/macro/github/verilog-basic/dc-example/synthesis/syn/netlist
set REPORT_PATH         $SYN_WORK_PATH/syn/report
/home/macro/github/verilog-basic/dc-example/synthesis/syn/report
#=====================================================================
# step 1: sead & elaborate the RTL file list & check
#=====================================================================
set_svf sequ_div.svf
1
set TOP_MODULE sequ_div
sequ_div
analyze -format verilog [list sequ_div.v]
Running PRESTO HDLC
Compiling source file /home/macro/github/verilog-basic/dc-example/synthesis/src/work/sequ_div.v
Presto compilation completed successfully.
Loading db file '/home/macro/synopsys/dc_pdk_lib/SMIC180/std/synopsys/fast.db'
Loading db file '/home/macro/synopsys/dc_pdk_lib/SMIC180/std/synopsys/fasta.db'
Loading db file '/home/macro/synopsys/dc_pdk_lib/SMIC180/std/synopsys/slow.db'
Loading db file '/home/macro/synopsys/dc_pdk_lib/SMIC180/std/synopsys/typical.db'
1
elaborate       $TOP_MODULE -architecture verilog
Loading db file '/home/macro/synopsys/dc_2016/syn/L-2016.03-SP1/libraries/syn/gtech.db'
Loading db file '/home/macro/synopsys/dc_2016/syn/L-2016.03-SP1/libraries/syn/standard.sldb'
  Loading link library 'fast'
  Loading link library 'fasta'
  Loading link library 'slow'
  Loading link library 'typical'
  Loading link library 'gtech'
Running PRESTO HDLC

Statistics for case statements in always block at line 148 in file
	'/home/macro/github/verilog-basic/dc-example/synthesis/src/work/sequ_div.v'
===============================================
|           Line           |  full/ parallel  |
===============================================
|           149            |    auto/auto     |
===============================================

Statistics for case statements in always block at line 224 in file
	'/home/macro/github/verilog-basic/dc-example/synthesis/src/work/sequ_div.v'
===============================================
|           Line           |  full/ parallel  |
===============================================
|           235            |    auto/auto     |
===============================================

Inferred memory devices in process
	in routine sequ_div line 137 in file
		'/home/macro/github/verilog-basic/dc-example/synthesis/src/work/sequ_div.v'.
===============================================================================
|    Register Name    |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
===============================================================================
|    cur_state_reg    | Flip-flop |   8   |  Y  | N  | Y  | N  | N  | N  | N  |
|    cur_state_reg    | Flip-flop |   1   |  N  | N  | N  | Y  | N  | N  | N  |
===============================================================================

Inferred memory devices in process
	in routine sequ_div line 224 in file
		'/home/macro/github/verilog-basic/dc-example/synthesis/src/work/sequ_div.v'.
====================================================================================
|      Register Name       |   Type    | Width | Bus | MB | AR | AS | SR | SS | ST |
====================================================================================
|       illegal_reg        | Flip-flop |   1   |  N  | N  | Y  | N  | N  | N  | N  |
|       quotient_reg       | Flip-flop |  32   |  Y  | N  | Y  | N  | N  | N  | N  |
|      remainder_reg       | Flip-flop |  32   |  Y  | N  | Y  | N  | N  | N  | N  |
|     shift_count_reg      | Flip-flop |   5   |  Y  | N  | Y  | N  | N  | N  | N  |
|  remainder_quotient_reg  | Flip-flop |  64   |  Y  | N  | Y  | N  | N  | N  | N  |
| illegal_divider_zero_reg | Flip-flop |   1   |  N  | N  | Y  | N  | N  | N  | N  |
|        ready_reg         | Flip-flop |   1   |  N  | N  | Y  | N  | N  | N  | N  |
====================================================================================
Presto compilation completed successfully.
Elaborated 1 design.
Current design is now 'sequ_div'.
1
current_design  $TOP_MODULE
Current design is 'sequ_div'.
{sequ_div}
if {[list] == 0} {
    echo "Link with error!";
    exit;
}
if {[check_design] == 0} {
    echo "Check desing with error!";
    exit;
}
 
****************************************
check_design summary:
Version:     L-2016.03-SP1
Date:        Sun Aug 13 22:08:07 2023
****************************************

                   Name                                            Total
--------------------------------------------------------------------------------
Cells                                                               5
    Cells do not drive (LINT-1)                                     5
--------------------------------------------------------------------------------

Warning: In design 'sequ_div', cell 'B_21' does not drive any nets. (LINT-1)
Warning: In design 'sequ_div', cell 'B_22' does not drive any nets. (LINT-1)
Warning: In design 'sequ_div', cell 'C2208' does not drive any nets. (LINT-1)
Warning: In design 'sequ_div', cell 'C2210' does not drive any nets. (LINT-1)
Warning: In design 'sequ_div', cell 'C2212' does not drive any nets. (LINT-1)
#=====================================================================
# step 2: reset the designi first
#=====================================================================
reset_design
1
#=====================================================================
# step 3: write the unmapped file
#=====================================================================
uniquify
1
set uniquify_name_style "%s_%d"
%s_%d
write_file -format ddc -hierarchy -output ${UNMAPPED_FILE_PATH}/${TOP_MODULE}.ddc
Writing ddc file '/home/macro/github/verilog-basic/dc-example/synthesis/syn/unmapped/sequ_div.ddc'.
1
#=====================================================================
# step 4: define default constration
#=====================================================================
source default_con.tcl
Current design is 'sequ_div'.
Warning: Design rule attributes from the driving cell will be
	set on the port. (UID-401)
Warning: Design rule attributes from the driving cell will be
	set on the port. (UID-401)
Warning: Design rule attributes from the driving cell will be
	set on the port. (UID-401)
Warning: Design rule attributes from the driving cell will be
	set on the port. (UID-401)
Warning: Design rule attributes from the driving cell will be
	set on the port. (UID-401)
Warning: Design rule attributes from the driving cell will be
	set on the port. (UID-401)
Warning: Design rule attributes from the driving cell will be
	set on the port. (UID-401)
Warning: Design rule attributes from the driving cell will be
	set on the port. (UID-401)
Warning: Design rule attributes from the driving cell will be
	set on the port. (UID-401)
Warning: Design rule attributes from the driving cell will be
	set on the port. (UID-401)
Warning: Design rule attributes from the driving cell will be
	set on the port. (UID-401)
Warning: Design rule attributes from the driving cell will be
	set on the port. (UID-401)
Warning: Design rule attributes from the driving cell will be
	set on the port. (UID-401)
Warning: Design rule attributes from the driving cell will be
	set on the port. (UID-401)
Warning: Design rule attributes from the driving cell will be
	set on the port. (UID-401)
Warning: Design rule attributes from the driving cell will be
	set on the port. (UID-401)
Warning: Design rule attributes from the driving cell will be
	set on the port. (UID-401)
Warning: Design rule attributes from the driving cell will be
	set on the port. (UID-401)
Warning: Design rule attributes from the driving cell will be
	set on the port. (UID-401)
Warning: Design rule attributes from the driving cell will be
	set on the port. (UID-401)
Warning: Design rule attributes from the driving cell will be
	set on the port. (UID-401)
Warning: Design rule attributes from the driving cell will be
	set on the port. (UID-401)
Warning: Design rule attributes from the driving cell will be
	set on the port. (UID-401)
Warning: Design rule attributes from the driving cell will be
	set on the port. (UID-401)
Warning: Design rule attributes from the driving cell will be
	set on the port. (UID-401)
Warning: Design rule attributes from the driving cell will be
	set on the port. (UID-401)
Warning: Design rule attributes from the driving cell will be
	set on the port. (UID-401)
Warning: Design rule attributes from the driving cell will be
	set on the port. (UID-401)
Warning: Design rule attributes from the driving cell will be
	set on the port. (UID-401)
Warning: Design rule attributes from the driving cell will be
	set on the port. (UID-401)
Warning: Design rule attributes from the driving cell will be
	set on the port. (UID-401)
Warning: Design rule attributes from the driving cell will be
	set on the port. (UID-401)
Warning: Design rule attributes from the driving cell will be
	set on the port. (UID-401)
Warning: Design rule attributes from the driving cell will be
	set on the port. (UID-401)
Warning: Design rule attributes from the driving cell will be
	set on the port. (UID-401)
Warning: Design rule attributes from the driving cell will be
	set on the port. (UID-401)
Warning: Design rule attributes from the driving cell will be
	set on the port. (UID-401)
Warning: Design rule attributes from the driving cell will be
	set on the port. (UID-401)
Warning: Design rule attributes from the driving cell will be
	set on the port. (UID-401)
Warning: Design rule attributes from the driving cell will be
	set on the port. (UID-401)
Warning: Design rule attributes from the driving cell will be
	set on the port. (UID-401)
Warning: Design rule attributes from the driving cell will be
	set on the port. (UID-401)
Warning: Design rule attributes from the driving cell will be
	set on the port. (UID-401)
Warning: Design rule attributes from the driving cell will be
	set on the port. (UID-401)
Warning: Design rule attributes from the driving cell will be
	set on the port. (UID-401)
Warning: Design rule attributes from the driving cell will be
	set on the port. (UID-401)
Warning: Design rule attributes from the driving cell will be
	set on the port. (UID-401)
Warning: Design rule attributes from the driving cell will be
	set on the port. (UID-401)
Warning: Design rule attributes from the driving cell will be
	set on the port. (UID-401)
Warning: Design rule attributes from the driving cell will be
	set on the port. (UID-401)
Warning: Design rule attributes from the driving cell will be
	set on the port. (UID-401)
Warning: Design rule attributes from the driving cell will be
	set on the port. (UID-401)
Warning: Design rule attributes from the driving cell will be
	set on the port. (UID-401)
Warning: Design rule attributes from the driving cell will be
	set on the port. (UID-401)
Warning: Design rule attributes from the driving cell will be
	set on the port. (UID-401)
Warning: Design rule attributes from the driving cell will be
	set on the port. (UID-401)
Warning: Design rule attributes from the driving cell will be
	set on the port. (UID-401)
Warning: Design rule attributes from the driving cell will be
	set on the port. (UID-401)
Warning: Design rule attributes from the driving cell will be
	set on the port. (UID-401)
Warning: Design rule attributes from the driving cell will be
	set on the port. (UID-401)
Warning: Design rule attributes from the driving cell will be
	set on the port. (UID-401)
Warning: Design rule attributes from the driving cell will be
	set on the port. (UID-401)
Warning: Design rule attributes from the driving cell will be
	set on the port. (UID-401)
Warning: Design rule attributes from the driving cell will be
	set on the port. (UID-401)
Warning: Design rule attributes from the driving cell will be
	set on the port. (UID-401)
Warning: Design rule attributes from the driving cell will be
	set on the port. (UID-401)
Warning: Design rule attributes from the driving cell will be
	set on the port. (UID-401)
Using operating conditions 'typical' found in library 'typical'.
Information: Updating design information... (UID-85)
Warning: Design 'sequ_div' contains 1 high-fanout nets. A fanout number of 1000 will be used for delay calculations involving these nets. (TIM-134)
 
****************************************
Report : path_group
Design : sequ_div
Version: L-2016.03-SP1
Date   : Sun Aug 13 22:08:07 2023
****************************************

                        Critical
Group Name    Weight    Range
--------------------------------------------------------------------------------
**default**   1.00      0.00                 
COMB          1.00      1.00                 
INPUTS        1.00      1.00                 
OUTPUTS       1.00      1.00                 
clk           5.00      1.00                 

Path Group COMB:
	-from    { clk\
		   rst_n\
		   divider[31]\
		   divider[30]\
		   divider[29]\
		   divider[28]\
		   divider[27]\
		   divider[26]\
		   divider[25]\
		   divider[24]\
		   divider[23]\
		   divider[22]\
		   divider[21]\
		   divider[20]\
		   divider[19]\
		   divider[18]\
		   divider[17]\
		   divider[16]\
		   divider[15]\
		   divider[14]\
		   divider[13]\
		   divider[12]\
		   divider[11]\
		   divider[10]\
		   divider[9]\
		   divider[8]\
		   divider[7]\
		   divider[6]\
		   divider[5]\
		   divider[4]\
		   divider[3]\
		   divider[2]\
		   divider[1]\
		   divider[0]\
		   dividend[31]\
		   dividend[30]\
		   dividend[29]\
		   dividend[28]\
		   dividend[27]\
		   dividend[26]\
		   dividend[25]\
		   dividend[24]\
		   dividend[23]\
		   dividend[22]\
		   dividend[21]\
		   dividend[20]\
		   dividend[19]\
		   dividend[18]\
		   dividend[17]\
		   dividend[16]\
		   dividend[15]\
		   dividend[14]\
		   dividend[13]\
		   dividend[12]\
		   dividend[11]\
		   dividend[10]\
		   dividend[9]\
		   dividend[8]\
		   dividend[7]\
		   dividend[6]\
		   dividend[5]\
		   dividend[4]\
		   dividend[3]\
		   dividend[2]\
		   dividend[1]\
		   dividend[0]\
		   start }\
	-to      { quotient[31]\
		   quotient[30]\
		   quotient[29]\
		   quotient[28]\
		   quotient[27]\
		   quotient[26]\
		   quotient[25]\
		   quotient[24]\
		   quotient[23]\
		   quotient[22]\
		   quotient[21]\
		   quotient[20]\
		   quotient[19]\
		   quotient[18]\
		   quotient[17]\
		   quotient[16]\
		   quotient[15]\
		   quotient[14]\
		   quotient[13]\
		   quotient[12]\
		   quotient[11]\
		   quotient[10]\
		   quotient[9]\
		   quotient[8]\
		   quotient[7]\
		   quotient[6]\
		   quotient[5]\
		   quotient[4]\
		   quotient[3]\
		   quotient[2]\
		   quotient[1]\
		   quotient[0]\
		   remainder[31]\
		   remainder[30]\
		   remainder[29]\
		   remainder[28]\
		   remainder[27]\
		   remainder[26]\
		   remainder[25]\
		   remainder[24]\
		   remainder[23]\
		   remainder[22]\
		   remainder[21]\
		   remainder[20]\
		   remainder[19]\
		   remainder[18]\
		   remainder[17]\
		   remainder[16]\
		   remainder[15]\
		   remainder[14]\
		   remainder[13]\
		   remainder[12]\
		   remainder[11]\
		   remainder[10]\
		   remainder[9]\
		   remainder[8]\
		   remainder[7]\
		   remainder[6]\
		   remainder[5]\
		   remainder[4]\
		   remainder[3]\
		   remainder[2]\
		   remainder[1]\
		   remainder[0]\
		   ready\
		   illegal_divider_zero }

Path Group INPUTS:
	-from    { clk\
		   rst_n\
		   divider[31]\
		   divider[30]\
		   divider[29]\
		   divider[28]\
		   divider[27]\
		   divider[26]\
		   divider[25]\
		   divider[24]\
		   divider[23]\
		   divider[22]\
		   divider[21]\
		   divider[20]\
		   divider[19]\
		   divider[18]\
		   divider[17]\
		   divider[16]\
		   divider[15]\
		   divider[14]\
		   divider[13]\
		   divider[12]\
		   divider[11]\
		   divider[10]\
		   divider[9]\
		   divider[8]\
		   divider[7]\
		   divider[6]\
		   divider[5]\
		   divider[4]\
		   divider[3]\
		   divider[2]\
		   divider[1]\
		   divider[0]\
		   dividend[31]\
		   dividend[30]\
		   dividend[29]\
		   dividend[28]\
		   dividend[27]\
		   dividend[26]\
		   dividend[25]\
		   dividend[24]\
		   dividend[23]\
		   dividend[22]\
		   dividend[21]\
		   dividend[20]\
		   dividend[19]\
		   dividend[18]\
		   dividend[17]\
		   dividend[16]\
		   dividend[15]\
		   dividend[14]\
		   dividend[13]\
		   dividend[12]\
		   dividend[11]\
		   dividend[10]\
		   dividend[9]\
		   dividend[8]\
		   dividend[7]\
		   dividend[6]\
		   dividend[5]\
		   dividend[4]\
		   dividend[3]\
		   dividend[2]\
		   dividend[1]\
		   dividend[0]\
		   start }

Path Group OUTPUTS:
	-to      { quotient[31]\
		   quotient[30]\
		   quotient[29]\
		   quotient[28]\
		   quotient[27]\
		   quotient[26]\
		   quotient[25]\
		   quotient[24]\
		   quotient[23]\
		   quotient[22]\
		   quotient[21]\
		   quotient[20]\
		   quotient[19]\
		   quotient[18]\
		   quotient[17]\
		   quotient[16]\
		   quotient[15]\
		   quotient[14]\
		   quotient[13]\
		   quotient[12]\
		   quotient[11]\
		   quotient[10]\
		   quotient[9]\
		   quotient[8]\
		   quotient[7]\
		   quotient[6]\
		   quotient[5]\
		   quotient[4]\
		   quotient[3]\
		   quotient[2]\
		   quotient[1]\
		   quotient[0]\
		   remainder[31]\
		   remainder[30]\
		   remainder[29]\
		   remainder[28]\
		   remainder[27]\
		   remainder[26]\
		   remainder[25]\
		   remainder[24]\
		   remainder[23]\
		   remainder[22]\
		   remainder[21]\
		   remainder[20]\
		   remainder[19]\
		   remainder[18]\
		   remainder[17]\
		   remainder[16]\
		   remainder[15]\
		   remainder[14]\
		   remainder[13]\
		   remainder[12]\
		   remainder[11]\
		   remainder[10]\
		   remainder[9]\
		   remainder[8]\
		   remainder[7]\
		   remainder[6]\
		   remainder[5]\
		   remainder[4]\
		   remainder[3]\
		   remainder[2]\
		   remainder[1]\
		   remainder[0]\
		   ready\
		   illegal_divider_zero }

Path Group clk:
	-to      clk


  Loading design 'sequ_div'
Warning: Design 'sequ_div' contains 1 high-fanout nets. A fanout number of 1000 will be used for delay calculations involving these nets. (TIM-134)
  Simplifying Design 'sequ_div'
#=====================================================================
# step 5: check timing and design
#=====================================================================
check_timing
Information: Updating design information... (UID-85)
Warning: Design 'sequ_div' contains 1 high-fanout nets. A fanout number of 1000 will be used for delay calculations involving these nets. (TIM-134)

Information: Checking generated_clocks...

Information: Checking loops...

Information: Checking no_input_delay...

Information: Checking unconstrained_endpoints...

Information: Checking pulse_clock_cell_type...

Information: Checking no_driving_cell...

Information: Checking partial_input_delay...
1
check_design
 
****************************************
check_design summary:
Version:     L-2016.03-SP1
Date:        Sun Aug 13 22:08:08 2023
****************************************

                   Name                                            Total
--------------------------------------------------------------------------------
Nets                                                                5
    Unloaded nets (LINT-2)                                          5
--------------------------------------------------------------------------------

Warning: In design 'sequ_div', net 'net540' driven by pin 'C2212/Z' has no loads. (LINT-2)
Warning: In design 'sequ_div', net 'net539' driven by pin 'C2210/Z' has no loads. (LINT-2)
Warning: In design 'sequ_div', net 'net538' driven by pin 'C2208/Z' has no loads. (LINT-2)
Warning: In design 'sequ_div', net 'net537' driven by pin 'B_22/Z' has no loads. (LINT-2)
Warning: In design 'sequ_div', net 'net536' driven by pin 'B_21/Z' has no loads. (LINT-2)
1
#=====================================================================
# step 6: compile
#=====================================================================
source run_compile.tcl
Warning: duplicate option '-incremental' overrides previous value. (CMD-018)
Warning: The -timing_high_effort_script option is ignored.  (OPT-1342)
Information: Performing power optimization. (PWR-850)
Analyzing: "/home/macro/synopsys/dc_pdk_lib/SMIC180/std/synopsys/typical.db"
Library analysis succeeded.
Information: Running optimization using a maximum of 2 cores. (OPT-1500)
Information: Choosing a test methodology will restrict the optimization of sequential cells. (UIO-12)
Loading db file '/home/macro/synopsys/dc_2016/syn/L-2016.03-SP1/libraries/syn/dw_foundation.sldb'
Warning: DesignWare synthetic library dw_foundation.sldb is added to the synthetic_library in the current command. (UISN-40)
Information: Evaluating DesignWare library utilization. (UISN-27)

============================================================================
| DesignWare Building Block Library  |         Version         | Available |
============================================================================
| Basic DW Building Blocks           | L-2016.03-DWBB_201603.1 |     *     |
| Licensed DW Building Blocks        | L-2016.03-DWBB_201603.1 |     *     |
============================================================================


Information: There are 5 potential problems in your design. Please run 'check_design' for more information. (LINT-99)


Loaded alib file './alib-52/typical.db.alib'
Information: State dependent leakage is now switched from on to off.

  Beginning Pass 1 Mapping  (Incremental)
  ------------------------
  Processing 'sequ_div'
Information: Added key list 'DesignWare' to design 'sequ_div'. (DDB-72)

  Updating timing information
Information: Updating design information... (UID-85)
Information: The library cell 'HOLDX1' in the library 'typical' is not characterized for internal power. (PWR-536)
Information: The target library(s) contains cell(s), other than black boxes, that are not characterized for internal power. (PWR-24)
  Mapping 'sequ_div_DW_cmp_0'
  Mapping 'sequ_div_DW01_dec_0'
  Mapping 'sequ_div_DW01_sub_0'
Information: Automatic shift-register identification is enabled for scan. Not all registers will be scan-replaced. (OPT-467)

                                  TOTAL                                                
   ELAPSED            WORST NEG   SETUP    DESIGN                              LEAKAGE 
    TIME      AREA      SLACK     COST    RULE COST         ENDPOINT            POWER  
  --------- --------- --------- --------- --------- ------------------------- ---------
    0:00:05   29119.3     11.25    4802.5     501.0                           130229.6328
    0:00:05   29119.3     11.25    4802.5     501.0                           130229.6328

  Beginning Mapping Optimizations  (Ultra High effort)  (Incremental)
  -------------------------------

  Beginning Incremental Implementation Selection
  ----------------------------------------------
  Selecting implementations
  Mapping 'sequ_div_DW01_sub_2'
  Mapping 'sequ_div_DW01_sub_3'
    0:00:06   38659.4     11.26    4298.9      43.7                           185062.8906
    0:00:06   40116.4     11.05    3977.8      43.7                           184028.6875
    0:00:06   40116.4     11.05    3977.8      43.7                           184028.6875
    0:00:07   40139.7     11.05    3965.1      43.7                           184161.1094
  Global Optimization (Phase 1)
  Global Optimization (Phase 2)
  Global Optimization (Phase 3)
  Global Optimization (Phase 4)
  Global Optimization (Phase 5)



  Beginning Delay Optimization Phase
  ----------------------------------

                                  TOTAL                                                
   ELAPSED            WORST NEG   SETUP    DESIGN                              LEAKAGE 
    TIME      AREA      SLACK     COST    RULE COST         ENDPOINT            POWER  
  --------- --------- --------- --------- --------- ------------------------- ---------
    0:00:07   40119.7      0.00       0.0      12.4                           184652.6875
    0:00:07   38363.4      0.00       0.0      12.4                           167011.9844
    0:00:07   33706.4      0.00       0.0      12.4                           132671.7969
    0:00:07   33706.4      0.00       0.0      12.4                           132671.7969
    0:00:07   33706.4      0.00       0.0      12.4                           132671.7969
    0:00:07   33706.4      0.00       0.0      12.4                           132671.7969
    0:00:07   33706.4      0.00       0.0      12.4                           132671.7969

  Beginning Delay Optimization
  ----------------------------
    0:00:07   33706.4      0.00       0.0      12.4                           132671.7969
    0:00:07   33706.4      0.00       0.0      12.4                           132671.7969
    0:00:07   33706.4      0.00       0.0      12.4                           132671.7969
    0:00:07   33706.4      0.00       0.0      12.4                           132671.7969
    0:00:07   33706.4      0.00       0.0      12.4                           132671.7969
    0:00:08   33540.1      0.00       0.0      12.3                           130450.3516


  Beginning Design Rule Fixing  (max_transition)  (max_capacitance)
  ----------------------------

                                  TOTAL                                                
   ELAPSED            WORST NEG   SETUP    DESIGN                              LEAKAGE 
    TIME      AREA      SLACK     COST    RULE COST         ENDPOINT            POWER  
  --------- --------- --------- --------- --------- ------------------------- ---------
    0:00:08   33540.1      0.00       0.0      12.3                           130450.3516
    0:00:08   33550.1      0.00       0.0       0.0                           130469.2188
    0:00:08   33244.0      0.00       0.0       0.0                           128493.9219
    0:00:08   33244.0      0.00       0.0       0.0                           128493.9219
    0:00:08   33244.0      0.00       0.0       0.0                           128493.9219
    0:00:08   33244.0      0.00       0.0       0.0                           128493.9219
    0:00:08   33244.0      0.00       0.0       0.0                           128493.9219
    0:00:08   33244.0      0.00       0.0       0.0                           128493.9219
    0:00:08   33244.0      0.00       0.0       0.0                           128493.9219
    0:00:08   33244.0      0.00       0.0       0.0                           128493.9219
    0:00:08   33244.0      0.00       0.0       0.0                           128493.9219


  Beginning Critical Range Optimization
  -------------------------------------

                                  TOTAL                                                
   ELAPSED            WORST NEG   SETUP    DESIGN                              LEAKAGE 
    TIME      AREA      SLACK     COST    RULE COST         ENDPOINT            POWER  
  --------- --------- --------- --------- --------- ------------------------- ---------
    0:00:08   33244.0      0.00       0.0       0.0                           128493.9219


  Beginning Leakage Power Optimization  (max_leakage_power 0)
  ------------------------------------

                                  TOTAL                                                
   ELAPSED            WORST NEG   SETUP    DESIGN                              LEAKAGE 
    TIME      AREA      SLACK     COST    RULE COST         ENDPOINT            POWER  
  --------- --------- --------- --------- --------- ------------------------- ---------
    0:00:08   33244.0      0.00       0.0       0.0                           128493.9219
    0:00:09   32172.9      0.00       0.0       0.0                           124170.1797
    0:00:09   32083.1      0.00       0.0       0.0                           123659.9844
    0:00:09   32083.1      0.00       0.0       0.0                           123659.9844
    0:00:09   32083.1      0.00       0.0       0.0                           123659.9844
    0:00:09   32083.1      0.00       0.0       0.0                           123659.9844
    0:00:09   32083.1      0.00       0.0       0.0                           123659.9844
    0:00:09   32083.1      0.00       0.0       0.0                           123659.9844
    0:00:09   32083.1      0.00       0.0       0.0                           123659.9844
    0:00:09   32083.1      0.00       0.0       0.0                           123659.9844
    0:00:09   32083.1      0.00       0.0       0.0                           123659.9844
    0:00:09   32083.1      0.00       0.0       0.0                           123659.9844

                                  TOTAL                                                
   ELAPSED            WORST NEG   SETUP    DESIGN                              LEAKAGE 
    TIME      AREA      SLACK     COST    RULE COST         ENDPOINT            POWER  
  --------- --------- --------- --------- --------- ------------------------- ---------
    0:00:09  175677.2      0.00       0.0       0.0                           123659.9844
    0:00:09  175677.2      0.00       0.0       0.0                           123659.9844
    0:00:10  172853.1      0.00       0.0       0.0                           98928.5156
    0:00:10  172853.1      0.00       0.0       0.0                           98928.5156
    0:00:10  172799.9      0.00       0.0       0.0                           98558.9688
Loading db file '/home/macro/synopsys/dc_pdk_lib/SMIC180/std/synopsys/fast.db'
Loading db file '/home/macro/synopsys/dc_pdk_lib/SMIC180/std/synopsys/fasta.db'
Loading db file '/home/macro/synopsys/dc_pdk_lib/SMIC180/std/synopsys/slow.db'
Loading db file '/home/macro/synopsys/dc_pdk_lib/SMIC180/std/synopsys/typical.db'


Note: Symbol # after min delay cost means estimated hold TNS across all active scenarios 


  Optimization Complete
  ---------------------
Information: State dependent leakage is now switched from off to on.
Information: Propagating switching activity (low effort zero delay simulation). (PWR-6)
Error: unknown option '-all_violatiors' (CMD-010)
Information: Updating design information... (UID-85)
 
****************************************
Report : timing
        -path full
        -delay max
        -max_paths 1
Design : sequ_div
Version: L-2016.03-SP1
Date   : Sun Aug 13 22:09:51 2023
****************************************

Operating Conditions: typical   Library: typical
Wire Load Model Mode: enclosed

  Startpoint: remainder_quotient_reg[32]
              (rising edge-triggered flip-flop clocked by clk)
  Endpoint: remainder_quotient_reg[44]
            (rising edge-triggered flip-flop clocked by clk)
  Path Group: clk
  Path Type: max

  Des/Clust/Port     Wire Load Model       Library
  ------------------------------------------------
  sequ_div           smic18_wl10           typical

  Point                                                   Incr       Path
  --------------------------------------------------------------------------
  clock clk (rise edge)                                   0.00       0.00
  clock network delay (ideal)                             2.00       2.00
  remainder_quotient_reg[32]/CK (SDFFRXL)                 0.00       2.00 r
  remainder_quotient_reg[32]/Q (SDFFRXL)                  0.85       2.85 r
  sub_x_2/[A|1] (sequ_div_DW01_sub_3)                     0.00       2.85 r
  sub_x_2/U306/Y (NOR2XL)                                 0.23       3.09 f
  sub_x_2/U310/Y (OAI21XL)                                0.37       3.45 r
  sub_x_2/U229/Y (AOI21X1)                                0.16       3.62 f
  sub_x_2/U196/Y (OAI21XL)                                0.36       3.98 r
  sub_x_2/U122/Y (AOI21X1)                                0.17       4.14 f
  sub_x_2/U319/Y (OAI21XL)                                0.38       4.53 r
  sub_x_2/U87/Y (AOI21X1)                                 0.21       4.73 f
  sub_x_2/U81/Y (OAI21XL)                                 0.39       5.12 r
  sub_x_2/U73/Y (AOI21X1)                                 0.21       5.33 f
  sub_x_2/U67/Y (OAI21XL)                                 0.39       5.72 r
  sub_x_2/U59/Y (AOI21X1)                                 0.21       5.92 f
  sub_x_2/U320/Y (OAI21XL)                                0.39       6.31 r
  sub_x_2/U45/Y (AOI21X1)                                 0.21       6.51 f
  sub_x_2/U39/Y (OAI21XL)                                 0.38       6.89 r
  sub_x_2/U321/Y (AOI21XL)                                0.25       7.14 f
  sub_x_2/U25/Y (OAI21XL)                                 0.40       7.54 r
  sub_x_2/U17/Y (AOI21X1)                                 0.21       7.75 f
  sub_x_2/U11/Y (OAI21XL)                                 0.38       8.12 r
  sub_x_2/U315/Y (AOI21XL)                                0.18       8.30 f
  sub_x_2/U1/Y (XOR2XL)                                   0.27       8.57 r
  sub_x_2/[DIFF|32] (sequ_div_DW01_sub_3)                 0.00       8.57 r
  I_7/Y (INVX1)                                           0.12       8.70 f
  U633/Y (NOR2X2)                                         1.48      10.18 r
  U594/Y (AOI22XL)                                        0.24      10.42 f
  U282/Y (OAI21XL)                                        0.26      10.67 r
  U429/Y (MX2X2)                                          0.16      10.84 r
  remainder_quotient_reg[44]/D (SDFFRXL)                  0.00      10.84 r
  data arrival time                                                 10.84

  clock clk (rise edge)                                  10.00      10.00
  clock network delay (ideal)                             2.00      12.00
  clock uncertainty                                      -0.50      11.50
  remainder_quotient_reg[44]/CK (SDFFRXL)                 0.00      11.50 r
  library setup time                                     -0.10      11.40
  data required time                                                11.40
  --------------------------------------------------------------------------
  data required time                                                11.40
  data arrival time                                                -10.84
  --------------------------------------------------------------------------
  slack (MET)                                                        0.56


  Startpoint: divider[1] (input port clocked by clk)
  Endpoint: remainder_quotient_reg[44]
            (rising edge-triggered flip-flop clocked by clk)
  Path Group: INPUTS
  Path Type: max

  Des/Clust/Port     Wire Load Model       Library
  ------------------------------------------------
  sequ_div           smic18_wl10           typical

  Point                                                   Incr       Path
  --------------------------------------------------------------------------
  clock clk (rise edge)                                   0.00       0.00
  clock network delay (ideal)                             2.00       2.00
  input external delay                                    1.00       3.00 f
  divider[1] (in)                                         0.19       3.19 f
  sub_x_2/[B|1] (sequ_div_DW01_sub_3)                     0.00       3.19 f
  sub_x_2/U335/Y (INVXL)                                  0.27       3.47 r
  sub_x_2/U306/Y (NOR2XL)                                 0.17       3.64 f
  sub_x_2/U310/Y (OAI21XL)                                0.37       4.01 r
  sub_x_2/U229/Y (AOI21X1)                                0.16       4.17 f
  sub_x_2/U196/Y (OAI21XL)                                0.36       4.53 r
  sub_x_2/U122/Y (AOI21X1)                                0.17       4.70 f
  sub_x_2/U319/Y (OAI21XL)                                0.38       5.08 r
  sub_x_2/U87/Y (AOI21X1)                                 0.21       5.28 f
  sub_x_2/U81/Y (OAI21XL)                                 0.39       5.67 r
  sub_x_2/U73/Y (AOI21X1)                                 0.21       5.88 f
  sub_x_2/U67/Y (OAI21XL)                                 0.39       6.27 r
  sub_x_2/U59/Y (AOI21X1)                                 0.21       6.47 f
  sub_x_2/U320/Y (OAI21XL)                                0.39       6.86 r
  sub_x_2/U45/Y (AOI21X1)                                 0.21       7.07 f
  sub_x_2/U39/Y (OAI21XL)                                 0.38       7.44 r
  sub_x_2/U321/Y (AOI21XL)                                0.25       7.69 f
  sub_x_2/U25/Y (OAI21XL)                                 0.40       8.09 r
  sub_x_2/U17/Y (AOI21X1)                                 0.21       8.30 f
  sub_x_2/U11/Y (OAI21XL)                                 0.38       8.67 r
  sub_x_2/U315/Y (AOI21XL)                                0.18       8.85 f
  sub_x_2/U1/Y (XOR2XL)                                   0.27       9.13 r
  sub_x_2/[DIFF|32] (sequ_div_DW01_sub_3)                 0.00       9.13 r
  I_7/Y (INVX1)                                           0.12       9.25 f
  U633/Y (NOR2X2)                                         1.48      10.73 r
  U594/Y (AOI22XL)                                        0.24      10.97 f
  U282/Y (OAI21XL)                                        0.26      11.23 r
  U429/Y (MX2X2)                                          0.16      11.39 r
  remainder_quotient_reg[44]/D (SDFFRXL)                  0.00      11.39 r
  data arrival time                                                 11.39

  clock clk (rise edge)                                  10.00      10.00
  clock network delay (ideal)                             2.00      12.00
  clock uncertainty                                      -0.50      11.50
  remainder_quotient_reg[44]/CK (SDFFRXL)                 0.00      11.50 r
  library setup time                                     -0.10      11.40
  data required time                                                11.40
  --------------------------------------------------------------------------
  data required time                                                11.40
  data arrival time                                                -11.39
  --------------------------------------------------------------------------
  slack (MET)                                                        0.01


  Startpoint: illegal_divider_zero_reg
              (rising edge-triggered flip-flop clocked by clk)
  Endpoint: illegal_divider_zero
            (output port clocked by clk)
  Path Group: OUTPUTS
  Path Type: max

  Des/Clust/Port     Wire Load Model       Library
  ------------------------------------------------
  sequ_div           smic18_wl10           typical

  Point                                                   Incr       Path
  --------------------------------------------------------------------------
  clock clk (rise edge)                                   0.00       0.00
  clock network delay (ideal)                             2.00       2.00
  illegal_divider_zero_reg/CK (SDFFRXL)                   0.00       2.00 r
  illegal_divider_zero_reg/Q (SDFFRXL)                    0.62       2.62 r
  U656/Y (CLKBUFX3)                                       1.33       3.95 r
  illegal_divider_zero (out)                              0.00       3.95 r
  data arrival time                                                  3.95

  clock clk (rise edge)                                  10.00      10.00
  clock network delay (ideal)                             2.00      12.00
  clock uncertainty                                      -0.50      11.50
  output external delay                                  -1.00      10.50
  data required time                                                10.50
  --------------------------------------------------------------------------
  data required time                                                10.50
  data arrival time                                                 -3.95
  --------------------------------------------------------------------------
  slack (MET)                                                        6.55


 
****************************************
Report : area
Design : sequ_div
Version: L-2016.03-SP1
Date   : Sun Aug 13 22:09:51 2023
****************************************

Library(s) Used:

    typical (File: /home/macro/synopsys/dc_pdk_lib/SMIC180/std/synopsys/typical.db)

Number of ports:                          303
Number of nets:                          1612
Number of cells:                         1374
Number of combinational cells:           1080
Number of sequential cells:               292
Number of macros/black boxes:               0
Number of buf/inv:                        222
Number of references:                      46

Combinational area:              15713.913801
Buf/Inv area:                     1955.923226
Noncombinational area:           13491.878159
Macro/Black Box area:                0.000000
Net Interconnect area:          143594.070038

Total cell area:                 29205.791959
Total area:                     172799.861997
Warning: The specified replacement character (_) is conflicting with the specified allowed or restricted character.   (UCN-4)
Writing ddc file '/home/macro/github/verilog-basic/dc-example/synthesis/syn/mapped/sequ_div.ddc'.
Writing verilog file '/home/macro/github/verilog-basic/dc-example/synthesis/syn/netlist/sequ_div.v'.
Information: Annotated 'cell' delays are assumed to include load delay. (UID-282)
Information: Writing timing information to file '/home/macro/github/verilog-basic/dc-example/synthesis/syn/mapped/sequ_div.sdf'. (WT-3)
#=====================================================================
# step 7: save report 
#=====================================================================
source save_output.tcl
 
****************************************
check_design summary:
Version:     L-2016.03-SP1
Date:        Sun Aug 13 22:09:51 2023
****************************************

                   Name                                            Total
--------------------------------------------------------------------------------
Inputs/Outputs                                                      7
    Unconnected ports (LINT-28)                                     7

Cells                                                               7
    Connected to power or ground (LINT-32)                          5
    Nets connected to multiple pins on same cell (LINT-33)          2
--------------------------------------------------------------------------------

Warning: In design 'sequ_div_DW_cmp_1', port 'TC' is not connected to any nets. (LINT-28)
Warning: In design 'sequ_div_DW_cmp_1', port 'GE_LT' is not connected to any nets. (LINT-28)
Warning: In design 'sequ_div_DW_cmp_1', port 'GE_GT_EQ' is not connected to any nets. (LINT-28)
Warning: In design 'sequ_div_DW_cmp_1', port 'EQ_NE' is not connected to any nets. (LINT-28)
Warning: In design 'sequ_div_DW01_sub_3', port 'p_B[32]' is not connected to any nets. (LINT-28)
Warning: In design 'sequ_div_DW01_sub_3', port 'CI' is not connected to any nets. (LINT-28)
Warning: In design 'sequ_div_DW01_sub_3', port 'CO' is not connected to any nets. (LINT-28)
Warning: In design 'sequ_div', a pin on submodule 'gt_x_24' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'TC' is connected to logic 0. 
Warning: In design 'sequ_div', a pin on submodule 'gt_x_24' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'GE_LT' is connected to logic 0. 
Warning: In design 'sequ_div', a pin on submodule 'gt_x_24' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'GE_GT_EQ' is connected to logic 1. 
Warning: In design 'sequ_div', a pin on submodule 'sub_x_2' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'p_B[32]' is connected to logic 0. 
Warning: In design 'sequ_div', a pin on submodule 'sub_x_2' is connected to logic 1 or logic 0. (LINT-32)
   Pin 'CI' is connected to logic 0. 
Warning: In design 'sequ_div', the same net is connected to more than one pin on submodule 'gt_x_24'. (LINT-33)
   Net 'n403' is connected to pins 'TC', 'GE_LT''.
Warning: In design 'sequ_div', the same net is connected to more than one pin on submodule 'sub_x_2'. (LINT-33)
   Net 'n403' is connected to pins 'p_B[32]', 'CI''.
1

Information: Checking generated_clocks...

Information: Checking loops...

Information: Checking no_input_delay...

Information: Checking unconstrained_endpoints...

Information: Checking pulse_clock_cell_type...

Information: Checking no_driving_cell...

Information: Checking partial_input_delay...
1
 
****************************************
Report : constraint
        -all_violators
Design : sequ_div
Version: L-2016.03-SP1
Date   : Sun Aug 13 22:09:51 2023
****************************************


   max_area

                             Required        Actual
   Design                      Area           Area           Slack
   -----------------------------------------------------------------
   sequ_div                     0.00       172799.86      -172799.86
                                                                    (VIOLATED)


   max_leakage_power

                             Required        Actual
   Design                   Leakage Power  Leakage Power     Slack
   -----------------------------------------------------------------
   sequ_div                     0.00       104843.55      -104843.55
                                                                    (VIOLATED)


1
 
****************************************
Report : timing
        -path full
        -delay max
        -max_paths 1
Design : sequ_div
Version: L-2016.03-SP1
Date   : Sun Aug 13 22:09:51 2023
****************************************

Operating Conditions: typical   Library: typical
Wire Load Model Mode: enclosed

  Startpoint: remainder_quotient_reg_32_
              (rising edge-triggered flip-flop clocked by clk)
  Endpoint: remainder_quotient_reg_44_
            (rising edge-triggered flip-flop clocked by clk)
  Path Group: clk
  Path Type: max

  Des/Clust/Port     Wire Load Model       Library
  ------------------------------------------------
  sequ_div           smic18_wl10           typical

  Point                                                   Incr       Path
  --------------------------------------------------------------------------
  clock clk (rise edge)                                   0.00       0.00
  clock network delay (ideal)                             2.00       2.00
  remainder_quotient_reg_32_/CK (SDFFRXL)                 0.00       2.00 r
  remainder_quotient_reg_32_/Q (SDFFRXL)                  0.85       2.85 r
  sub_x_2/p_A[1] (sequ_div_DW01_sub_3)                    0.00       2.85 r
  sub_x_2/U306/Y (NOR2XL)                                 0.23       3.09 f
  sub_x_2/U310/Y (OAI21XL)                                0.37       3.45 r
  sub_x_2/U229/Y (AOI21X1)                                0.16       3.62 f
  sub_x_2/U196/Y (OAI21XL)                                0.36       3.98 r
  sub_x_2/U122/Y (AOI21X1)                                0.17       4.14 f
  sub_x_2/U319/Y (OAI21XL)                                0.38       4.53 r
  sub_x_2/U87/Y (AOI21X1)                                 0.21       4.73 f
  sub_x_2/U81/Y (OAI21XL)                                 0.39       5.12 r
  sub_x_2/U73/Y (AOI21X1)                                 0.21       5.33 f
  sub_x_2/U67/Y (OAI21XL)                                 0.39       5.72 r
  sub_x_2/U59/Y (AOI21X1)                                 0.21       5.92 f
  sub_x_2/U320/Y (OAI21XL)                                0.39       6.31 r
  sub_x_2/U45/Y (AOI21X1)                                 0.21       6.51 f
  sub_x_2/U39/Y (OAI21XL)                                 0.38       6.89 r
  sub_x_2/U321/Y (AOI21XL)                                0.25       7.14 f
  sub_x_2/U25/Y (OAI21XL)                                 0.40       7.54 r
  sub_x_2/U17/Y (AOI21X1)                                 0.21       7.75 f
  sub_x_2/U11/Y (OAI21XL)                                 0.38       8.12 r
  sub_x_2/U315/Y (AOI21XL)                                0.18       8.30 f
  sub_x_2/U1/Y (XOR2XL)                                   0.27       8.57 r
  sub_x_2/p_DIFF[32] (sequ_div_DW01_sub_3)                0.00       8.57 r
  I_7/Y (INVX1)                                           0.12       8.70 f
  U633/Y (NOR2X2)                                         1.48      10.18 r
  U594/Y (AOI22XL)                                        0.24      10.42 f
  U282/Y (OAI21XL)                                        0.26      10.67 r
  U429/Y (MX2X2)                                          0.16      10.84 r
  remainder_quotient_reg_44_/D (SDFFRXL)                  0.00      10.84 r
  data arrival time                                                 10.84

  clock clk (rise edge)                                  10.00      10.00
  clock network delay (ideal)                             2.00      12.00
  clock uncertainty                                      -0.50      11.50
  remainder_quotient_reg_44_/CK (SDFFRXL)                 0.00      11.50 r
  library setup time                                     -0.10      11.40
  data required time                                                11.40
  --------------------------------------------------------------------------
  data required time                                                11.40
  data arrival time                                                -10.84
  --------------------------------------------------------------------------
  slack (MET)                                                        0.56


  Startpoint: divider[1] (input port clocked by clk)
  Endpoint: remainder_quotient_reg_44_
            (rising edge-triggered flip-flop clocked by clk)
  Path Group: INPUTS
  Path Type: max

  Des/Clust/Port     Wire Load Model       Library
  ------------------------------------------------
  sequ_div           smic18_wl10           typical

  Point                                                   Incr       Path
  --------------------------------------------------------------------------
  clock clk (rise edge)                                   0.00       0.00
  clock network delay (ideal)                             2.00       2.00
  input external delay                                    1.00       3.00 f
  divider[1] (in)                                         0.19       3.19 f
  sub_x_2/p_B[1] (sequ_div_DW01_sub_3)                    0.00       3.19 f
  sub_x_2/U335/Y (INVXL)                                  0.27       3.47 r
  sub_x_2/U306/Y (NOR2XL)                                 0.17       3.64 f
  sub_x_2/U310/Y (OAI21XL)                                0.37       4.01 r
  sub_x_2/U229/Y (AOI21X1)                                0.16       4.17 f
  sub_x_2/U196/Y (OAI21XL)                                0.36       4.53 r
  sub_x_2/U122/Y (AOI21X1)                                0.17       4.70 f
  sub_x_2/U319/Y (OAI21XL)                                0.38       5.08 r
  sub_x_2/U87/Y (AOI21X1)                                 0.21       5.28 f
  sub_x_2/U81/Y (OAI21XL)                                 0.39       5.67 r
  sub_x_2/U73/Y (AOI21X1)                                 0.21       5.88 f
  sub_x_2/U67/Y (OAI21XL)                                 0.39       6.27 r
  sub_x_2/U59/Y (AOI21X1)                                 0.21       6.47 f
  sub_x_2/U320/Y (OAI21XL)                                0.39       6.86 r
  sub_x_2/U45/Y (AOI21X1)                                 0.21       7.07 f
  sub_x_2/U39/Y (OAI21XL)                                 0.38       7.44 r
  sub_x_2/U321/Y (AOI21XL)                                0.25       7.69 f
  sub_x_2/U25/Y (OAI21XL)                                 0.40       8.09 r
  sub_x_2/U17/Y (AOI21X1)                                 0.21       8.30 f
  sub_x_2/U11/Y (OAI21XL)                                 0.38       8.67 r
  sub_x_2/U315/Y (AOI21XL)                                0.18       8.85 f
  sub_x_2/U1/Y (XOR2XL)                                   0.27       9.13 r
  sub_x_2/p_DIFF[32] (sequ_div_DW01_sub_3)                0.00       9.13 r
  I_7/Y (INVX1)                                           0.12       9.25 f
  U633/Y (NOR2X2)                                         1.48      10.73 r
  U594/Y (AOI22XL)                                        0.24      10.97 f
  U282/Y (OAI21XL)                                        0.26      11.23 r
  U429/Y (MX2X2)                                          0.16      11.39 r
  remainder_quotient_reg_44_/D (SDFFRXL)                  0.00      11.39 r
  data arrival time                                                 11.39

  clock clk (rise edge)                                  10.00      10.00
  clock network delay (ideal)                             2.00      12.00
  clock uncertainty                                      -0.50      11.50
  remainder_quotient_reg_44_/CK (SDFFRXL)                 0.00      11.50 r
  library setup time                                     -0.10      11.40
  data required time                                                11.40
  --------------------------------------------------------------------------
  data required time                                                11.40
  data arrival time                                                -11.39
  --------------------------------------------------------------------------
  slack (MET)                                                        0.01


  Startpoint: illegal_divider_zero_reg
              (rising edge-triggered flip-flop clocked by clk)
  Endpoint: illegal_divider_zero
            (output port clocked by clk)
  Path Group: OUTPUTS
  Path Type: max

  Des/Clust/Port     Wire Load Model       Library
  ------------------------------------------------
  sequ_div           smic18_wl10           typical

  Point                                                   Incr       Path
  --------------------------------------------------------------------------
  clock clk (rise edge)                                   0.00       0.00
  clock network delay (ideal)                             2.00       2.00
  illegal_divider_zero_reg/CK (SDFFRXL)                   0.00       2.00 r
  illegal_divider_zero_reg/Q (SDFFRXL)                    0.62       2.62 r
  U656/Y (CLKBUFX3)                                       1.33       3.95 r
  illegal_divider_zero (out)                              0.00       3.95 r
  data arrival time                                                  3.95

  clock clk (rise edge)                                  10.00      10.00
  clock network delay (ideal)                             2.00      12.00
  clock uncertainty                                      -0.50      11.50
  output external delay                                  -1.00      10.50
  data required time                                                10.50
  --------------------------------------------------------------------------
  data required time                                                10.50
  data arrival time                                                 -3.95
  --------------------------------------------------------------------------
  slack (MET)                                                        6.55


1
 
****************************************
Report : timing
        -path full
        -delay min
        -max_paths 1
Design : sequ_div
Version: L-2016.03-SP1
Date   : Sun Aug 13 22:09:51 2023
****************************************

Operating Conditions: typical   Library: typical
Wire Load Model Mode: enclosed

  Startpoint: illegal_divider_zero_reg
              (rising edge-triggered flip-flop clocked by clk)
  Endpoint: illegal_divider_zero_reg
            (rising edge-triggered flip-flop clocked by clk)
  Path Group: clk
  Path Type: min

  Des/Clust/Port     Wire Load Model       Library
  ------------------------------------------------
  sequ_div           smic18_wl10           typical

  Point                                                   Incr       Path
  --------------------------------------------------------------------------
  clock clk (rise edge)                                   0.00       0.00
  clock network delay (ideal)                             0.00       0.00
  illegal_divider_zero_reg/CK (SDFFRXL)                   0.00       0.00 r
  illegal_divider_zero_reg/Q (SDFFRXL)                    0.40       0.40 f
  U481/Y (MX2X1)                                          0.19       0.59 f
  illegal_divider_zero_reg/D (SDFFRXL)                    0.00       0.59 f
  data arrival time                                                  0.59

  clock clk (rise edge)                                   0.00       0.00
  clock network delay (ideal)                             0.00       0.00
  illegal_divider_zero_reg/CK (SDFFRXL)                   0.00       0.00 r
  library hold time                                      -0.09      -0.09
  data required time                                                -0.09
  --------------------------------------------------------------------------
  data required time                                                -0.09
  data arrival time                                                 -0.59
  --------------------------------------------------------------------------
  slack (MET)                                                        0.68


  Startpoint: start (input port clocked by clk)
  Endpoint: cur_state_reg_1_
            (rising edge-triggered flip-flop clocked by clk)
  Path Group: INPUTS
  Path Type: min

  Des/Clust/Port     Wire Load Model       Library
  ------------------------------------------------
  sequ_div           smic18_wl10           typical

  Point                                    Incr       Path
  -----------------------------------------------------------
  clock clk (rise edge)                    0.00       0.00
  clock network delay (ideal)              0.00       0.00
  input external delay                     1.00       1.00 r
  start (in)                               0.11       1.11 r
  U159/Y (AND2XL)                          0.18       1.29 r
  cur_state_reg_1_/D (SDFFRX1)             0.00       1.29 r
  data arrival time                                   1.29

  clock clk (rise edge)                    0.00       0.00
  clock network delay (ideal)              0.00       0.00
  cur_state_reg_1_/CK (SDFFRX1)            0.00       0.00 r
  library hold time                       -0.11      -0.11
  data required time                                 -0.11
  -----------------------------------------------------------
  data required time                                 -0.11
  data arrival time                                  -1.29
  -----------------------------------------------------------
  slack (MET)                                         1.39


  Startpoint: quotient_reg_6_
              (rising edge-triggered flip-flop clocked by clk)
  Endpoint: quotient[6]
            (output port clocked by clk)
  Path Group: OUTPUTS
  Path Type: min

  Des/Clust/Port     Wire Load Model       Library
  ------------------------------------------------
  sequ_div           smic18_wl10           typical

  Point                                    Incr       Path
  -----------------------------------------------------------
  clock clk (rise edge)                    0.00       0.00
  clock network delay (ideal)              0.00       0.00
  quotient_reg_6_/CK (SDFFRXL)             0.00       0.00 r
  quotient_reg_6_/Q (SDFFRXL)              0.40       0.40 f
  U696/Y (CLKBUFX3)                        1.35       1.74 f
  quotient[6] (out)                        0.00       1.74 f
  data arrival time                                   1.74

  clock clk (rise edge)                    0.00       0.00
  clock network delay (ideal)              0.00       0.00
  output external delay                   -1.00      -1.00
  data required time                                 -1.00
  -----------------------------------------------------------
  data required time                                 -1.00
  data arrival time                                  -1.74
  -----------------------------------------------------------
  slack (MET)                                         2.74


1
 
****************************************
Report : area
Design : sequ_div
Version: L-2016.03-SP1
Date   : Sun Aug 13 22:09:51 2023
****************************************

Library(s) Used:

    typical (File: /home/macro/synopsys/dc_pdk_lib/SMIC180/std/synopsys/typical.db)

Number of ports:                          303
Number of nets:                          1612
Number of cells:                         1374
Number of combinational cells:           1080
Number of sequential cells:               292
Number of macros/black boxes:               0
Number of buf/inv:                        222
Number of references:                      46

Combinational area:              15713.913801
Buf/Inv area:                     1955.923226
Noncombinational area:           13491.878159
Macro/Black Box area:                0.000000
Net Interconnect area:          143594.070038

Total cell area:                 29205.791959
Total area:                     172799.861997
1
#=====================================================================
dc_shell> 
Information: Interrupting current command. (INT-2)
Information: One more interrupt will exit process. (INT-3)
Information: Process terminated by interrupt. (INT-4)
