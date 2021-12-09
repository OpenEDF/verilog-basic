//
// Book, "RTL Modeling with SystemVerilog for Simulation and Synthesis"
// by Stuart Sutherland, published by Sutherland HDL, Inc.
//
// SystemVerilog mixed RTL and gate-level model of a 1-bit adder,
// illustrating the use of `default_nettype for implicit nets.
//
// Copyright 2017, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//

//`begin_keywords "1800-2012" // use SystemVerilog-2012 keywords
module alu
(input  logic signed [31:0] a, b,     // ALU operand inputs
 input  logic        [ 3:0] opcode,   // ALU operation code
 output logic signed [31:0] result,   // Operation result
 output logic               overflow, // Set if result overflowed
 output logic               error     // Set if operation errored
);
  timeunit 1ns; timeprecision 100ps;
  /////////////////////////////////////////////
  //      model functionality not shown      //
  /////////////////////////////////////////////
endmodule: alu
//`end_keywords
