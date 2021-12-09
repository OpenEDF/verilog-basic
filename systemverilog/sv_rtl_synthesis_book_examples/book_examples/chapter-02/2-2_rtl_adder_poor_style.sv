//
// Book, "RTL Modeling with SystemVerilog for ASIC and FPGA Design"
// by Stuart Sutherland
//
// RTL model of a 32-bit adder with minimal white space (poor style)
//
// Copyright 2016, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//
module rtl_adder_poor_style(input logic[31:0]a,b,output logic[31:0]sum,output logic co);timeunit 1ns;timeprecision 1ns;always_comb begin{co,sum}=a+b;end endmodule:rtl_adder_poor_style
