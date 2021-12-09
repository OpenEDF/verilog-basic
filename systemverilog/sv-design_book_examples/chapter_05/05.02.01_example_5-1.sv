/**********************************************************************
 * FSM using always @() -- only triggers on changes in sensitivity list
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

typedef enum {FETCH, WRITE, ADD, SUB, MULT, DIV, SHIFT, NOP} instr_t;

module controller (output logic   read, write,
                   input  instr_t instruction,
                   input  wire    clock, resetN);

  enum {WAITE, LOAD, STORE} State, NextState;

  always @(posedge clock, negedge resetN)
    if (!resetN) State <= WAITE;
    else State <= NextState;

  always @(State)  // only tiggers when State changes value
    case (State)
      WAITE:  NextState = LOAD;
      LOAD:   NextState = STORE;
      STORE:  NextState = WAITE;
    endcase

  always @(State or instruction)
    begin
      read = 0; write = 0;
      if (State == LOAD && instruction == FETCH)
        read = 1;
      else if (State == STORE && instruction == WRITE)
        write = 1;
    end
endmodule

module test;
  logic  clock, resetN = 1;
  instr_t instruction;

  always #5 clock = ~clock;

  controller dut /* ( .* ); */
                 (.read(read), .write(write),
                  .instruction(instruction),
                  .clock(clock), .resetN(resetN) );

  initial begin
    clock = 0;
    instruction = FETCH;
    resetN <= 0;
    #8 resetN = 1;
    repeat (3) @(negedge clock) ;  // run 3 clock cycles
    $display("\n instruction=%h  read=%b  write=%b (expect 00000000, x, x)\n",
             instruction, read, write);
    $display(" [note that these outputs are logically incorrect, due to FSM lock up,");
    $display(" which is caused by using \"always\" instead of \"always_comb\".");
    $display(" Locically correct results would be 00000000, 0, 0]\n");

    instruction = WRITE;
    repeat (3) @(negedge clock) ;  // run 3 clock cycles
    $display("\n instruction=%h  read=%b  write=%b (expect 00000001, 0, 0)\n",
             instruction, read, write);
    $display(" [note that these outputs are logically incorrect, due to FSM lock up,");
    $display(" which is caused by using \"always\" instead of \"always_comb\".");
    $display(" Locically correct results would be 00000001, 0, 1]\n");
    $finish;
  end
endmodule
