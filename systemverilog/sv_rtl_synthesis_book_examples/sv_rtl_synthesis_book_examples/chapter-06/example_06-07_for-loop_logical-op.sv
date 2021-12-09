//
// Book, "RTL Modeling with SystemVerilog for Simulation and Synthesis"
// by Stuart Sutherland, published by Sutherland HDL, Inc.
//
// Using for-loop to exclusive-or one bus with the reverse-order or another bus.
//
// Copyright 2017, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//

//`begin_keywords "1800-2012" // use SystemVerilog-2012 keywords
module bus_xor
#(parameter N = 4)            // bus size
(input  logic [N-1:0] a, b,   // scalable input size
 output logic [N-1:0] y       // scalable output size
);
  timeunit 1ns; timeprecision 1ns;

  always_comb begin 
    for (int i=0; i<N; i++) begin 
      y[i] = a[i] ^ b[(N-1)-i]; // XOR a and reverse order of b
    end 
  end 

endmodule: bus_xor
//`end_keywords

