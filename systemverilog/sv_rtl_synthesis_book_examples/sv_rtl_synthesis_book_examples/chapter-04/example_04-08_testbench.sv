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
  (input  logic          test_clk,
   output logic          load_en,
   output logic          rstN,
   output data_t         op_a,
   output data_t         op_b,
   output op_t           opcode,
   output operand_type_t op_type,
   output logic [4:0]    write_pointer,
   output logic [4:0]    read_pointer,
   input  instruction_t  iw
  );

  timeunit 1ns; timeprecision 1ns;

  int seed = 555;

  initial begin
    $display("\nReseting the instruction register...");
    write_pointer  = 5'h00;           // initialize write pointer
    read_pointer   = 5'h1F;           // initialize read pointer
    load_en        = 1'b0;            // initialize load control line
    rstN          <= 1'b0;            // assert rstN (active low)
    repeat (2) @(posedge test_clk) ;  // hold in reset for 2 clk cycles
    rstN           = 1'b1;            // deassert reset_n (active low)

    $display("\nWriting values to register stack...");
    op_type     = SIGNED;
    op_a.s_data =  3;
    op_b.s_data = -5;
    opcode      = ADD;
    load_en     = 1'b1;  // enable writing to register
    @(posedge test_clk) ;
    for (int i=0; i<=2; i++) begin
      write_pointer = i;
      $display("Writing to register location %0d: ", write_pointer);
      $display("  opcode = %0d (%s)", opcode, opcode.name);
      $display("  op_type = %0d (%s)", op_type, op_type.name);
      if (op_type == SIGNED) begin
        $display("  op_a.s_data = %0d",   op_a.s_data);
        $display("  op_b.s_data = %0d\n", op_b.s_data);
      end else begin
        $display("  op_a.s_data = %0d",   op_a.u_data);
        $display("  op_b.s_data = %0d\n", op_b.u_data);
      end
      @(negedge test_clk) ;
      op_a++;
      op_b--;
      opcode = op_t'(opcode + 1);
      op_type = op_type.next;
    end
    load_en = 1'b0;  // turn-off writing to register

    // read back and display same three register locations
    $display("\nReading back the same register locations written...");
    for (int i=0; i<=2; i++) begin
      @(posedge test_clk) read_pointer = i;
      @(negedge test_clk) ;
      $display("Read from register location %0d: ", read_pointer);
      $display("  iw.opcode = %0d (%s)", iw.opcode, iw.opcode.name);
      $display("  iw.op_type = %0d (%s)", iw.op_type, iw.op_type.name);
      if (iw.op_type == SIGNED) begin
        $display("  iw.op_a.s_data = %0d",   iw.op_a.s_data);
        $display("  iw.op_b.s_data = %0d\n", iw.op_b.s_data);
      end else begin
        $display("  iw.op_a.s_data = %0d",   iw.op_a.u_data);
        $display("  iw.op_b.s_data = %0d\n", iw.op_b.u_data);
      end
    end
    @(posedge test_clk) $finish;
  end
endmodule: test

module top;
  timeunit 1ns; timeprecision 1ns;

  import definitions_pkg::*;

  logic          clk;
  logic          test_clk;
  logic          rstN;
  logic          load_en;
  logic          reset_n;
  op_t           opcode;
  operand_type_t op_type;
  data_t         op_a, op_b;
  logic [4:0]    write_pointer, read_pointer;
  instruction_t  iw;

  test                 test (.*);
  instruction_register dut  (.*);

  initial begin
    clk <= 0;
    forever #5  clk = ~clk;
  end

  initial begin
    test_clk <=0;
    // offset test_clk edges from clk to prevent races between
    // the testbench and the design
    #4 forever begin
      #2ns test_clk = 1'b1;
      #8ns test_clk = 1'b0;
    end
  end
endmodule: top
//`end_keywords


