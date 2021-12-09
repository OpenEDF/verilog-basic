//
// Book, "RTL Modeling with SystemVerilog for ASIC and FPGA Design"
// by Stuart Sutherland
//
// SystemVerilog RTL model of a priority decoder
//
// Copyright 2016, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//

`begin_keywords "1800-2012"  // use SystemVerilog-2012 keywords
module priority_decoder_2 
(input  logic [3:0] select,
 output logic [2:0] high_bit
);
  timeunit 1ns/1ns;

  // return bit number of highest bit set, or 7 if none set
  always_comb begin 
    priority case (1'b1)          // "priority" is a keyword
      select[3]: high_bit = 4'h3;
      select[2]: high_bit = 4'h2;
      select[1]: high_bit = 4'h1;
      select[0]: high_bit = 4'h0;
      default  : high_bit = 4'h7;
    endcase
  end
endmodule: priority_decoder_2
`end_keywords
