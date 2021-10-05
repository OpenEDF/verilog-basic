### ----------------------------------------------------------------------------
### Author: Macro
### Brief: buidl and flash the FPGA used vivado

VIVADO=vivado
BUILD_TCL_SCRIPT = project_mode_tcl.tcl
CFGMEM_TCL_SCRIPT = buildfile.tcl

# vavido build
all:
	$(VIVADO) -mode tcl -source $(BUILD_TCL_SCRIPT)

# program to flash
flash:	
	$(VIVADO) -mode tcl -source $(CFGMEM_TCL_SCRIPT)
	
# delete the temp file
clean:
	rm -rf flowled.* output vivado.jou vivado.log webtalk.jou webtalk.log build

### ----------------------------------------------------------------------------
