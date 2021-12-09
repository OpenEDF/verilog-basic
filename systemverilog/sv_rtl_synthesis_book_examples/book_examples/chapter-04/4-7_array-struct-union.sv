//
// Book, "RTL Modeling with SystemVerilog for ASIC and FPGA Design"
// by Stuart Sutherland
//
// Instruction register using packages, structures and unions.
//
// Copyright 2016, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//

`begin_keywords "1800-2012" // use SystemVerilog-2012 keywords
package definitions_pkg;
  typedef enum logic [3:0] {ADD, SUB, MULT, DIV, SL, SR} op_t;

  typedef enum logic {UNSIGNED, SIGNED} operand_type_t;

  typedef union packed {
    logic        [31:0] u_data;
    logic signed [31:0] s_data;
  } data_t;
  
  typedef struct packed {
    op_t            opcode;
    operand_type_t  op_type;
    data_t          op_a;
    data_t          op_b;
  } instruction_t;

  typedef logic [4:0] address_t;
endpackage: definitions_pkg
`end_keywords


`begin_keywords "1800-2012" // use SystemVerilog-2012 keywords
module instruction_register
 import definitions_pkg::*;   // wildcard import the package
(input  clk, rstN, load_en,
 input  data_t         op_a,
 input  data_t         op_b,
 input  operand_type_t op_type,
 input  op_t           opcode,
 input  address_t      write_pointer,
 input  address_t      read_pointer,
 output instruction_t  iw
);
  timeunit 1ns/1ns;

  instruction_t  iw_reg [0:31];  // array of structures

  // write to the register array
  always_ff @(posedge clk, negedge rstN)
    if (!rstN) begin
      foreach (iw_reg[i])
        iw_reg[i] = '{opcode:ADD,default:0}; // reset
    end
    else if (load_en) begin
      case (op_type)
        SIGNED:   iw_reg[write_pointer] = '{opcode,op_type,op_a.s_data,op_b.s_data};
        UNSIGNED: iw_reg[write_pointer] = '{opcode,op_type,op_a.u_data,op_b.u_data};
      endcase
    end
  // read from the register array
  assign iw = iw_reg[read_pointer];

endmodule: instruction_register
`end_keywords
