#--------------------------------------------------------------------------
# Brief:  comipler and simluation systemverilog for UVM
# Author: Macro
# Date:   2024-05-01
#
#--------------------------------------------------------------------------
# test case file
TEST_FILE = src.lst
INC_DIR = ../src/+mst_agt/+inf/+../src/ahb_eg_slave
UVM_VERBOSITY =	UVM_LOW

# UVM simv Test options
UVM_VER = uvm-1.2
TEST_CASE ?= ahb_lite_pipeline_test
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
FSDB_FILE = $(TB_TOP)

# all test case
CASES := ahb_lite_pipeline_test \
	     ahb_lite_irq_test \
		 ahb_lite_new_test \
		 ahb_lite_auto_obj_test \
		 ahb_lite_vseq_test

# run
all: com sim
# compiler
com:
	vcs -sverilog -full64 +v2k \
		-lca -kdb \
		-Mupdate \
		-debug_access+all+reverse \
		-ntb_opts $(UVM_VER) \
		-timescale=1ns/1ns \
		+define+$(UVM_DEFINES)  \
		+incdir+$(INC_DIR)      \
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
	verdi -ssf $(FSDB_FILE).fsdb \
		-sswr signal.rc \
		-nologo &

#coverage
cov:
	verdi -cov -covdir $(TEST_CASE).vdb &

# all test case run
all_case: com $(CASES)
	@echo "run all test cases"

define run_all_test
TEST_CASE = $(1)
$(1):
	./simv +UVM_TESTNAME=$(TEST_CASE)  \
		+UVM_VERBOSITY=$(UVM_VERBOSITY)  \
		$(UVM_VERDI_OPTS) \
		+UVM_VERDI_TRACE=$(TRACE) \
		$(ENABLE_CULI)            \
		$(CM) $(CM_NAME) $(CM_DIR) \
		$(SIM_FLAGS)    \
		+$(DEFINES)     \
		-l ssim_$(TEST_CASE).log
endef

#generate
$(foreach cases, $(CASES), $(eval $(call run_all_test, $(cases))))

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
	@echo "all_test => Run all tescase"
	@echo ===================================================================

# clean
.PHONY: clean
clean:
	@rm -rf csrc simv* *.key *~ core vc_hdrs.h ucli.key urg* *.log dump.vcd \
		   novas* *.vcd *.fsdb verdiLog uvmgen_options_log.txt *fsdb*       \
		   vdCovLog base_test.vdb profileReport.* simprofile_dir* \
		   profileReport *.vdb

	@echo "clean the intermediate files..."
#--------------------------------------------------------------------------
