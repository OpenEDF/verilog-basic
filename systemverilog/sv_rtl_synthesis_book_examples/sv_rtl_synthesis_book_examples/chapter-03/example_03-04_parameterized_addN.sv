//
// Book, "RTL Modeling with SystemVerilog for Simulation and Synthesis"
// by Stuart Sutherland, published by Sutherland HDL, Inc.
//
// Simple adder with parameterized port widths, and a higher level
// ALU that instantiates the adder (partial code, only).
//
// Copyright 2017, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//

//`begin_keywords "1800-2012" // use SystemVerilog-2012 keywords
module add_n_bits
#(parameter N = 8)
 (input  logic [N-1:0] a, b, 
  output logic [N-1:0] sum
 );
  timeunit 1ns; timeprecision 1ns;

  assign sum = a + b;       // N-bit wide addition, no carry
endmodule: add_n_bits

module alu (/* ports not shown */);
  logic [31:0] a, b, sum;
  add_n_bits #(.N(32)) add32 (.*);  // configure to 32 bits
endmodule: alu
//`end_keywords
