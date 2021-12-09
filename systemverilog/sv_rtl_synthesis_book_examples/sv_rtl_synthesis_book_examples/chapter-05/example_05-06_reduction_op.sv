//
// Book, "RTL Modeling with SystemVerilog for Simulation and Synthesis"
// by Stuart Sutherland, published by Sutherland HDL, Inc.
//
// Parity checker using even parity, registered error flag
//
// Copyright 2017, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//

//`begin_keywords "1800-2012" // use SystemVerilog-2012 keywords

// User-defined type definitions
package definitions_pkg;
  typedef struct {
    logic [3:0] data;
    logic       parity_bit;
  } data_t;
endpackage: definitions_pkg

// Parity checker using even parity, registered error flag.
// The combined data value plus parity bit should always have
// an even number of bits set to 1
module parity_checker
 import definitions_pkg::*;
(input  data_t data_in,  // 5-bit structure input
 input  clk,             // clk input
 input  rstN,            // active-low asynchronous reset
 output logic  error     // set if parity error detected
);
  timeunit 1ns; timeprecision 1ns;

  always_ff @(posedge clk or negedge rstN) // async reset
    if (!rstN) error <= 0;                 // active-low reset
    else       error <= ^{data_in.parity_bit, data_in.data};
      // reduction-XOR returns 1 if an odd number of bits are
      // set in the combined data and parity_bit
endmodule: parity_checker
//`end_keywords
