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
#(parameter N = 4)           // bus size
(input                clock, 
 output logic [N-1:0] a, b, c,   // input to DUT
 output logic [  1:0] factor,    // input to DUT
 input  logic [N-1:0] out        // output from DUT
);
  timeunit 1ns/1ns;

  // generate stimulus
  initial begin
  	$timeformat(-9, 0, "ns", 6);  // nanoseconds, no precision, 6 columns
    repeat (3) begin
      @(negedge clock) ;
      void'(std::randomize(a));
      void'(std::randomize(b));
      void'(std::randomize(c));
      void'(std::randomize(factor));
      @(negedge clock) check_results;
    end
    @(negedge clock) $finish;
  end

  // verify results
  task check_results;
    $write("At %t: a=%0d  b=%0d  c=%0d  factor=%0d:  ", $time, a, b, c, factor);
    $write("EXPECT: out = %0d, ACTUAL: %0d ", out_f(), out);
    if (out_f() === out) $display(" OK");
    else                 $display(" ERROR!");
  endtask
  
  function [N-1:0] out_f;
    return ( ((a + b) * factor) - c );
  endfunction

endmodule: test
`end_keywords

`begin_keywords "1800-2012"
module top;
  timeunit 1ns/1ns;
  parameter N = 4;

  logic         clock;
  logic [N-1:0] a, b, c;
  logic [  1:0] factor;
  logic [N-1:0] out;

  test      #(.N(N)) test (.*);
  dataflow  #(.N(N)) dut  (.*);

  initial begin
    clock <= 0;
    forever #5 clock = ~clock;
  end
endmodule: top
`end_keywords

