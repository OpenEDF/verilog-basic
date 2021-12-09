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
(output logic a, b, ci,
 input  logic sum, co
);
  timeunit 1ns; timeprecision 1ns;

  initial begin
    $display();
    $display("port a type is %s", $typename(top.dut.a));
    $display("port b type is %s", $typename(top.dut.b));
    $display("port ci type is %s", $typename(top.dut.ci));
    $display("port sum type is %s", $typename(top.dut.sum));
    $display("port co type is %s", $typename(top.dut.co));
    $display();
    $display("internal n1 type is %s", $typename(top.dut.n1));
    $display("internal n2 type is %s", $typename(top.dut.n2));
    $display("internal n3 type is %s", $typename(top.dut.n3));
    $display();
  end

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

module top;
  timeunit 1ns; timeprecision 1ns;

  logic a,  b, ci, sum, co;

  test                     test (.*);
  mixed_rtl_and_gate_adder dut  (.*);

endmodule: top
//`end_keywords


