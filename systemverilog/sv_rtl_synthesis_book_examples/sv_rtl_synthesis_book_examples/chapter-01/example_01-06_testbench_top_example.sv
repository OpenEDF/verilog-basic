//
// Book, "RTL Modeling with SystemVerilog for Simulation and Synthesis"
// by Stuart Sutherland, published by Sutherland HDL, Inc.
//
// Top-level connection of testbench and DUT
//
// Copyright 2017, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//
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


