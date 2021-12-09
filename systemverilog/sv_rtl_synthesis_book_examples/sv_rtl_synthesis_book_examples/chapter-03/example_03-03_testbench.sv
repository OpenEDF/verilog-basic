//
// Book, "RTL Modeling with SystemVerilog for Simulation and Synthesis"
// by Stuart Sutherland, published by Sutherland HDL, Inc.
//
// Testbench
//
// Copyright 2017, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//
//`begin_keywords "1800-2012"
module test
(output logic signed [31:0] a, b,     // ALU operand inputs
 output logic        [ 3:0] opcode,   // ALU operation code
 input  logic signed [31:0] result,   // Operation result
 input  logic               overflow, // Set if result overflowed
 input  logic               error     // Set if operation errored
);
  timeunit 1ns; timeprecision 1ns;

  initial begin
    $display();
    $display("input port a type is %s", $typename(top.dut.a));
    $display("input port b type is %s", $typename(top.dut.b));
    $display("input port opcode type is %s", $typename(top.dut.opcode));
    $display();
    $display("output port result type is %s", $typename(top.dut.result));
    $display("output port overflow type is %s", $typename(top.dut.overflow));
    $display("output port error type is %s", $typename(top.dut.error));
    $display();
    #10 $finish;
  end
endmodule: test

module top;
  timeunit 1ns; timeprecision 1ns;

  logic [31:0] a, b, result;
  logic [ 3:0] opcode;
  logic        overflow, error;

  logic        clk;

  test test (.*);
  alu  dut  (.*);

  initial begin
    clk <= 0;
    forever #5 clk = ~clk;
  end
endmodule: top
//`end_keywords


