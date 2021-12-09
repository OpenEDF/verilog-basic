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
(output logic [N-1:0]   a, b, // N-bit inputs to DUT
 input  logic [N-1:0]   sum   // N-bit output from DUT
);
  timeunit 1ns/1ns;

  // generate stimulus
  initial begin
  	$timeformat(-9, 0, "ns", 6);  // nanoseconds, no precision, 6 columns
  	#5 a = 8'd1; b = 8'd1;   // 1 + 1
  	#5 check_results;

  	#5 a = 8'd1; b = 8'd255;  // 1 + 255 (overflow)
  	#5 check_results;

  	#5 a = 8'd1; b = -8'd3;   // 1 + -3 (-3 will be treated as unsigned 253)
  	#5 check_results;

  	#5 a = -8'd1; b = -8'd3;   // -1 + -3 
  	#5 check_results;

    #5 $finish;
  end

  // verify results
  task check_results;
    $write("At %t: a=%0d (%b binary), b=%0d (%b binary):  ", $time, a, a, b, b);
    $write("EXPECT: sum = %0d, ACTUAL: %0d (%b binary)", add_f(a, b), sum, sum);
    if (sum === add_f(a, b)) $display(" OK");
    else                     $display(" ERROR!");
  endtask

  function [N-1:0] add_f(logic [N-1:0] a, b);
    return a + b;
  endfunction

endmodule: test
`end_keywords

`begin_keywords "1800-2012"
module top;
  timeunit 1ns/1ns;
  parameter N = 8;
  logic [N-1:0] a, b;
  logic [N-1:0] sum;

  test           #(.N(N)) test (.*);
  unsigned_adder #(.N(N)) dut  (.*);

endmodule: top
`end_keywords

