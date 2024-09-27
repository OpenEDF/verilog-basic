#--------------------------------------------------------------------------
# Brief:  comipler and simluation systemverilog for UVM
# Author: Macro
# Date:   2024-05-01
#
#--------------------------------------------------------------------------
# test case file
TEST_FILE = src.lst
UVM_VERBOSITY =	UVM_LOW

# UVM simv Test options
UVM_VER = uvm-1.2
TEST_CASE = test
TB_TOP = top_tb
DEFINES = UVM_NO_RELNOTES
UVM_DEFINES = UVM_NO_DEPRECATED+UVM_OBJECT_MUST_HAVE_CONSTRUCTOR
PROGRAM_TOP = base_test.sv
#UVM_AWARE|RAL|TLM|MSG|HIER|PRINT
TRACE = HIER
UVM_VERDI_OPTS = +UVM_TR_RECORD +UVM_LOG_RECORD +UVM_PHASE_RECORD
CM = -cm line+cond+fsm+tgl+branch+assert
CM_NAME = -cm_name $(TEST_CASE)
CM_DIR = -cm_dir ./$(TEST_CASE).vdb
SIM_FLAGS = +fsdb+force
# SIM OPTIONS
#ENABLE_UCLI = -ucli
ENABLE_UCLI =

# run
all: clean com sim
# compiler
com:
	vcs +acc +vpi -sverilog -full64 +v2k \
		-lca -kdb -Mupdate \
		-debug_access+all+reverse \
		-ntb_opts $(UVM_VER) \
		-timescale=1ns/1ns \
		-CFLAGS -DVCS \
		+define+$(UVM_DEFINES)  \
		$(CM) $(CM_NAME) $(CM_DIR) \
		-top $(TB_TOP) \
		-f $(TEST_FILE) \
		-l comp.log

# simluation
sim:
	./simv +UVM_TESTNAME=$(TEST_CASE)    \
		+UVM_VERBOSITY=$(UVM_VERBOSITY)  \
		$(UVM_VERDI_OPTS) \
		+UVM_VERDI_TRACE=$(TRACE) \
		$(ENABLE_CULI)            \
		$(CM) $(CM_NAME) $(CM_DIR) \
		$(SIM_FLAGS)    \
		+$(DEFINES)     \
		-l ssim.log

# verdi debug
debug:
	./simv -gui=verdi \
		$(UVM_VERDI_OPTS) \
		+UVM_VERDI_TRACE=$(TRACE) \
		-l verdi_debug.log

# debug
wave:
	verdi -ssf uvm_test.fsdb \
		-nologo &

#coverage
cov:
	verdi -cov -covdir $(TEST_CASE).vdb &

# help
help:
	@echo ===================================================================
	@echo "------------------------- TARGET ---------------------------------"
	@echo "help     => Display the message"
	@echo "clean    => Remove all intermediate simv and log files"
	@echo "com      => Compile TB and DUT files"
	@echo "sim      => Run the simulation with text"
	@echo "debug    => Run the simulation with verdi gui uvm debug"
	@echo "wave     => Display the fsdb waveform by verdi"
	@echo "cov      => Display the coverage info by verdi"
	@echo ===================================================================

# clean
.PHONY: clean
clean:
	@rm -rf csrc simv* *.key *~ core vc_hdrs.h ucli.key urg* *.log dump.vcd \
		   novas* *.vcd *.fsdb verdiLog uvmgen_options_log.txt *fsdb*       \
		   vdCovLog *.vdb *.vpd profileReport.* simprofile_dir* \
		   profileReport

	@echo "clean the intermediate files..."
#--------------------------------------------------------------------------
