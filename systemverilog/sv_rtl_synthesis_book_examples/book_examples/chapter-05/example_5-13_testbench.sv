//
// Book, "RTL Modeling with SystemVerilog for ASIC and FPGA Design"
// by Stuart Sutherland
//
// Testbench
//
// Copyright 2016, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//
`begin_keywords "1800-2012"
module test
#(parameter N = 8)
(output logic [N-1:0]         data_in,  // N-bit input
 output logic [$clog2(N)-1:0] base2exp, // ceiling log2 of N
 input  logic [N-1:0]         data_out  // N-bit output
);
  timeunit 1ns/1ns;

  // generate stimulus
  initial begin
  	$timeformat(-9, 0, "ns", 6);  // nanoseconds, no precision, 6 columns
  	#5 data_in  = 0;
  	   base2exp = 2;
  	#5 check_results;

  	#5 data_in  = 5;
  	   base2exp = 2;
  	#5 check_results;

  	#5 data_in  = 5;
  	   base2exp = 3;
  	#5 check_results;

  	#5 data_in  = 5;
  	   base2exp = N-1;
  	#5 check_results;

    #5 $finish;
  end

  // verify results
  task check_results;
    const logic [N-1:0] base = 2;  // need base to be same vector size as
                                   // data in order to prevent overflow bits
    $write("At %t: data_in=%0d  base2exp=%0d:  ", $time, data_in, base2exp);
    $write("EXPECT: data_out = %0d, ACTUAL: %0d ", (data_in*(base**base2exp)), data_out);
    if (data_out === (data_in*(base**base2exp))) $display(" OK");
    else                                         $display(" ERROR!");
  endtask

endmodule: test
`end_keywords

`begin_keywords "1800-2012"
module top;
  timeunit 1ns/1ns;
  parameter N = 8;
  logic [N-1:0] data_in;
  logic [$clog2(N)-1:0] base2exp;
  logic [N-1:0] data_out;

  test                            test (.*);
  algorithmic_8bit_barrel_shifter dut  (.*);

endmodule: top
`end_keywords
