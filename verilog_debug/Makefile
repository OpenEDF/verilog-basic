#/bin/sh
#--------------------------------------------------------------------------
# Brief:  comipler and simluation verilog
# Author: Macro
# Date:   2023-04-21

#--------------------------------------------------------------------------
# test case file
SRC_FILE = work_src.list 
#TEST_FILE = testbench.v
TOP_MODULE ?= ascii_verilog

# clean old file --> compiler --> simluation
all: com sim

# compiler
com:
	vcs -full64 +v2k       \
	-LDFLAGS -Wl,--no-as-needed -timescale=1ns/1ps \
    -P $(VERDI_HOME)/share/PLI/VCS/LINUX64/novas.tab                         \
    $(VERDI_HOME)/share/PLI/VCS/LINUX64/pli.a -load libnovas.so:FSDBDumpCmd  \
	-f $(SRC_FILE)
	#$(TEST_FILE)

# simluation
sim:
	./simv +fsdb+autoflush 

# wave
wave:
	verdi -f $(SRC_FILE)        \
		-top $(TOP_MODULE)      \
		-ssf $(TOP_MODULE).fsdb \
		-nologo &

.PHONY: clean
clean:
	rm -rf csrc simv* *.key *.vcd *.log *.fsdb *.conf *.rc verdiLog

#--------------------------------------------------------------------------
