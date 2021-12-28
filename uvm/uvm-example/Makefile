#/bin/sh
#--------------------------------------------------------------------------
# Brief:  comipler and simluation systemverilog for UVM
# Author: Macro
# Date:   2021-10-20

#--------------------------------------------------------------------------
# test case file
TEST_FILE = work_list.f
UVM_VERBOSITY =	UVM_LOW

# clean old file --> compiler --> simluation
all: clean com base_sim wrrd_sim

# compiler
com:$(TEST_FILE)
	vcs -sverilog -full64 +v2k -timescale=1ns/1ns -cpp g++-4.8 \
    -cc gcc-4.8 -LDFLAGS -Wl,--no-as-needed +incdir+$(UVM_HOME)/src \
    $(UVM_HOME)/src/uvm.sv $(UVM_HOME)/src/dpi/uvm_dpi.cc -CFLAGS -DVCS \
    -timescale=1ns/1ps +incdir+./tb_class -f $(TEST_FILE)

# simluation
base_sim:
	./simv +UVM_TESTNAME=mem_model_base_test +UVM_VERBOSITY=$(UVM_VERBOSITY) -l vcs_base_sim.log

wrrd_sim:
	./simv +UVM_TESTNAME=mem_wr_rd_test +UVM_VERBOSITY=$(UVM_VERBOSITY) -l vcs_base_sim.log

# clean
.PHONY: clean
clean:
	rm -rf csrc simv* *.key *~ core vc_hdrs.h ucli.key urg* *.log dump.vcd

#--------------------------------------------------------------------------
