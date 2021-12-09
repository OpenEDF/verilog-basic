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
#(parameter N = 1)                 // bus size
(output logic         rstN, setN,  // inputs to DUT
 output logic [N-1:0] d,           // input to DUT
 input  logic [N-1:0] q,           // output from DUT
 input  logic         clk          // input from top
);
  timeunit 1ns; timeprecision 1ns;

  // generate stimulus
  initial begin
  	$timeformat(-9, 0, "ns", 6);  // nanoseconds, no precision, 6 columns
    @(negedge clk) ;
  	rstN = 1'b1;  // reset off (active low)
  	setN = 1'b1;  // preset off
    void'(std::randomize(d));
    @(negedge clk) check_results;

  	rstN = 1'b0;  // reset on (active low)
  	setN = 1'b0;  // preset also on
    void'(std::randomize(d));
    @(negedge clk) check_results;

  	rstN = 1'b1;  // reset off
  	setN = 1'b0;  // preset still on
    void'(std::randomize(d));
    @(negedge clk) check_results;

    @(negedge clk) $finish;
  end

  // verify results
  task check_results;
    $write("At %t: rstN=%b  setN=%b  d=%h:  ", $time, rstN, setN, d);
    $write("EXPECT: q = %h, ACTUAL: %h ", q_f(rstN, setN, d), q);
    if (q === q_f(rstN, setN, d)) $display(" OK");
    else                          $display(" ERROR!");
  endtask
  
  function [N-1:0] q_f(rstN, setN, [N-1:0] d);
    case ({rstN,setN})
    	2'b00: return '0;
    	2'b01: return '0;
    	2'b10: return '1;
    	2'b11: return  d;
    endcase
  endfunction

endmodule: test
//`end_keywords

//`begin_keywords "1800-2012"
module top;
  timeunit 1ns; timeprecision 1ns;

  parameter N = 8;  // word size
  logic         clk, rstN, setN;
  logic [N-1:0] d;
  logic [N-1:0] q;

  test #(.N(N))  test (.*);
  srff #(.N(N))  dut  (.*);

  initial begin
    clk <= 0;
    forever #5 clk = ~clk;
  end
endmodule: top
//`end_keywords

