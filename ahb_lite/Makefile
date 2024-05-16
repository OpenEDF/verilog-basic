#/bin/sh
#--------------------------------------------------------------------------
# Brief:  comipler and simluation verilog
# Author: Macro
# Date:   2023-04-21

#--------------------------------------------------------------------------
# test case file
SRC_FILE = script/work_src.lst
TOP_MODULE = testbench
SPY_PRJ = spy/ahb_lite_top.prj
nWave_SIGNAL = script/ahb_lite_top.rc

# clean old file --> compiler --> simluation
all: com sim

# compiler
com:
	vcs -full64 +v2k -Mupdate +incdir+./src \
	-timescale=1ns/1ps \
	-debug_access+all +warn=noVPI-CT-NS            \
    -P $(VERDI_HOME)/share/PLI/VCS/LINUX64/novas.tab                         \
    $(VERDI_HOME)/share/PLI/VCS/LINUX64/pli.a -load libnovas.so:FSDBDumpCmd  \
	-f $(SRC_FILE)

# simluation
sim:
	./simv +fsdb+autoflush+force

# wave
wave:
	verdi -f $(SRC_FILE)        \
		-top $(TOP_MODULE)      \
		-ssf $(TOP_MODULE).fsdb \
		-sswr $(nWave_SIGNAL)   \
		-workMode hardwareDebug \
		+incdir+./src           \
		-nologo &
# spy
spy:
	spyglass -project $(SPY_PRJ) &

.PHONY: clean sim com spy
clean:
	rm -rf csrc simv* *.key *.vcd *.log *.fsdb *.conf novas.rc verdiLog

#--------------------------------------------------------------------------
