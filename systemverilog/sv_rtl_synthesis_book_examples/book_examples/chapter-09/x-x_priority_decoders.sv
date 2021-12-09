//
// Book, "RTL Modeling with SystemVerilog for ASIC and FPGA Design"
// by Stuart Sutherland
//
// RTL model of a priority decoder using a reverse case statement
//
// Copyright 2016, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//

`begin_keywords "1800-2012"   // use SystemVerilog-2012 keywords
module priority_decoder_new
(input  wire [7:0] select,
 output reg  [3:0] high_bit   // "priority" is not a keyword
);
  timeunit 1ns/1ns;

  // return bit number of highest bit set, or 8 if none set
  always_comb begin
    priority case (1'b1)      // "priority" is a keyword
      select[7]: high_bit = 4'h7;
      select[6]: high_bit = 4'h6;
      select[5]: high_bit = 4'h5;
      select[4]: high_bit = 4'h4;
      select[3]: high_bit = 4'h3;
      select[2]: high_bit = 4'h2;
      select[1]: high_bit = 4'h1;
      select[0]: high_bit = 4'h0;
      default  : high_bit = 4'h8;
    endcase
  end
endmodule: priority_decoder_new
`end_keywords


`begin_keywords "1364-2005"   // use Verilog-2005 keywords
`timescale 1ns/1ns
module priority_decoder_old
(input  wire [7:0] select,
 output reg  [3:0] priority   // "priority" is not a keyword
);
  // return bit number of highest bit set, or 8 if none set
  always @(select) begin
    casez (select) // synthesis full_case
      8'b1???????: priority = 4'h7;
      8'b01??????: priority = 4'h6;
      8'b001?????: priority = 4'h5;
      8'b0001????: priority = 4'h4;
      8'b00001???: priority = 4'h3;
      8'b000001??: priority = 4'h2;
      8'b0000001?: priority = 4'h1;
      8'b00000001: priority = 4'h0;
      8'b00000000: priority = 4'h8;
    endcase
  end
endmodule // priority_decoder_old
`end_keywords

