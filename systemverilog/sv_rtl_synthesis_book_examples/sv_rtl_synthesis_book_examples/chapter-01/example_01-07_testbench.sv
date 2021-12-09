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

/////////////////////////////////////////////////////////////
// Top module with clk oscillator
/////////////////////////////////////////////////////////////
//`begin_keywords "1800-2012"
module top;
  timeunit 1ns; timeprecision 1ns;
  logic       clk;
  logic [7:0] d;
  logic [7:0] q;

  test  i1 (.*);   // connect top module to test module
  d_reg i2 (.*);   // connect top module to d_reg module

  initial begin    // clk oscillator
    clk <= 0;                // initialize clk at time 0
    forever #5 clk = ~clk;   // toggle clk every 5ns
  end

endmodule: top
//`end_keywords

/////////////////////////////////////////////////////////////
// Test module with stimulus generator
/////////////////////////////////////////////////////////////
//`begin_keywords "1800-2012"
module test (input  logic       clk,
             output logic [7:0] d,
             input  logic [7:0] q
            );
  timeunit 1ns; timeprecision 1ns;

  initial begin
    d = 1;
    #7  d = 2;
    #10 d = 3;
    #10 $display("\n%m: No output -- just checking that example compiles\n");
    #10 $finish;
  end

endmodule: test
//`end_keywords
