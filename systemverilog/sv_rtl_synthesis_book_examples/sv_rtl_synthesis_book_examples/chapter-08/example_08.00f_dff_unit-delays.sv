//
// Book, "RTL Modeling with SystemVerilog for Simulation and Synthesis"
// by Stuart Sutherland, published by Sutherland HDL, Inc.
//
// N-bit wide flip-flop with unit delays.
//
// Copyright 2017, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//

//`begin_keywords "1800-2012" // use SystemVerilog-2012 keywords
module reg32
(output logic [31:0] q,
 input  logic [31:0] d,
 input  logic        clk, rstN
);
  timeunit 1ns; timeprecision 1ns;

  always_ff @(posedge clk or negedge rstN)
    if (!rstN) q <= #1 '0;  // 1ns intra-assignment delay
    else       q <= #1 d;   // 1ns intra-assignment delay

endmodule: reg32
//`end_keywords
