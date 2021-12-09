//
// Book, "RTL Modeling with SystemVerilog for ASIC and FPGA Design"
// by Stuart Sutherland
//
// Using packed unions -- dual typed ALU.
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
  } instr_t;
endpackage: definitions_pkg
`end_keywords


`begin_keywords "1800-2012" // use SystemVerilog-2012 keywords
module alu 
 import definitions_pkg::*;   // wildcard import the package
(input  instr_t iw,
 output data_t  alu_out
);
  timeunit 1ns/1ns;

  always_comb begin 
    if (iw.op_type == SIGNED) begin 
      case (iw.opcode)
        ADD : alu_out.s_data = iw.op_a.s_data + iw.op_b.s_data;
        SUB : alu_out.s_data = iw.op_a.s_data - iw.op_b.s_data;
        MULT: alu_out.s_data = iw.op_a.s_data * iw.op_b.s_data;
        DIV : alu_out.s_data = iw.op_a.s_data / iw.op_b.s_data;
        SL  : alu_out.s_data = iw.op_a.s_data <<< 2;
        SR  : alu_out.s_data = iw.op_a.s_data >>> 2;
      endcase 
    end 
    else begin 
      case (iw.opcode)
        ADD : alu_out.u_data = iw.op_a.u_data + iw.op_b.u_data;
        SUB : alu_out.u_data = iw.op_a.u_data - iw.op_b.u_data;
        MULT: alu_out.u_data = iw.op_a.u_data * iw.op_b.u_data;
        DIV : alu_out.u_data = iw.op_a.u_data / iw.op_b.u_data;
        SL  : alu_out.u_data = iw.op_a.u_data << 2;
        SR  : alu_out.u_data = iw.op_a.u_data >> 2;
      endcase 
    end 
  end 
endmodule: alu
`end_keywords
