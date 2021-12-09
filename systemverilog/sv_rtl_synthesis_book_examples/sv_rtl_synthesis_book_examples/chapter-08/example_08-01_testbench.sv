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
(output logic        rstN,  // input to counter
 input  logic  [0:3] cnt,   // outputs from counter
 input  logic        clk    // from top module
);
  timeunit 1ns; timeprecision 1ns;

  initial begin // input stimulus
      $display("\nNO SELF CHECKING -- VISUALLY VERIFY JOHNSON COUNT PATTERN");
    rstN = 1'b1;
    repeat (2) @(negedge clk) ;           // let simulation stablilize
      $display("\nTesting reset, should not shift ...");
      rstN = 1'b0;                        // assert reset
    repeat (5) @(posedge clk) ;           // run 5 clk cycles
    @(negedge clk)
      rstN = 1'b1;                        // de-assert reset
      $display("\nTesting shift ...");
    repeat (12) @(posedge clk) ;          // run 12 clk cycles
    @(negedge clk) $finish;               // exit simulation
  end

  initial begin  // text output)
    forever @(posedge clk)
      $strobe("cnt[0:3] = %b", cnt);
  end

endmodule: test
//`end_keywords

//`begin_keywords "1800-2012"
module top;
  timeunit 1ns; timeprecision 1ns;
  parameter N = 4;

  logic       clk, rstN;
  logic [0:3] cnt;

  test      test (.*);
  jcounter  dut  (.*);

  initial begin
    clk <= 0;
    forever #5 clk = ~clk;
  end
endmodule: top
//`end_keywords

