/**********************************************************************
 * unique case statements with overlapping case items (run-time error)
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
             input        [ 1:0] select);
  always_comb
    unique casez (select)
      2'b1?: y = a + b;
      2'b0?: y = b - b;
      2'b?0: y = a * b; // ERROR due to overlap
      2'b?1: y = a / b; // ERROR due to overlap
    endcase
endmodule

module test;
  bit   [ 1:0] select;
  logic [15:0] a, b;
  wire  [15:0] y;

  chip chip (y, a, b, select);

  initial begin
    $display("\nSetting different values of select: ");
    $display("expect run-time warnings for values of 00, 01, 10, 11 (binary) due to overlap in casez");
    $monitor("  select=%b  a=%0d  b=%0d  y=%0d", select, a, b, y);

    a = 5; b = 2;
    select = 2'b00;
    #1 select = 2'b01;
    #1 select = 2'b10;
    #1 select = 2'b11;
    #1 $display("");
    $finish;
  end
endmodule
