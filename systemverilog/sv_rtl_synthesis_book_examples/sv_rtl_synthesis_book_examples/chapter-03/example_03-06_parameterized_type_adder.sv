//
// Book, "RTL Modeling with SystemVerilog for Simulation and Synthesis"
// by Stuart Sutherland, published by Sutherland HDL, Inc.
//
// RAM with parameterized size and port widths.
//
// Copyright 2017, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//

//`begin_keywords "1800-2012" // use SystemVerilog-2012 keywords
module add_type
 #(parameter type DTYPE = logic [0:0]) // default is 1-bit
  (input  DTYPE  a, b,
   output DTYPE  sum
  );
  timeunit 1ns; timeprecision 1ns;

  assign sum = a + b;
endmodule: add_type
//`end_keywords
