//
// Book, "RTL Modeling with SystemVerilog for Simulation and Synthesis"
// by Stuart Sutherland, published by Sutherland HDL, Inc.
//
// RTL model of an 8-bit wide D-type register
//
// Copyright 2017, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//

/////////////////////////////////////////////////////////////
// Design module with RTL model of a D-type register
/////////////////////////////////////////////////////////////
//`begin_keywords "1800-2012"
module d_reg (input  logic       clk,
              input  logic [7:0] d,
              output logic [7:0] q
             );
  timeunit 1ns; timeprecision 1ns;
  
  always @(posedge clk)
    q <= d;

endmodule: d_reg
//`end_keywords
