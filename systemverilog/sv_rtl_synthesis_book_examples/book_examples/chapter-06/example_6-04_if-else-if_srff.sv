//
// Book, "RTL Modeling with SystemVerilog for ASIC and FPGA Design"
// by Stuart Sutherland
//
// Set/reset flip-flop modeled with a series of if-else-if statements.
//
// Copyright 2016, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//

`begin_keywords "1800-2012" // use SystemVerilog-2012 keywords
module srff
#(parameter N = 1)                      // bus size
(input  logic          clk, rstN, setN, // 1-bit inputs
 input  logic [N-1:0] d,                // scalable input size
 output logic [N-1:0] q                 // scalable output size
);
  timeunit 1ns/1ns;

  always_ff @(posedge clk or negedge rstN or negedge setN)
    if      (rstN == 1'b0) q <= '0;  // reset (active low)
    else if (setN == 1'b0) q <= '1;  // set (active low)
    else                   q <= d;   // clock   

endmodule: srff
`end_keywords
