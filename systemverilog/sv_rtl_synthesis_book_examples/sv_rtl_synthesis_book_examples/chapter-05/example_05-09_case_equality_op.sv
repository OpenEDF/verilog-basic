//
// Book, "RTL Modeling with SystemVerilog for Simulation and Synthesis"
// by Stuart Sutherland, published by Sutherland HDL, Inc.
//
// Comparator that sets high_addr flag if all bits of the upper byte
// of address is set
//
// Copyright 2017, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//

//
// Set high_addr flag if all bits of upper byte of address
// are set
//
//`begin_keywords "1800-2012" // use SystemVerilog-2012 keywords
module high_address_check
(input  logic        clk,       // clk input
 input  logic        rstN,      // active-low async reset
 input  logic [31:0] address,   // 32-bit input
 output logic        high_addr  // set high-byte all ones
);
  timeunit 1ns; timeprecision 1ns;

  always_ff @(posedge clk or negedge rstN) // async reset
    if (!rstN)                             // active-low reset
      high_addr <= '0;
    else
      high_addr <= (address ==? 32'hFF??????); // mask low bits
endmodule: high_address_check
//`end_keywords
