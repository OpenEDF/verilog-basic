//
// Book, "RTL Modeling with SystemVerilog for Simulation and Synthesis"
// by Stuart Sutherland, published by Sutherland HDL, Inc.
//
// Definition of a shared declaration package.
//
// Copyright 2017, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//

//////////////////////////////////////////////////////////////
// NOTE: To change from the 16-bit default word size, either 
// comment out one of the following `define statements, or
// invoke simulation/synthesis with +define+_32_bit or
// +define+_64_bit.
//////////////////////////////////////////////////////////////
//`define _32bit
//`define _64bit

//`begin_keywords "1800-2012" // use SystemVerilog-2012 keywords
package definitions_pkg;
  timeunit 1ns; timeprecision 1ns;

  parameter VERSION = "1.1";

  `ifdef _64bit
    typedef logic [63:0] word_t;
  `elsif _32bit 
    typedef logic [31:0] word_t;
  `else // default is 16bit 
    typedef logic [15:0] word_t;
  `endif 
  
  typedef enum logic [1:0] {ADD, SUB, MULT, DIV2} opcodes_t;

  typedef struct {
    word_t       a, b;
    opcodes_t    opcode_e;
  } instruction_t;

  function automatic word_t multiplier (input word_t a, b);
    // code for a custom n-bit multiplier
  endfunction 
endpackage: definitions_pkg
//`end_keywords
