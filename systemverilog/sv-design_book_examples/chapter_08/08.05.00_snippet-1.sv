/**********************************************************************
 * Examples of net aliases
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

  wire clock;
  wire clk;
  alias clk = clock;

  wire  rst, reset, resetN, rstN;
  alias rst = reset = resetN = rstN;

  wire [31:0] n1;
  wire [3:0][7:0] n2;
  alias n2 = n1;  // both n1 and n2 are 32 bits

  wire [39:0] d_in;
  wire  [7:0] crc;
  wire [31:0] data;
  alias data = d_in[31:0];   // both are 32 bit nets
  alias crc  = d_in[39:32];  // both are 8 bit nets

  initial begin
    force rst = 1'b1;
    $display("\n rst=%b  reset=%b  resetN=%b  rstN=%b (expect 1, 1, 1, 1)",
              rst, reset, resetN, rstN);
    release rst;
    force resetN = 1'b0;
    $display("\n rst=%b  reset=%b  resetN=%b  rstN=%b (expect 0, 0, 0, 0)",
              rst, reset, resetN, rstN);
  end

endmodule

module register (output [63:0] q,
                 input  [63:0] d,
                 input         clock, reset);

  wire [63:0] out, in;
  alias in = d;        // infers d is a 64-bit wire
  alias out = q;       // infers q is a 64-bit wire
  alias rstN = reset;  // infers 1-bit wires for rstN and reset
  //...
  initial begin
    $display("\n d is %0d bits wide (expect 64)", $bits(d));
    $display("reset is %0d bits wide (expect 1)\n", $bits(reset));
  end

endmodule