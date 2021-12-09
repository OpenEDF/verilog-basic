//
// Book, "RTL Modeling with SystemVerilog for Simulation and Synthesis"
// by Stuart Sutherland, published by Sutherland HDL, Inc.
//
// Gate-level model of a 1-bit adder
//
// Copyright 2017, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//
//`begin_keywords "1800-2012"
module gate_adder
(input  wire a, b, ci,
 output wire sum, co
);
  timeunit 1ns; timeprecision 100ps;

  wire n1, n2, n3;

  xor            g1 (n1, a, b);
  xor #1.3       g2 (sum, n1, ci);
  and            g3 (n2, a, b);
  and            g4 (n3, n1, ci);
  or  #(1.5,1.8) g5 (co, n2, n3);

endmodule: gate_adder
//`end_keywords
