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
module test
(output logic [31:0] a, b,
 input  logic [31:0] sum,
 input  logic        co
);
  timeunit 1ns; timeprecision 1ns;

  initial begin
    a = 10;
    b = 5;
    #5 ;
    $finish;
  end

  initial begin
    $timeformat(-9,0," ns",10);
    $monitor("At %t: \t a=%0d  b=%0d  sum=%0d  co=%0d",
             $realtime, a, b, sum, co);
  end
endmodule: test

module top;
  timeunit 1ns; timeprecision 1ns;

  logic [31:0] a, b;
  logic [31:0] sum;
  logic        co;

  test                 test (.*);
  rtl_adder_poor_style dut  (.*);

endmodule: top


