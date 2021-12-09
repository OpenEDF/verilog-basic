//
// Book, "RTL Modeling with SystemVerilog for Simulation and Synthesis"
// by Stuart Sutherland, published by Sutherland HDL, Inc.
//
// Explicit references to package items.
//
// Copyright 2017, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//

//`begin_keywords "1800-2012" // use SystemVerilog-2012 keywords
module alu
 import definitions_pkg::*; // wildcard import
(input  instruction_t  iw,
 input  logic          clk,
 output word_t         result
);

  always_comb begin 
    case (iw.opcode_e)
      ADD : result = iw.a + iw.b;
      SUB : result = iw.a - iw.b;
      MULT: result = multiplier(iw.a, iw.b);
      DIV2: result = iw.a >> 1;
    endcase 
  end 
endmodule: alu
//`end_keywords
