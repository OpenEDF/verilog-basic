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
#(parameter N = 8)            // data size (default 8-bits)
(input  logic         clk,    // clock input
 output logic         rstN,   // active-low asynch reset
 output logic [N-1:0] a, b,   // scalable input size
 input  logic         lt,     // set if a is less than b
 input  logic         eq,     // set if a is equal to b
 input  logic         gt      // set if a is greater than b
);
  timeunit 1ns/1ns;

  // generate stimulus
  initial begin
  	$timeformat(-9, 0, "ns", 6);  // nanoseconds, no precision, 6 columns
    rstN <= 0;                    // reset DUT (active low)
    repeat(2)  @(negedge clk) ;   // hold reset for 2 clock cycles
    rstN = 1;                     // remove reset
    repeat (16) begin
      @(negedge clk) ;
      void'(std::randomize(a) with {a inside {0,3,5};});
      void'(std::randomize(b) with {b inside {0,3,5};});
      @(negedge clk) check_results;
    end
    @(negedge clk) $finish;
  end

  // verify results
  task check_results;
    $write("At %t: a=%d  b=%d:  ", $time, a, b);
    if (a < b) begin
      $write("EXPECT: {lt,eq,gt} = 100, ACTUAL: %b ", {lt,eq,gt});
      if ({lt,eq,gt} === 3'b100) $display(" OK");
      else                       $display(" ERROR!");
    end
    else if (a == b) begin
      $write("EXPECT: {lt,eq,gt} = 010, ACTUAL: %b ", {lt,eq,gt});
      if ({lt,eq,gt} === 3'b010) $display(" OK");
      else                       $display(" ERROR!");
    end
    else if (a > b) begin
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
  logic [N-1:0] a, b;
  logic         lt, eq, gt;

  test       #(.N(N)) test (.*);
  comparator #(.N(N)) dut  (.*);

  initial begin
    clk <= 0;
    forever #5 clk = ~clk;
  end
endmodule: top
`end_keywords

