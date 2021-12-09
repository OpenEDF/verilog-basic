//
// Book, "RTL Modeling with SystemVerilog for Simulation and Synthesis"
// by Stuart Sutherland, published by Sutherland HDL, Inc.
//
// Comparator that sets flags based on if a is less-than, equal-to
// or greater-than b.
//
// Copyright 2017, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//

//
// Set lt, eq and gt flags based on if s is less-than, equal-to
// or greater-than u, respectively
//
//`begin_keywords "1800-2012" // use SystemVerilog-2012 keywords
module signed_comparator
#(parameter N = 8)                 // data size 
(input  logic                clk,  // clk input
 input  logic                rstN, // active-low async reset
 input  logic signed [N-1:0] s,    // scalable input size
 input  logic        [N-1:0] u,    // scalable input size
 output logic                lt,   // set if s less than u
 output logic                eq,   // set if s equal to u
 output logic                gt    // set if s greater than u
);
  timeunit 1ns; timeprecision 1ns;

  always_ff @(posedge clk, negedge rstN)
    if (!rstN) {lt,eq,gt} <= '0;  // reset flags
    else begin
      lt <= (s <  signed'(u));    // less-than operator
      eq <= (s == signed'(u));    // equality operator
      gt <= (s >  signed'(u));    // greater-than operator
    end
endmodule: signed_comparator
//`end_keywords
