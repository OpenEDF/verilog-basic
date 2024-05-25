#/bin/sh
#--------------------------------------------------------------------------
# Brief:  comipler and simluation systemverilog
# Author: Macro
# Date:   2023-10-25

#--------------------------------------------------------------------------
# test case file
TEST_FILE = work_list.f

# clean old file --> compiler --> simluation
all: com sim

# compiler
com:$(TEST_FILE)
	vcs -sverilog -f $(TEST_FILE) -full64 +v2k  \
   	 -timescale=1ns/1ns

# simluation
sim:
	./simv

# clean
.PHONY: clean
clean:
	rm -rf csrc simv* *.key

#--------------------------------------------------------------------------
