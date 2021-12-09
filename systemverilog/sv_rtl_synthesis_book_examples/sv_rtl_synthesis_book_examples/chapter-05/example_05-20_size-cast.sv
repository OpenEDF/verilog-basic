//
// Book, "RTL Modeling with SystemVerilog for Simulation and Synthesis"
// by Stuart Sutherland, published by Sutherland HDL, Inc.
//
// Using size casting.
//
// Copyright 2017, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//


//
// Rotate operation using size casting.
//
//`begin_keywords "1800-2012" // use SystemVerilog-2012 keywords
module rotate_right_n
#(parameter N = 8)
(input  logic [N-1:0]       in,      // N-bit input
 input  logic [$clog2(N):0] rfactor, // calculate max rotation size
 output logic [N-1:0]       out      // N-bit output
);
  timeunit 1ns; timeprecision 1ns;

  assign out = N'({in,in} >> rfactor);  // variable rotate right

endmodule: rotate_right_n
//`end_keywords
