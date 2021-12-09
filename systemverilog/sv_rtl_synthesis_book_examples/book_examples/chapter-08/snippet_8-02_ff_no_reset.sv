//
// Book, "RTL Modeling with SystemVerilog for ASIC and FPGA Design"
// by Stuart Sutherland
//
// N-bit wide flip-flop with no reset input.
//
// Copyright 2016, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//

`begin_keywords "1800-2012" // use SystemVerilog-2012 keywords
module ff_no_reset
#(parameter N=1)            // scalable bus size 
(output logic [N-1:0] q,
 input  logic [N-1:0] d,
 input  logic         clock
);
  timeunit 1ns/1ns;

  always_ff @(posedge clock)
    q <= d;

endmodule: ff_no_reset
`end_keywords
