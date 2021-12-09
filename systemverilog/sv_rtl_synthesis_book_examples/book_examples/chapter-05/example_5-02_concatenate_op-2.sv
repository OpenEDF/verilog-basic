//
// Book, "RTL Modeling with SystemVerilog for ASIC and FPGA Design"
// by Stuart Sutherland
//
// RTL model of a 1-bit adder with carry, using a concatenation on
// the left-hand side of an assignment statement
//
// Copyright 2016, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//
`begin_keywords "1800-2012"
module rtl_adder
(input  logic a, b, ci,
 output logic sum, co
);
  timeunit 1ns/1ns;

  assign {co,sum} = a + b + ci;

endmodule: rtl_adder
`end_keywords
