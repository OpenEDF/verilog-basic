//
// Book, "RTL Modeling with SystemVerilog for ASIC and FPGA Design"
// by Stuart Sutherland
//
// RTL model of an 8-bit wide D-type register
//
// Copyright 2016, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//

/////////////////////////////////////////////////////////////
// Design module with RTL model of a D-type register
/////////////////////////////////////////////////////////////
`begin_keywords "1800-2012"
module d_reg (input  logic       clock,
              input  logic [7:0] d,
              output logic [7:0] q
             );
  timeunit 1ns/1ns;
  
  always @(posedge clock)
    q <= d;

endmodule: d_reg
`end_keywords
