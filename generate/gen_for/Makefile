#/bin/sh
#--------------------------------------------------------------------------
# Brief:  comipler and simluation systemverilog
# Author: Macro
# Date:   2021-10-20

#--------------------------------------------------------------------------
# test case file
TEST_FILE = testbench.v
SRC_FILE  = generate_for.v 

# clean old file --> compiler --> simluation
all: clean com sim

# compiler
com:$(TEST_FILE)
	vcs -full64 +v2k -cpp g++-4.8 -cc gcc-4.8      \
	-LDFLAGS -Wl,--no-as-needed +timescale=1ns/1ps \
	$(SRC_FILE) $(TEST_FILE)

# lint
lint:
	verilator --lint-only -Wall $(SRC_FILE)

# simluation
sim:$(simv)
	./simv

# clean
.PHONY: clean
clean:
	rm -rf csrc simv* *.key *.vcd

#--------------------------------------------------------------------------
