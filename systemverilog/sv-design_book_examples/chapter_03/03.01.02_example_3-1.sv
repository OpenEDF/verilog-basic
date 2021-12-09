/**********************************************************************
 * external typedef declarations
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

// Invoke compilation using +define+TWO_STATE for 2-state data types,
// or uncomment the following line
//`define TWO_STATE

`ifdef TWO_STATE
  typedef bit dtype_t;     // external typedef
`else
  typedef logic dtype_t;   // external typedef
`endif


module counter (output dtype_t [15:0] count,
                input  dtype_t        clock, resetN);

  always @(posedge clock, negedge resetN)
    if
      (!resetN) count <= 0;
    else
      count <= count + 1;
endmodule

module test;
  wire [15:0] count;
  dtype_t     clock;
  dtype_t     resetN = 1;  // active low reset begins with a 1

  counter dut (count, clock, resetN);  // instance of device under test

  always #5 clock = ~clock;

  initial begin
    $display("\nFor two-state simulation, invoke with +define+TWO_STATE\n");
   `ifdef TWO_STATE
      $display("\nModels were compiled with 2-state types");
      $display("Expect to reset, and then count to 4");
      $display("Prior to reset, expect count to be 0000\n");
   `else
      $display("\nModels were compiled with 4-state types");
    $display("Expect to reset, and then count to 4");
    $display("Prior to reset, expect count to be xxxx\n");
   `endif
    $monitor("At %0d: clock=%b   resetN=%b   count=%h",
             $time, clock, resetN, count);
    #1 resetN <= 0;  // apply reset
    #8 resetN = 1;   // turn-off reset
    repeat (5) @(negedge clock) ; // let clock run 5 cycles
    $display("");
    $finish;
  end

  initial begin
   `ifndef TWO_STATE
    clock = 0;  // initialize clock for 4-state simulation
   `endif
  end
endmodule
