 /**********************************************************************
 * Concurrent for loops with local variables (Verilog style)
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

module chip (/*...*/ input clock);  // Verilog style loops
  reg [7:0] i;
  integer j, k;

  always @(posedge clock) begin: loop1
    reg [7:0] i;  // local variable
    for (i = 0; i <= 15; i = i + 1) begin
      //...
    end
    $display("\n loop1.i=%0d (expect 16)", i);
  end

  always @(posedge clock) begin: loop2
    integer i;   // local variable
    for (i = 1; i <= 1024; i = i + i) begin
      //...
    end
    $display("\n loop2.i=%0d (expect 2048)", i);
  end
endmodule

module test;
  bit clock;

  chip chip (clock);

  initial begin
    clock = 1;
    #1 $display("");
    $finish;
  end
endmodule
