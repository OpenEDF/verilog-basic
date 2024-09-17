#/bin/sh
#--------------------------------------------------------------------------
# Brief:  comipler and simluation verilog
# Author: Macro
# Date:   2023-04-21

#--------------------------------------------------------------------------
# test case file
DESIGN_TOP = ahb_lite_top
SPY_PRJ = spy/$(DESIGN_TOP).prj

# clean old file --> compiler --> simluation
all: spy_gui

# spy
spy:
	spyglass -shell -tcl spy/core.tcl -l spyglass_logfile.log

# spy
spy_gui:
	spyglass -project spy/ahb_lite_top.prj &

.PHONY: clean sim com spy spy_gui
clean:
	@rm -rf csrc simv* *.key *.vcd *.log *.fsdb *.conf novas.rc verdiLog \
		   $(DESIGN_TOP) core *.log ./spy/*.awl
	@echo "clean the files that generated during compilation..."

#--------------------------------------------------------------------------
