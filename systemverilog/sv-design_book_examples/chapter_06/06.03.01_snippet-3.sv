/**********************************************************************
 * Accessing local variables declared external to for loops (legal)
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
  bit [63:0] data;

  always_comb begin
    int low_bit;  // local variable to the block
    for (low_bit=0; low_bit<=63; low_bit++) begin
      if (data[low_bit]) break;  // exit loop if bit is set
    end
    if (low_bit > 7)  // OK: low_bit exists outside of loop
      //...
      $display("   low_bit = %0d", low_bit);
    else
      $display("   low_bit = %0d", low_bit);
  end

  initial begin
    #1 $display("\nSetting data = 16, expect low bit to be 4");
       data = 16;
    #1 $display("\nSetting data = 1024, expect low bit to be 10");
       data = 1024;
    #1 $display("");
    $finish;
  end
endmodule
