//
// Book, "RTL Modeling with SystemVerilog for ASIC and FPGA Design"
// by Stuart Sutherland
//
// Testbench
//
// Copyright 2016, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//
`begin_keywords "1800-2012"
module test
 import definitions_pkg::*;
(output instruction_t  iw,
 input  logic          clk,
 input  word_t         result
);
  timeunit 1ns/1ns;
  initial begin
    $display();
    $display("port result type is %s", $typename(top.dut.result));
    $display();
  end

  initial begin
  	$display("\n*** No simulation results expected. ***");
  	$display("*** Only checking that module compiles. ***\n");
    $finish;
  end
endmodule: test

module top;
  timeunit 1ns/1ns;
  import definitions_pkg::*;
  instruction_t  iw;
  logic          clk;
  word_t         result;

  test test (.*);
  alu  dut  (.*);

  initial begin
    clk <= 0;
    forever #5 clk = ~clk;
  end
endmodule: top
`end_keywords


