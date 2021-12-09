//
// Book, "RTL Modeling with SystemVerilog for ASIC and FPGA Design"
// by Stuart Sutherland
//
// Conditional operator snippets.
//
// Copyright 2016, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//

`begin_keywords "1800-2012"

//
// Concatenate operators
//
module op_rules_1;
  logic       sel, mode, enableN;
  logic [7:0] a, b, y1, y2;

  assign y1 = sel ? a : b;

  assign y2 = (mode & !enableN)? a + b: a - b;

  initial begin
    sel = 1;
    mode = 1;
    enableN = 0;
    a = 5;
    b = 3;
    #10 ;
    $display("y1 = %d (expect 5)", y1);
    $display("y2 = %d (expect 8)", y2);
  end
endmodule: op_rules_1

`end_keywords
