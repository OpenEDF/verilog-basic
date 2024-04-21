### ------------------------------------------------------------------------------------------
##
## Brief: makefile file for vcs and verdi
## Author: Macro
## Email: makermuyi@gmail.com
## Run:
##
### ------------------------------------------------------------------------------------------
# Compile command and flags
# Project output target
OUTPUT     = counter
TOP_MODULE = testbench

# module file list
MODULE_FLIES = work_src.list

# fsdb dump file for verdi
WAVEFORM = $(TOP_MODULE).fsdb

# output log file
COM_LOG_FILE = complier_log
SIM_LOG_FILE = simlution_log

VCS_FLAGS = -f $(MODULE_FLIES) -sverilog \
            -full64                      \
            +lint=all                    \
            +warn=noVPI-CT-NS            \
            +v2k                         \
            -override_timescale=1ns/1ns  \
            -debug_access+all            \
            -debug_acc+dmptf             \
            -debug_region+cell+encrypt   \
            -lca -kdb                    \
            -LDFLAGS -Wl,--no-as-needed  \
            -P $(VERDI_HOME)/share/PLI/VCS/LINUX64/novas.tab                         \
            $(VERDI_HOME)/share/PLI/VCS/LINUX64/pli.a -load libnovas.so:FSDBDumpCmd  \
			+incdir+${PWD}/src           \
            -Mupdate                     \
			+define+FSDB                 \
            -o $(OUTPUT)                 \
            -l $(COM_LOG_FILE).log

# Simulation command
SIM_FLAGS = +fsdb+autoflush              \
            -l $(SIM_LOG_FILE).log

# Debug command and flags
DEBUG_FLAGS = -sv -f $(MODULE_FLIES)     \
		      +incdir+${PWD}/src         \
              -top $(TOP_MODULE)         \
              -ssf $(WAVEFORM)           \
			  -gui=verdi                 \
              -nologo

### ------------------------------------------------------------------------------------------
# all run
all: clean com sim wave

# only com and sim
com_sim: com sim

# compiler verilog module file
com:
	vcs $(VCS_FLAGS)

# VCS -R FLAG will start simv sutomatic
sim:
	./$(OUTPUT) $(COV_NAME) $(SIM_FLAGS)

#  verdi debug
debug:
	./$(OUTPUT) -gui=verdi

# debug the model via verdi
wave:
	verdi $(DEBUG_FLAGS) &

.PHONY: clean com sim wave
clean:
	rm -rf csrc *simv *.daidir *.log *.key *.vpd DVEfiles *.fsdb* \
	verdiLog novas.* *.vdb urgReport vdCovLog $(OUTPUT)
### ------------------------------------------------------------------------------------------
