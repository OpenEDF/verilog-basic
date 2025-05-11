#/bin/sh
#--------------------------------------------------------------------------
# Brief:  comipler and simluation verilog
# Author: Macro
# Date:   2023-04-21

#--------------------------------------------------------------------------
# test case file
SRC_FILE = src.lst
TOP_MODULE = testbench
SPY_PRJ =
nWave_SIGNAL = 
LIB_PATH = /home/macro/tools/pdk/tphn28hpcpgv18_110a/TSMCHOME/digital/Front_End/verilog/tphn28hpcpgv18_110a

# clean old file --> compiler --> simluation
all: com sim

# compiler
com:
	vcs -full64 +v2k  \
	-LDFLAGS -Wl,--no-as-needed -timescale=1ns/1ps \
	-debug_access+all +warn=noVPI-CT-NS            \
	-v $(LIB_PATH)/tphn28hpcpgv18.v \
	-f $(SRC_FILE)

# simluation
sim:
	./simv +fsdb+autoflush

# wave
wave:
	verdi -f $(SRC_FILE)        \
		-top $(TOP_MODULE)      \
		-ssf $(TOP_MODULE).fsdb \
		-sswr $(nWave_SIGNAL)   \
		-nologo &
# spy
spy:
	spyglass -project $(SPY_PRJ) &

.PHONY: clean
clean:
	rm -rf csrc simv* *.key *.vcd *.log *.fsdb *.conf novas.rc verdiLog

#--------------------------------------------------------------------------
