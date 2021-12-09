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
#(parameter N = 4)                // bus size
(output logic [N-1:0] a, b, c,    // input to DUT
 input  logic [N-1:0] out,        // output from DUT
 input  logic         clk1, clk2  // input to top
);
  timeunit 1ns/1ns;

  // generate stimulus
  initial begin
  	$timeformat(-9, 0, "ns", 6);  // nanoseconds, no precision, 6 columns
  	$display();
  	a = 0; b = 1; c = 2;
  	@(negedge clk2) ;
    repeat (3) begin
      a++;
      @(negedge clk2) #2 check_results;
    end
  	$display();
    #1 $finish;
  end

  // verify results
  task check_results;
    $write("At %t: a=%d  b=%d  c=%d:  ", $time, a, b, c);
    $write("EXPECT: out = %d, ACTUAL: %d ", out_f(), out);
    if (out === out_f()) $display(" OK");
    else                 $display(" ERROR!");
  endtask

  function [N-1:0] out_f;
    return (a * b) * c;
  endfunction
endmodule: test
`end_keywords

`begin_keywords "1800-2012"
module top;
  timeunit 1ns/1ns;
  parameter N = 4;

  logic         clk1, clk2;
  logic         en1, en2;
  logic [N-1:0] a, b, c;
  logic [N-1:0] out;

  test            #(.N(N)) test (.*);
  latch_pipeline  #(.N(N)) dut  (.*);

  initial begin
    clk1 <= 0;
    clk2 <= 0;
    fork
      forever #5 clk1 = ~clk1;
      #2 forever #5 clk2 = ~clk2;
    join
  end
endmodule: top
`end_keywords

