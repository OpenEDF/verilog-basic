//
// Book, "RTL Modeling with SystemVerilog for ASIC and FPGA Design"
// by Stuart Sutherland
//
// Package snippets.
//
// Copyright 2016, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//

`begin_keywords "1800-2012"

//
// Conditional compilation of a package
//
`ifndef DEFINITIONS_PKG_ALREADY_COMPILED
//  `include "definitions_pkg.sv"  // compile the package
  `include "4-1_example_package.sv"  // compile the package
  `define DEFINITIONS_PKG_ALREADY_COMPILED  // set the flag
`endif
module alu
 import definitions_pkg::*; // wildcard import
(input  instruction_t  iw,
 input  logic          clk,
 output word_t         result
);
  //...

  initial begin
  	$display("\n*** No simulation results expected. ***");
  	$display("*** Only checking that module compiles. ***\n");
  end
endmodule: alu

`end_keywords
