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
//ALIASES FOR INTERNAL SIGNAL NAMES -- MODIFY TO MATCH YOUR MODEL !!!!
//      alais    internal name
//      -----    -----------------
`define STATE    top.dut.state
`define C_RST    top.dut.cntr_rstN
`define S_ENA    top.dut.shift_en
`define COUNT    top.dut.downcount


module test
(input  logic [7:0] data,      // from DUT
 input  logic       data_rdy,          // from DUT
 input  logic       clk,               // from top
 output logic       serial_in, rstN);  // to DUT

  timeunit 1ns; timeprecision 1ns;

  int          i, n;
  logic  [7:0] test_data;
  bit   [(12*8):1] message_string;     // can hold 12 8-bit ASCII characters
  event        start_StrobedMonitor, start_AsciiMonitor;

  task DisplayHeader;
    $display("                       OUTPUTS           INPUTS             INTERNAL       ");
    $display("                     data     d_rdy  s_in clk rstN  state c_rst s_ena count");
    $display("                 ==================  =============  =======================");
  endtask

  task AssertrstN;
    serial_in = 1'b1;
    rstN = 1'b0;                          // assert rstN
    repeat (4) @(negedge clk) ;
    rstN = 1'b1;                          // de-assert rstN
  endtask

  task TestrstN;
    serial_in = 1'b0;                     // assert start bit
    rstN = 1'b0;                          // assert rstN
    repeat (4) @(negedge clk) ;
    rstN = 1'b1;                          // de-assert rstN
    #1 serial_in = 1'b1;	                // de-assert start bit
  endtask

  task SendWord (input logic [7:0] data);
    @(negedge clk) serial_in = 1'b0;      // assert start bit
    for (int i=0; i<=7; i=i+1)
      @(negedge clk) serial_in = data[i]; // send 1-bit of data
    @(negedge clk) serial_in = 1'b1;      // done, deassert start bit
  endtask

  task VerifyOutputs
  (input logic [7:0] expected_dout,
   input logic       expected_drdy
  );
    if ({data, data_rdy} !== {expected_dout, expected_drdy}) 
      $display("ERROR! EXPECTED: %b     %b", expected_dout, expected_drdy);
    else
      $display("Test Passed!");
  endtask

  initial begin: input_stimulus
    #1
    $display("\nTest SPI rstN");
    $display("---------------------------------------------------------------------------");
    DisplayHeader;                       // call subroutine to print output header
    AssertrstN;
    #1 VerifyOutputs(8'h00,1'b0);        // expected values after rstN

    $display("\nTest SPI WAITE state");
    $display("---------------------------------------------------------------------------");
    DisplayHeader;
    repeat (4) @(negedge clk) ;          // run 4 clk cycles
    #1 VerifyOutputs(8'h00,1'b0);        // expected values in wait state (after rstN)

    $display("\nTest receiving 1 byte of 8'b11001010");
    $display("---------------------------------------------------------------------------");
    DisplayHeader;
    test_data = 8'hCA;
    SendWord(test_data);
    #1 VerifyOutputs(test_data,1'b1);    // expected values after receiving data

    $display("\nTest wait in WAITE state");
    $display("---------------------------------------------------------------------------");
    DisplayHeader;
    repeat(3) @(negedge clk) ;
    #1 VerifyOutputs(test_data,1'b0);    // expected values in wait state

    @(negedge clk)
    $display("\n\nEnd of Tests!!!\n");
    $finish;
  end: input_stimulus

  initial begin: StrobedMonitor
    $timeformat(-9, 0, " ns", 9);
    forever @(negedge clk)
      $strobe("At %t:      %b     %b      %b   %b    %b    %b    %b     %b    %b",
              $realtime, data, data_rdy, serial_in, clk, rstN,
              `STATE, `C_RST, `S_ENA, `COUNT);
  end: StrobedMonitor

endmodule: test

//`end_keywords

//`begin_keywords "1800-2012"
module top;
  timeunit 1ns; timeprecision 1ns;
  logic [7:0] data;     // from DUT
  logic       data_rdy;         // from DUT
  logic       serial_in, rstN;  // to DUT
  logic       clk;              // from top

  simple_spi dut  (.*);  // connect top-level signals to ports with same name
  test       test (.*);  // connect top-level signals to ports with same name

  // clk generators
  initial begin
    clk <= 1'b1;
    forever #5 clk = ~clk;
  end

endmodule: top
//`end_keywords

