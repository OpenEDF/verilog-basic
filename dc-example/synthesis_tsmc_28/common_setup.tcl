#-----------------------------------------------------------------------------------------
# User-defined variables for logical library setup in dc_setup.tcl
#-----------------------------------------------------------------------------------------
set DESIGN_NAME                 "chip_top"
set PDK_HOME                    /home/macro/tools/pdk
set STAN_CELL_HOME              $PDK_HOME/tcbn28hpcplusbwp7t40p140_180b/TSMCHOME/digital/Front_End
set IO_CELL_HOME                $PDK_HOME/tphn28hpcpgv18_110a/TSMCHOME/digital/Front_End
set RAM_BLOCK_HOME              $PDK_HOME/
set SYN_WORK_PATH               [exec pwd]
set CURRENT_RTL_SRC             $SYN_WORK_PATH/rtl
set DESIGN_SCRIPT_PATH          $SYN_WORK_PATH/script
set ADDITIONAL_SEARCH_PATH      "$STAN_CELL_HOME/timing_power_noise/NLDM/tcbn28hpcplusbwp7t40p140_180a $IO_CELL_HOME/timing_power_noise/NLDM/tphn28hpcpgv18_170a "  ;#  Directories containing logic libraries,
set TARGET_LIBRARY_FILES        { tcbn28hpcplusbwp7t40p140tt0p9v25c.db  tcbn28hpcplusbwp7t40p140ssg0p9v0p9v125c.db tcbn28hpcplusbwp7t40p140ffg1p05v1p05vm40c.db tphn28hpcpgv18tt0p9v1p8v25c.db tphn28hpcpgv18ssg0p81v1p62v125c.db tphn28hpcpgv18ffg0p99v1p98vm40c.db }     ;#  Logic cell library file
#set SYMBOL_LIBRARY_FILES       ""                                           ;#  Symbol library file

#-----------------------------------------------------------------------------------------
