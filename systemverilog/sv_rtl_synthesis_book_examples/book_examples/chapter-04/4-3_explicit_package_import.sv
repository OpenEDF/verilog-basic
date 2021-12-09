//
// Book, "RTL Modeling with SystemVerilog for ASIC and FPGA Design"
// by Stuart Sutherland
//
// Explicit references to package items.
//
// Copyright 2016, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//

`begin_keywords "1800-2012" // use SystemVerilog-2012 keywords
module alu
 import definitions_pkg::instruction_t,
        definitions_pkg::word_t;
(input  instruction_t  iw,
 input  logic          clk,
 output word_t         result
);
  import definitions_pkg::ADD;
  import definitions_pkg::SUB;
  import definitions_pkg::MULT;
  import definitions_pkg::multiplier;

  always_comb begin 
    case (iw.opcode)
      ADD : result = iw.a + iw.b;
      SUB : result = iw.a - iw.b;
      MULT: result = multiplier(iw.a, iw.b);
    endcase 
  end 
endmodule: alu
`end_keywords
