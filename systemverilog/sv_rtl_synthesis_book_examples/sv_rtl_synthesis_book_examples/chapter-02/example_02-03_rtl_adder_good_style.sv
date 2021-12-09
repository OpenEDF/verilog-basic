//
// Book, "RTL Modeling with SystemVerilog for Simulation and Synthesis"
// by Stuart Sutherland, published by Sutherland HDL, Inc.
//
// RTL model of a 32-bit adder with good use of white space
//
// Copyright 2017, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//
module rtl_adder_good_style
( input  logic [31:0] a, b,
  output logic [31:0] sum,
  output logic        co
);
  timeunit 1ns; timeprecision 1ns;

  always_comb begin
    {co, sum} = a + b;
  end 

endmodule: rtl_adder_good_style
