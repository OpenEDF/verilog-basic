//
// Book, "RTL Modeling with SystemVerilog for Simulation and Synthesis"
// by Stuart Sutherland, published by Sutherland HDL, Inc.
//
// 4-bit Johnson counter correctly modeled with nonblocking assignments.
//
// Copyright 2017, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//

//`begin_keywords "1800-2012" // use SystemVerilog-2012 keywords
module jcounter
(output logic  [0:3] cnt,
 input  logic  clk, rstN
);
  timeunit 1ns; timeprecision 1ns;

  always_ff @(posedge clk)
    if (!rstN) cnt <= '0;  // synchronous active-low reset
    else begin             // shift the count
      cnt[0] <= ~cnt[3];
      cnt[1] <=  cnt[0];
      cnt[2] <=  cnt[1];
      cnt[3] <=  cnt[2];
    end 
endmodule: jcounter
//`end_keywords
