#/bin/sh
#--------------------------------------------------------------------------
# Brief:  comipler and simluation systemverilog for UVM
# Author: Macro
# Date:   2021-10-20

#--------------------------------------------------------------------------
# test case file
TEST_FILE = work_list.f
UVM_VERBOSITY =	UVM_LOW

# Accessing HDL Registers Through UVM Backdoor
ACC_HDL_REG = -debug_pp

# UVM simv Test options
TEST_CASE = mem_model_base_test

# clean old file --> compiler --> simluation
all: clean com base_sim wrrd_sim

# compiler
com:$(TEST_FILE)
	vcs -sverilog $(ACC_HDL_REG) -full64 +v2k -timescale=1ns/1ns \
     +incdir+$(UVM_HOME)/src \
    $(UVM_HOME)/src/uvm.sv $(UVM_HOME)/src/dpi/uvm_dpi.cc -CFLAGS -DVCS \
    -P $(VERDI_HOME)/share/PLI/VCS/LINUX64/novas.tab                         \
    $(VERDI_HOME)/share/PLI/VCS/LINUX64/pli.a -load libnovas.so:FSDBDumpCmd  \
    -timescale=1ns/1ps +incdir+./tb_class -f $(TEST_FILE)

# simluation
base_sim:
	./simv +UVM_TESTNAME=mem_model_base_test +UVM_VERBOSITY=$(UVM_VERBOSITY) -l vcs_base_sim.log

wrrd_sim:
	./simv +UVM_TESTNAME=mem_wr_rd_test +UVM_VERBOSITY=$(UVM_VERBOSITY) -l vcs_base_sim.log

# You can enter 'make sim TEST_CASE=mem_wr_rd_test' on CLI rather than modify Makefile
sim:
	./simv +UVM_TESTNAME=$(TEST_CASE) +UVM_VERBOSITY=$(UVM_VERBOSITY) +UVM_PHASE_RECORD -l vcs_sim.log

wave:
	verdi -f $(TEST_FILE)       \
		-ssf uvm_test.fsdb \
		-nologo &
# clean
.PHONY: clean
clean:
	rm -rf csrc simv* *.key *~ core vc_hdrs.h ucli.key urg* *.log dump.vcd \
		   novas* *.vcd *.fsdb verdiLog uvmgen_options_log.txt

#--------------------------------------------------------------------------
