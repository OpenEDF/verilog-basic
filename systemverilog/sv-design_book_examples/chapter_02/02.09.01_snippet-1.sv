/**********************************************************************
 * Code snippet showing initialization order dependency
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

// Invoke compilation with +define+v95 or +define+v2k, or uncomment one
// of the following `define lines
//`define v95
//`define v2k

module test;

`ifdef v95
  // Verilog-1995 style initialization
  integer i;   // declare a variable named i
  integer j;   // declare a variable named j

  initial begin
    i = 5;     // initialize i to 5
  end

  initial begin
    j = i;     // initialize j to the value of i
  end

  initial begin
    #1
    $display("\nModels were compiled with +define+v95");
    $display("\ni=%0d, j=%0d (expect i=5, j=[ambiguous: could be x or 5])\n", i, j);
    $finish;
  end

`elsif v2k
  // Verilog-2001 style initialization
  integer i = 5;   // declare variable and initialize i
  integer j;       // declare a variable named j

  initial begin
    j = i;   // initialize j to the value of i
  end

  initial begin
    #1
    $display("\nModels were compiled with +define+v2k");
    $display("\ni=%0d, j=%0d (expect i=5, j=5 [would be ambiguous in v2k])\n", i, j);
    $finish;
  end

`else
  initial begin
    $display("\nModels must be compiled with +define+v95 or +define+v2k\n");
    $finish;
  end
`endif

endmodule
