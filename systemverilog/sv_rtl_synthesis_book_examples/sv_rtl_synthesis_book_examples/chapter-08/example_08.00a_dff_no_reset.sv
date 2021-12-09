//
// Book, "RTL Modeling with SystemVerilog for Simulation and Synthesis"
// by Stuart Sutherland, published by Sutherland HDL, Inc.
//
// N-bit wide flip-flop with no reset input.
//
// Copyright 2017, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//

//`begin_keywords "1800-2012" // use SystemVerilog-2012 keywords
module ff_no_reset
#(parameter N=1)            // scalable bus size 
(output logic [N-1:0] q,
 input  logic [N-1:0] d,
 input  logic         clk
);
  timeunit 1ns; timeprecision 1ns;

  always_ff @(posedge clk)
    q <= d;

endmodule: ff_no_reset
//`end_keywords
