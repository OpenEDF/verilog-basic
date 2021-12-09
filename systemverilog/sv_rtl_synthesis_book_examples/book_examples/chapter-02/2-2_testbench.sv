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
module test
(output logic [31:0] a, b,
 input  logic [31:0] sum,
 input  logic        co
);
  timeunit 1ns/1ns;

  initial begin
    a = 10;
    b = 5;
    #5 ;
    $finish;
  end

  initial begin
    $timeformat(-9,0," ns",10);
    $monitor("At %t: \t a=%0d  b=%0d  sum=%0d  co=%0d",
             $realtime, a, b, sum, co);
  end
endmodule: test

module top;
  timeunit 1ns/1ns;

  logic [31:0] a, b;
  logic [31:0] sum;
  logic        co;

  test                 test (.*);
  rtl_adder_poor_style dut  (.*);

endmodule: top


