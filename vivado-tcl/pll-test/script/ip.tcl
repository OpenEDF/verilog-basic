create_ip -vendor xilinx.com -library ip -name clk_wiz -module_name mmcm -dir $ipdir -force
set_property -dict [list \
  CONFIG.PRIMITIVE {MMCM} \
  CONFIG.PRIM_IN_FREQ {50.000} \
  CONFIG.MMCM_CLKIN1_PERIOD {20.000} \
  CONFIG.RESET_TYPE {ACTIVE_LOW} \
  CONFIG.CLKOUT1_USED {true} \
  CONFIG.CLKOUT2_USED {true} \
  CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {16.000} \
  CONFIG.CLKOUT2_REQUESTED_OUT_FREQ {25.000} \
  ] [get_ips mmcm]
