//
// Book, "RTL Modeling with SystemVerilog for Simulation and Synthesis"
// by Stuart Sutherland, published by Sutherland HDL, Inc.
//
// 4-operation bitwise unit modeled with a case statement.
//
// Copyright 2017, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//

//`begin_keywords "1800-2012" // use SystemVerilog-2012 keywords
module mux4to1 
#(parameter N=8)
(
  input  logic [N-1:0] a, b, c, d,
  input  logic [  1:0] select,
  output logic [N-1:0] y
);

  always_comb begin 
    case (select)
      2'b00: y = a;
      2'b01: y = b;
      2'b10: y = c;
      2'b11: y = d;
    endcase 
  end 
endmodule: mux4to1
//`end_keywords 

