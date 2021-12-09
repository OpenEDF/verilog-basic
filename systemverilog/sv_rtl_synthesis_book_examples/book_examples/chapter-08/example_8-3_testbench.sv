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
//ALIASES FOR INTERNAL SIGNAL NAMES -- MODIFY TO MATCH YOUR MODEL !!!!
//      alais    internal name
//      -----    -----------------
`define STATE    top.dut.state
`define C_RST    top.dut.cntr_rstN
`define S_ENA    top.dut.shift_en
`define COUNT    top.dut.downcount


module test
(input  logic [7:0] parallel_out,        // from DUT
 input  logic       ready,               // from DUT
 input  logic       clock,               // from top
 output logic       serial_in, resetN);  // to DUT

  timeunit 1ns/1ns;

  int          i, n;
  logic  [7:0] test_data;
  bit   [(12*8):1] message_string;     // can hold 12 8-bit ASCII characters
  event        start_StrobedMonitor, start_AsciiMonitor;

  task DisplayHeader;
    $display("                       OUTPUTS           INPUTS             INTERNAL       ");
    $display("                 parallel_out ready  s_in clk rstN  state c_rst s_ena count");
    $display("                 ==================  =============  =======================");
  endtask

  task AssertresetN;
    serial_in = 1'b1;
    resetN = 1'b0;                          // assert resetN
    repeat (4) @(negedge clock) ;
    resetN = 1'b1;                          // de-assert resetN
  endtask

  task TestresetN;
    serial_in = 1'b0;                       // assert start bit
    resetN = 1'b0;                          // assert resetN
    repeat (4) @(negedge clock) ;
    resetN = 1'b1;                          // de-assert resetN
    #1 serial_in = 1'b1;	                  // de-assert start bit
  endtask

  task SendWord (input logic [7:0] data);
    @(negedge clock) serial_in = 1'b0;      // assert start bit
    for (int i=0; i<=7; i=i+1)
      @(negedge clock) serial_in = data[i]; // send 1-bit of data
    @(negedge clock) serial_in = 1'b1;      // done, deassert start bit
  endtask

  task VerifyOutputs
  (input logic [7:0] expected_dout,
   input logic       expected_drdy
  );
    if ({parallel_out, ready} !== {expected_dout, expected_drdy}) 
      $display("ERROR! EXPECTED: %b     %b", expected_dout, expected_drdy);
    else
      $display("Test Passed!");
  endtask

  initial begin: input_stimulus
    #1
    $display("\nTest SPI resetN");
    $display("---------------------------------------------------------------------------");
    DisplayHeader;                       // call subroutine to print output header
    AssertresetN;
    #1 VerifyOutputs(8'h00,1'b0);        // expected values after resetN

    $display("\nTest SPI WAITE state");
    $display("---------------------------------------------------------------------------");
    DisplayHeader;
    repeat (4) @(negedge clock) ;        // run 4 clock cycles
    #1 VerifyOutputs(8'h00,1'b0);        // expected values in wait state (after resetN)

    $display("\nTest receiving 1 byte of 8'b11001010");
    $display("---------------------------------------------------------------------------");
    DisplayHeader;
    test_data = 8'hCA;
    SendWord(test_data);
    #1 VerifyOutputs(test_data,1'b1);    // expected values after receiving parallel_out

    $display("\nTest wait in WAITE state");
    $display("---------------------------------------------------------------------------");
    DisplayHeader;
    repeat(3) @(negedge clock) ;
    #1 VerifyOutputs(test_data,1'b0);    // expected values in wait state

    @(negedge clock)
    $display("\n\nEnd of Tests!!!\n");
    $finish;
  end: input_stimulus

  initial begin: StrobedMonitor
    $timeformat(-9, 0, " ns", 9);
    forever @(negedge clock)
      $strobe("At %t:      %b     %b      %b   %b    %b    %b    %b     %b    %b",
              $realtime, parallel_out, ready, serial_in, clock, resetN,
              `STATE, `C_RST, `S_ENA, `COUNT);
  end: StrobedMonitor

endmodule: test

`end_keywords

`begin_keywords "1800-2012"
module top;
  timeunit 1ns/1ns;
  logic [7:0] parallel_out;              // from DUT
  logic       ready;          // from DUT
  logic       serial_in, resetN;  // to DUT
  logic       clock;             // from top

  simple_spi dut  (.*);  // connect top-level signals to ports with same name
  test       test (.*);  // connect top-level signals to ports with same name

  // clock generators
  initial begin
    clock <= 1'b1;
    forever #5 clock = ~clock;
  end

endmodule: top
`end_keywords

