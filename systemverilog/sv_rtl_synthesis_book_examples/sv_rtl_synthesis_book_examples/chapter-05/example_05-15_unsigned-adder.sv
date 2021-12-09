//
// Book, "RTL Modeling with SystemVerilog for Simulation and Synthesis"
// by Stuart Sutherland, published by Sutherland HDL, Inc.
//
// Using arithmetic operators with unsigned data types.
//
// Copyright 2017, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//


//
// Simple adder with unsigned data types.
//
//`begin_keywords "1800-2012" // use SystemVerilog-2012 keywords
module unsigned_adder
#(parameter N = 8)
(input  logic [N-1:0]  a, b,   // N-bit unsigned inputs
 output logic [N-1:0]  sum     // N-bit unsigned output
);
  timeunit 1ns; timeprecision 1ns;

  assign sum = a + b;          // adder with no carry

endmodule: unsigned_adder
//`end_keywords
