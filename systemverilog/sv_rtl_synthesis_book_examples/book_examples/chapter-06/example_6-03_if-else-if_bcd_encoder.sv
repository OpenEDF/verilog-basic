//
// Book, "RTL Modeling with SystemVerilog for ASIC and FPGA Design"
// by Stuart Sutherland
//
// 4-bit priority binary-coded-decimal encoder modeled with a series of if-else-if statements.
//
// Copyright 2016, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//

`begin_keywords "1800-2012" // use SystemVerilog-2012 keywords
module priority_bcd_encoder (
  input  logic [3:0] data_in,
  output logic [2:0] bcd_out
);
  timeunit 1ns/1ns;

  always_comb begin
    if      (data_in[3]) bcd_out = 4;  // bit 3 is set
    else if (data_in[2]) bcd_out = 3;  // bit 2 is set
    else if (data_in[1]) bcd_out = 2;  // bit 1 is set
    else if (data_in[0]) bcd_out = 1;  // bit 0 is set
    else                 bcd_out = 0;  // no bits are set
  end
endmodule: priority_bcd_encoder
`end_keywords
