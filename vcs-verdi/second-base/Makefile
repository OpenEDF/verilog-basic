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

# module file list
MODULE_FLIES = module.list

# testbench file list
TB_FILES = tb.list

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

### ------------------------------------------------------------------------------------------
# All run
all: com sim debug

# compiler verilog module file
com:
	vcs $(VCS_FLAGS)

# VCS -R FLAG will start simv sutomatic
sim:
	./$(OUTPUT) $(SIM_FLAGS)

# coverage the verilog module
cov:

# debug the model via verdi
debug:
	verdi $(DEBUG_FLAGS)

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
	@echo "command    : descript"
	@echo "make clean : clean the temp file."
	@echo "make all   : execute the compile simluation and open verdi debug."
	@echo "make com   : only execute compile the verilog module."
	@echo "make sim   : only execute simulation the model."
	@echo "make cov   : only execute coverage."
	@echo "make debug : start the verdi and execute debug the waveform."
	@echo "make help  : print the all command and use method."
	@echo --------------------------------- Help  ---------------------------------
### ------------------------------------------------------------------------------------------
