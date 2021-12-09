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
(output logic  a, b, ci,
 input  logic  sum, co);
  timeunit 1ns; timeprecision 1ns;

  initial begin
    a = 0;
    b = 0;              //              sum   co
    ci = 0;             // should get:   0     0
    #10 a = 1;          // should get:   1     0
    #10 b = 1;          // should get:   0     1
    #10 ci = 1;         // should get:   1     1
    #10 $finish;
  end

  initial begin
    $timeformat(-9,2," ns",10);
    $monitor("At %t: \t a=%b  b=%b  ci=%b  sum=%b  co=%b",
             $realtime, a, b, ci, sum, co);
  end
endmodule: test
//`end_keywords

//`begin_keywords "1800-2012"
module top;
  timeunit 1ns; timeprecision 1ns;

  logic  a, b, ci, sum, co;

  test       test (.*);
  gate_adder dut  (.*);
endmodule: top
//`end_keywords


