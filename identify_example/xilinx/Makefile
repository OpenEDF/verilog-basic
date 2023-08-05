#
# @brief: identify debugger test
#
.PHONY: syn idf clean
syn:
	synplify_premier idc_test.prj &

idf:
	identify_debugger -prj idc_test.prj &

clean:
	rm -rf *.log *.log.bak.* synlog synlog.tcl *.log.bak *.bak synlog.tcl output
