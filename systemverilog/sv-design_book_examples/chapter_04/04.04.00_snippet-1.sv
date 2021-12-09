/**********************************************************************
 * Array query functions
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

  bit [3:0][7:0] array [0:1023];

  int d = $dimensions(array);

  initial begin
    $display("\n $dimensions(array) = %0d (expect 3)", d);
    $display("\n $size(array,1) = %0d (expect 1024)", $size(array,1));
    $display("\n $left(array,1) = %0d (expect 0)", $left(array,1));
    $display("\n $right(array,1) = %0d (expect 1023)", $right(array,1));
    $display("\n $increment(array,1) = %0d (expect -1)", $increment(array,1));

    $display("\nExpect for loop to decrement from 1023 to 0...");
    if (d > 0) begin   // object is an array
      for (int j = $right(array,1);
               j < $size(array,1);
               j += $increment(array,1))
        begin
          //...  // do something
          $write("%0d  ", j);
          if (j%10 == 0) $write("\n");
        end
    end
    $display("\n"); // add white space at end of loop output
    $finish;
  end
endmodule
