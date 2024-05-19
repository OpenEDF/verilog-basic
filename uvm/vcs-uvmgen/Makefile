#/bin/sh
#--------------------------------------------------------------------------
# Brief:  use uvmgen tool to generate UVM template.
# Author: Macro
# Date:   2021-01-08

#--------------------------------------------------------------------------
UVMGEN_GENERATOR = uvmgen

#--------------------------------------------------------------------------
uvm:
	$(UVMGEN_GENERATOR)

# options file argument
opt_gen: cfile
	$(UVMGEN_GENERATOR) -RAL=y -ENV=apb -TR=apb_data+ahb_data -SE=n

# help
.PHONY: help
help:
	@echo "------------------------ HELP ---------------------------------"
	@echo "uvmgen : UVM Template Generator"
	@echo "[CMD] make : manual input argument to generator UVM Template"
	@echo "------------------------ HELP ---------------------------------"

#--------------------------------------------------------------------------

# clean
.PHONY: clean uvm 
clean:
	rm -rf proj ENV 

#--------------------------------------------------------------------------
