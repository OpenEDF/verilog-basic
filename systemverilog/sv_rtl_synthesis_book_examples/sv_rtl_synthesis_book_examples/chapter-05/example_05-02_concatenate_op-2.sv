//
// Book, "RTL Modeling with SystemVerilog for Simulation and Synthesis"
// by Stuart Sutherland, published by Sutherland HDL, Inc.
//
// RTL model of a 1-bit adder with carry, using a concatenation on
// the left-hand side of an assignment statement
//
// Copyright 2017, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//
//`begin_keywords "1800-2012"
module rtl_adder
(input  logic a, b, ci,
 output logic sum, co
);
  timeunit 1ns; timeprecision 1ns;

  assign {co,sum} = a + b + ci;

endmodule: rtl_adder
//`end_keywords
