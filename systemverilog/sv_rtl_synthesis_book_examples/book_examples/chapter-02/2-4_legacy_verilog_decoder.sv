//
// Book, "RTL Modeling with SystemVerilog for ASIC and FPGA Design"
// by Stuart Sutherland
//
// Legacy Verilog RTL model of a priority decoder
//
// Copyright 2016, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//

`begin_keywords "1364-2001"   // use Verilog-2001 keywords
`timescale 1ns/1ns
module priority_decoder_1
(input  wire [3:0] select,
 output reg  [2:0] priority   // "priority" is not a keyword
);
  // return bit number of highest bit set, or 7 if none set
  always @(select) begin 
    casez (select) // synthesis full_case
      4'b1???: priority = 4'h3;
      4'b01??: priority = 4'h2;
      4'b001?: priority = 4'h1;
      4'b0001: priority = 4'h0;
      4'b0000: priority = 4'h7;
    endcase
  end
endmodule // priority_decoder_1
`end_keywords
