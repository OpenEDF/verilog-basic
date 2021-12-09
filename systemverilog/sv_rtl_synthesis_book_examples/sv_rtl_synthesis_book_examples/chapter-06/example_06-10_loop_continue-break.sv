//
// Book, "RTL Modeling with SystemVerilog for Simulation and Synthesis"
// by Stuart Sutherland, published by Sutherland HDL, Inc.
//
// Using continue and break to control processing of loop statements.
//
// Copyright 2017, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//

//`begin_keywords "1800-2012" // use SystemVerilog-2012 keywords
module find_bit_in_range
#(parameter N = 4) // bus size
(input  logic [N-1:0]         data,
 input  logic [$clog2(N)-1:0] start_range, end_range,
 output logic [$clog2(N)-1:0] low_bit
);
  timeunit 1ns; timeprecision 1ns;

  always_comb begin 
    low_bit = '0;
    for (int i=0; i<N; i++) begin 
      if (i < start_range) continue;  // skip rest of loop
      if (i > end_range)   break;     // exit loop
      if ( data[i] ) begin 
        low_bit = i;
        break;                        // exit loop
      end 
    end  // end of the loop
    // ...  // process data based on lowest bit set
  end 

endmodule: find_bit_in_range
//`end_keywords

