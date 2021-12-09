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
#(parameter N = 4)            // bus size
(output logic [N-1:0] a, b,   // input to DUT
 input  logic [N-1:0] out,    // output from DUT
 input  logic         clk     // testbench clock
);
  timeunit 1ns/1ns;

  // generate stimulus
  initial begin
  	$timeformat(-9, 0, "ns", 6);  // nanoseconds, no precision, 6 columns
    repeat (3) begin
      @(negedge clk) ;
      void'(std::randomize(a));
      void'(std::randomize(b));
      void'(std::randomize(b));
      @(negedge clk) check_results;
    end
    @(negedge clk) $finish;
  end

  // verify results
  task check_results;
    $write("At %t: a=%b  b=%b  ", $time, a, b);
    $write("EXPECT: out=%b, ACTUAL: %b ", xor_f(), out);
    if (out === xor_f()) $display(" OK");
    else                 $display(" ERROR!");
  endtask
  
  function [N-1:0] xor_f();
    logic [N-1:0] tmp;
    tmp = { << {b}}; // reverse bit order of b);
    xor_f = a ^ tmp;
  endfunction

endmodule: test
`end_keywords

`begin_keywords "1800-2012"
module top;
  timeunit 1ns/1ns;

  parameter N = 4;   // bus size
  logic [N-1:0] a, b;
  logic [N-1:0] out;
  logic         clk;  // testbench clock

  test    #(.N(N))  test (.*);
  bus_xor #(.N(N))  dut  (.*);

  initial begin
    clk <= 0;
    forever #5 clk = ~clk;
  end
endmodule: top
`end_keywords

