//
// Book, "RTL Modeling with SystemVerilog for ASIC and FPGA Design"
// by Stuart Sutherland
//
// Synthesizable always_comb block that infers a latch.
//
// Copyright 2016, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//

`begin_keywords "1800-2012"

//
// Snippet 3:
// Variables not updated, using always_comb procedure
//
module mux_with_latch 
(output logic [7:0] y1, y2,  // 8-bit variables
 input  logic [7:0] in,      // 8-bit variables
 input  logic       sel      // scalar (1-bit) variable
);

always_comb begin 
  if (sel) y1 = in;
  else     y2 = in;
end 

endmodule: mux_with_latch

`end_keywords
