//
// Book, "RTL Modeling with SystemVerilog for Simulation and Synthesis"
// by Stuart Sutherland, published by Sutherland HDL, Inc.
//
// Using arithmetic operators with signed data types.
//
// Copyright 2017, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//


//
// Simple adder with signed data types.
//
//`begin_keywords "1800-2012" // use SystemVerilog-2012 keywords
module signed_adder
#(parameter N = 8)
(input  logic signed [N-1:0]  a, b,   // N-bit signed inputs
 output logic signed [N-1:0]  sum     // N-bit signed output
);
  timeunit 1ns; timeprecision 1ns;

  assign sum = a + b;                 // adder with no carry

endmodule: signed_adder
//`end_keywords
