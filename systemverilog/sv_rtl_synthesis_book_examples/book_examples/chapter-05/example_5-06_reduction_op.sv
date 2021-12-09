//
// Book, "RTL Modeling with SystemVerilog for ASIC and FPGA Design"
// by Stuart Sutherland
//
// Parity checker using even parity, registered error flag
//
// Copyright 2016, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//

//
// User-defined type definitions
//
`begin_keywords "1800-2012" // use SystemVerilog-2012 keywords
package definitions_pkg;
  typedef struct {
    logic [7:0] data;
    logic       parity_bit;
  } data_t;
endpackage: definitions_pkg
`end_keywords


//
// Parity checker using even parity, registered error flag.
// The combined data value plus parity bit should always have
// an even number of bits set to 1
//
`begin_keywords "1800-2012" // use SystemVerilog-2012 keywords
module parity_checker
 import definitions_pkg::*;
(input  data_t data_in,  // 9-bit structure input
 input  clk,             // clock input
 input  rstN,            // active-low asynchronous reset
 output logic  error     // set if parity error detected
);
  timeunit 1ns/1ns;

  always_ff @(posedge clk, negedge rstN)
    if (!rstN) error <= 0;
    else       error <= ^{data_in.parity_bit, data_in.data};
      // reduction-XOR returns 1 if an odd number of bits are
      // set in the combined data and parity_bit
endmodule: parity_checker
`end_keywords
