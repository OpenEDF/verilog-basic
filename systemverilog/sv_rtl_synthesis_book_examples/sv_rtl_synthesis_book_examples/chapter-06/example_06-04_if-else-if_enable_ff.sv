//
// Book, "RTL Modeling with SystemVerilog for Simulation and Synthesis"
// by Stuart Sutherland, published by Sutherland HDL, Inc.
//
// Chip-enable flip-flop modeled with a series of
// if-else-if statements.
//
// Copyright 2017, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//

//`begin_keywords "1800-2012" // use SystemVerilog-2012 keywords

module enable_ff
#(parameter N = 1)            // bus size
(input  logic         clk,    // posedge triggered clk
 input  logic         rstN,   // active low async reset
 input  logic         enable, // active high chip enable
 input  logic [N-1:0] d,      // scalable input size
 output logic [N-1:0] q       // scalable output size
);
  timeunit 1ns; timeprecision 1ns;

  always_ff @(posedge clk or negedge rstN) // async reset
    if      (!rstN)  q <= '0;              // active-low reset
    else if (enable) q <= d;               // store if enabled

endmodule: enable_ff
//`end_keywords
