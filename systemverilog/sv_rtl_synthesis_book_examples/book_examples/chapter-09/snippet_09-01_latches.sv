//
// Book, "RTL Modeling with SystemVerilog for ASIC and FPGA Design"
// by Stuart Sutherland
//
// Always and always_comb snippets.
//
// Copyright 2016, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//

`begin_keywords "1800-2012"

//
// Snippet 1:
// Simple transparent latch
//
module simple_latch; 

logic [7:0] in, out;  // 8-bit variables
logic       ena;      // scalar (1-bit) variable

always @(in, ena) begin 
  if (ena) out <= in;
end 

  initial begin
    #(1*10);    // advance to unique time slot for this test number
    in = 8'h5;
    ena = 1'b1;  // transparent
    #1;
    $display("\n%m: in=%0d  ena=%b  : out=%0d  (expect out=5)", in, ena, out);
    #1;
    ena = 1'b0;  // latched
    #1;
    in = 8'h7;
    #1;
    $display("%m: in=%0d  ena=%b  : out=%0d  (expect out=5)\n", in, ena, out);
  end
endmodule: simple_latch


//
// Snippet 2:
// Variables not updated, using always procedure
//
module always_at_latch; 
  logic [7:0] in, y1, y2;  // 8-bit variables
  logic       sel;         // scalar (1-bit) variable

always @(sel, in) begin 
  if (sel) y1 = in;
  else     y2 = in;
end 

  initial begin
    #(2*10);    // advance to unique time slot for this test number
    in = 8'h5;
    sel = 1'b1;  // y1 branch
    #1;
    $display("\n%m: in=%0d  sel=%b  : y1=%0d  y2=%0d (expect y1=5  y2=X)", in, sel, y1, y2);
    #1;
    sel = 1'b0;  // y2 branch
    #1;
    in = 8'h7;
    #1;
    $display("%m: in=%0d  sel=%b  : y1=%0d  y2=%0d (expect y1=5  y2=7)\n", in, sel, y1, y2);
  end
endmodule: always_at_latch


`end_keywords
