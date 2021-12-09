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
#(parameter N = 1)                     // bus size
(output logic         resetN, enable,  // inputs to DUT
 output logic [N-1:0] d,               // input to DUT
 input  logic [N-1:0] q,               // output from DUT
 input  logic         clock            // input from top
);
  timeunit 1ns/1ns;

  logic [N-1:0] d_previous;  // previous value of d input
  // generate stimulus
  initial begin
  	$timeformat(-9, 0, "ns", 6);  // nanoseconds, no precision, 6 columns
    @(negedge clock) ;
  	resetN = 1'b1;  // reset off (active low)
  	enable = 1'b1;  // enable on (active high)
    d = 1;
    d_previous = d;
    @(negedge clock) check_results;

  	resetN = 1'b0;  // reset on (active low)
  	enable = 1'b1;  // enable on (active high)
    @(negedge clock) check_results;

  	resetN = 1'b1;  // reset off (active low)
  	enable = 1'b1;  // enable on (active high)
    @(negedge clock) check_results;

  	resetN = 1'b1;  // reset off (active low)
  	enable = 1'b0;  // enable off (active high)
  	d = 0;
    @(negedge clock) check_results;

    @(negedge clock) $finish;
  end

  // verify results
  task check_results;
    $write("At %t: resetN=%b  enable=%b  d=%h:  ", $time, resetN, enable, d);
    $write("EXPECT: q = %h, ACTUAL: %h ", q_f(resetN, enable, d), q);
    if (q === q_f(resetN, enable, d)) $display(" OK");
    else                              $display(" ERROR!");
  endtask
  
  function [N-1:0] q_f(resetN, enable, [N-1:0] d);
    case ({resetN,enable})
    	2'b00: return '0;
    	2'b01: return '0;
    	2'b10: return  d_previous;
    	2'b11: return  d;
    endcase
  endfunction

endmodule: test
`end_keywords

`begin_keywords "1800-2012"
module top;
  timeunit 1ns/1ns;

  parameter N = 1;  // word size
  logic         clock, resetN, enable;
  logic [N-1:0] d;
  logic [N-1:0] q;

  test       #(.N(N))  test (.*);
  enable_ff  #(.N(N))  dut  (.*);

  initial begin
    clock <= 0;
    forever #5 clock = ~clock;
  end
endmodule: top
`end_keywords

