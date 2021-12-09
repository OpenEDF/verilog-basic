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
#(parameter N = 8)                // data size (default 8-bits)
(input  logic         clk,        // clock input
 output logic         rstN,       // active-low asynch reset
 output logic signed [N-1:0] s,   // scalable input size
 output logic        [N-1:0] u,   // scalable input size
 input  logic         lt,         // set if a is less than b
 input  logic         eq,         // set if a is equal to b
 input  logic         gt          // set if a is greater than b
);
  timeunit 1ns/1ns;

  // generate stimulus
  initial begin
  	$timeformat(-9, 0, "ns", 6);  // nanoseconds, no precision, 6 columns
    rstN <= 0;                    // reset DUT (active low)
    repeat(2)  @(negedge clk) ;   // hold reset for 2 clock cycles
    rstN = 1;                     // remove reset
    @(negedge clk) ;
    s = 5; u = 1;
    @(negedge clk) check_results;

    @(negedge clk) ;
    s = 1; u = 5;
    @(negedge clk) check_results;

    @(negedge clk) ;
    s = -1; u = 5;
    @(negedge clk) check_results;

    @(negedge clk) ;
    s = -1; u = -1;
    @(negedge clk) check_results;

    @(negedge clk) $finish;
  end

  // verify results
  task check_results;
    $write("At %t: s=%0d  u=%0d:  ", $time, s, u);
    if (s < signed'(u)) begin
      $write("EXPECT: {lt,eq,gt} = 100, ACTUAL: %b ", {lt,eq,gt});
      if ({lt,eq,gt} === 3'b100) $display(" OK");
      else                       $display(" ERROR!");
    end
    else if (s == signed'(u)) begin
      $write("EXPECT: {lt,eq,gt} = 010, ACTUAL: %b ", {lt,eq,gt});
      if ({lt,eq,gt} === 3'b010) $display(" OK");
      else                       $display(" ERROR!");
    end
    else if (s > signed'(u)) begin
      $write("EXPECT: {lt,eq,gt} = 001, ACTUAL: %b ", {lt,eq,gt});
      if ({lt,eq,gt} === 3'b001) $display(" OK");
      else                       $display(" ERROR!");
    end
  endtask
endmodule: test
`end_keywords

`begin_keywords "1800-2012"
module top;
  timeunit 1ns/1ns;
  parameter N = 8;

  logic         clk, rstN;
  logic [N-1:0] s;
  logic [N-1:0] u;
  logic         lt, eq, gt;

  test              #(.N(N)) test (.*);
  signed_comparator #(.N(N)) dut  (.*);

  initial begin
    clk <= 0;
    forever #5 clk = ~clk;
  end
endmodule: top
`end_keywords

