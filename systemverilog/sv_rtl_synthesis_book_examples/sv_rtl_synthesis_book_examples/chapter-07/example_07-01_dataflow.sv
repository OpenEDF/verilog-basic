//
// Book, "RTL Modeling with SystemVerilog for Simulation and Synthesis"
// by Stuart Sutherland, published by Sutherland HDL, Inc.
//
// N-bit adder -> subtractor -> multiplier dataflow with registered output.
//
// Copyright 2017, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//

//`begin_keywords "1800-2012" // use SystemVerilog-2012 keywords
module dataflow
#(parameter N = 4)               // bus size
(input  logic         clk,       // scalar input
 input  logic [N-1:0] a, b, c,   // scalable input size
 input  logic [  1:0] factor,    // fixed input size
 output logic [N-1:0] out        // scalable output size
);
  timeunit 1ns; timeprecision 1ns;

  logic [N-1:0] sum, diff, prod;
  
  assign sum  = a + b;
  assign diff = prod - c;
  assign prod = sum * factor;

  always @(posedge clk)
    out <= diff;

endmodule: dataflow
//`end_keywords
