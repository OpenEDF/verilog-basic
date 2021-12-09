/**********************************************************************
 * always @* inferred sensitivity lists -- does not include signals
 * read by functions
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
  bit [1:0] sel;
  bit [7:0] a1, b1, c, d, e, data;

  always @* begin   // infers @(data)
    a1 = data << 1;
    b1 = decode();
    //...
  end

  function decode;  // function with no inputs
    begin
      $display("   decode function called");
      case (sel)
        2'b01: decode = d | e;
        2'b10: decode = d & e;
        default: decode = c;
      endcase
    end
  endfunction

  initial begin
    $display ("\nExpect decode function to called 1 time...\n");
    c = 1; d = 3; e = 5;
    #1 data = 7;
    #1 c = 2;
    #1 d = 4;
    #1 e = 6;
    #1 sel = 2'b01;
    #1 $finish;
  end
endmodule


    