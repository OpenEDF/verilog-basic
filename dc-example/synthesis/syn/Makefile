#-----------------------------------------------------------------------------
# 						    - Design Compiler - 
# Date: 2023/08/08
# Author: Macro
# Brief: Design Compiler automated management by script.
#
#-----------------------------------------------------------------------------
DC_OPTION = -f script/read_input.tcl
all: dc

# start up dc on wire load mode
dc:
	dc_shell $(DC_OPTION) | tee -i log/dc_start.log

# start up dc on topographical mode
dcto:
	dc_shell -topographical_mode $(DC_OPTION) | tee -i log/dc_start.log

# clean the outfile
.PHONY: clean dc dcto clean_all
clean_all:
	rm -rf *.txt *.log *.svf alib-52 *.syn *.pvl *.mr ../*.mr \
	       ../*-verilog.pvl ../*-verilog.syn mapped/*.ddc mapped/*.sdc \
	       mapped/*.sdf unmapped/*.ddc netlist/*.v log/*.log

clean:
	rm -rf *.txt *.log *.svf alib-52 *.syn *.pvl *.mr ../*.mr \
	       ../*-verilog.pvl ../*-verilog.syn  log/*.log

#-----------------------------------------------------------------------------
