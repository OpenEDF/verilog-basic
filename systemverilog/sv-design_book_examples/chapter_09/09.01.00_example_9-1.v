/**********************************************************************
 * Verilog netlist with discrete signals as module interconnections
 *
 * NOTE: The modules in this example do not contain functionality.
 * The purpose of the example is to illustrate connections between
 * module instances.
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

`default_nettype none  // turn off implicit net declarations

module top (input wire clock, resetN, test_mode);
  wire [15:0] data, address, program_address, jump_address;
  wire [ 7:0] instruction, next_instruction;
  wire [ 3:0] slave_instruction;
  wire        slave_request, slave_ready;
  wire        bus_request, bus_grant;
  wire        mem_read, mem_write;
  wire        data_ready;

  initial begin
    $display("\nNo simulation results--just checking that example compiles and elaborates\n");
    $finish;
  end

  processor proc1 (
    // main_bus ports
    .data(data),
    .address(address),
    .slave_instruction(slave_instruction),
    .slave_request(slave_request),
    .bus_grant(bus_grant),
    .mem_read(mem_read),
    .mem_write(mem_write),
    .bus_request(bus_request),
    .slave_ready(slave_ready),
    // other ports
    .jump_address(jump_address),
    .instruction(instruction),
    .clock(clock),
    .resetN(resetN),
    .test_mode(test_mode)
  );

  slave slave1 (
    // main_bus ports
    .data(data),
    .address(address),
    .bus_request(bus_request),
    .slave_ready(slave_ready),
    .mem_read(mem_read),
    .mem_write(mem_write),
    .slave_instruction(slave_instruction),
    .slave_request(slave_request),
    .bus_grant(bus_grant),
    .data_ready(data_ready),
    // other ports
    .clock(clock),
    .resetN(resetN)
  );

  instruction_reg ir (
    // main_bus ports
    // other ports
    .program_address(program_address),
    .instruction(instruction),
    .jump_address(jump_address),
    .next_instruction(next_instruction),
    .clock(clock),
    .resetN(resetN)
  );


  dual_port_ram ram (
    // main_bus ports
    .data(data),
    .data_ready(data_ready),
    .address(address),
    .mem_read(mem_read),
    .mem_write(mem_write),
    // other ports
    .program_address(program_address),
    .data_b(next_instruction)
  );

    test_generator test_gen(
    // main_bus ports
    .data(data),
    .address(address),
    .mem_read(mem_read),
    .mem_write(mem_write),
    // other ports
    .clock(clock),
    .resetN(resetN),
    .test_mode(test_mode)
  );
endmodule


module processor (
    // main_bus ports
    inout  wire [15:0] data,
    output reg  [15:0] address,
    output reg  [ 3:0] slave_instruction,
    output reg         slave_request,
    output reg         bus_grant,
    output wire        mem_read,
    output wire        mem_write,
    input  wire        bus_request,
    input  wire        slave_ready,
    // other ports
    output reg  [15:0] jump_address,
    input  wire [ 7:0] instruction,
    input  wire        clock,
    input  wire        resetN,
    input  wire        test_mode
  );
  //...  // module functionality code
endmodule


module slave (
    // main_bus ports
    inout  wire [15:0] data,
    inout  wire [15:0] address,
    output reg         bus_request,
    output reg         slave_ready,
    output wire        mem_read,
    output wire        mem_write,
    input  wire [ 3:0] slave_instruction,
    input  wire        slave_request,
    input  wire        bus_grant,
    input  wire        data_ready,
    // other ports
    input  wire        clock,
    input  wire        resetN
  );
  //...  // module functionality code
endmodule


module dual_port_ram (
    // main_bus ports
    inout  wire [15:0] data,
    output wire        data_ready,
    input  wire [15:0] address,
    input  tri0        mem_read,
    input  tri0        mem_write,
    // other ports
    input  wire [15:0] program_address,
    output reg  [ 7:0] data_b
  );
  //...  // module functionality code
endmodule


module instruction_reg (
    // main_bus ports
    // other ports
    output reg  [15:0] program_address,
    output reg  [ 7:0] instruction,
    input  wire [15:0] jump_address,
    input  wire [ 7:0] next_instruction,
    input  wire        clock,
    input  wire        resetN
  );
  //...  // module functionality code
endmodule

module test_generator (
    // main_bus ports
    output wire [15:0] data,
    output reg  [15:0] address,
    output reg         mem_read,
    output reg         mem_write,
    // other ports
    input  wire        clock,
    input  wire        resetN,
    input  wire        test_mode
  );
  //...  // module functionality code
endmodule
