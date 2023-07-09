#
# @brief: identify debugger test
#
.PHONY: syn idf clean
syn:
	synplify_premier &

idf:
	identify_debugger &

qur:
	quartus &

clean:
	rm -rf *.log *.log.bak.* synlog.tcl *.log.bak *.bak synlog.tcl output
