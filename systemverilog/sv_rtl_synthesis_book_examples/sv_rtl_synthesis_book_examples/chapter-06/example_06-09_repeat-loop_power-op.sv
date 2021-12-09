//
// Book, "RTL Modeling with SystemVerilog for Simulation and Synthesis"
// by Stuart Sutherland, published by Sutherland HDL, Inc.
//
// Using repeat-loop to code a value raised to the power of E, where E is a parameter.
//
// Copyright 2017, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//

//`begin_keywords "1800-2012" // use SystemVerilog-2012 keywords
module exponential
#(parameter E = 3,    // power exponent
  parameter N = 4,    // input bus size
  parameter M = N*2   // output bus size
)
(input  logic         clk,
 input  logic [N-1:0] d,
 output logic [M-1:0] q
);
  timeunit 1ns; timeprecision 1ns;

  always_ff @(posedge clk) begin: power_loop
    logic [M-1:0] q_temp; // temp variable for inside the loop
    if (E == 0)
      q <= 1;  // do to power of 0 is a decimal 1
    else begin 
      q_temp = d;
      repeat (E-1) begin 
        q_temp = q_temp * d;
      end 
      q <= q_temp;
    end 
  end: power_loop
  
endmodule: exponential
//`end_keywords 

