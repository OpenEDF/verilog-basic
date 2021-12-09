/**********************************************************************
 * Relaxed use of variables; input ports, continuous assigns,
 * connections to module instance outputs.
 *
 * Author: Stuart Sutherland
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

module compare (output bit          lt, eq, gt,
                input  logic [63:0] a, b );

  always @(a, b)
    if (a < b) lt = 1'b1;     // procedural assignments
    else       lt = 1'b0;

  assign gt = (a > b);        // continuous assignments

  comparator u1 (eq, a, b);   // module instance

endmodule

module comparator (output bit    eq,
                   input  [63:0] a, b);
  always @(a, b)
    eq = (a==b);
endmodule

module test;
  bit [63:0] a, b;
  wire lt, eq, gt;

  compare dut (lt, eq, gt, a, b);

  initial begin
    a = 5;
    b = 6;
    #1 $display("\nlt=%b  eq=%b  gt=%b (expect 1, 0, 0)\n",
                lt, eq, gt);
    $finish;
  end
endmodule
