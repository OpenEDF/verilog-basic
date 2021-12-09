/**********************************************************************
 * Referencing signals in an interface without modports
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

  initial begin
    $display("\nNo simulation results--just checking that example compiles and elaborates\n");
    $finish;
  end

  main_bus bus (clock, resetN, test_mode);  // instance of interface

  slave slave1 (
    // main_bus ports
    .bus(bus)   // interface connection
    // other ports
  );
endmodule


module slave (
    // main_bus interface port
    main_bus bus
    // other ports
  );
  // internal signals
  logic [15:0] slave_data, slave_address;
  bit   [15:0] operand_A, operand_B;
  bit          mem_select, read, write;

  assign bus.address = mem_select? slave_address: 'z;
  assign bus.data = bus.slave_ready? slave_data: 'z;

  enum {RESET, START, REQ_DATA, EXECUTE, DONE} State, NextState;

  always_ff @(posedge bus.clock, negedge bus.resetN) begin: FSM
    if (!bus.resetN) State <= START;
    else State <= NextState;
  end

  always_comb begin : FSM_decode
    unique case (State)
      START:    if (!bus.slave_request) begin
                  bus.bus_request = 0;
                  NextState = State;
                end
                else begin
                  operand_A = bus.data;
                  slave_address = bus.address;
                  bus.bus_request = 1;
                  NextState = REQ_DATA;
                end
      //...  // decode other states
    endcase
  end: FSM_decode
endmodule
