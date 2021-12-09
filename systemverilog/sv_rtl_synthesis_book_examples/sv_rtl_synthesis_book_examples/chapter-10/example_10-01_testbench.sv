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
module test;
  timeunit 1ns; timeprecision 1ns;

  initial begin
    #(1*10);    // advance to unique time slot for this test number
    $display("\n%m: No outputs -- only checking that code compiles.\n");
  end


endmodule: test
//`end_keywords
