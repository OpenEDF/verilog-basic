#/bin/sh
#--------------------------------------------------------------------------
# Brief:  comipler and simluation verilog
# Author: Macro
# Date:   2023-04-21

#--------------------------------------------------------------------------
# test case file
SRC_FILE = src.lst 
TOP_MODULE ?= strobe_task

# clean old file --> compiler --> simluation
all: com 

# compiler
com:
	vcs -full64 +v2k -R \
	-LDFLAGS -Wl,--no-as-needed -timescale=1ns/1ps \
	-f $(SRC_FILE)

.PHONY: clean
clean:
	rm -rf csrc simv* *.key *.vcd *.log *.fsdb *.conf *.rc verdiLog

#--------------------------------------------------------------------------
