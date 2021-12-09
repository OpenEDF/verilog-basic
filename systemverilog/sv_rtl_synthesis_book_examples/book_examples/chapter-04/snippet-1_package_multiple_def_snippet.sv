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
// Multiple packages with duplicate identifier names
//
package cpu_pkg;
  typedef logic [31:0] word32_t;
  typedef enum logic [1:0] {ADD, SUB, MULT} opcodes_t;

  typedef struct {
    word32_t  a, b;
    opcodes_t opcode;
  } instruction_t;
 endpackage: cpu_pkg

package gpu_pkg;
  typedef enum logic [1:0] {MUL,DIV,SHIFTL,SHIFTR} op_t;
  typedef enum logic {FIXED,FLOAT} operand_type_t;

  typedef struct {
    op_t           opcode;
    operand_type_t op_type;
    logic [63:0]   op_a;
    logic [63:0]   op_b;
  } instruction_t;
endpackage: gpu_pkg

module processor (/*...*/);
  //...
  import cpu_pkg::*;
  import gpu_pkg::*;
  import cpu_pkg::instruction_t;
  instruction_t instruction;
  //...

  initial begin
  	$display("\n*** No simulation results expected. ***");
  	$display("*** Only checking that module compiles. ***\n");
  end
endmodule: processor
`end_keywords
