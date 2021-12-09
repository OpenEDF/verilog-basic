//
// Book, "RTL Modeling with SystemVerilog for Simulation and Synthesis"
// by Stuart Sutherland, published by Sutherland HDL, Inc.
//
// Using disable to control processing of loop statements.
//
// Copyright 2017, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//

//`begin_keywords "1800-2012" // use SystemVerilog-2012 keywords
module find_bit_in_range_2
#(parameter N = 8)           // bus size
(input  logic [N-1:0]         data,
 input  logic [$clog2(N)-1:0] start_range, end_range,
 output logic [$clog2(N)-1:0] low_bit
);
  timeunit 1ns; timeprecision 1ns;

  always_comb begin 
    low_bit = 0;
    begin: loop_block
      for (int i=0; i<N; i++) begin: loop 
        if (i < start_range) disable loop;  // skip rest of loop
        if (i > end_range)   disable loop_block;  // exit loop
        if ( data[i] ) begin 
          low_bit = i;
          disable loop_block;  // exit loop
        end 
      end: loop 
    end: loop_block
    // ...  // process data based on lowest bit set
  end 

endmodule: find_bit_in_range_2
//`end_keywords

