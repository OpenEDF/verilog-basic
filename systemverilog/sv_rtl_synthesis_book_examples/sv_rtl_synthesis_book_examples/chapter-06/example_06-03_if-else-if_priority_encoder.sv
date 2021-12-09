//
// Book, "RTL Modeling with SystemVerilog for Simulation and Synthesis"
// by Stuart Sutherland, published by Sutherland HDL, Inc.
//
// 4-to-2 priority encoder modeled with a series of if-else-if statements.
//
// Copyright 2017, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//

//`begin_keywords "1800-2012" // use SystemVerilog-2012 keywords
module priority_4to2_encoder (
  input  logic [3:0] d_in,
  output logic [1:0] d_out,
  output logic       error
);
  timeunit 1ns; timeprecision 1ns;

  always_comb begin 
    error = '0;
    if      (d_in[3]) d_out = 2'h3;  // bit 3 is set
    else if (d_in[2]) d_out = 2'h2;  // bit 2 is set
    else if (d_in[1]) d_out = 2'h1;  // bit 1 is set
    else if (d_in[0]) d_out = 2'h0;  // bit 0 is set
    else begin                       // no bits set
      d_out = 2'b0;
      error = '1;
    end
  end 
endmodule: priority_4to2_encoder
//`end_keywords 
