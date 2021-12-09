/**********************************************************************
 * Assigning lists of values to unpacked arrays
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
  byte a [0:3][0:3];

  initial begin
    a[1][0] = 8'h5;  // assign to one element
    $display("\n a[0][0] = %0h (expect 0)", a[0][0]);
    $display("\n a[1][0] = %0h (expect 5)", a[1][0]);

    a = {{0,1,2,3},{4,5,6,7},{7,6,5,4},{3,2,1,0}};
    // assign a list of values to the full array
    $display("\n a[2][0] = %0h (expect 7)", a[2][0]);

    a[3] = {'hF, 'hA, 'hC, 'hE};
    // assign list of values to slice of the array
    $display("\n a[3][0] = %0h (expect f)\n", a[3][0]);

    $finish;
  end
endmodule
