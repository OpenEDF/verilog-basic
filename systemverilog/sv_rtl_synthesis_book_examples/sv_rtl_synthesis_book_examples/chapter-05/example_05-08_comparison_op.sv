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
// Set lt, eq and gt flags based on if a is less-than, equal-to
// or greater-than b, respectively
//
//`begin_keywords "1800-2012" // use SystemVerilog-2012 keywords
module comparator
#(parameter N = 8)            // data size (default 8-bits)
(input  logic         clk,    // clk input
 input  logic         rstN,   // active-low async reset
 input  logic [N-1:0] a, b,   // scalable input size
 output logic         lt,     // set if a is less than b
 output logic         eq,     // set if a is equal to b
 output logic         gt      // set if a is greater than b
);
  timeunit 1ns; timeprecision 1ns;

  always_ff @(posedge clk or negedge rstN) // async reset
    if (!rstN) {lt,eq,gt} <= '0;  // reset flags
    else begin
      lt <= (a < b);     // less-than operator
      eq <= (a == b);    // equality operator
      gt <= (a > b);     // greater-than operator
    end
endmodule: comparator
//`end_keywords
