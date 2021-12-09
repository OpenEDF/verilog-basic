/**********************************************************************
 * unique if...else statements with unspecified conditions (run-time error)
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

module chip (output logic [15:0] mux_out,
             input        [15:0] a, b, c,
             input        [ 2:0] sel);

  always_comb begin
    unique if (sel == 3'b001) mux_out = a;
      else if (sel == 3'b010) mux_out = b;
      else if (sel == 3'b100) mux_out = c;
  end
endmodule

module test;
  bit   [ 2:0] sel;
  logic [15:0] a, b, c;
  wire  [15:0] mux_out;

  chip chip (mux_out, a, b, c, sel);

  initial begin
    $display("\nSetting invalid values of sel: ");
    $display("expect run-time warnings for 011, 101, 110 (binary)");
    $monitor("  sel=%b  a=%0d  b=%0d  c=%0d  mux_out=%0d", sel, a, b, c, mux_out);
    a = 5; b = 2; c = 7;
       sel = 3'b001;
    #1 sel = 3'b011; //should cause run-time error
    #1 sel = 3'b101; //should cause run-time error
    #1 sel = 3'b110; //should cause run-time error
    #1 $display("");
    $finish;
  end
endmodule
