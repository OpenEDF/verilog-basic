#/bin/sh
#--------------------------------------------------------------------------
# Brief:  comipler and simluation systemverilog
# Author: Macro
# Date:   2021-12-13

#--------------------------------------------------------------------------
# test case file
TEST_FILE = test.f

# clean old file --> compiler --> simluation
all: clean com sim

# compiler
com:$(TEST_FILE)
	vcs -sverilog -f $(TEST_FILE) -full64 +v2k -cpp g++-4.8 \
   	-cc gcc-4.8 -LDFLAGS -Wl,--no-as-needed

# simluation
sim:$(simv)
	./simv

# clean
.PHONY: clean
clean:
	rm -rf csrc simv* *.key

#--------------------------------------------------------------------------
