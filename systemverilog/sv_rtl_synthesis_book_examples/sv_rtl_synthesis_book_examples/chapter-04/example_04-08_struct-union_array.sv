//
// Book, "RTL Modeling with SystemVerilog for Simulation and Synthesis"
// by Stuart Sutherland, published by Sutherland HDL, Inc.
//
// Instruction register using packages, structures and unions.
//
// Copyright 2017, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//

//
// Package with union and structure definitions
//
//`begin_keywords "1800-2012" // use SystemVerilog-2012 keywords
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


//`begin_keywords "1800-2012" // use SystemVerilog-2012 keywords
module instruction_register
 import definitions_pkg::*;   // wildcard import the package
(input  logic          clk, rstN, load_en,
 input  data_t         op_a,
 input  data_t         op_b,
 input  operand_type_t op_type,
 input  op_t           opcode,
 input  logic [4:0]    write_pointer,
 input  logic [4:0]    read_pointer,
 output instruction_t  iw
);
  timeunit 1ns; timeprecision 1ns;

  instruction_t  iw_reg [0:31];  // array of structures

  // write to the register array
  always_ff @(posedge clk or negedge rstN) // async reset
    if (!rstN) begin                       // active-low reset
      foreach (iw_reg[i])
        iw_reg[i] <= '{opcode:ADD,default:0}; // reset values
    end 
    else if (load_en) begin 
      case (op_type)
        SIGNED:   iw_reg[write_pointer] <= 
                    '{opcode,op_type,op_a.s_data,op_b.s_data};
        UNSIGNED: iw_reg[write_pointer] <=
                    '{opcode,op_type,op_a.u_data,op_b.u_data};
      endcase 
    end 
  // read from the register array
  assign iw = iw_reg[read_pointer];

endmodule: instruction_register
//`end_keywords 
