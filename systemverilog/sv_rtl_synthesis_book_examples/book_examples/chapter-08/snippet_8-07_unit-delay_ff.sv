//
// Book, "RTL Modeling with SystemVerilog for ASIC and FPGA Design"
// by Stuart Sutherland
//
// N-bit wide flip-flop with asynchronous reset input.
//
// Copyright 2016, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//

`begin_keywords "1800-2012" // use SystemVerilog-2012 keywords
module reg32
(output logic [31:0] q,
 input  logic [31:0] d,
 input  logic        clock, resetN
);
  timeunit 1ns/1ns;

  always_ff @(posedge clock or negedge resetN)
    if (!resetN) q <= #1 '0;  // 1ns intra-assignment delay
    else         q <= #1 d;   // 1ns intra-assignment delay

endmodule: reg32
`end_keywords
