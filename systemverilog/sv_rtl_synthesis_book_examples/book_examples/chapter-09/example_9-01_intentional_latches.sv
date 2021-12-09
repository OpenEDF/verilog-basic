//
// Book, "RTL Modeling with SystemVerilog for ASIC and FPGA Design"
// by Stuart Sutherland
//
// Using always_latch to model latched logic.
//
// Copyright 2016, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//


//
// Using intentional latches for a cycle-stealing pipeline.
//

`begin_keywords "1800-2012" // use SystemVerilog-2012 keywords
module latch_pipeline
#(parameter N = 4)                 // bus size
(input  logic         clk1, clk2,  // clock inputs
 input  logic [N-1:0] a, b, c,     // scalable input size
 output logic [N-1:0] out          // scalable output size
);
  timeunit 1ns/1ns;

 logic [N-1:0] tmp;

  always_latch begin 
    if (clk1)         // transparent when clk1 is high
      tmp <= a * b;
  end                 // latched when clk1 is low

  always_latch begin 
    if (clk2)         // transparent when clk2 is high
      out <= tmp * c;
  end                 // latched when clk2 is low

endmodule: latch_pipeline
`end_keywords
