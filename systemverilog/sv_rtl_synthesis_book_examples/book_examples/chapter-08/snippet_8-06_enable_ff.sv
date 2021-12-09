//
// Book, "RTL Modeling with SystemVerilog for ASIC and FPGA Design"
// by Stuart Sutherland
//
// Data-enabled flip-flop.
//
// Copyright 2016, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//

`begin_keywords "1800-2012" // use SystemVerilog-2012 keywords
module enable_ff
#(parameter N = 1)              // bus size
(input  logic         clock,    // posedge triggered clock
 input  logic         resetN,   // active low async reset
 input  logic         enable,   // active high data enable
 input  logic [N-1:0] d,        // scalable input size
 output logic [N-1:0] q         // scalable output size
);
  timeunit 1ns/1ns;

  always_ff @(posedge clock or negedge resetN)
    if      (!resetN) q <= '0;  // reset (active low)
    else if (enable)  q <= d;   // store data if enabled   

endmodule: enable_ff
`end_keywords

