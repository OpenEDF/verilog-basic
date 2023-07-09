#
# @brief: identify debugger test
#
.PHONY: syn idf clean
syn:
	synplify_premier idc_test.prj &
	#synplify_premier idc_test.prj -batch &

idf:
	identify_debugger -prj idc_test.prj &

qur:
	quartus idc_test_pro.qpf &

pro:
	quartus_pgm -z --mode=JTAG -o "p;./output_files/idc_test_pro.sof"

clean:
	rm -rf *.log *.log.bak.* synlog.tcl *.log.bak *.bak \
		synlog.tcl output *_output output_files db \
		incremental_db synlog

