//
// Book, "RTL Modeling with SystemVerilog for Simulation and Synthesis"
// by Stuart Sutherland, published by Sutherland HDL, Inc.
//
// Testbench for an RTL model of a 32-bit adder/subtractor
//
// Copyright 2017, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//
//`begin_keywords "1800-2012"
module test
(output logic [31:0] a, b,
 output logic        mode,
 input  logic [31:0] sum,
 input  logic        clk
);
  timeunit 1ns; timeprecision 1ns;

  // generate stimulus
  initial begin
    repeat (10) begin
      @(negedge clk) ;
      void'(std::randomize(a) with {a >= 10; a <= 20;});
      void'(std::randomize(b) with {b <= 10;});
      void'(std::randomize(mode));
      @(negedge clk) check_results;
    end
    @(negedge clk) $finish;
  end

  // verify results
  task check_results;
    $display("At %0d: \t a=%0d  b=%0d  mode=%b  sum=%0d",
             $time, a, b, mode, sum);
    case (mode)
      1'b0: if (sum !== a + b) $error("expected sum = %0d", a + b);
      1'b1: if (sum !== a - b) $error("expected sum = %0d", a - b);
    endcase
  endtask
      
endmodule: test
//`end_keywords



