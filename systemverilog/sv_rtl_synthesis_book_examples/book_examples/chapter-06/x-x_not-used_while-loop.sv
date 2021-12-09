//
// Book, "RTL Modeling with SystemVerilog for ASIC and FPGA Design"
// by Stuart Sutherland
//
// Using repeat-loop to code a value raised to the power of E, where E is a parameter.
//
// Copyright 2016, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//

`begin_keywords "1800-2012" // use SystemVerilog-2012 keywords
module address_range_decode_1
(input  logic [15:0] data,
 output logic [ 3:0] num_ones
);
  timeunit 1ns/1ns;

always_comb begin 
  logic [15:0] temp;  // local temporary variable
  num_ones = 0;
  temp = data;
  while (temp) begin // loop as long as a bit in temp is set
    if (temp[0]) num_ones++;
    temp >>= 1;
  end 
end 

endmodule: address_range_decode_1
`end_keywords

