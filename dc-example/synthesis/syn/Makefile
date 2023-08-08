#-----------------------------------------------------------------------------
# 						    - Design Compiler - 
# Date: 2023/08/08
# Author: Macro
# Brief: Design Compiler automated management by script.
#
#-----------------------------------------------------------------------------
DC_OPTIONS = -f script/read_input.scr
all: dc

# start up dc on wire load mode
dc:
	dc_shell $(DC_OPTIONS)

# start up dc on topographical mode
dcto:
	dc_shell -topographical_mode $(DC_OPTIONS) 

# clean the outfile
.PHONY: clean
clean:
	rm -rf *.log *.svf alib-52 *.syn *.pvl *.mr

#-----------------------------------------------------------------------------
