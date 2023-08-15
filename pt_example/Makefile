#-----------------------------------------------------------------------------
# 						    - Prime Time - 
# Date:   2023/08/16
# Author: Macro
# Brief:  Primetime example
#
#-----------------------------------------------------------------------------
DC_OPTION = -f script/pt_script.tcl
all: pt

# start up dc on wire load mode
pt:
	pt_shell -gui $(DC_OPTION) | tee -i pt_start.log

# clean the outfile
.PHONY: clean pt
clean:
	rm -rf *.log 

#-----------------------------------------------------------------------------
