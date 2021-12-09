//
// Book, "RTL Modeling with SystemVerilog for ASIC and FPGA Design"
// by Stuart Sutherland
//
// N-bit latch modeled with an if statement.
//
// Copyright 2016, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//

`begin_keywords "1800-2012" // use SystemVerilog-2012 keywords
module latch
#(parameter N = 4)          // bus size
(input  logic         ena,  // 1-bit input
 input  logic [N-1:0] in,   // scalable input size
 output logic [N-1:0] out   // scalable output size
);
  timeunit 1ns/1ns;

  always_comb begin
    if (ena) out <= in; 
  end

endmodule: latch
`end_keywords
