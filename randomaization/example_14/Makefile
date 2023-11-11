#/bin/sh
#--------------------------------------------------------------------------
# Brief:  comipler and simluation verilog
# Author: Macro
# Date:   2023-04-21

#--------------------------------------------------------------------------
# test case file
SRC_FILE = work_src.list
TOP_MODULE = testbench

# clean old file --> compiler --> simluation
all: com sim

# compiler
com:
	vcs -full64 -sverilog \
        +v2k -cpp g++-4.8 -cc gcc-4.8      \
        -LDFLAGS -Wl,--no-as-needed -timescale=1ns/1ns \
        -debug_access+all +warn=noVPI-CT-NS            \
        -P $(VERDI_HOME)/share/PLI/VCS/LINUX64/novas.tab                         \
        $(VERDI_HOME)/share/PLI/VCS/LINUX64/pli.a -load libnovas.so:FSDBDumpCmd  \
        -f $(SRC_FILE)

# simluation
sim:
	./simv +fsdb+autoflush+force

.PHONY: clean sim com 
clean:
	rm -rf csrc simv* *.key *.vcd *.log *.fsdb *.conf novas.rc verdiLog \
		urgReport vdCovLog

#--------------------------------------------------------------------------
