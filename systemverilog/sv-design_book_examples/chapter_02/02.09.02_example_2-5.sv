/**********************************************************************
 * Appying reset with 2-state variable types
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

timeunit 1ns;
timeprecision 1ns;

module test;
  wire [15:0] count;
  bit  clock;
  bit  resetN = 1;   // de-assert reset

  counter dut (clock, resetN, count);

  initial
    begin
      resetN = 0;     // assert active-low reset
      #5 resetN = 1;  // de-assert reset
      repeat (5) @(negedge clock) ;
      $finish;
    end

    always #10 clock = ~clock;
    initial begin
      $timeformat(-9, 0, "ns", 8);
      $display("\nExpect counter to reset and then count from 0 to 5...");
      $monitor("  At %t: clock=%b  resetN=%b  count=%h",
               $realtime, clock, resetN, count);
    end
endmodule


module counter (input clock, resetN,
                output logic [15:0] count);

  always @(posedge clock, negedge resetN)
    if (!resetN) count <= 0;  // active low reset
    else count <= count + 1;
endmodule
