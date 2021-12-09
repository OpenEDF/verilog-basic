//
// Book, "RTL Modeling with SystemVerilog for ASIC and FPGA Design"
// by Stuart Sutherland
//
// Concatenate operator snippets.
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
  logic signed [3:0] a;
  logic        [7:0] b;

  assign a = 4'sb1011; // same as -6
  assign b = 8'b00010001;

  initial begin
    $display("{a,b} results in %b (expect 101100010001)", {a,b});
    $display("{4'hF,a} results in %b (expect 11111011)", {4'hF,a});
    $display("{8{2'b10}} results in %b (expect 1010101010101010)", {8{2'b10}});
    $display("{ {4{a[3]}}, a } results in %b (export 11111011)", { {4{a[3]}}, a };
  end
endmodule: op_rules_1

`end_keywords
