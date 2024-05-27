#/bin/sh
#--------------------------------------------------------------------------
# Brief:  comipler and simluation verilog
# Author: Macro
# Date:   2023-04-21

#--------------------------------------------------------------------------
# test case file
SRC_FILE = src.lst
TOP_MODULE = testbench
SEED = 2
VERDI_RC_FILE = signal.rc

# clean old file --> compiler --> simluation
all: clean com sim

# compiler
com:
	vcs -full64 -sverilog +v2k -lca -kdb    \
        -LDFLAGS -Wl,--no-as-needed -timescale=1ns/1ns \
        -debug_access+all +warn=noVPI-CT-NS            \
        -P $(VERDI_HOME)/share/PLI/VCS/LINUX64/novas.tab                         \
        $(VERDI_HOME)/share/PLI/VCS/LINUX64/pli.a -load libnovas.so:FSDBDumpCmd  \
        -f $(SRC_FILE)

# simluation
sim:
	./simv +fsdb+autoflush+force +ntb_random_seed=$(SEED) -l simv.log

# wave
wave:
	verdi -sverilog -ssf $(TOP_MODULE).fsdb \
		  -top $(TOP_MODULE) \
		  -f $(SRC_FILE) \
		  -sswr $(VERDI_RC_FILE) \
		  -nologo &

# debug
debug:
	./simv -gui=verdi \
		   +ntb_random_seed=$(SEEED) \
           -l simv.log &

.PHONY: clean sim com wave debug
clean:
	rm -rf csrc simv* *.key *.vcd *.log *.fsdb *.conf novas.rc \
	       verdiLog

#--------------------------------------------------------------------------
