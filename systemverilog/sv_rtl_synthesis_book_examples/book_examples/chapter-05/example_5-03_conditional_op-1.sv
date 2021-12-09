//
// Book, "RTL Modeling with SystemVerilog for ASIC and FPGA Design"
// by Stuart Sutherland
//
// 4-bit register with multiplexed D input, using conditional
// operator.
//
// Copyright 2016, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//


//
// 4-bit register with multiplexed D input, using conditional
// operator.
//
`begin_keywords "1800-2012" // use SystemVerilog-2012 keywords
module muxed_register
#(parameter WIDTH = 4)                 // register size
(input  logic             clk,         // 1-bit input
 input  logic             data_select, // 1-bit input
 input  logic [WIDTH-1:0] d1, d2,      // scalable input size
 output logic [WIDTH-1:0] q_out        // scalable output size
);
  timeunit 1ns/1ns;

  always_ff @(posedge clk)
    q_out <= data_select? d1 : d2;     // store d1 or d2

endmodule: muxed_register
`end_keywords
