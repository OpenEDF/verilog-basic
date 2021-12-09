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
(output logic        resetN,  // input to counter
 input  logic  [0:3] cnt,   // outputs from counter
 input  logic        clock    // from top module
);
  timeunit 1ns/1ns;

  initial begin // input stimulus
      $display("\nNO SELF CHECKING -- VISUALLY VERIFY JOHNSON COUNT PATTER");
    resetN = 1'b1;
    repeat (2) @(negedge clock) ;           // let simulation stablilize
      $display("\nTesting reset, should not shift ...");
      resetN = 1'b0;                        // assert reset
    repeat (5) @(posedge clock) ;           // run 5 clock cycles
    @(negedge clock)
      resetN = 1'b1;                        // de-assert reset
      $display("\nTesting shift ...");
    repeat (12) @(posedge clock) ;          // run 12 clock cycles
    @(negedge clock) $finish;               // exit simulation
  end

  initial begin  // text output)
    forever @(posedge clock)
      $strobe("cnt[0:3] = %b", cnt);
  end

endmodule: test
`end_keywords

`begin_keywords "1800-2012"
module top;
  timeunit 1ns/1ns;
  parameter N = 4;

  logic       clock, resetN;
  logic [0:3] cnt;

  test      test (.*);
  jcounter  dut  (.*);

  initial begin
    clock <= 0;
    forever #5 clock = ~clock;
  end
endmodule: top
`end_keywords

