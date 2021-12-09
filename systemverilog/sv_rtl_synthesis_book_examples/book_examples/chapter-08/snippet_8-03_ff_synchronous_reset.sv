//
// Book, "RTL Modeling with SystemVerilog for ASIC and FPGA Design"
// by Stuart Sutherland
//
// N-bit wide flip-flop with synchronous reset input.
//
// Copyright 2016, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//

`begin_keywords "1800-2012" // use SystemVerilog-2012 keywords
module ff_synchronous_reset
#(parameter N=1)            // scalable bus size 
(output logic [N-1:0] q,
 input  logic [N-1:0] d,
 input  logic         clock, reset
);
  timeunit 1ns/1ns;

  always_ff @(posedge clock)
    if (reset) q <= '0;  // active-high synchronous reset
    else       q <= d;       

endmodule: ff_synchronous_reset
`end_keywords
