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
CM = -cm line+cond+fsm+tgl+branch+assert
CM_NAME = -cm_name $(TEST_CASE)
CM_DIR = -cm_dir ./$(TEST_CASE).vdb
SIM_FLAGS = +fsdb+force
# SIM OPTIONS
#ENABLE_UCLI = -ucli
ENABLE_UCLI =
RALF_FILE = dma_uvm

# run
all: clean com sim
# compiler
com:
	vcs -sverilog -full64 +v2k \
		-lca -kdb \
		-Mupdate \
		-debug_access+all+reverse \
		-ntb_opts $(UVM_VER) \
		-timescale=1ns/1ns \
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

# generate ralf file
ralf:
	ralgen -full64 -uvm -t $(RALF_FILE) ralf/$(RALF_FILE).ralf
	# mv ral_$(RALF_FILE).sv ralf

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
	@echo "ralf     => genrate the ralf systemverilog file"
	@echo ===================================================================

# clean
.PHONY: clean com sim help cove debug ralf all
clean:
	@rm -rf csrc simv* *.key *~ core vc_hdrs.h ucli.key urg* *.log dump.vcd \
		   novas* *.vcd *.fsdb verdiLog uvmgen_options_log.txt *fsdb*       \
		   vdCovLog base_test.vdb

	@echo "clean the intermediate files..."
#--------------------------------------------------------------------------
