//
// Book, "RTL Modeling with SystemVerilog for ASIC and FPGA Design"
// by Stuart Sutherland
//
// Port declarations snippets showing various port list styles.
//
// Copyright 2016, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//

`begin_keywords "1800-2012"

//
// Combined port list style (ANSI-style)
//
module alu_1
(input  wire logic signed [31:0] a,        // 32-bit input
 input  wire logic signed [31:0] b,        // 32-bit input
 input  wire logic        [ 3:0] opcode,   //  4-bit input
 output var  logic signed [31:0] result,   // 32-bit output
 output var  logic               overflow, //  1-bit output
 output var  logic               error     //  1-bit output
);
  /////////////////////////////////////////////
  //      model functionality not shown      //
  /////////////////////////////////////////////
endmodule: alu_1

//
// Combined port list style, combining ports of similar types
//
module alu_2
(input  wire logic signed [31:0] a, b,     // 32-bit inputs
 input  wire logic        [ 3:0] opcode,   //  4-bit input
 output var  logic signed [31:0] result,   // 32-bit output
 output var  logic               overflow, error // 1-bit
);
  /////////////////////////////////////////////
  //      model functionality not shown      //
  /////////////////////////////////////////////
endmodule: alu_2

//
// Legacy Verilog port list style (non-ANSI style port list)
//
module alu_3 (a, b, opcode, result, overflow, error);
  input  [31:0] a, b;            // 32-bit inputs
  input  [ 3:0] opcode;          //  4-bit input
  output [31:0] result;          // 32-bit output
  output        overflow, error; //  1-bit outputs

  wire logic signed [31:0] a, b;     // 32-bit net
  wire logic        [ 3:0] opcode;   //  4-bit net
  var  logic signed [31:0] result;   // 32-bit variable
  var  logic               overflow, error; // 1-bit vars
  /////////////////////////////////////////////
  //      model functionality not shown      //
  /////////////////////////////////////////////
endmodule: alu_3

//
// Legacy Verilog port list with combined direction and type
//
module alu_4 (a, b, opcode, result, overflow, error);
//  input  wire logic signed [31:0] a, b;     // 32-bit inputs  // Questa does not support "wire logic" in this context
//  input  wire logic        [ 3:0] opcode;   //  4-bit input   // Questa does not support "wire logic" in this context
  input  wire       signed [31:0] a, b;     // 32-bit inputs
  input  wire              [ 3:0] opcode;   //  4-bit input
  output var  logic signed [31:0] result;   // 32-bit output
  output var  logic               overflow, error; // 1-bit
  /////////////////////////////////////////////
  //      model functionality not shown      //
  /////////////////////////////////////////////
endmodule: alu_4

//
// Defaults for combined port list style (ANSI-style)
//
module alu_5                        // implicit defaults:
(wire logic signed [31:0] a, b,     // inout
 wire logic [3:0]         opcode,   // inout, unsigned
 output signed [31:0]     result,   // wire, logic
 output var               overflow, // logic, unsigned, 1-bit
 output bit               error     // var, unsigned, 1-bit
);
  /////////////////////////////////////////////
  //      model functionality not shown      //
  /////////////////////////////////////////////
endmodule: alu_5

//
// Sticky port characteristics for combined port list style (ANSI-style)
//
/***
Sticky port direction — An explicit port direction declaration remains in effect until a new direction is specified, even when the port type changes.
Sticky port type — An explicit port type declaration remains in effect until a new direction or type is specified.
Sticky port data type — An explicit port data type declaration remains in effect until a new direction or type or data type is specified.
Sticky port signing — An explicit port signing declaration remains in effect until a new direction or type or data type or size is specified.
Sticky port size — An explicit port size declaration remains in effect until a new direction or type or data type or size is specified.***/
module alu_6                               // inherited traits: 
(input  wire logic signed [31:0] a,
                                 b,          // all
        tri1 logic        [ 3:0] opcode,     // direction
 output                   [31:0] result,     // nothing
        var                      overflow,   // direction
                          [1:0]  error       // all except size
);
  /////////////////////////////////////////////
  //      model functionality not shown      //
  /////////////////////////////////////////////
endmodule: alu_6

`end_keywords
