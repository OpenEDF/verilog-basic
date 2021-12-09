/**********************************************************************
 * Verilog style state machine model using `define and parameters
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

`define FETCH 3'h0
`define WRITE 3'h1
`define ADD   3'h2
`define SUB   3'h3
`define MULT  3'h4
`define DIV   3'h5
`define SHIFT 3'h6
`define NOP   3'h7

module controller (output reg        read, write,
                   input  wire [3:0] instruction,
                   input  wire       clock, resetN);

  parameter WAITE = 0,
            LOAD  = 1,
            STORE = 2;

  reg [1:0] State, NextState;

  always @(posedge clock, negedge resetN)
    if (!resetN) State <= WAITE;
    else State <= NextState;

  always @(State)
    case (State)
      WAITE:  NextState = LOAD;
      LOAD:   NextState = STORE;
      STORE:  NextState = WAITE;
    endcase

  always @(State, instruction)
    begin
      read = 0; write = 0;
      if (State == LOAD && instruction == `FETCH)
        read = 1;
      else if (State == STORE && instruction == `WRITE)
        write = 1;
    end
endmodule

module test;
  reg  clock, resetN = 1;
  reg [3:0] instruction;

  always #5 clock = ~clock;

  controller dut (.read(read), .write(write),
                  .instruction(instruction),
                  .clock(clock), .resetN(resetN) );

  initial begin
    $display("\nExpect to see State sequence of: 0,1,2, 0,1,2\n");
    $monitor("at %0d: dut.State=%0d", $time, dut.State);
    clock = 0;
    instruction = `FETCH;
    resetN <= 0;
    #8 resetN = 1;
    repeat (3) @(negedge clock) ;  // run 3 clock cycles
    instruction = `WRITE;
    repeat (3) @(negedge clock) ;  // run 3 clock cycles
    $finish;
  end
endmodule