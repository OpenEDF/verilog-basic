//
// Book, "RTL Modeling with SystemVerilog for ASIC and FPGA Design"
// by Stuart Sutherland
//
// RTL model of a 32-bit adder/subtracter
//
// Copyright 2016, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//
`begin_keywords "1800-2012"
module rtl_adder_subtracter
(input  logic        clock, // 1-bit scalar input
 input  logic        mode,  // 1-bit scalar input
 input  logic [31:0] a, b,  // 32-bit vector inputs
 output logic [31:0] sum    // 32-bit vector output
);
  timeunit 1ns/1ns;

  always_ff @(posedge clock) begin 
    if (mode == 0) sum <= a + b;
    else           sum <= a - b;
  end

endmodule: rtl_adder_subtracter
`end_keywords
