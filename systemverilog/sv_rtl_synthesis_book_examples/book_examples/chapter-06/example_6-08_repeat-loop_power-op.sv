//
// Book, "RTL Modeling with SystemVerilog for ASIC and FPGA Design"
// by Stuart Sutherland
//
// Using repeat-loop to code a value raised to the power of E, where E is a parameter.
//
// Copyright 2016, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//

`begin_keywords "1800-2012" // use SystemVerilog-2012 keywords
module exponential
#(parameter E = 3,    // power exponent
  parameter N = 4,    // input bus size
  parameter M = N*2   // output bus size
)
(input  logic         clock,
 input  logic [N-1:0] d,
 output logic [M-1:0] q
);
  timeunit 1ns/1ns;

  always_ff @(posedge clock) 
    if (E == 0)
      q <= '1;
    else begin 
      q <= d;
      repeat (E-1) begin 
        q <= q * d;
      end 
    end 
  
endmodule: exponential
`end_keywords

