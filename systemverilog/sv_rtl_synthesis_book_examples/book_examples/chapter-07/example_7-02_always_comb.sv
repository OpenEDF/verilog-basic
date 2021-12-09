//
// Book, "RTL Modeling with SystemVerilog for ASIC and FPGA Design"
// by Stuart Sutherland
//
// Using always_comb to model combinational logic.
//
// Copyright 2016, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//


//
// Using always_comb to model simple Arithmetic Logic Unit.
//

`begin_keywords "1800-2012" // use SystemVerilog-2012 keywords
package operation_types_pkg;
  timeunit 1ns/1ns;
  typedef enum logic [1:0] {ADD, SUB, MUL, DIV} op_t;
endpackage: operation_types_pkg
`end_keywords

`begin_keywords "1800-2012" // use SystemVerilog-2012 keywords
//import operation_types_pkg::*;  // WORKAROUND FOR BUG IN MENTOR PRECISION SYNTHESIS, v. 2015.1.6
module simple_alu
import operation_types_pkg::*;
#(parameter N = 4)
(input  logic [N-1:0] a, b,
 input  op_t          opcode,
 output logic [N-1:0] result
);
  timeunit 1ns/1ns;

  always_comb begin 
    case (opcode)
      ADD: result = a + b;
      SUB: result = a - b;
      MUL: result = a * b;
      DIV: result = a / b;
    endcase 
  end 
endmodule: simple_alu
`end_keywords
