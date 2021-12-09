//
// Book, "RTL Modeling with SystemVerilog for Simulation and Synthesis"
// by Stuart Sutherland, published by Sutherland HDL, Inc.
//
// Set in-range flag if either d1 or d2 are within a configurable
// MIN/MAX range of values
//
// Copyright 2017, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//

//`begin_keywords "1800-2012" // use SystemVerilog-2012 keywords
module status_flag
#(parameter           N   = 4,   // data bus size
        logic [N-1:0] MIN = 'h7, // minimum must-have value
        logic [N-1:0] MAX = 'hC  // maximum must-have value
)
(input  logic         clk,       // clk input
 input  logic         rstN,      // active-low async reset
 input  logic [N-1:0] d1, d2,    // scalable input size
 output logic         in_range   // set if either d1 or d2 
);                               // is within MIN/MAX reange
  timeunit 1ns; timeprecision 1ns;

  always_ff @(posedge clk or negedge rstN) // async reset
    if (!rstN) in_range <= '0;             // active-low reset
    else       in_range <= (   ((d1 >= MIN) && (d1 <= MAX))
                            || ((d2 >= MIN) && (d2 <= MAX))
                           );

endmodule: status_flag
//`end_keywords


