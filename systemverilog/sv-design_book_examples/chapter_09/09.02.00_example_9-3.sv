/**********************************************************************
 * Interface with external inputs (ports)
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

interface main_bus (input wire clock, resetN, test_mode);
  wire  [15:0] data, address;
  logic [ 7:0] slave_instruction;
  logic        slave_request;
  logic        bus_grant;
  logic        bus_request;
  logic        slave_ready;
  logic        data_ready;
  logic        mem_read;
  logic        mem_write;
endinterface


module top (input wire clock, resetN, test_mode);
  wire [15:0] program_address, jump_address;
  wire [ 7:0] instruction, next_instruction;

  initial begin
    $display("\nNo simulation results--just checking that example compiles and elaborates\n");
    $finish;
  end

  main_bus bus (    // instance of an interface
    .clock(clock),
    .resetN(resetN),
    .test_mode(test_mode)
  );


  processor proc1 (
    // main_bus ports
    .bus(bus),  // interface connection
    // other ports
    .jump_address(jump_address),
    .instruction(instruction)
  );

  slave slave1 (
    // main_bus ports
    .bus(bus)   // interface connection
    // other ports
  );

  dual_port_ram ram (
    // main_bus ports
    .bus(bus),  // interface connection
    // other ports
    .program_address(program_address),
    .data_b(next_instruction)
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

    test_generator test_gen(
    // main_bus ports
    .bus(bus)   // interface connection
    // other ports
  );
endmodule

/********************** Sub Modules ********************/
module processor (
    // main_bus interface port
    main_bus bus,
    // other ports
    output logic [15:0] jump_address,
    input  wire  [ 7:0] instruction,
    input  wire         clock,
    input  wire         resetN,
    input  wire         test_mode
  );
  //...
endmodule

module slave (
    // main_bus ports
    // main_bus interface port
    main_bus bus,
    // other ports
    input  wire         clock,
    input  wire         resetN
  );
  //...
endmodule

module dual_port_ram (
    // main_bus interface port
    main_bus bus,
    // other ports
    input  wire  [15:0] program_address,
    output logic [ 7:0] data_b
  );
  //...
endmodule

module instruction_reg (
    // main_bus interface port
    // other ports
    output logic [15:0] program_address,
    output logic [ 7:0] instruction,
    input  wire  [15:0] jump_address,
    input  wire  [ 7:0] next_instruction,
    input  wire         clock,
    input  wire         resetN
  );
  //...
endmodule

module test_generator (
    // main_bus interface port
    main_bus bus,
    // other ports
    input  wire         clock,
    input  wire         resetN,
    input  wire         test_mode
  );
  //...
endmodule
