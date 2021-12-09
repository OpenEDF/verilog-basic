/**********************************************************************
 * Module declaration default and inferred port directions
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

module accum_95 (data, result, co, a, b, ci);
  inout   [31:0]  data;
  output  [31:0]  result;
  output          co;
  input   [31:0]  a, b;
  input           ci;

  wire    [31:0]  data;
  reg     [31:0]  result;
  reg             co;
  tri1            ci;
  //...
endmodule

module accum_01 (
  inout   wire [31:0]  data,   // must explicitly declare port direction
  output  reg  [31:0]  result,
  output  reg          co,     // must explicitly declare port direction
  input        [31:0]  a, b,
  input   tri1         ci      // must explicitly declare port direction
);
  //...
endmodule

module accum_sv (
          wire  [31:0]  data,    // defaults to inout port
  output  logic [31:0]  result,  // explicit output port
          logic         co,      // defaults to output port
  input         [31:0]  a, b,    // explicit inout ports
          tri1          ci       // defaults to input port
);
  //...
endmodule

module test;

  wire [31:0] data, result, a, b;
  wire        co, ci;

  accum_95 i1 (.data(data), .result(result), .co(co),
               .a(a), .b(b), .ci(ci) );

  accum_01 i2 (.data(data), .result(result), .co(co),
               .a(a), .b(b), .ci(ci) );

  accum_sv i3 (.data(data), .result(result), .co(co),
               .a(a), .b(b), .ci(ci) );

  initial begin
    $display("\nNo simulation results--only checking that example compiles and elaborates\n");
    $finish;
  end

endmodule
