#/bin/sh
#--------------------------------------------------------------------------
# Brief:  comipler and simluation systemverilog
# Author: Macro
# Date:   2021-10-20

#--------------------------------------------------------------------------
# test case file
TEST_FILE = fork_join.v

# clean old file --> compiler --> simluation
all: clean com sim

# compiler
com:
	vcs -sverilog $(TEST_FILE)

# simluation
sim:
	./simv

# clean
.PHONY: clean
clean:
	rm -rf csrc *simv *.key

#--------------------------------------------------------------------------
