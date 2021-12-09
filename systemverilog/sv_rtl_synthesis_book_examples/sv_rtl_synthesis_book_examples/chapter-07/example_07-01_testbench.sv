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
#(parameter N = 4)           // bus size
(input                clk, 
 output logic [N-1:0] a, b, c,   // input to DUT
 output logic [  1:0] factor,    // input to DUT
 input  logic [N-1:0] out        // output from DUT
);
  timeunit 1ns; timeprecision 1ns;

  // generate stimulus
  initial begin
  	$timeformat(-9, 0, "ns", 6);  // nanoseconds, no precision, 6 columns
    repeat (3) begin
      @(negedge clk) ;
      void'(std::randomize(a));
      void'(std::randomize(b));
      void'(std::randomize(c));
      void'(std::randomize(factor));
      @(negedge clk) check_results;
    end
    @(negedge clk) $finish;
  end

  // verify results
  task check_results;
    $write("At %t: a=%0d  b=%0d  c=%0d  factor=%0d:  ", $time, a, b, c, factor);
    $write("EXPECT: out = %0d, ACTUAL: %0d ", out_f(), out);
    if (out_f() === out) $display(" OK");
    else                 $display(" ERROR!");
  endtask
  
  function [N-1:0] out_f;
    return ( ((a + b) * factor) - c );
  endfunction

endmodule: test
//`end_keywords

//`begin_keywords "1800-2012"
module top;
  timeunit 1ns; timeprecision 1ns;
  parameter N = 4;

  logic         clk;
  logic [N-1:0] a, b, c;
  logic [  1:0] factor;
  logic [N-1:0] out;

  test      #(.N(N)) test (.*);
  dataflow  #(.N(N)) dut  (.*);

  initial begin
    clk <= 0;
    forever #5 clk = ~clk;
  end
endmodule: top
//`end_keywords

