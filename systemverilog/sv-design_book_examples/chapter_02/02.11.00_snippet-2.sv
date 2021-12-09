/**********************************************************************
 * Code snippet showing illegal use of const constants (not in book)
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

module test;

  const bit [23:0] C1 = 7; // 24-bit constant
  const int C2 = 15;       // 32-bit constant
  const real C3 = 3.14;    // real constant
  const C4 = 5;            // ERROR, no data type

  task automatic C;
    const int N = 5;  // N is a constant
    // ...
    N = 6; // ERROR: illegal assignment to const
    $display("In task C, N = %0d (expect compile error)\n", N);
  endtask

  initial begin
    $display("\nExpect compilation error on declaration of constant C4 and ");
    $display("for assignments to constants C1 and N \n");
    C1 = 8; // ERROR: illegal assignment to const
    $display("\C1=%0d (expect compile error)", C1);
    C; // call task
    #1 $finish;
  end
endmodule
