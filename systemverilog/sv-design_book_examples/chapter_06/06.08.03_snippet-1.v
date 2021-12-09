/**********************************************************************
 * parallel_case and full_case pragmas as attributes (V2K style)
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

module chip (output logic [15:0] y,
             input        [15:0] a, b,
             input        [ 2:0] opcode);

  bit [3:0] State, NextState;

  always @*
    (* synthesis, parallel_case *)
    case (opcode)
      2'b00:  y = a + b;
      2'b01:  y = a - b;
      2'b10:  y = a * b;
      2'b11:  y = a / b;
    endcase

  always @*
    (* synthesis, full_case *)
    case (State)
      3'b001:  NextState = 3'b010;
      3'b010:  NextState = 3'b100;
      3'b100:  NextState = 3'b001;
    endcase
endmodule

module test;
  bit   [ 2:0] opcode;
  logic [15:0] a, b;
  wire  [15:0] y;

  chip chip (y, a, b, opcode);

  initial begin
    $display("\nNo simulation results--only checking that example compiles and elaborates\n");
    $finish;
  end
endmodule
