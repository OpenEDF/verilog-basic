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
 import definitions_pkg::*;
(output instr_t iw,
 input  data_t  alu_out
);
  timeunit 1ns/1ns;

  data_t out;
  instr_t instruction;

  int   error_count;

  initial begin
    iw.opcode = SR;
    iw.op_type = SIGNED;
    iw.op_a.s_data = -8;
    iw.op_b.s_data = 2;
    #1 $display("\n out.s_data = %0d (expect -2)", alu_out.s_data);
    if (alu_out.s_data !== -2) error_count++;

    iw.op_type = UNSIGNED;
    #1 $display("\n out.u_data = %0d (expect 1073741822)", alu_out.u_data);
    if (alu_out.u_data !== 1073741822) error_count++;

    if (error_count === 0)
      $display("\n%m: *** TEST PASSED ***\n");
    else
      $display("\n%m: *** TEST FAILED ***\n");
    #1 $finish;
  end
endmodule: test

module top;
  timeunit 1ns/1ns;
  import definitions_pkg::*;

  instr_t iw;
  data_t  alu_out;

  test test (.*);
  alu  dut  (.*);
endmodule: top
`end_keywords


