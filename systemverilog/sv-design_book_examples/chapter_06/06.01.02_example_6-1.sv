/**********************************************************************
 * Assignment operators
 *
 * Author: Don Mills, Stuart Sutherland
 *
 * (c) Copyright 2003, Sutherland HDL, Inc. *** ALL RIGHTS RESERVED ***
 * www.sutherland-hdl.com
 *
 * Used with permission in the book, "SystemVerilog for Design"
 *  By Stuart Sutherland, Simon Davidmann, and Peter Flake.
 *  Book copyright: 2003, Kluwer Academic Publishers, Norwell, MA, USA
 *  www.wkap.il, ISBN: 0-4020-7530-8
 *
 * Revision History:
 *   1.00 15 Dec 2003 -- original code, as included in book
 *   1.01 10 Jul 2004 -- cleaned up comments, added expected results
 *                       to output messages
 *
 * Caveat: Expected results displayed for this code example are based
 * on an interpretation of the SystemVerilog 3.1 standard by the code
 * author or authors.  At the time of writing, official SystemVerilog
 * validation suites were not available to validate the example.
 *
 * RIGHT TO USE: This code example, or any portion thereof, may be
 * used and distributed without restriction, provided that this entire
 * comment block is included with the example.
 *
 * DISCLAIMER: THIS CODE EXAMPLE IS PROVIDED "AS IS" WITHOUT WARRANTY
 * OF ANY KIND, EITHER EXPRESS OR IMPLIED, INCLUDING, BUT NOT LIMITED
 * TO WARRANTIES OF MERCHANTABILITY, FITNESS OR CORRECTNESS. IN NO
 * EVENT SHALL THE AUTHOR OR AUTHORS BE LIABLE FOR ANY DAMAGES,
 * INCLUDING INCIDENTAL OR CONSEQUENTIAL DAMAGES, ARISING OUT OF THE
 * USE OF THIS CODE.
 *********************************************************************/

typedef enum {ADD, SUB, MULT, DIV, SL, SR} opcode_t;

typedef enum {UNSIGNED, SIGNED} operand_type_t;

typedef union packed {
  logic [23:0]      u_data;
  bit signed [23:0] s_data;
} data_t;

typedef struct packed {
  opcode_t        opc;
  operand_type_t  op_type;
  data_t          op_a;
  data_t          op_b;
} instruction_t;

module alu (input  instruction_t instr, output data_t alu_out);

  always_comb begin
    if (instr.op_type == SIGNED) begin
      alu_out.s_data = instr.op_a.s_data;
      case (instr.opc)
        ADD    : alu_out.s_data +=   instr.op_b.s_data;
        SUB    : alu_out.s_data -=   instr.op_b.s_data;
        MULT   : alu_out.s_data *=   instr.op_b.s_data;
        DIV    : alu_out.s_data /=   instr.op_b.s_data;
        SL     : alu_out.s_data <<<= 2;
        SR     : alu_out.s_data >>>= 2;
      endcase
    end
    else begin
      alu_out.u_data = instr.op_a.u_data;
      case (instr.opc)
        ADD    : alu_out.u_data +=   instr.op_b.u_data;
        SUB    : alu_out.u_data -=   instr.op_b.u_data;
        MULT   : alu_out.u_data *=   instr.op_b.u_data;
        DIV    : alu_out.u_data /=   instr.op_b.u_data;
        SL     : alu_out.u_data <<=  2;
        SR     : alu_out.u_data >>=  2;
      endcase
    end
  end

endmodule

module test;

  data_t out;
  instruction_t instruction;

  alu alu (.instr(instruction), .alu_out(out));

  initial begin
    instruction.opc = DIV;
    instruction.op_type = SIGNED;
    instruction.op_a.s_data = -8;
    instruction.op_b.s_data = 2;
    #1 $display("\n op_a.s_data=%0d  op_b.s_data=%0d  out.s_data=%0d (expect -8, 2, -4)",
                 instruction.op_a.s_data, instruction.op_b.s_data, out.s_data);
    instruction.op_type = UNSIGNED;
    #1 $display("\n op_a.u_data=%0d  op_b.u_data=%0d  out.u_data=%0d (expect 16777208, 2, 8388604)\n",
                 instruction.op_a.u_data, instruction.op_b.u_data, out.u_data);
    $finish;
  end
endmodule
