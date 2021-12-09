/**********************************************************************
 * external ($unit) defintions and declarations
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

parameter VERSION = "1.2a";   // external constant

reg resetN = 1;               // external variable (active low)

typedef struct packed {       // external user-defined type
  reg [31:0] address;
  reg [31:0] data;
  reg [ 7:0] opcode;
} instruction_word_t;


function automatic int log2 (input int n);  // external function
  if (n <=1) return(1);
  log2 = 0;
  while (n > 1) begin
    n = n/2;
    log2++;
  end
  return(log2);
endfunction

// external declaration is used to define port types
module register (output instruction_word_t q,
                 input  instruction_word_t d,
                 input  wire               clock );

  always @(posedge clock, negedge resetN)
    if (!resetN) q <= 0;  // use external reset
    else q <= d;
endmodule

module top;  // definition of top-level module
  instruction_word_t out, in;
  bit   clock;

  register i1 (out, in, clock);

  always #5 clock = ~clock;

  initial begin
    $display("\n Version is %s (expect 1.2a)\n", VERSION);  // use external parameter
    $display("\n log2 of 4096 is %0d (expect 12)\n", log2(4096));  // call external function
    in = {2,50,5};
    #1 resetN = 0;
    @(posedge clock) resetN <= 1;
    repeat (2) @(negedge clock) ;
    $display("\n in.data=%0d  out.data=%0d (expect 50, 50)\n", in.data, out.data);
    @(negedge clock) $finish;
  end
endmodule
