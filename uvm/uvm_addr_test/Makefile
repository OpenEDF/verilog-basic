#--------------------------------------------------------------------------
# Brief:  comipler and simluation systemverilog for UVM
# Author: Macro
# Date:   2024-05-01
#
#--------------------------------------------------------------------------
# test case file
TEST_FILE = work_list.f
UVM_VERBOSITY =	UVM_LOW

# UVM simv Test options
UVM_VER = uvm-1.2
TEST_CASE = base_test
TB_TOP = tb_top
DEFINES = UVM_NO_RELNOTES
UVM_DEFINES = UVM_NO_DEPRECATED+UVM_OBJECT_MUST_HAVE_CONSTRUCTOR
PROGRAM_TOP = base_test.sv
#UVM_AWARE|RAL|TLM|MSG|HIER|PRINT
TRACE = HIER
UVM_VERDI_OPTS = +UVM_TR_RECORD +UVM_LOG_RECORD +UVM_PHASE_RECORD

# run
all: clean com sim
# compiler
com:
	vcs -sverilog -full64 +v2k \
		-lca -kdb \
		-debug_access+all+reverse \
		-ntb_opts $(UVM_VER) \
		-timescale=1ns/1ns \
		+define+$(UVM_DEFINES)  \
		-top $(TB_TOP) \
		-f $(TEST_FILE) \
		-l comp.log

# simluation
sim:
	./simv +UVM_TESTNAME=$(TEST_CASE)    \
		+UVM_VERBOSITY=$(UVM_VERBOSITY)  \
		+UVM_VERDI_OPTS \
		+UVM_VERDI_TRACE=$(TRACE) \
		+$(DEFINES)     \
		-l ssim.log

# debug
wave:
	verdi -sverilog -f $(TEST_FILE)  \
		-ssf uvm_test.fsdb \
		-nologo &

# clean
.PHONY: clean
clean:
	rm -rf csrc simv* *.key *~ core vc_hdrs.h ucli.key urg* *.log dump.vcd \
		   novas* *.vcd *.fsdb verdiLog uvmgen_options_log.txt \
		   *fsdb*

#--------------------------------------------------------------------------
