//
// Book, "RTL Modeling with SystemVerilog for Simulation and Synthesis"
// by Stuart Sutherland, published by Sutherland HDL, Inc.
//
// RAM with parameterized size and port widths.
//
// Copyright 2017, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//

//`begin_keywords "1800-2012" // use SystemVerilog-2012 keywords
module ram
#(parameter  SIZE = 1024,            // address size of the RAM
             D_WIDTH = 8,            // data bus width
             A_WIDTH = $clog2(SIZE) 
 )
 (input logic [A_WIDTH-1:0] addr,
  input logic               rdN, wrN,
  inout tri   [D_WIDTH-1:0] data
 );
  timeunit 1ns; timeprecision 1ns;

  logic [D_WIDTH-1:0] mem [0:SIZE-1];

  assign data = (!rdN)? mem[addr] : 'z;
   
  always @(wrN, addr, data)
    if (!wrN) mem[addr] <= data;
endmodule: ram
//`end_keywords
