//
// Book, "RTL Modeling with SystemVerilog for Simulation and Synthesis"
// by Stuart Sutherland, published by Sutherland HDL, Inc.
//
// RTL model of a 32-bit adder/subtractor
//
// Copyright 2017, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//
//`begin_keywords "1800-2012"
module rtl_adder_subtractor
(input  logic        clk,   // 1-bit scalar input
 input  logic        mode,  // 1-bit scalar input
 input  logic [31:0] a, b,  // 32-bit vector inputs
 output logic [31:0] sum    // 32-bit vector output
);
  timeunit 1ns; timeprecision 1ns;

  always_ff @(posedge clk)  
    if (mode == 0) sum <= a + b;
    else           sum <= a - b;

endmodule: rtl_adder_subtractor
//`end_keywords
