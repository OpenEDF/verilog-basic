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
(output logic [ 7:0] data_in,      // operation data
 output logic [11:0] instruction,  // operation instruction
 output logic        clk,          // clock for all registers
 output logic        rstN,         // aynchronous reset, active low
 input  logic [ 7:0] data_out,     // operation result, registered
 input  logic        data_rdy      // operation complete flag
);
  timeunit 1ns/1ns;

  initial begin
    $display ("\n\n*** No results expected ***");
    $display ("*** Only testing that the dut compiles and elaborates ***\n\n");
    #5 ;
    $finish;
  end

endmodule: test

module top;
  timeunit 1ns/1ns;

  logic [ 7:0] data_in;
  logic [11:0] instruction;
  logic        clk;
  logic        rstN;
  logic [ 7:0] data_out;
  logic        data_rdy;
  logic [ 3:0] opcode;
  logic [ 7:0] i_data;
  logic [ 7:0] a_data;
  logic [ 7:0] b_data;
  logic [ 7:0] result;
  logic        setN;
  logic        data_sel;
  logic        load_b;
  logic        load_s;
  logic        load_d;
  logic        xbit;
  logic        error;
  logic        zbit;
  logic        zero;
  logic        branch;
  logic        branching;
  logic        done;

  test      test (.*);
  processor dut  (.*);

endmodule: top
`end_keywords


