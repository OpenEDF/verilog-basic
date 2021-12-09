/**********************************************************************
 * Procedural default assignments to packed arrays
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
  bit clock, resetN = 1;

  byte a [0:3][0:3];

  always@(posedge clock, negedge resetN)
    if (!resetN) begin
      a = {default:0};    // init entire array
      a[0] = {default:4}; // init slice of array
    end
    else begin
      //...
    end

  always #5 clock = ~clock;

  initial begin
    $display("\n before reset, a[0][0] = %0h (expect 0)", a[0][0]);
    $display(" before reset, a[1][1] = %0h (expect 0)", a[1][1]);
    @(negedge clock) resetN = 0;
    @(negedge clock) resetN = 1;
    $display(" after reset, a[0][0] = %0h (expect 4)", a[0][0]);
    $display(" after reset, a[1][1] = %0h (expect 0)", a[1][1]);
    $display("");
    $finish;
  end
endmodule
