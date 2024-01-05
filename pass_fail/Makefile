#/bin/sh
#--------------------------------------------------------------------------
# Brief:  comipler and simluation systemverilog
# Author: Macro
# Date:   2021-10-20

#--------------------------------------------------------------------------
# test case file
SRC_FILE ?= pass_fail_a.v 

# clean old file --> compiler --> simluation
all: clean com sim

# compiler
com:
	vcs -full64 -sverilog +v2k   \
	-LDFLAGS -Wl,--no-as-needed -timescale=1ns/1ps \
	$(SRC_FILE) 

# simluation
sim:$(simv)
	./simv

# clean
.PHONY: clean
clean:
	rm -rf csrc simv* *.key *.vcd

#--------------------------------------------------------------------------
