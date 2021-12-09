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
(output logic [N-1:0]       in,      // input to DUT
 output logic [$clog2(N):0] rfactor, // input to DUT
 input  logic [N-1:0]       out      // output from DUT
);
  timeunit 1ns/1ns;

  // generate stimulus
  initial begin
  	$timeformat(-9, 0, "ns", 6);  // nanoseconds, no precision, 6 columns

  	#5 in = 8'h55; 
  	rfactor = 1;
    #5 check_results;

  	#5 in = 8'h0F; 
  	rfactor = 4;
    #5 check_results;

    #5 $finish;
  end

  // verify results
  task check_results;
    $write("At %t: in=%b, rfactor=%0d:  ", $time, in, rfactor);
    $write("EXPECT: out = %b, ACTUAL: %b", rotate_f(in, rfactor), out);
    if (out === rotate_f(in, rfactor)) $display(" OK");
    else                               $display(" ERROR!");
  endtask

  function [N-1:0] rotate_f([N-1:0] in, [$clog2(N):0] rfactor);
    return {in,in} >> rfactor;  // rotate right
  endfunction

endmodule: test
`end_keywords

`begin_keywords "1800-2012"
module top;
  timeunit 1ns/1ns;
  parameter N = 8;
  
  logic [N-1:0]       in;
  logic [$clog2(N):0] rfactor;
  logic [N-1:0]       out;

  test            #(.N(N)) test (.*);
  rotate_right_n  #(.N(N)) dut  (.*);

endmodule: top
`end_keywords

