//
// Book, "RTL Modeling with SystemVerilog for ASIC and FPGA Design"
// by Stuart Sutherland
//
// Using assignment operators.
//
// Copyright 2016, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//


//
// Using assignment operators for a simple Bitwise Logic Unit.
//

`begin_keywords "1800-2012" // use SystemVerilog-2012 keywords
package bitwise_types;
  timeunit 1ns/1ns;

  typedef enum logic [1:0] {AND_OP, OR_OP, XOR_OP, RS1_OP} op_t;
endpackage: bitwise_types
`end_keywords

`begin_keywords "1800-2012" // use SystemVerilog-2012 keywords
module bitwise_unit
#(parameter N = 8)
(input  logic [N-1:0]  a, b,
 input  bitwise_types::op_t           opcode,
 output logic [N-1:0]  result
);
  timeunit 1ns/1ns;
  import bitwise_types::*;

  always_comb begin 
    result = a;    // transfer a input to result output
    case (opcode)  // modify result based on opcode
      AND_OP: result &= b;
      OR_OP : result |= b;
      XOR_OP: result ^= b;
      RS1_OP: result >>= 1;
    endcase 
  end 
endmodule: bitwise_unit
`end_keywords
