//
// Book, "RTL Modeling with SystemVerilog for Simulation and Synthesis"
// by Stuart Sutherland, published by Sutherland HDL, Inc.
//
// Testbench
//
// Copyright 2017, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//
//`begin_keywords "1800-2012"
module test
#(parameter N = 8)
(output logic [N-1:0] data_in,  // N-bit input
 input  logic [N-1:0] data_out  // N-bit output
);
  timeunit 1ns; timeprecision 1ns;

  // generate stimulus
  initial begin
  	$timeformat(-9, 0, "ns", 6);  // nanoseconds, no precision, 6 columns
  	#5 data_in = 0;
  	#5 check_results;

  	#5 data_in = 6;
  	#5 check_results;

  	#5 data_in = 15;
  	#5 check_results;

    #5 $finish;
  end

  // verify results
  task check_results;
    $write("At %t: data_in=%0d:  ", $time, data_in);
    $write("EXPECT: data_out = %0d, ACTUAL: %0d ", (data_in/2), data_out);
    if (data_out === (data_in/2)) $display(" OK");
    else                          $display(" ERROR!");
  endtask

endmodule: test
//`end_keywords

//`begin_keywords "1800-2012"
module top;
  timeunit 1ns; timeprecision 1ns;
  parameter N = 8;
  logic [N-1:0] data_in;
  logic [N-1:0] data_out;

  test          #(.N(N)) test (.*);
  divide_by_two #(.N(N)) dut  (.*);

endmodule: top
//`end_keywords

