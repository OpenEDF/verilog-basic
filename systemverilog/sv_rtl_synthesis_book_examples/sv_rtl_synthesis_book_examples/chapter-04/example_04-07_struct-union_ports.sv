//
// Book, "RTL Modeling with SystemVerilog for Simulation and Synthesis"
// by Stuart Sutherland, published by Sutherland HDL, Inc.
//
// Using packed unions -- dual typed ALU.
//
// Copyright 2017, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//

//
// Package with union and structure definitions
//
`begin_keywords "1800-2012" // use SystemVerilog-2012 keywords
`define _4bit        // use 4-bit data for testing synthesis
//`define _32bit     // use 32-bit data word size
//`define _64bit     // use 64-bit data word size
package definitions_pkg;
  `ifdef _4bit
    typedef logic        [ 3:0] uword_t;
    typedef logic signed [ 3:0] sword_t;
  `elsif _64bit
    typedef logic        [63:0] uword_t;
    typedef logic signed [63:0] sword_t;
  `else  // default is 32-bit vectors 
    typedef logic        [31:0] uword_t;
    typedef logic signed [31:0] sword_t;
  `endif 
  
  typedef enum logic [2:0] {ADD, SUB, MULT, DIV} op_t;
  typedef enum logic {UNSIGNED, SIGNED} operand_type_t;

  // Packed union represents a variable that can store 
  // different types
  typedef union packed {
    uword_t u_data;
    sword_t s_data;
  } data_t;
  
  // Packed structure represents a collection of variables 
  // that can referenced and passed through ports as a group
  typedef struct packed {
    op_t            opcode;
    operand_type_t  op_type;
    data_t          op_a;
    data_t          op_b;
  } instruction_t;
endpackage: definitions_pkg
//`end_keywords 


//
// Module with structure input port and union output port
//
//`begin_keywords "1800-2012" // use SystemVerilog-2012 keywords
module alu 
 import definitions_pkg::*;   // wildcard import the package
(input  logic         clk, rstN,
 input  instruction_t iw,         // input is a structure
 output data_t        alu_out     // output is a union
);
  timeunit 1ns; timeprecision 1ns;

  always_ff @(posedge clk or negedge rstN) // async reset
    if (!rstN)                             // active-low
      alu_out <= '0;
    else begin: alu_operations 
      if (iw.op_type == SIGNED) begin: signed_ops 
        case (iw.opcode)
          ADD : alu_out.s_data <= iw.op_a.s_data
                                  + iw.op_b.s_data;
          SUB : alu_out.s_data <= iw.op_a.s_data
                                  - iw.op_b.s_data;
          MULT: alu_out.s_data <= iw.op_a.s_data
                                  * iw.op_b.s_data;
          DIV : alu_out.s_data <= iw.op_a.s_data
                                  / iw.op_b.s_data;
        endcase 
      end: signed_ops 
      else begin: unsigned_ops 
        case (iw.opcode)
          ADD : alu_out.u_data <= iw.op_a.u_data
                                  + iw.op_b.u_data;
          SUB : alu_out.u_data <= iw.op_a.u_data
                                  - iw.op_b.u_data;
          MULT: alu_out.u_data <= iw.op_a.u_data
                                  * iw.op_b.u_data;
          DIV : alu_out.u_data <= iw.op_a.u_data
                                  / iw.op_b.u_data;
        endcase 
      end: unsigned_ops 
    end: alu_operations 
endmodule: alu
`end_keywords 