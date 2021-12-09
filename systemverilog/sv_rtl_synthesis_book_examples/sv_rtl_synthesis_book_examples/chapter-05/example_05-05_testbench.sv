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
 import definitions_pkg::*;
#(parameter N = 8)
(output logic [N-1:0] a, b,
 output mode_t        mode,
 input  logic [N-1:0] result,
 input  logic         clk
);
  timeunit 1ns; timeprecision 1ns;

  // generate stimulus
  initial begin
  	$timeformat(-9, 0, "ns", 6);  // nanoseconds, no precision, 6 columns
    repeat (10) begin
      @(negedge clk) ;
      void'(std::randomize(a));
      void'(std::randomize(b));
      void'(std::randomize(mode));
      @(negedge clk) check_results;
    end
    @(negedge clk) $finish;
  end

  // verify results
  task check_results;
    $write("At %t: a=%b  b=%b  mode=%s:  ", $time, a, b, mode.name);
    case (mode)
      AND_OP: begin
      	        $write("EXPECT: result = %b, ACTUAL: %b ", (a & b), result);
      	        if (result === (a & b)) $display(" OK");
      	        else                    $display(" ERROR!");
      	      end
      XOR_OP: begin
      	        $write("EXPECT: result = %b, ACTUAL: %b ", (a ^ b), result);
      	        if (result === (a ^ b)) $display(" OK");
      	        else                    $display(" ERROR!");
      	      end
    endcase
  endtask

endmodule: test
//`end_keywords

//`begin_keywords "1800-2012"
module top;
  timeunit 1ns; timeprecision 1ns;
  import definitions_pkg::*;
  parameter N = 8;

  logic         clk;
  mode_t        mode;
  logic [N-1:0] a, b;
  logic [N-1:0] result;

  test    #(.N(N)) test (.*);
  and_xor #(.N(N)) dut  (.*);

  initial begin
    clk <= 0;
    forever #5 clk = ~clk;
  end
endmodule: top
//`end_keywords

