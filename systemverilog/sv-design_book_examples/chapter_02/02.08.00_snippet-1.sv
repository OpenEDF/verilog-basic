/**********************************************************************
 * Code snippet using automatic functions
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

module add_array (input  wire clock,
                  input  byte array [0:63],
                  output int  result
                 );

  always @(posedge clock)
    result <= b_add(0,63);

  // balance adder: low address and high address of
  // the array elements to be added are passed in;
  // this example has no error checking on input args
  function automatic int b_add (int lo, hi);
    int mid = (lo + hi + 1) >> 1;
    if (lo + 1 != hi)
      return(b_add(lo,(mid-1)) + b_add(mid,hi));
    else
      return(array[lo] + array[hi]);
  endfunction

endmodule


module test;
  byte array [0:63];
  bit clock;
  int result;

  add_array dut (clock, array, result);

  initial begin
    for (int i=0;i<64; i++) array[i]=i;  // fill array; each address has value of that address
    #5 clock = 1;
    #5 clock = 0;
    $display("\n result = %0d (expect 435)\n", result);
    $finish;
  end
endmodule

