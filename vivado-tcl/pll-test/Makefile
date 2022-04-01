#-----------------------------------------------------------------------------------------
VIVADO ?= vivado
VIVADOFLAGS := \
	-nojournal -mode tcl \
	-source script/board.tcl \
	-source script/prologue.tcl

VIVADOFLAGS_SETUP := \
	-nojournal -mode gui \
	-source script/board.tcl \
	-source script/prologue_setup.tcl

# Path to a program in raw binary format to be flashed into the address that the
# bootrom jumps to.
FLASHED_PROGRAM ?=
BIT_TCL = -source script/init.tcl -source script/impl.tcl 
BUILD_MCS_TCL = -source script/buildfile.tcl
bit_file := obj/ip_clk_wiz.bit
DOWNLOAD_MCS_TCL = -source script/download_mcs.tcl 

.PHONY: bit mcs setup clean load
bit:
	$(VIVADO) $(VIVADOFLAGS) $(BIT_TCL)

mcs: $(bit_file)
	$(VIVADO) $(VIVADOFLAGS) $(BUILD_MCS_TCL) -tclargs $@ $^ $(FLASHED_PROGRAM)

setup:
	$(VIVADO) $(VIVADOFLAGS_SETUP) -source script/init_setup.tcl 

load:
	$(VIVADO) $(VIVADOFLAGS) $(DOWNLOAD_MCS_TCL)

clean:
	rm -rf -- .Xil .ip_user_files *.os obj src/generated usage_statistics_webtalk.xml usage_statistics_webtalk.html *.log build *.jou *.log xsim.dir xvlog.pb
#-----------------------------------------------------------------------------------------
