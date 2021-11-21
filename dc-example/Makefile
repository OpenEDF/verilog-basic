#-----------------------------------------------------------------------------
# 						    - Design Compiler - 
# Date: 2021/11/21
# Author: Macro
# Brief: Design Compiler automated management by script.
#
#-----------------------------------------------------------------------------
all: dc

# start up dc on wire load mode
dc:
	dc_shell &

# start up dc on topographical mode
dcto:
	dc_shell -topographical_mode &

# clean the outfile
.PHONY: clean
clean:
	rm -rf *.log *.svf alib-52 *.syn *.pvl *.mr

#-----------------------------------------------------------------------------
