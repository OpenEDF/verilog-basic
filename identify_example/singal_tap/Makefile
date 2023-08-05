#
# @brief: quartus test file
#
.PHONY: qur pro clean
qur:
	quartus idc_test_pro.qpf &
pro:
	quartus_pgm -z --mode=JTAG --operation="p;./output/idc_test_pro.sof"

clean:
	rm -rf *.log *.log.bak.* *.log.bak *.bak \
   	output_files db incremental_db output 

# mkdir output;  cp output_files/*.sof output/; cp output_files/*.jic output/
