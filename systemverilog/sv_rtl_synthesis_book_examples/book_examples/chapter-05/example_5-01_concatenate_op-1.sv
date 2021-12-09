//
// Book, "RTL Modeling with SystemVerilog for ASIC and FPGA Design"
// by Stuart Sutherland
//
// 8-bit register that is loaded with a concatenation of discrete inputs.
//
// Copyright 2016, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//

//
// 8-bit status register that stores multiple input values
//
// -----------------------------------------------------------
// | int_en | unused | unused | zero | carry | neg | parity  |
// -----------------------------------------------------------
// NOTE: not-used bits are set to a constant 1
//
//`begin_keywords "1800-2012" // use SystemVerilog-2012 keywords
module status_reg
(input  logic       clk,     // register clock
 input  logic       rstN,    // active-low reset
 input  logic       int_en,  // 1-bit interrupt enable
 input  logic       zero,    // 1-bit result = 0 flag
 input  logic       carry,   // 1-bit result overflow flag
 input  logic       neg,     // 1-bit negative result flag
 input  logic [1:0] parity,  // 2-bit parity bits
 output logic [7:0] status   // 8-bit status register output
);
  timeunit 1ns/1ns;

  always_ff @(posedge clk, negedge rstN)
    if (!rstN)
      status <= {1'b0,2'b11,5'b0};   // reset
    else
      status <= {int_en,2'b11,zero,carry,neg,parity}; // load

endmodule: status_reg
//`end_keywords
