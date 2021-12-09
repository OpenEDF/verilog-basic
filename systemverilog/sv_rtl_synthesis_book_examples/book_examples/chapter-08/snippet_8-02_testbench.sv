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
#(parameter N=1)
(output logic [N-1:0] d,     // input to DUT
 input  logic [N-1:0] q,     // outputs from DUT
 input  logic         clock  // from top module
);
  timeunit 1ns/1ns;

  initial begin // input stimulus
    d = 8'h1;
    @(posedge clock);
    @(negedge clock);
    $write("\n d=%0d  q=%0d (expect %0d)", d, q, d);
    if (q === d) $display(" -- OK \n");
    else         $display(" -- ERROR! \n");
    $finish;
  end

endmodule: test
`end_keywords

`begin_keywords "1800-2012"
module top;
  timeunit 1ns/1ns;
  parameter N = 4;

  logic         clock;
  logic [N-1:0] d, q;

  test         #(.N(N)) test (.*);
  ff_no_reset  #(.N(N)) dut  (.*);

  initial begin
    clock <= 0;
    forever #5 clock = ~clock;
  end
endmodule: top
`end_keywords

