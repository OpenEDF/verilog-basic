#/bin/sh
#--------------------------------------------------------------------------
# Brief:  comipler and simluation verilog
# Author: Macro
# Date:   2023-04-21

#--------------------------------------------------------------------------
# test case file
SRC_FILE = src.lst
PROJECT = clock_div
TOP_MODULE = testbench
SPY_PRJ = $(PROJECT).prj
nWave_SIGNAL = $(PROJECT).rc

# clean old file --> compiler --> simluation
all: com sim

# compiler
com:
	vcs -full64 +v2k -sverilog  \
	-LDFLAGS -Wl,--no-as-needed -timescale=1ns/1ns \
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
		-nologo &
# spy
spy:
	spyglass -project $(SPY_PRJ) &

.PHONY: clean
clean:
	rm -rf csrc simv* *.key *.vcd *.log *.fsdb *.conf novas.rc \
		verdiLog sequ_multi spyglass*

#--------------------------------------------------------------------------
