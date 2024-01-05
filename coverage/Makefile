#/bin/sh
#--------------------------------------------------------------------------
# Brief:  comipler and simluation verilog
# Author: Macro
# Date:   2023-08-01

#--------------------------------------------------------------------------
# test case file
SRC_FILE = work_src.list
TOP_MODULE = testbench
SPY_PRJ = sequ_div.prj
nWave_SIGNAL = sequ_div.rc
CM = -cm line+tgl+cond+fsm+branch+assert
OUTPUT = sequ_div
CM_NAME = -cm_name $(OUTPUT)
CM_DIR  = -cm_dir ./$(OUTPUT).vdb
VPD_NAME = +vpdfile+$(OUTPUT).vpd
SIM_FLAGS = +fsdb+force

# clean old file --> compiler --> simluation
all: com sim

# compiler
com_centos:
	vcs -full64 +v2k -timescale=1ns/1ps \
	-debug_access+all +warn=noVPI-CT-NS            \
    -P $(VERDI_HOME)/share/PLI/VCS/LINUX64/novas.tab                         \
    $(VERDI_HOME)/share/PLI/VCS/LINUX64/pli.a -load libnovas.so:FSDBDumpCmd  \
	$(CM) $(CM_NAME) $(CM_DIR) $(VPD_NAME) -f $(SRC_FILE) -o $(OUTPUT)

com:
	vcs -full64 +v2k  \
	-LDFLAGS -Wl,--no-as-needed -timescale=1ns/1ps \
	-debug_access+all +warn=noVPI-CT-NS            \
    -P $(VERDI_HOME)/share/PLI/VCS/LINUX64/novas.tab                         \
    $(VERDI_HOME)/share/PLI/VCS/LINUX64/pli.a -load libnovas.so:FSDBDumpCmd  \
	$(CM) $(CM_NAME) $(CM_DIR) $(VPD_NAME) -f $(SRC_FILE) -o $(OUTPUT)

# simluation
sim:
	./$(OUTPUT) $(SIM_FLAGS) $(VPD_NAME) \
	  $(CM) $(CM_NAME) \
	  $(CM_DIR) -l $(OUTPUT).log

# wave
wave:
	verdi -f $(SRC_FILE)        \
		-top $(TOP_MODULE)      \
		-ssf $(TOP_MODULE).fsdb \
		-sswr $(nWave_SIGNAL)   \
		-workMode hardwareDebug \
		-nologo &
# spy
spy:
	spyglass -project $(SPY_PRJ) &

#dve
dve:
	dve -full64 -covdir *.vdb &

#verdi cov
vcov:
	verdi -cov -covdir $(OUTPUT).vdb &

.PHONY: clean com sim wave spy dve vcov
clean:
	rm -rf csrc simv* *.key *.vcd *.log vdCovLog \
		*.fsdb *.conf novas.rc verdiLog \
		sequ_div *.vpd *.vdb *daidir DVEfiles

#--------------------------------------------------------------------------
