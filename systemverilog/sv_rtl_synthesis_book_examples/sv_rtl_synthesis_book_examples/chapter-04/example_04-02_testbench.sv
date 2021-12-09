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
 import definitions_pkg::*;
(output instruction_t  iw,
 input  logic          clk,
 input  word_t         result
);
  timeunit 1ns; timeprecision 1ns;
  initial begin
    $display();
    $display("port result type is %s", $typename(top.dut.result));
    $display();
  end

  initial begin
  	$display("\n*** No simulation results expected. ***");
  	$display("*** Only checking that module compiles. ***\n");
    $finish;
  end
endmodule: test

module top;
  timeunit 1ns; timeprecision 1ns;
  import definitions_pkg::*;
  instruction_t  iw;
  logic          clk;
  word_t         result;

  test test (.*);
  alu  dut  (.*);

  initial begin
    clk <= 0;
    forever #5 clk = ~clk;
  end
endmodule: top
//`end_keywords


