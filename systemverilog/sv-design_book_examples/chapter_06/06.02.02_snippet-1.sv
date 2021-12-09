/**********************************************************************
 * Casting expression size
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

  bit [15:0] a, b, c, sum;  // 16 bits wide
  bit        carry;         // 1 bit wide

  initial begin
    sum = a + 16'(5);     // cast operand
    $display("\nSize of (a + 5) is %0d bits (expect 32)",
             $bits( (a + 5) ) );
    $display("Size of (a + 16'(5)) is %0d bits (expect 16)",
             $bits( (a + 16'(5)) ) );

    {carry,sum} = 17'(a + 3);  // cast result
    $display("\nSize of (a + 3) is %0d bits (expect 32)",
             $bits( (a + 3) ) );
    $display("Size of (17'(a + 3)) is %0d bits (expect 17)",
             $bits( (17'(a + 3)) ) );

    sum = a + 16'(b - 2) / c;  // cast intermediate result
    $display("\nSize of (a + (b-2)) is %0d bits (expect 32)",
             $bits( (a + (b-2)) ) );
    $display("Size of (a + 16'(b - 2)) is %0d bits (expect 16)",
             $bits( (a + 16'(b - 2)) ) );

    $display("");
    $finish;
  end
endmodule
