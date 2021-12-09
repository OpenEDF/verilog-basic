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
