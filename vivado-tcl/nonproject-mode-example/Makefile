### ----------------------------------------------------------------------------
### Author: Macro
### Brief: buidl and flash the FPGA used vivado

VIVADO=vivado
BUILD_TCL_SCRIPT = nonproject_model.tcl
CFGMEM_TCL_SCRIPT = buildfile.tcl

# vavido build
all:
	$(VIVADO) -mode tcl -source $(BUILD_TCL_SCRIPT)

# program to flash
flash:	
	$(VIVADO) -mode tcl -source $(CFGMEM_TCL_SCRIPT)
	
# delete the temp file
clean:
	rm -rf output build usage_statistics_webtalk.* *.jou *.log

### ----------------------------------------------------------------------------
