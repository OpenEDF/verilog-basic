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
(output logic [31:0] a, b,
 output logic        mode,
 input  logic [31:0] sum,
 input  logic        clk
);
  timeunit 1ns; timeprecision 1ns;

  initial begin
    a = 10;
    b = 5;
    mode = 0;      // add: expect sum = 15
    repeat (2) @(negedge clk) ;
    mode = 1;      // subtract: expect sum = 5
    repeat (2) @(negedge clk) ;
    $finish;
  end

  initial begin
    $timeformat(-9,0," ns",10);
    $monitor("At %t: \t a=%0d  b=%0d  mode=%b  sum=%0d",
             $realtime, a, b, mode, sum);
  end
endmodule: test
//`end_keywords

//`begin_keywords "1800-2012"
module top;
  timeunit 1ns; timeprecision 1ns;

  logic [31:0] a, b;
  logic        mode;
  logic [31:0] sum;
  logic        clk;

  test                 test (.*);
  rtl_adder_subtractor dut  (.*);

  initial begin
    clk <= 0;
    forever #5 clk = ~clk;
  end
endmodule: top
//`end_keywords
