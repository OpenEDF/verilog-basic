#--------------------------------------------------------------------------
# Brief:  comipler and simluation systemverilog for UVM
# Author: Macro
# Date:   2024-05-01
#
#--------------------------------------------------------------------------
# test case file
TEST_FILE = work_list.f
UVM_VERBOSITY =	UVM_LOW

# Accessing HDL Registers Through UVM Backdoor
ACC_HDL_REG = -debug_pp

# UVM simv Test options
TEST_CASE = base_test

# run
all: clean com sim
# compiler
com:
	vcs -sverilog -full64 +v2k $(ACC_HDL_REG) -top tb_top\
     +incdir+$(UVM_HOME)/src \
    $(UVM_HOME)/src/uvm.sv $(UVM_HOME)/src/dpi/uvm_dpi.cc -CFLAGS -DVCS \
    -P $(VERDI_HOME)/share/PLI/VCS/LINUX64/novas.tab                         \
    $(VERDI_HOME)/share/PLI/VCS/LINUX64/pli.a -load libnovas.so:FSDBDumpCmd  \
    -timescale=1ns/1ps +incdir+./tb_class -f $(TEST_FILE) base_test.sv  -l comp.log

# simluation
sim:
	./simv +UVM_TESTNAME=$(TEST_CASE) +UVM_VERBOSITY=$(UVM_VERBOSITY) +UVM_PHASE_RECORD -l ssim.log

# debug
wave:
	verdi -f $(TEST_FILE)  \
		-ssf uvm_test.fsdb \
		-nologo &
# clean
.PHONY: clean
clean:
	rm -rf csrc simv* *.key *~ core vc_hdrs.h ucli.key urg* *.log dump.vcd \
		   novas* *.vcd *.fsdb verdiLog uvmgen_options_log.txt \
		   *fsdb*

#--------------------------------------------------------------------------
