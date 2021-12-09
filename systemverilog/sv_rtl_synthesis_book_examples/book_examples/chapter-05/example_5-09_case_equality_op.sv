//
// Book, "RTL Modeling with SystemVerilog for ASIC and FPGA Design"
// by Stuart Sutherland
//
// Comparator that sets high_addr flag if all bits of the upper byte
// of address is set
//
// Copyright 2016, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//

//
// Set high_addr flag if all bits of upper byte of address
// are set
//
`begin_keywords "1800-2012" // use SystemVerilog-2012 keywords
module high_address_check
(input  logic        clk,       // clock input
 input  logic        rstN,      // active-low async reset
 input  logic [31:0] address,   // 32-bit input
 output logic        high_addr  // set high-byte all ones
);
  timeunit 1ns/1ns;

  always_ff @(posedge clk, negedge rstN)
    if (!rstN)
      high_addr <= '0;                         // reset
    else
      high_addr <= (address ==? 32'hFF??????); // mask low bits
endmodule: high_address_check
`end_keywords
