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
#(parameter N = 4)                // register size
(output logic             enable, // output enable
 output logic     [N-1:0] a, b,   // scalable input size
 input  tri logic [N-1:0] out     // tri-state output, net type
);
  timeunit 1ns; timeprecision 1ns;

  initial begin
    enable = 0;  // turn-off adder output
    a = 0;
    b = 0;
    #1 $display("a=%b  b=%b  enable=%b  out=%b: expect out=zzzz", a, b, enable, out);
    #1 a = 1;
    #1 b = 2;
    #1 $display("a=%b  b=%b  enable=%b  out=%b: expect out=zzzz", a, b, enable, out);
    #1 enable = 1;
    #1 $display("a=%b  b=%b  enable=%b  out=%b: expect out=0011", a, b, enable, out);
    #1 a = 5;
    #1 $display("a=%b  b=%b  enable=%b  out=%b: expect out=0111", a, b, enable, out);
    #1 enable = 0;
    #1 $display("a=%b  b=%b  enable=%b  out=%b: expect out=zzzz", a, b, enable, out);
    #1 $finish;
  end
endmodule: test
//`end_keywords

//`begin_keywords "1800-2012"
module top;
  timeunit 1ns; timeprecision 1ns;

  parameter N = 4;

  logic             enable;
  logic [N-1:0] a, b;
  logic [N-1:0] out;

  test            #(.N(N)) test (.*);
  tri_state_adder #(.N(N)) dut  (.*);
endmodule: top
//`end_keywords
