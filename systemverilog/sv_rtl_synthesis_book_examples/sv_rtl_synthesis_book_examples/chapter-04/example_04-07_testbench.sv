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
(output logic         rstN,
 output instruction_t iw,
 input  data_t        alu_out,
 input  logic         clk
);
  timeunit 1ns; timeprecision 1ns;

  data_t        out;
  instruction_t instruction;

  int   error_count;

  initial begin
    rstN <= '0;
    repeat (2) @(negedge clk) ;
    rstN = '1;
    iw.opcode = ADD;
    iw.op_type = SIGNED;
    iw.op_a.s_data = -2;
    iw.op_b.s_data = -2;
    @(negedge clk) ;
    $display("\n out.s_data = %0d (expect -4)", alu_out.s_data);
    if (alu_out.s_data !== -4) error_count++;

    iw.op_type = UNSIGNED;
    @(negedge clk) ;
    $display("\n out.u_data = %0d (expect 12)", alu_out.u_data);
    if (alu_out.u_data !== 12) error_count++; // 12 is 2's comp of -4 in a 4-bit vector

    if (error_count === 0)
      $display("\n%m: *** TEST PASSED ***\n");
    else
      $display("\n%m: *** TEST FAILED ***\n");
    @(negedge clk) ;
    $finish;
  end
endmodule: test

module top;
  timeunit 1ns; timeprecision 1ns;
  import definitions_pkg::*;

  logic         clk, rstN;
  instruction_t iw;
  data_t        alu_out;

  test test (.*);
  alu  dut  (.*);
  
  initial begin
    clk <= '0;
    forever #5 clk = ~clk;
  end
endmodule: top
//`end_keywords


