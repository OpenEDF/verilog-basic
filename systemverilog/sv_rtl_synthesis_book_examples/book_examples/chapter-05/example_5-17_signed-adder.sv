//
// Book, "RTL Modeling with SystemVerilog for ASIC and FPGA Design"
// by Stuart Sutherland
//
// Using arithmetic operators with signed data types.
//
// Copyright 2016, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//


//
// Simple adder with signed data types.
//
`begin_keywords "1800-2012" // use SystemVerilog-2012 keywords
module signed_adder
#(parameter N = 8)
(input  logic signed [N-1:0]  a, b,   // N-bit signed inputs
 output logic signed [N-1:0]  sum     // N-bit signed output
);
  timeunit 1ns/1ns;

  assign sum = a + b;                 // adder with no carry

endmodule: signed_adder
`end_keywords
