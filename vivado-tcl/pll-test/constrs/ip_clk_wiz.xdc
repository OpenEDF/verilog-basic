set_property -dict {PACKAGE_PIN G22 IOSTANDARD LVCMOS33} [get_ports sys_clk]
create_clock -add -name sys_clk_pin -period 20.00 -waveform {0 10} [get_ports {sys_clk}];

set_property -dict {PACKAGE_PIN D26 IOSTANDARD LVCMOS33} [get_ports sys_rst_n]
set_property -dict {PACKAGE_PIN H14 IOSTANDARD LVCMOS33} [get_ports clk_16mhz]
set_property -dict {PACKAGE_PIN H12 IOSTANDARD LVCMOS33} [get_ports clk_25mhz]
