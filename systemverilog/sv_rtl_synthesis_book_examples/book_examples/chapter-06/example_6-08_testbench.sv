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
#(parameter E = 3,    // power exponent
  parameter N = 4,    // input bus size
  parameter M = N*2   // output bus size
)
(output logic [N-1:0] d,   // finput to DUT
 input  logic [M-1:0] q,   // output from DUT
 input  logic         clk  // testbench clock
);
  timeunit 1ns/1ns;

  // generate stimulus
  initial begin
  	$timeformat(-9, 0, "ns", 6);  // nanoseconds, no precision, 6 columns
    @(negedge clk) ;
    d=3;
    @(negedge clk) check_results;
    @(negedge clk) $finish;
  end

  // verify results
  task check_results;
    $write("\nAt %t: d=%0d  ", $time, d);
    $write("EXPECT: q=%0d, ACTUAL: %0d \n", power_f(), q);
    if (q === power_f()) $display(" OK");
    else                 $display(" ERROR!");
  endtask
  
  function [M-1:0] power_f();
    return d**E;
  endfunction

endmodule: test
`end_keywords

`begin_keywords "1800-2012"
module top;
  timeunit 1ns/1ns;

  parameter E = 3;         // power exponent
  parameter N = 4;         // bus size
  parameter M = N*2;       // output bus size
  
  logic [N-1:0]  d;
  logic [M-1:0]  q;
  logic          clock;    // design clock
  logic          clk;      // testbench clock

  test             test (.*);
  exponential  dut  (.*);

  initial begin
    clk <= 0;
    forever #5 clk = ~clk;
  end
  
  assign clock = ~clk;
  
endmodule: top
`end_keywords

