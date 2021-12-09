//
// Book, "RTL Modeling with SystemVerilog for Simulation and Synthesis"
// by Stuart Sutherland, published by Sutherland HDL, Inc.
//
// Set/reset flip-flop modeled with a series of if-else-if statements.
//
// Copyright 2017, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//

//`begin_keywords "1800-2012" // use SystemVerilog-2012 keywords
module srff
#(parameter N = 1)                      // bus size
(input  logic          clk, rstN, setN, // 1-bit inputs
 input  logic [N-1:0] d,                // scalable input size
 output logic [N-1:0] q                 // scalable output size
);
  timeunit 1ns; timeprecision 1ns;

  always_ff @(    posedge clk 
               or negedge rstN
               or negedge setN
  // synthesis translate_off
               or posedge (rstN & ~setN) // not synthesizable
  // synthesis translate_on
             )

    if      (!rstN) q <= '0;  // reset (active low)
    else if (!setN) q <= '1;  // set (active low)
    else            q <= d;   // clock   

endmodule: srff
//`end_keywords
