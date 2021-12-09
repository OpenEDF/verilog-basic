//
// Book, "RTL Modeling with SystemVerilog for Simulation and Synthesis"
// by Stuart Sutherland, published by Sutherland HDL, Inc.
//
// Using increment and decrement operators.
//
// Copyright 2017, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//


//
// Count number of bits in a vector that are set to one.
//
//`begin_keywords "1800-2012" // use SystemVerilog-2012 keywords
module count_ones
#(parameter N = 8)
(input  logic [N-1:0]       data_bus,
 output logic [$clog2(N):0] count // compute count width based
);                                // on the size of data_bus
  timeunit 1ns; timeprecision 1ns;

  always_comb begin 
    count = '0;
    for (int i=N-1; i>=0; i--) 
      if (data_bus[i]) count++;
  end 
endmodule: count_ones
//`end_keywords
