/**********************************************************************
 * Netlist with named port connections (Verilog style)
 *
 * Author: Stuart Sutherland
 *
 * (c) Copyright 2003, Sutherland HDL, Inc. *** ALL RIGHTS RESERVED ***
 * www.sutherland-hdl.com
 *
 * Used with permission in the book, "SystemVerilog for Design"
 *  By Stuart Sutherland, Simon Davidmann, and Peter Flake.
 *  Book copyright: 2003, Kluwer Academic Publishers, Norwell, MA, USA
 *  www.wkap.il, ISBN: 0-4020-7530-8
 *
 * Revision History:
 *   1.00 15 Dec 2003 -- original code, as included in book
 *   1.01 10 Jul 2004 -- cleaned up comments, added expected results
 *                       to output messages
 *
 * Caveat: Expected results displayed for this code example are based
 * on an interpretation of the SystemVerilog 3.1 standard by the code
 * author or authors.  At the time of writing, official SystemVerilog
 * validation suites were not available to validate the example.
 *
 * RIGHT TO USE: This code example, or any portion thereof, may be
 * used and distributed without restriction, provided that this entire
 * comment block is included with the example.
 *
 * DISCLAIMER: THIS CODE EXAMPLE IS PROVIDED "AS IS" WITHOUT WARRANTY
 * OF ANY KIND, EITHER EXPRESS OR IMPLIED, INCLUDING, BUT NOT LIMITED
 * TO WARRANTIES OF MERCHANTABILITY, FITNESS OR CORRECTNESS. IN NO
 * EVENT SHALL THE AUTHOR OR AUTHORS BE LIABLE FOR ANY DAMAGES,
 * INCLUDING INCIDENTAL OR CONSEQUENTIAL DAMAGES, ARISING OUT OF THE
 * USE OF THIS CODE.
 *********************************************************************/

module miniPIC (
    inout  wire [7:0] port_a_pins,
    inout  wire [7:0] port_b_pins,
    inout  wire [7:0] port_c_pins,
    input  wire       clk,
    input  wire       resetN
  );

  initial begin
    $display("\nNo simulation results--only checking that example compiles and elaborates\n");
    $finish;
  end

  wire [11:0] instruct_reg, program_data;
  wire [10:0] program_counter, program_address;
  wire [ 7:0] tmr0_reg, status_reg, fsr_reg, w_reg, option_reg,
              reg_file_out, port_a, port_b, port_c, trisa,
              trisb, trisc, data_bus, alu_a, alu_b;
  wire [ 6:0] reg_file_addr;
  wire [ 3:0] alu_opcode;
  wire [ 1:0] alu_a_sel, alu_b_sel;
  wire        reg_file_sel, special_reg_sel, reg_file_enable,
              w_reg_enable, zero_enable, carry_enable, skip,
              isoption, istris, polarity, carry, zero;

  pc_stack pcs (  // module instance with named port connections
    .program_counter(program_counter),
    .program_address(program_address),
    .clk(clk),
    .resetN(resetN),
    .instruct_reg(instruct_reg),
    .data_bus(data_bus),
    .status_reg(status_reg)
  );

  prom prom (
    .dout(program_data),
    .clk(clk),
    .address(program_address)
  );

  instruction_decode decoder (
    .alu_opcode(alu_opcode),
    .alu_a_sel(alu_a_sel),
    .alu_b_sel(alu_b_sel),
    .w_reg_enable(w_reg_enable),
    .reg_file_sel(reg_file_sel),
    .zero_enable(zero_enable),
    .carry_enable(carry_enable),
    .polarity(polarity),
    .option(isoption),
    .tris(istris),
    .instruct_reg(instruct_reg)
  );

  register_files regs (
    .dout(reg_file_out),
    .tmr0_reg(tmr0_reg),
    .status_reg(status_reg),
    .fsr_reg(fsr_reg),
    .port_a(port_a),
    .port_b(port_b),
    .port_c(port_c),
    .trisa(trisa),
    .trisb(trisb),
    .trisc(trisc),
    .option_reg(option_reg),
    .w_reg(w_reg),
    .instruct_reg(instruct_reg),
    .program_data(program_data),
    .port_a_pins(port_a_pins),
    .data_bus(data_bus),
    .address(reg_file_addr),
    .clk(clk),
    .resetN(resetN),
    .skip(skip),
    .reg_file_sel(reg_file_sel),
    .zero_enable(zero_enable),
    .carry_enable(carry_enable),
    .w_reg_enable(w_reg_enable),
    .reg_file_enable(reg_file_enable),
    .zero(zero),
    .carry(carry),
    .special_reg_sel(special_reg_sel),
    .isoption(isoption),
    .istris(istris)
  );

  alu alu  (
    .y(data_bus),
    .carry_out(carry),
    .zero_out(zero),
    .a(alu_a),
    .b(alu_b),
    .opcode(alu_opcode),
    .carry_in(status_reg[0])
  );

  glue_logic glue (
    .port_b_pins(port_b_pins),
    .port_c_pins(port_c_pins),
    .alu_a(alu_a),
    .alu_b(alu_b),
    .reg_file_addr(reg_file_addr),
    .reg_file_enable(reg_file_enable),
    .special_reg_sel(special_reg_sel),
    .skip(skip),
    .instruct_reg(instruct_reg),
    .program_counter(program_counter),
    .port_a(port_a),
    .port_b(port_b),
    .port_c(port_c),
    .data_bus(data_bus),
    .fsr_reg(fsr_reg),
    .tmr0_reg(tmr0_reg),
    .status_reg(status_reg),
    .w_reg(w_reg),
    .reg_file_out(reg_file_out),
    .alu_a_sel(alu_a_sel),
    .alu_b_sel(alu_b_sel),
    .reg_file_sel(reg_file_sel),
    .polarity(polarity),
    .zero(zero)
  );

endmodule

// stubs of the sub modules

module alu (
    output reg  [ 7:0] y,
    output reg         carry_out,
    output reg         zero_out,
    input       [ 7:0] a,
    input       [ 7:0] b,
    input       [ 3:0] opcode,
    input              carry_in
  );
endmodule

module glue_logic (
    output reg  [ 7:0] port_b_pins,
    output reg  [ 7:0] port_c_pins,
    output reg  [7:0]  alu_a,
    output reg  [7:0]  alu_b,
    output reg  [ 6:0] reg_file_addr,
    output reg         reg_file_enable,
    output reg         special_reg_sel,
    output reg         skip,
    input       [11:0] instruct_reg,
    input       [10:0] program_counter,
    input       [ 7:0] port_a,
    input       [ 7:0] port_b,
    input       [ 7:0] port_c,
    input       [ 7:0] data_bus,
    input       [ 7:0] fsr_reg,
    input       [ 7:0] tmr0_reg,
    input       [ 7:0] status_reg,
    input       [ 7:0] w_reg,
    input       [ 7:0] reg_file_out,
    input       [ 1:0] alu_a_sel,
    input       [ 1:0] alu_b_sel,
    input              reg_file_sel,
    input              polarity,
    input              zero
  );
endmodule

module instruction_decode (
    output wire [ 3:0] alu_opcode,
    output wire [ 1:0] alu_a_sel,
    output wire [ 1:0] alu_b_sel,
    output wire        w_reg_enable,
    output wire        reg_file_sel,
    output wire        zero_enable,
    output wire        carry_enable,
    output wire        polarity,
    output wire        option,
    output wire        tris,
    input  wire [11:0] instruct_reg
  );
endmodule

module pc_stack (
    output reg [10:0] program_counter,
    output reg [10:0] program_address,
    input             clk,
    input             resetN,
    input      [11:0] instruct_reg,
    input      [ 7:0] data_bus,
    input      [ 7:0] status_reg
  );
endmodule

module prom (
    output wire [11:0] dout,
    input              clk,
    input       [10:0] address
  );
endmodule

module register_files (
    output wire [ 7:0] dout,
    output reg  [ 7:0] tmr0_reg,
    output reg  [ 7:0] status_reg,
    output reg  [ 7:0] fsr_reg,
    output reg  [ 7:0] port_a,
    output reg  [ 7:0] port_b,
    output reg  [ 7:0] port_c,
    output reg  [ 7:0] trisa,
    output reg  [ 7:0] trisb,
    output reg  [ 7:0] trisc,
    output reg  [ 7:0] option_reg,
    output reg  [ 7:0] w_reg,
    output reg  [11:0] instruct_reg,
    input       [11:0] program_data,
    input       [ 7:0] port_a_pins,
    input       [ 7:0] data_bus,
    input       [ 6:0] address,
    input              clk,
    input              resetN,
    input              skip,
    input              reg_file_sel,
    input              zero_enable,
    input              carry_enable,
    input              w_reg_enable,
    input              reg_file_enable,
    input              zero,
    input              carry,
    input              special_reg_sel,
    input              isoption,
    input              istris
  );
endmodule

