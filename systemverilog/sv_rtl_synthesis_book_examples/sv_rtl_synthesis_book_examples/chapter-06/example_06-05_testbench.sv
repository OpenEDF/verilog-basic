//
// Book, "RTL Modeling with SystemVerilog for Simulation and Synthesis"
// by Stuart Sutherland, published by Sutherland HDL, Inc.
//
// Testbench
//
// Copyright 2017, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//
//`begin_keywords "1800-2012"
module test
#(parameter N=8)
(
  output logic [N-1:0] a, b, c, d,
  output logic [  1:0] select,
  input  logic [N-1:0] y,
  input  logic         clk     // testbench clk
);
  timeunit 1ns; timeprecision 1ns;

  // generate stimulus
  initial begin
  	$timeformat(-9, 0, "ns", 6);  // nanoseconds, no precision, 6 columns
    a = 'h1;
    b = 'h2;
    c = 'h3;
    d = 'h4;
    for (int i=0; i<=3; i++) begin
      select = i;
      @(negedge clk) check_results;
    end
    @(negedge clk) $finish;

  end

  // verify results
  task check_results;
    $write("At %t: a=%0d  b=%0d  c=%0d  d=%0d  select=%b:  ", $time, a, b, c, d, select);
    $write("EXPECT: y = %0d, ACTUAL: %0d ", expect_f(a, b, c, d, select), y);
    if (y === expect_f(a, b, c, d, select)) $display(" OK");
    else                                    $display(" ERROR!");
  endtask
  
  function logic [3:0] expect_f([3:0] a, b, c, d, [1:0] select);
    if      (select == 2'b00) return a;
    else if (select == 2'b01) return b;
    else if (select == 2'b10) return c;
    else if (select == 2'b11) return d;
    else                      return 'X;
  endfunction

endmodule: test
//`end_keywords

//`begin_keywords "1800-2012"
module top;
  timeunit 1ns; timeprecision 1ns;

  parameter N = 8;
  logic [N-1:0] a, b, c, d;
  logic [  1:0] select;
  logic [N-1:0] y;
  logic         clk;

  test     test (.*);
  mux4to1  dut  (.*);

  initial begin
    clk <= 0;
    forever #5 clk = ~clk;
  end
endmodule: top
//`end_keywords
