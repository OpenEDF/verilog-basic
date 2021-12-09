//
// Book, "RTL Modeling with SystemVerilog for ASIC and FPGA Design"
// by Stuart Sutherland
//
// 4-bit adder with tri-state outputs, using conditional operator
// (no carry).
//
// Copyright 2016, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//


//
// 4-bit adder with tri-state outputs, using conditional operator
// (no carry).
//
`begin_keywords "1800-2012" // use SystemVerilog-2012 keywords
module tri_state_adder
#(parameter N = 4)                // N-bit adder size
(input  logic             enable, // output enable
 input  logic     [N-1:0] a, b,   // scalable input size
 output tri logic [N-1:0] out     // tri-state output, net type
);
  timeunit 1ns/1ns;

//  logic [N-1:0] sum;    // internal variable, scalable size
//
//  always_comb begin
//    sum = a + b;
//  end
//
//  assign out = enable? sum : 'z;  // tri-state buffer

  assign out = enable? (a + b) : 'z;  // tri-state buffer

endmodule: tri_state_adder
`end_keywords
