#/bin/sh
#--------------------------------------------------------------------------
# Brief:  comipler and simluation verilog
# Author: Macro
# Date:   2023-04-21

#--------------------------------------------------------------------------
# test case file
#TEST_FILE = testbench.v
SRC_FILE  = ascii_verilog.v 

# clean old file --> compiler --> simluation
all: clean com sim

# compiler
com:$(TEST_FILE)
	vcs -full64 +v2k -cpp g++-4.8 -cc gcc-4.8      \
	-LDFLAGS -Wl,--no-as-needed -timescale=1ns/1ps \
    -P $(VERDI_HOME)/share/PLI/VCS/LINUX64/novas.tab                         \
    $(VERDI_HOME)/share/PLI/VCS/LINUX64/pli.a -load libnovas.so:FSDBDumpCmd  \
	$(SRC_FILE) 
	#$(TEST_FILE)

# simluation
sim:$(simv)
	./simv +fsdb+autoflush 

# wave
wave:
	verdi -v ./ascii_verilog.v    \
		-top sacii_verilog      \
		-ssf ascii_verilog.fsdb \
		-nologo &

.PHONY: clean
clean:
	rm -rf csrc simv* *.key *.vcd *.log *.fsdb *.conf *.rc verdiLog

#--------------------------------------------------------------------------
