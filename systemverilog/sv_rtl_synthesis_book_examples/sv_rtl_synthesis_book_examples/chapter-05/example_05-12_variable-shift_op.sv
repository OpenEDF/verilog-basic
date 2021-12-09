//
// Book, "RTL Modeling with SystemVerilog for Simulation and Synthesis"
// by Stuart Sutherland, published by Sutherland HDL, Inc.
//
// Using the shift operator to perform a variable shift
// operation.
//
// Copyright 2017, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//


//
// Multiply by a power of two operation by shifting an N-bit
// bus left by a variable number of times; no overflow.
//
//`begin_keywords "1800-2012" // use SystemVerilog-2012 keywords
module multiply_by_power_of_two
#(parameter N = 8)
(input  logic [N-1:0]         data_in,    // N-bit input
 input  logic [$clog2(N)-1:0] base2exp,   // ceiling log2 of N
 output logic [N-1:0]         data_out    // N-bit output
);
  timeunit 1ns; timeprecision 1ns;

  assign data_out = data_in << base2exp;  // shift left

endmodule: multiply_by_power_of_two
//`end_keywords