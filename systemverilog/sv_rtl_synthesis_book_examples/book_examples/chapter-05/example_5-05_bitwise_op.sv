//
// Book, "RTL Modeling with SystemVerilog for ASIC and FPGA Design"
// by Stuart Sutherland
//
// Multiplexed N-bit wide bitwise-AND or bitwise-XOR operation
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
  typedef enum logic {AND_OP, XOR_OP} mode_t;
endpackage: definitions_pkg
`end_keywords


//
// Multiplexed N-bit wide bitwise-AND or bitwise-XOR operation
//
`begin_keywords "1800-2012" // use SystemVerilog-2012 keywords
module and_xor
 import definitions_pkg::*;
#(parameter N = 4)            // op size (default 8-bits)
(input  mode_t        mode,   // 1-bit enumerated input
 input  logic [N-1:0] a, b,   // scalable input size
 output logic [N-1:0] result  // scalable output size
);
  timeunit 1ns/1ns;

  always_comb
    case (mode)
      AND_OP: result = a & b;
      XOR_OP: result = a ^ b;
    endcase

endmodule: and_xor
`end_keywords
