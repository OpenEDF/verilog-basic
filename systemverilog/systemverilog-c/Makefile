#/bin/sh
#--------------------------------------------------------------------------
# Brief:  comipler and simluation systemverilog
# Author: Macro
# Date:   2021-10-20

#--------------------------------------------------------------------------
# test case file
TEST_FILE = systemvc.v test.c

# clean old file --> compiler --> simluation
all: com sim

# You can use -R run compiler and simulator together
# compiler
com:$(TEST_FILE)
	vcs -sverilog $(TEST_FILE) -full64 +v2k -cpp g++-4.8 \
   	-cc gcc-4.8 -LDFLAGS -Wl,--no-as-needed

# simluation
sim:$(simv)
	./simv

# clean
.PHONY: clean
clean:
	rm -rf csrc simv* *.key vc_hdrs.h

#--------------------------------------------------------------------------
