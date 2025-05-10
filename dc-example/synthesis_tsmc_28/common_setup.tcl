#-----------------------------------------------------------------------------------------
# User-defined variables for logical library setup in dc_setup.tcl
#-----------------------------------------------------------------------------------------
set DESIGN_NAME                 "sequ_div"
set PDK_HOME                    /home/macro/tools/pdk
set TSMCHOME                    $PDK_HOME/tcbn28hpcplusbwp7t40p140_180b/TSMCHOME
set SYN_WORK_PATH               [exec pwd]
set CURRENT_RTL_SRC             $SYN_WORK_PATH/rtl
set DESIGN_SCRIPT_PATH          $SYN_WORK_PATH/script
set ADDITIONAL_SEARCH_PATH      "$TSMCHOME/digital/Front_End/timing_power_noise/NLDM/tcbn28hpcplusbwp7t40p140_180a "  ;#  Directories containing logic libraries,
set TARGET_LIBRARY_FILES        tcbn28hpcplusbwp7t40p140tt0p9v25c.db         ;#  Logic cell library file
#set SYMBOL_LIBRARY_FILES       ""                                           ;#  Symbol library file

#-----------------------------------------------------------------------------------------
