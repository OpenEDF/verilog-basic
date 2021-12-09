//
// Book, "RTL Modeling with SystemVerilog for ASIC and FPGA Design"
// by Stuart Sutherland
//
// Using for-loop to exclusive-or one bus with the reverse-order or another bus.
//
// Copyright 2016, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//

`begin_keywords "1800-2012" // use SystemVerilog-2012 keywords
module bus_xor
#(parameter N = 4)            // bus size
(input  logic [N-1:0] a, b,   // scalable input size
 output logic [N-1:0] out     // scalable output size
);
  timeunit 1ns/1ns;

  always_comb begin 
    for (int i=0; i<N; i++) begin 
      out[i] = a[i] ^ b[(N-1)-i]; // XOR a and reverse order of b
    end 
  end 

endmodule: bus_xor
`end_keywords

