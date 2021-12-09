//
// Book, "RTL Modeling with SystemVerilog for Simulation and Synthesis"
// by Stuart Sutherland, published by Sutherland HDL, Inc.
//
// Using the concatenate and shift operators to perform a variable
// rotate operation.
//
// Copyright 2017, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//


//
// Rotate an input vector left the number of times specified
// by a rotation factor input.
//
//`begin_keywords "1800-2012" // use SystemVerilog-2012 keywords
module rotate_left_rfactor_times
#(parameter N = 8)
(input  logic [N-1:0]         data_in,   // N-bit input
 input  logic [$clog2(N)-1:0] rfactor,   // ceiling log2 of N
 output logic [N-1:0]         data_out   // N-bit output
);
  timeunit 1ns; timeprecision 1ns;
  logic [N*2-1:0] temp;

  assign temp = {data_in,data_in} << rfactor;  // rotate left
  assign data_out = temp[N*2-1:N];  // select left half of temp

endmodule: rotate_left_rfactor_times
//`end_keywords
