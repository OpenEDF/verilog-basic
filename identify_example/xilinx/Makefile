#
# @brief: identify debugger test
#
.PHONY: syn idf clean
syn:
	synplify_premier idc_test.prj &

idf:
	identify_debugger -prj idc_test.prj &

xilinx:
	vivado -mode gui idc_vivado/idc_vivado.xpr & 

debug:
	verdi -top led_stream -ssf save_dir/IICE.fsdb

load:
	djtgcfg prog -i 0 -d JtagSmt2 -f idc_vivado/idc_vivado.runs/impl_1/led_stream.bit

clean:
	rm -rf *.log *.log.bak.* synlog synlog.tcl \
    *.jou *.log.bak *.bak synlog.tcl output \
	verdiLog novas.*  
