#/bin/sh
#--------------------------------------------------------------------------
# Brief:  use uvmgen tool to generate UVM template.
# Author: Macro
# Date:   2021-01-08

#--------------------------------------------------------------------------
UVMGEN_GENERATOR = uvmgen
TEST_NAME = test_proj.sv

#--------------------------------------------------------------------------
uvm:
	$(UVMGEN_GENERATOR)

# options file argument
opt_gen: cfile
	$(UVMGEN_GENERATOR) -options_file cfile 

# help
.PHONY: help
help:
	@echo "                    -- HELP --                             "
	@echo "uvmgen : UVM Template Generator"
	@echo "[CMD] make : manual input argument to generator UVM Template"

#--------------------------------------------------------------------------

# clean
.PHONY: clean
clean:
	rm -rf proj ENV 

#--------------------------------------------------------------------------
