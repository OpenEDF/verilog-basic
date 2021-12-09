/**********************************************************************
 * Using disable to abort one     PASS of a loop or abort the loop entirely
 * (Verilog style code)
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
  int first_bit, start_range, end_range;
  bit [63:0] data;

  // find first bit set within a range of bits
  always @* begin
    begin: loop
      integer i;
      first_bit = 0;
      for (i=0; i<=63; i=i+1) begin:     PASS
        if (i < start_range)
          disable     PASS;  // continue loop
        if (i > end_range)
          disable loop;  // break out of loop
        if ( data[i] ) begin
          first_bit = i;
          disable loop;  // break out of loop
        end
      end // end of one     PASS of loop
    end // end of the loop
    //... // process data based on first bit set
  end

  initial begin
    start_range = 4;
    end_range = 32;
    #1 data = 1024;
    #1 $display("\n first_bit=%0d (expect 10)", first_bit);
    #1 data = 32768;
    #1 $display(" first_bit=%0d (expect 15)", first_bit);
    start_range = 16;
    #1 $display(" first_bit=%0d (expect 0)\n", first_bit);
    $finish;
  end
endmodule
