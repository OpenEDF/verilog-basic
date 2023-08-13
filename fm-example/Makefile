#-----------------------------------------------------------------------------
# 						    - Formality - 
# Date: 2023/08/013
# Author: Macro
# Brief: formality automated management by script.
#
#-----------------------------------------------------------------------------
FM_OPTION = -f script/run_design.tcl
all: fm

# start up dc on wire load mode
fm:
	fm_shell $(FM_OPTION) | tee -i fm_start.log

# clean the outfile
.PHONY: clean fm 
clean:
	rm -rf *.log formality*_svf *.syn *.lck FM_WORK

#-----------------------------------------------------------------------------
