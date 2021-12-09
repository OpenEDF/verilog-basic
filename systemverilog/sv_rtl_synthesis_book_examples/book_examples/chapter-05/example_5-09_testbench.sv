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
#(parameter N = 8)               // data size (default 8-bits)
(input  logic        clk,       // clock input
 output logic        rstN,      // active-low asynch reset
 output logic [31:0] address,   // 32-bit input
 input logic         high_addr  // set high-byte all ones
);
  timeunit 1ns/1ns;

  // generate stimulus
  initial begin
  	$timeformat(-9, 0, "ns", 6);  // nanoseconds, no precision, 6 columns
    address = 32'h000000FF;       // start with a lower address
    rstN <= 0;                    // reset DUT (active low)
    repeat(2)  @(negedge clk) ;   // hold reset for 2 clock cycles
    @(negedge clk) check_results;
    rstN = 1;                     // remove reset
    @(negedge clk) ;
    @(negedge clk) check_results;
    @(negedge clk) ;
    address = 32'hFE0000FF;
    @(negedge clk) check_results;
    @(negedge clk) ;
    address = 32'hFF0000FF;
    @(negedge clk) check_results;
    @(negedge clk) $finish;
  end

  // verify results
  task check_results;
    $write("At %t: address = %h:  ", $time, address);
    if (&address[31:24]) begin
      $write("EXPECT: high_addr = 1, ACTUAL: %b ", high_addr);
      if (high_addr === 1'b1) $display(" OK");
      else                    $display(" ERROR!");
    end
    else begin
      $write("EXPECT: high_addr = 0, ACTUAL: %b ", high_addr);
      if (high_addr === 1'b0) $display(" OK");
      else                    $display(" ERROR!");
    end
  endtask
endmodule: test
`end_keywords

`begin_keywords "1800-2012"
module top;
  timeunit 1ns/1ns;

  logic        clk, rstN;
  logic [31:0] address;
  logic        high_addr;

  test               test (.*);
  high_address_check dut  (.*);

  initial begin
    clk <= 0;
    forever #5 clk = ~clk;
  end
endmodule: top
`end_keywords

