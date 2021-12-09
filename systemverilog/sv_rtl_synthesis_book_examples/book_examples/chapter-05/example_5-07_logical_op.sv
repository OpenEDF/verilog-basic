//
// Book, "RTL Modeling with SystemVerilog for ASIC and FPGA Design"
// by Stuart Sutherland
//
// Set equivalent flag if either d1 and d2 are both true,
// or d1 and d2 are both false
//
// Copyright 2016, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//

//
// Set equivalent flag if either d1 and d2 are both true,
// or d1 and d2 are both false
//
`begin_keywords "1800-2012" // use SystemVerilog-2012 keywords
module status_flag
#(parameter N = 8)               // data size (default 8-bits)
(input  logic         clk,       // clock input
 input  logic         rstN,      // active-low async reset
 input  logic [N-1:0] d1, d2,    // scalable input size
 output logic         equivalent // set if true/false value of
);                               // d1 and d2 are the same
  timeunit 1ns/1ns;

  always_ff @(posedge clk, negedge rstN)
    if (!rstN) equivalent <= 0;
//    else       equivalent <= ((d1 && d2) || (!d2 && !d1));
    else       equivalent <= (d1 <-> d2);  // logical equivelance op
endmodule: status_flag
`end_keywords
