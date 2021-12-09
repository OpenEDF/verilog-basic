//
// Book, "RTL Modeling with SystemVerilog for Simulation and Synthesis"
// by Stuart Sutherland, published by Sutherland HDL, Inc.
//
// N-bit latch modeled with an if statement.
//
// Copyright 2017, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//

//`begin_keywords "1800-2012" // use SystemVerilog-2012 keywords
module latch
#(parameter N = 4)          // bus size
(input  logic         ena,  // 1-bit input
 input  logic [N-1:0] in,   // scalable input size
 output logic [N-1:0] out   // scalable output size
);
  timeunit 1ns; timeprecision 1ns;

  always_latch begin
    if (ena) out <= in; 
  end

endmodule: latch
//`end_keywords
