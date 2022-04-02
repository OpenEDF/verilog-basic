set_property -dict {PACKAGE_PIN G22 IOSTANDARD LVCMOS33} [get_ports sys_clk]
create_clock -add -name sys_clk_pin -period 20.00 -waveform {0 10} [get_ports {sys_clk}];

set_property -dict {PACKAGE_PIN D26 IOSTANDARD LVCMOS33} [get_ports sys_rst_n]
set_property -dict {PACKAGE_PIN H14 IOSTANDARD LVCMOS33} [get_ports clk_16mhz]
set_property -dict {PACKAGE_PIN H12 IOSTANDARD LVCMOS33} [get_ports clk_25mhz]

#####         SPI Configurate Setting        #######
set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]
set_property CONFIG_MODE SPIx4 [current_design]
set_property BITSTREAM.CONFIG.CONFIGRATE 50 [current_design]
set_property BITSTREAM.CONFIG.SPI_FALL_EDGE Yes [current_design]
set_property BITSTREAM.GENERAL.COMPRESS true [current_design]
