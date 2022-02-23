### ------------------------------------------------------------------------------------------
## 
## Brief: makefile file for vcs and verdi 
## Author: Macro
## Email: makermuyi@gmail.com
## Run: 
##
### ------------------------------------------------------------------------------------------
# Project output target
export OUTPUT = flowled
TOP_MODULE = flowled_tb

# Set the debug GUI (verdi or dve)
DEBUG_GUI = verdi

# Set the FPGA Platform
VIVADO=vivado
BUILD_TCL_SCRIPT = ./fpga/nonproject_model_build.tcl
CFGMEM_TCL_SCRIPT = ./fpga/cfg_program_flash.tcl

# UVM test

# module file list
MODULE_FLIES = ./script/module.list

# testbench file list
TB_FILES = ./script/tb.list

# output log file
COM_LOG_FILE = complier_log
SIM_LOG_FILE = simlution_log
COV_LOG_FILE = coverage_log

# fsdb dump file for verdi
WAVEFORM = $(OUTPUT).fsdb

# Coverage command and flags
COV_FLAGS = -cm line+cond+fsm+tgl+branch+assert
#TODO: CHECK NAME AND OUTPUT
COV_NAME = -cm_name $(OUTPUT).cov
COV_DIR = -cm_dir ./$(OUTPUT).vdb

# Dve and Verdi Coverage command
DVE_COV_CMD = dve -full64 -covdir $(OUTPUT).vdb &
#NO SUPPORT: VERDI_COV_CMD = verdi -cov -covdir $(OUTPUT).vdb &

# Compile command and flags
VCS_FLAGS = -f $(MODULE_FLIES)           \
            -f $(TB_FILES)               \
            -full64                      \
            +lint=all                    \
            +warn=noVPI-CT-NS            \
            +v2k                         \
            -override_timescale=1ns/10ps \
            -debug_access+all            \
            -debug_acc+dmptf             \
            -debug_region+cell+encrypt   \
            -cpp g++-4.8                 \
            -cc  gcc-4.8 			     \
            -LDFLAGS -Wl,--no-as-needed  \
            -P $(VERDI_HOME)/share/PLI/VCS/LINUX64/novas.tab                         \
            $(VERDI_HOME)/share/PLI/VCS/LINUX64/pli.a -load libnovas.so:FSDBDumpCmd  \
            $(COV_FLAGS)                 \
            $(COV_DIR)                   \
            -Mupdate                     \
            -o $(OUTPUT)                 \
            -l $(COM_LOG_FILE).log

# Simulation command
SIM_FLAGS = -ucli -i ./script/dum_fsdb_vcs.tcl    \
            +fsdb+autoflush                       \
            $(COV_FLAGS)                          \
            -cm_log $(COV_LOG_FILE).log           \
            -l $(SIM_LOG_FILE).log

# Debug command and flags
DEBUG_FLAGS = -f $(MODULE_FLIES)                  \
              -f $(TB_FILES)                      \
              -top $(TOP_MODULE)                  \
              -ssf $(WAVEFORM)                    \
              -nologo

# Lint Flags
LINT_FLAGS = --lint-only        \
             -Wall              \
             -f $(MODULE_FLIES)

# FPGA implement options
VIVADO_FLAGS = -mode tcl -source $(BUILD_TCL_SCRIPT)

# Download to FPGA Flash options
VIVADO_FLASH_FLAGS = -mode tcl -source $(CFGMEM_TCL_SCRIPT)

# Lattice FPGA implement

# Lattice FPGA program

# Formality Flags

# PeimrTime Flags

# Spyglass Flags

# Design Compiler Flags

# Synthesis Flags

### ------------------------------------------------------------------------------------------
# All run
all: com sim vdebug

# only com and sim
com_sim: com sim

# lint the verilog design code
# verilator --lint-only -Wall [source_files.v]...
lint:
	verilator $(LINT_FLAGS)

# compiler verilog module file
com:
	vcs $(VCS_FLAGS)

# VCS -R FLAG will start simv sutomatic
sim:
	./$(OUTPUT) $(SIM_FLAGS)

# coverage the verilog module
cov:
	$(DVE_COV_CMD)

# debug the model via verdi
vdebug:
	verdi $(DEBUG_FLAGS)

# impletment in FPGA vavido build
fpga:
	$(VIVADO) $(VIVADO_FLAGS)

# download to FPGA Flash
flash:
	$(VIVADO) $(VIVADO_FLASH_FLAGS)

# show coverage by html
html:
	urg -dir $(OUTPUT).vdb -dbname merge &

# compiler the C code to debug Soc
cdebug:

# clean the compiler-time file
.PHONY: clean all com_sim lint com sim cov vdebug fpga flash html cdebug
clean:
	rm -rf csrc *simv *.daidir *.log *.key $(OUTPUT) *.vpd DVEfiles *.fsdb \
	verdiLog novas.* *.vdb urgReport vdCovLog output \
	build usage_statistics_webtalk.* *.jou *.log

### ------------------------------------------------------------------------------------------
# display the help information
help:
	@echo
	@echo --------------------------------- Help  ---------------------------------
	@echo "command     : descript"
	@echo "make clean  : clean the temp file."
	@echo "make lint   : lint the verilog format and pre-check."
	@echo "make all    : execute the compile simluation and open verdi debug."
	@echo "make com    : only execute compile the verilog module."
	@echo "make sim    : only execute simulation the model."
	@echo "make cov    : only execute coverage."
	@echo "make vdebug : start the verdi and execute debug the waveform."
	@echo "make fpga   : synthesize and implement the model to FPGA SRAM."
	@echo "make flash  : download the .bin file to FPGA Flash."
	@echo "make cdebug : compile and load C program to debug and test Soc model."
	@echo "make html   : view coverage report by html file."
	@echo "make help   : print the all command and use method."
	@echo --------------------------------- Help  ---------------------------------
### ------------------------------------------------------------------------------------------
