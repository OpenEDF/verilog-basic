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
module find_lowest_bit
#(parameter N = 4)            // bus size
(input  logic [N-1:0]         data,
 output logic [$clog2(N):0]  low_bit
);
  timeunit 1ns; timeprecision 1ns;

  logic        done;  // local flag
  
  always_comb begin 
    // find lowest bit that is set in a vector
    low_bit = '0;
    done = '0;
    for (int i=0; i<=N-1; i++) begin 
      if (!done) begin 
        if (data[i]) begin 
          low_bit = i;
          done = '1;
        end 
      end 
    end 
  end 
  
endmodule: find_lowest_bit
//`end_keywords

