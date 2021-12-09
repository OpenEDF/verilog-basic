//
// Book, "RTL Modeling with SystemVerilog for ASIC and FPGA Design"
// by Stuart Sutherland
//
// Mixed blocking and nonblocking assignments.
//
// Copyright 2016, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//

//`begin_keywords "1800-2012" // use SystemVerilog-2012 keywords
module messed_up
(input  logic clock, mode,
 input  logic [7:0] a,b,
 output logic [7:0] q1, q2
);
always @(posedge clock) begin
  if (mode) q1 = a + b;   // adder
  else      q1 = a - b;   // subtractor
  q2 <= q1 | (q2<<2);          // multiply by 4 (using shift)
end
endmodule: messed_up
//`end_keywords