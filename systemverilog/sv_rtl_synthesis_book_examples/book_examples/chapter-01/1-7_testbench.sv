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

/////////////////////////////////////////////////////////////
// Top module with clock oscillator
/////////////////////////////////////////////////////////////
`begin_keywords "1800-2012"
module top;
  timeunit 1ns/1ns;
  logic       clock;
  logic [7:0] d;
  logic [7:0] q;

  test  i1 (.*);   // connect top module to test module
  d_reg i2 (.*);   // connect top module to d_reg module

  initial begin    // clock oscillator
    clock <= 0;                  // initialize clock at time 0
    forever #5 clock = ~clock;   // toggle clock every 5ns
  end

endmodule: top

/////////////////////////////////////////////////////////////
// Test module with stimulus generator
/////////////////////////////////////////////////////////////
`begin_keywords "1800-2012"
module test (input  logic       clock,
             output logic [7:0] d,
             input  logic [7:0] q
            );
  timeunit 1ns/1ns;

  initial begin
    d = 1;
    #7  d = 2;
    #10 d = 3;
    #10 $finish;
  end

endmodule: test
`end_keywords
