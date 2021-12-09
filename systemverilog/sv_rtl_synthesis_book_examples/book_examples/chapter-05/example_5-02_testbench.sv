//
// Book, "RTL Modeling with SystemVerilog for ASIC and FPGA Design"
// by Stuart Sutherland
//
// Testbench
//
// Copyright 2016, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//
`begin_keywords "1800-2012"
module test
(output logic  a, b, ci,
 input  logic  sum, co);
  timeunit 1ns/1ns;

  initial begin
    a = 0;
    b = 0;
    ci = 0;
    #1 $display("a=%b  b=%b  ci=%b  sum=%b  co=%b: expect sum=0, co=0", a, b, ci, sum, co);
    #1 a = 1;
    #1 $display("a=%b  b=%b  ci=%b  sum=%b  co=%b: expect sum=1, co=0", a, b, ci, sum, co);
    #1 b = 1;
    #1 $display("a=%b  b=%b  ci=%b  sum=%b  co=%b: expect sum=0, co=1", a, b, ci, sum, co);
    #1 ci = 1;
    #1 $display("a=%b  b=%b  ci=%b  sum=%b  co=%b: expect sum=1, co=1", a, b, ci, sum, co);
    #1 $finish;
  end
endmodule: test
`end_keywords

`begin_keywords "1800-2012"
module top;
  timeunit 1ns/1ns;

  logic  a, b, ci, sum, co;

  test      test (.*);
  rtl_adder dut  (.*);
endmodule: top
`end_keywords


