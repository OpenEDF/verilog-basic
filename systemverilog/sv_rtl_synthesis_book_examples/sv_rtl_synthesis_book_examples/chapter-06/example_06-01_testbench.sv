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
#(parameter N = 4)           // bus size
(output logic         sel,   // input to DUT
 output logic [N-1:0] a, b,  // input to DUT
 input  logic [N-1:0] y,     // output from DUT
 input  logic         clk    // testbench clk
);
  timeunit 1ns; timeprecision 1ns;

  // generate stimulus
  initial begin
  	$timeformat(-9, 0, "ns", 6);  // nanoseconds, no precision, 6 columns
    repeat (3) begin
      @(negedge clk) ;
      void'(std::randomize(a));
      void'(std::randomize(b));
      void'(std::randomize(sel));
      @(negedge clk) check_results;
    end
    @(negedge clk) $finish;
  end

  // verify results
  task check_results;
    $write("At %t: a=%h  b=%h  sel=%h:  ", $time, a, b, sel);
    case (sel)
      0: begin
      	   $write("EXPECT: y = %h, ACTUAL: %h ", b, y);
      	   if (y === b) $display(" OK");
      	   else         $display(" ERROR!");
      	 end
      1: begin
      	   $write("EXPECT: y = %h, ACTUAL: %h ", a, y);
      	   if (y === a) $display(" OK");
      	   else         $display(" ERROR!");
      	 end
    endcase
  endtask

endmodule: test
//`end_keywords

//`begin_keywords "1800-2012"
module top;
  timeunit 1ns; timeprecision 1ns;
  parameter N = 4;

  logic         clk;
  logic         sel;
  logic [N-1:0] a, b;
  logic [N-1:0] y;

  test     #(.N(N)) test (.*);
  mux2to1  #(.N(N)) dut  (.*);

  initial begin
    clk <= 0;
    forever #5 clk = ~clk;
  end
endmodule: top
//`end_keywords

