//
// Book, "RTL Modeling with SystemVerilog for Simulation and Synthesis"
// by Stuart Sutherland, published by Sutherland HDL, Inc.
//
// Using the streaming pack operator to reverse the bits of a vector.
//
// Copyright 2017, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//


//
// Reverse the bit order of an input vector.
//
//`begin_keywords "1800-2012" // use SystemVerilog-2012 keywords
module reverse_bits
#(parameter N = 8)
(input  logic [N-1:0]         data_in,   // N-bit input
 output logic [N-1:0]         data_out   // N-bit output
);
  timeunit 1ns; timeprecision 1ns;

  assign data_out = { << { data_in }}; // reverse of bit order

endmodule: reverse_bits
//`end_keywords
