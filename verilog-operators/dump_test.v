/* dump VCD file */
module dump_test;

initial begin
    $dumpfile("dumpfile.vcd");
    $dumpvars();

    #100
    $dumpoff;

    #500
    $dumpon;
end

endmodule

// simluation output
//VCD info: dumpfile dumpfile.vcd opened for output.

// dumpfile,vcd file context
/*
$date
	Thu Oct 14 20:51:17 2021
$end
$version
	Icarus Verilog
$end
$timescale
	1s
$end
$scope module dump_test $end
$upscope $end
$enddefinitions $end
#0
$dumpvars
$end
#100
$dumpoff
$end
#600
$dumpon
$end
*/
