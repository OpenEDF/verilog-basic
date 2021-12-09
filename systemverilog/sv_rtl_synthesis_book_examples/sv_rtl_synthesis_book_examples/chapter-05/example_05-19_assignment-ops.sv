//
// Book, "RTL Modeling with SystemVerilog for Simulation and Synthesis"
// by Stuart Sutherland, published by Sutherland HDL, Inc.
//
// Using assignment operators.
//
// Copyright 2017, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//


//
// Using assignment operators for a simple Bitwise Logic Unit.
//

//`begin_keywords "1800-2012" // use SystemVerilog-2012 keywords
package bitwise_types_pkg;
  timeunit 1ns; timeprecision 1ns;

  typedef enum logic [1:0] {AND_OP, OR_OP, XOR_OP, RS1_OP} op_t;
endpackage: bitwise_types_pkg
//`end_keywords

//`begin_keywords "1800-2012" // use SystemVerilog-2012 keywords
module bitwise_unit
//import bitwise_types_pkg::*;
#(parameter N = 8)
(input  logic [N-1:0]           a, b,
 input  bitwise_types_pkg::op_t opcode,
 output logic [N-1:0]           result
);
  timeunit 1ns; timeprecision 1ns;
  import bitwise_types_pkg::*;

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
//`end_keywords
