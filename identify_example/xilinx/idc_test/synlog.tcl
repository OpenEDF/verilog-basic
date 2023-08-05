project -load /home/macro/github/verilog-basic/identify_example/xilinx/idc_test.prj
puts "Generating SRS instrumentation file: /home/macro/github/verilog-basic/identify_example/xilinx/idc_test/instr_sources/syn_dics.v"
 if { [catch {write instrumentation} err] } {
    puts stderr "write instrumentation failed $err"
    exit 9
}
