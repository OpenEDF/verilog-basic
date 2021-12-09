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
(output logic [N-1:0]         data_in, // N-bit input
 output logic [$clog2(N)-1:0] rfactor, // ceiling log2 of N
 input  logic [N-1:0]         data_out // N-bit output
);
  timeunit 1ns; timeprecision 1ns;

  // generate stimulus
  initial begin
  	$timeformat(-9, 0, "ns", 6);  // nanoseconds, no precision, 6 columns
  	#5 data_in = 8'b00001111;
  	   rfactor = 4;
  	#5 check_results(.expected(8'b11110000));

  	#5 data_in = 8'b11000101;
  	   rfactor = 2;
  	#5 check_results(.expected(8'b00010111));

  	#5 data_in = 8'b10000000;
  	   rfactor = N-1;
  	#5 check_results(.expected(8'b01000000));

    #5 $finish;
  end

  // verify results
  task check_results(logic [N-1:0] expected);
    $write("At %t: data_in=%b  rfactor=%0d:  ", $time, data_in, rfactor);
    $write("EXPECT: data_out = %b, ACTUAL: %b ", expected, data_out);
    if (data_out === expected) $display(" OK");
    else                       $display(" ERROR!");
  endtask

endmodule: test
//`end_keywords

//`begin_keywords "1800-2012"
module top;
  timeunit 1ns; timeprecision 1ns;
  parameter N = 8;
  logic [N-1:0] data_in;
  logic [$clog2(N)-1:0] rfactor;
  logic [N-1:0] data_out;

  test                      #(.N(N)) test (.*);
  rotate_left_rfactor_times #(.N(N)) dut  (.*);

endmodule: top
//`end_keywords

