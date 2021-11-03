###############################################################################
#
# ICARUS VERILOG & GTKWAVE MAKEFILE
# MADE BY WILLIAM GIBB FOR HACDC
# makermuyi@gmail.com
# 
# USE THE FOLLOWING COMMANDS WITH THIS MAKEFILE
#	"make check" - compiles your verilog design - good for checking code
#	"make simulate" - compiles your design+TB & simulates your design
#	"make display" - compiles, simulates and displays waveforms
# 
###############################################################################
#
# CHANGE THESE THREE LINES FOR YOUR DESIGN
#
#TOOL INPUT
SRC = decoder.v
TESTBENCH = decoder_tb.v
COUTPUT = compiler.out
TBOUTPUT = test.vcd

###############################################################################
# BE CAREFUL WHEN CHANGING ITEMS BELOW THIS LINE
###############################################################################
#TOOLS
COMPILER = iverilog
SIMULATOR = vvp
VIEWER = gtkwave

#TOOL OPTIONS
COFLAGS = -o
SFLAGS = -i

###############################################################################
#MAKE DIRECTIVES
.PHONY : check simulate displays
all: check simulate display

check: $(SRC)
	@echo "Check $(SRC)"
	@verilator --lint-only -Wall $(SRC)
	@$(COMPILER) $(COFLAGS) $(COUTPUT) $(SRC)

simulate: $(COUTPUT) $(TESTBENCH)
	@echo "Simulate $(COUTPUT)"
	@$(COMPILER) $(COFLAGS) $(COUTPUT) $(SRC) $(TESTBENCH)
	@$(SIMULATOR) $(SFLAGS) $(COUTPUT)

display: $(TBOUTPUT)
	@echo "Display $(TBOUTPUT)"
	@$(VIEWER) $(TBOUTPUT) &

#CLEAN THE FILE
.PHONY : clean
clean:
	@echo "Clean $(COUTPUT) $(TBOUTPUT)"
	@rm -rf $(COUTPUT) $(TBOUTPUT)

#DISPLAY THE HELP
.PHONY : help
help:
	@echo " Help Info:"
	@echo " make check    - compiles your verilog design - good for checking code"
	@echo " make simulate - compiles your design+TB & simulates your design"
	@echo " make display  - compiles, simulates and displays waveforms"

###############################################################################
