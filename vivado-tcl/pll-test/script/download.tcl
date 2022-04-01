###-----------------------------------------------------------------
### vivado tcl Create a configuration file to program the device
### Author: Macro
### Reference: Vivado Design Suite User Guide Using Tcl Scripting(ug894)
### 

# 1. set the flash mcs file path, accroding the project setup
set flashmcs_path prebuild/borad_flash.mcs

# target device info
set hw_fpga "xc7k325t_0"

# 2. Open and connect device
open_hw_manager
connect_hw_server -allow_non_jtag
open_hw_target
current_hw_device [get_hw_devices $hw_fpga]
refresh_hw_device -update_hw_probes false [lindex [get_hw_devices $hw_fpga] 0]

# 3. Add memory device to FPGA
create_hw_cfgmem -hw_device [lindex [get_hw_devices $hw_fpga] 0] [lindex [get_cfgmem_parts {mx25l25645g-spi-x1_x2_x4}] 0]
set_property PROGRAM.BLANK_CHECK  0 [ get_property PROGRAM.HW_CFGMEM [lindex [get_hw_devices $hw_fpga] 0]]
set_property PROGRAM.ERASE  1 [ get_property PROGRAM.HW_CFGMEM [lindex [get_hw_devices $hw_fpga] 0]]
set_property PROGRAM.CFG_PROGRAM  1 [ get_property PROGRAM.HW_CFGMEM [lindex [get_hw_devices $hw_fpga] 0]]
set_property PROGRAM.VERIFY  1 [ get_property PROGRAM.HW_CFGMEM [lindex [get_hw_devices $hw_fpga] 0]]
set_property PROGRAM.CHECKSUM  0 [ get_property PROGRAM.HW_CFGMEM [lindex [get_hw_devices $hw_fpga] 0]]
refresh_hw_device [lindex [get_hw_devices $hw_fpga] 0]

# 4. Select a configuration file and set programming options.
set flash_mscs [list]
lappend flash_mscs $flashmcs_path
set_property PROGRAM.ADDRESS_RANGE  {use_file} [ get_property PROGRAM.HW_CFGMEM [lindex [get_hw_devices $hw_fpga] 0]]
set_property PROGRAM.FILES $flash_mscs [ get_property PROGRAM.HW_CFGMEM [lindex [get_hw_devices $hw_fpga] 0]]
set_property PROGRAM.PRM_FILE {} [ get_property PROGRAM.HW_CFGMEM [lindex [get_hw_devices $hw_fpga] 0]]
set_property PROGRAM.UNUSED_PIN_TERMINATION {pull-none} [ get_property PROGRAM.HW_CFGMEM [lindex [get_hw_devices $hw_fpga] 0]]
startgroup 
create_hw_bitstream -hw_device [lindex [get_hw_devices $hw_fpga] 0] [get_property PROGRAM.HW_CFGMEM_BITFILE [ lindex [get_hw_devices $hw_fpga] 0]]
program_hw_devices [lindex [get_hw_devices $hw_fpga] 0]
refresh_hw_device [lindex [get_hw_devices $hw_fpga] 0]
program_hw_cfgmem -hw_cfgmem [ get_property PROGRAM.HW_CFGMEM [lindex [get_hw_devices $hw_fpga] 0]]
endgroup

# close the connect
delete_hw_cfgmem [ get_property PROGRAM.HW_CFGMEM [get_hw_devices $hw_fpga ]]
close_hw_target
disconnect_hw_server
close_hw_manager

# quit the tcl
quit
###-----------------------------------------------------------------
