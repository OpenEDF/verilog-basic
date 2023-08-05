#
# @brief: identify debugger test
#
.PHONY: syn idf clean
syn:
	synplify_premier idc_test.prj &

idf:
	identify_debugger -prj idc_test.prj &

xilinx:
	setvivado;
	vivado -mode gui idc_vivado/idc_vivado.xpr & 

debug:
	verdi -top led_stream -ssf save_dir/IICE.fsdb

clean:
	rm -rf *.log *.log.bak.* synlog synlog.tcl \
    *.jou *.log.bak *.bak synlog.tcl output \
	verdiLog novas.*  
