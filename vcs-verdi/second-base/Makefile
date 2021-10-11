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

# Set the debug GUI (verdi or dve)
DEBUG_GUI = verdi

# Set the FPGA Platform

# UVM test

# module file list
MODULE_FLIES = ./script/module.list

# testbench file list
TB_FILES = ./script/tb.list

# output log file
COM_LOG_FILE = complier_log
SIM_LOG_FILE = simlution_log

# fsdb dump file for verdi
WAVEFORM = $(OUTPUT).fsdb

# Compile command and flags
VCS_FLAGS = -f $(MODULE_FLIES)           \
            -f $(TB_FILES)               \
            -full64                      \
            +v2k                         \
            -override_timescale=1ns/10ps \
            -debug_pp                    \
            -fsdb                        \
            -cpp g++-4.8                 \
            -cc  gcc-4.8 			     \
            -LDFLAGS -Wl,--no-as-needed  \
            -rdynamic                    \
            -P $(VERDI_HOME)/share/PLI/VCS/LINUX64/novas.tab                         \
            $(VERDI_HOME)/share/PLI/VCS/LINUX64/pli.a -load libnovas.so:FSDBDumpCmd  \
            -Mupdate                     \
            -o $(OUTPUT)                 \
            -l $(COM_LOG_FILE).log

# Simulation command
SIM_FLAGS = -ucli -i ./script/dum_fsdb_vcs.tcl    \
            +fsdb+autoflush                       \
            -l $(SIM_LOG_FILE).log

# Debug command and flags
DEBUG_FLAGS = -f $(MODULE_FLIES)                  \
              -f $(TB_FILES)                      \
              -top flow_led_tb                    \
              -ssf $(WAVEFORM)                    \
              -nologo

# Coverage command and flags
COV_FLAGS = ""

# Lint Flags
LINT_FLAGS = --lint-only        \
             -Wall              \
             -f $(MODULE_FLIES) \
             -f $(TB_FILES)

# FPGA implement options

# Download to FPGA Flash options

### ------------------------------------------------------------------------------------------
# All run
all: lint com sim vdebug

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

# debug the model via verdi
vdebug:
	verdi $(DEBUG_FLAGS)

# impletment in FPGA
fpga:

# download to FPGA Flash
flash:

# compiler the C code to debug Soc
cdebug:

# clean the compiler-time file
.PHONY: clean
clean:
	rm -rf csrc *simv *.daidir *.log *.key $(OUTPUT) *.vpd DVEfiles *.fsdb \
	verdiLog novas.*

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
	@echo "make help   : print the all command and use method."
	@echo --------------------------------- Help  ---------------------------------
### ------------------------------------------------------------------------------------------
