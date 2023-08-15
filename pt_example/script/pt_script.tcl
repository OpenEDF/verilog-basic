#=====================================================================
# Project   : Primetime tcl script
# Author    : Macro
# E-mail    : makermuyi@gmail.com
# Version   : 0.0.1
# Change Log:
#   1. 2023-08-16  Initial version
#
#=====================================================================

#=====================================================================
# step 0: setup the environment
#=====================================================================
set LINK_PATH /home/macro/synopsys/dc_pdk_lib/SMIC180/std/synopsys
set SYMBOL_PATH_STD /home/macro/synopsys/dc_pdk_lib/SMIC180/std/symbols
set SYMBOL_PATH_IO /home/macro/synopsys/dc_pdk_lib/SMIC180/io/symbol
set RTL_PATH ./src
set SCRIPT_PATH ./script
set TOP_MODULE sequ_div
set_app_var search_path [ list . $search_path $LINK_PATH \
                                 $RTL_PATH               \
                                 $SCRIPT_PATH            \
                                 $SYMBOL_PATH_IO         \
                                 $SYMBOL_PATH_STD        \
                        ]

set_app_var symbol_library [ list smic18.sdb ]
set_app_var link_library [ list * fast.db fasta.db slow.db typical.db ]
set_app_var target_library [ list typical.db ]

#=====================================================================
# step 1: read verilog file, netlist from dc
#=====================================================================
read_verilog ${TOP_MODULE}.v

#=====================================================================
# step 2: link design
#=====================================================================
link_design ${TOP_MODULE}

#=====================================================================
# step 3: check design
#=====================================================================
list_designs
list_libs

#=====================================================================
# step 4: setup the sconstrints
#=====================================================================
source -verbose sdc/${TOP_MODULE}.sdc

#=====================================================================
# step 5: report timing
#=====================================================================
report_timing -delay_type max > rpt/${TOP_MODULE}.rpt
report_constraint -all_violators -path_type slack_only
report_constraint
report_analysis_coverage -status_details {untested met} \
    -sort_by slack

#=====================================================================
