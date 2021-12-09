//
// Book, "RTL Modeling with SystemVerilog for Simulation and Synthesis"
// by Stuart Sutherland, published by Sutherland HDL, Inc.
//
// Using arithmetic operators with floating point data types.
//
// Copyright 2017, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//


//
// Simple adder with floating point data types.
//
//`begin_keywords "1800-2012" // use SystemVerilog-2012 keywords
module floating_point_adder
(input  real  a, b,    // double-precision floating point inputs
 output real  sum      // double-precision floating point output
);
  timeunit 1ns; timeprecision 1ns;

  assign sum = a + b;  // floating point adder

endmodule: floating_point_adder
//`end_keywords
