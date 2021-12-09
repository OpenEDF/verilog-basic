/**********************************************************************
 * Using arrays, structures and unions
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
  logic [31:0]      u_data;
  bit signed [31:0] s_data;
} data_t;

typedef struct packed {
  opcode_t        opc;
  operand_type_t  op_type;
  data_t          op_a;
  data_t          op_b;
} instr_t;


module instruction_register (
  output instr_t  [0:31] instr_reg, // packed array of structures
  input  data_t          operand_a,
  input  data_t          operand_b,
  input  operand_type_t  op_type,
  input  opcode_t        opcode,
  input  logic [4:0]     write_pointer
);

/***********************************************************************
 * Write values onto the instruction register
 **********************************************************************/
  always@(write_pointer)
    begin
      instr_reg[write_pointer].op_type = op_type;
      instr_reg[write_pointer].opc     = opcode;

      // use the op_type to determine the operand data type stored
      // in the input operand union
      if (op_type == SIGNED) begin
        instr_reg[write_pointer].op_a.s_data = operand_a.s_data;
        instr_reg[write_pointer].op_b.s_data = operand_b.s_data;
      end
      else begin
        instr_reg[write_pointer].op_a.u_data = operand_a.u_data;
        instr_reg[write_pointer].op_b.u_data = operand_b.u_data;
      end
    end

endmodule

module test;

  initial begin
    $display("\nNo simulation results expected--only testing that code compiles\n");
    $finish;
  end

endmodule
