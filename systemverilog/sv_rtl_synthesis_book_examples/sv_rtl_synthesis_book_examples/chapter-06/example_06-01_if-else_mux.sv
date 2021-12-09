//
// Book, "RTL Modeling with SystemVerilog for Simulation and Synthesis"
// by Stuart Sutherland, published by Sutherland HDL, Inc.
//
// N-bit 2:1 multiplexor modeled with an if-else statement.
//
// Copyright 2017, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//

//`begin_keywords "1800-2012" // use SystemVerilog-2012 keywords
module mux2to1
#(parameter N = 4)            // bus size
(input  logic         sel,    // 1-bit input
 input  logic [N-1:0] a, b,   // scalable input size
 output logic [N-1:0] y       // scalable output size
);
  timeunit 1ns; timeprecision 1ns;

  always_comb begin
    if (sel) y = a; 
    else     y = b;
  end

endmodule: mux2to1
//`end_keywords
