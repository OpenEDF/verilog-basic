#/bin/sh
#--------------------------------------------------------------------------
# Brief:  comipler and simluation verilog
# Author: Macro
# Date:   2023-04-21

#--------------------------------------------------------------------------
# test case file
SRC_FILE = src.lst
TOP_MODULE = testbench
nWave_SIGNAL = $(TOP_MODULE).rc

# clean old file --> compiler --> simluation
all: com sim

# compiler
com:
	vcs -full64 +v2k -sverilog \
	+define+ASSERT_ON+COVER_ON \
	-y $(VCS_HOME)/packages/sva_cg +libext+.v \
	+incdir+$(VCS_HOME)/packages/sva_cg \
	-LDFLAGS -Wl,--no-as-needed -timescale=1ns/1ns \
	-debug_access+all +warn=noVPI-CT-NS            \
    -P $(VERDI_HOME)/share/PLI/VCS/LINUX64/novas.tab                         \
    $(VERDI_HOME)/share/PLI/VCS/LINUX64/pli.a -load libnovas.so:FSDBDumpCmd  \
	-f $(SRC_FILE) -l $(TOP_MODULE).log

# simluation
sim:
	./simv +fsdb+autoflush -l sim.log

# wave
wave:
	verdi -sv -f $(SRC_FILE)    \
		-top $(TOP_MODULE)      \
		-ssf $(TOP_MODULE).fsdb \
		-sswr $(nWave_SIGNAL)   \
		-nologo &

# urg
urg:
	urg -full64 -dir simv.vdb

# spy
spy:
	spyglass -project $(SPY_PRJ) &

.PHONY: clean
clean:
	rm -rf csrc simv* *.key *.vcd *.log *.fsdb *.conf novas.rc \
		verdiLog sequ_div urgReport

#--------------------------------------------------------------------------
