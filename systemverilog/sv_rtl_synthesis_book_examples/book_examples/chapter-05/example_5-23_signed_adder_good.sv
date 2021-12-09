//
// Book, "RTL Modeling with SystemVerilog for ASIC and FPGA Design"
// by Stuart Sutherland
//
// Signed adder with carry-in.
//
// Copyright 2016, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//

`begin_keywords "1800-2012"
module signed_adder_good
 #(parameter N = 4)
  (input  logic signed [N-1:0] a, b, // signed inputs
   input  logic                ci,   // unsigned carry-in
   output logic signed [N-1:0] sum,  // signed output
   output logic                ov    // unsigned overflow
  );
  timeunit 1ns/1ns;

  assign sum = a + b + signed'({1'b0,ci}); // signed adder

  assign ov = (!a[N-1] && !b[N-1] && sum[N-1]) || (a[N-1] && b[N-1] && !sum[N-1]);
  // An overflow has occurred if:
  // 1. If the sum of two positive numbers yields a negative result 
  // 2. If the sum of two negative numbers yields a positive result 
  
endmodule: signed_adder_good
`end_keywords
