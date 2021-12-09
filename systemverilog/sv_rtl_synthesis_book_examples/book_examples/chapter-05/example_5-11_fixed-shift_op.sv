//
// Book, "RTL Modeling with SystemVerilog for ASIC and FPGA Design"
// by Stuart Sutherland
//
// Using the shift operator to perform a divide-by-two
// operation.
//
// Copyright 2016, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//


//
// Divide-by-two operation by shifting an N-bit bus right by
// one bit. Fractional results are always rounded down.
//
`begin_keywords "1800-2012" // use SystemVerilog-2012 keywords
module divide_by_two
#(parameter N = 8)
(input  logic [N-1:0] data_in,  // N-bit input
 output logic [N-1:0] data_out  // N-bit output
);
  timeunit 1ns/1ns;

  assign data_out = data_in >> 1;   // shift right one bit

endmodule: divide_by_two
`end_keywords
