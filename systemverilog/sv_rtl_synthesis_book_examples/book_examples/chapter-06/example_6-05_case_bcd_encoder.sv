//
// Book, "RTL Modeling with SystemVerilog for ASIC and FPGA Design"
// by Stuart Sutherland
//
// 4-bit priority binary-coded-decimal encoder modeled with a case..inside statements.
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
    case (data_in) inside
      4'b1???: bcd_out = 4;  // bit 4 is set
      4'b01??: bcd_out = 3;  // bit 3 is set
      4'b001?: bcd_out = 2;  // bit 2 is set
      4'b0001: bcd_out = 1;  // bit 1 is set
      4'b0000: bcd_out = 0;  // no bits are set
    endcase
  end

endmodule: priority_bcd_encoder
`end_keywords

