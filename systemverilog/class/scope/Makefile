#/bin/sh
#--------------------------------------------------------------------------
# Brief:  comipler and simluation systemverilog
# Author: Macro
# Date:   2024/05/19

#--------------------------------------------------------------------------
# test case file
TEST_FILE = src.lst

# clean old file --> compiler --> simluation
all: clean com sim

# compiler
com:$(TEST_FILE)
	vcs -full64  -sverilog -f $(TEST_FILE) +v2k -R -Mupdate -l sv.log

# clean
.PHONY: clean
clean:
	rm -rf csrc simv* *.key *.log

#--------------------------------------------------------------------------
