/**********************************************************************
 * Casting expression signedness
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

  bit [15:0] a, b, sum;  // 16 bits wide, unsigned

  initial begin
    a = -1;
    b = 1;

    sum = signed'(a) + signed'(b); // cast operands
    $display("\n a=%0d, signed'(a)=%0d, b=%0d, signed'(b)=%0d, sum=%0d (expect 65535, -1, 1, 1, 0)",
         a, signed'(a), b, signed'(b), sum);

    $display("\nTesting  \"if ((a-b) <= 5)\" ");
    if ((a-b) <= 5)  // no cast of intermediate result (not in book)
      $display("  FAILED: result = %0d (expect 65534)", (a-b));
    else
      $display("  PASSED: result = %0d (expect 65534)", (a-b));

    $display("\nTesting  \"if (signed'(a) - signed'(b) <= 5)\" ");
    if (signed'(a) - signed'(b) <= 5)  // cast operands (not in book)
      $display("  PASSED: result = %0d (expect -2)", (signed'(a) - signed'(b)) );
    else
      $display("  FAILED: result = %0d (expect -2)", (signed'(a) - signed'(b)) );

    $display("\nTesting  \"if (unsigned'(a) + unsigned'(b) <= 5)\" ");
    if (unsigned'(a) + unsigned'(b) <= 5)  // cast operands (not in book)
      $display("  FAILED: result = %0d (expect 0)", (unsigned'(a) + unsigned'(b)));
    else
      $display("  PASSED: result = %0d (expect 0)", (unsigned'(a) + unsigned'(b)) );

    $display("");
    $finish;
  end
endmodule
