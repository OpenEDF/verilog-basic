//
// Book, "RTL Modeling with SystemVerilog for ASIC and FPGA Design"
// by Stuart Sutherland
//
// Package snippets.
//
// Copyright 2016, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//

`begin_keywords "1800-2012"

//
// Multiple packages with package chaining
//
package base_types;
  typedef logic [31:0] word32_t;
  typedef logic [63:0] word64_t;
endpackage: base_types

package alu_types;
  import base_types::*; // wildcard import another package
  export base_types::*; // export (chain) the imported items  
  typedef enum logic [1:0] {ADD, SUB, MULT, DIV} opcodes_t;
  
  typedef struct {
    word64_t  a, b;
    opcodes_t opcode;
  } instr_t;
endpackage: alu_types

module alu
 import alu_types::*;
(input  instr_t  instruction,  // OK: instr_t was imported
 output word64_t result  // ERROR: word64_t was not imported
);
  //...

  initial begin
  	$display("\n*** No simulation results expected. ***");
  	$display("*** Only checking that module compiles. ***\n");
  end
endmodule: alu

`end_keywords
