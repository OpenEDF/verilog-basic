/**********************************************************************
 * priority if...else statements with unspecified conditions
 * (run-time error)
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

module chip (output logic [3:0] irq,
             input        irq0, irq1, irq2, irq3);

  always_comb begin
    priority if (irq0) irq = 4'b0001;
        else if (irq1) irq = 4'b0010;
        else if (irq2) irq = 4'b0100;
        else if (irq3) irq = 4'b1000;
  end
endmodule

module test;
  wire [ 3:0] irq;
  bit  irq0, irq1, irq2, irq3;

  chip chip (irq, irq0, irq1, irq2, irq3);

  initial begin
    $display("\nSetting different irq inputs: ");
    $display("expect run-time warning when no irq bits are set");
    $monitor("  irq3=%b, irq2=%b, irq1=%b, irq0=%b : irq=%b", irq3, irq2, irq1, irq0, irq);
       irq1 = 1;
    #1 irq3 = 1;
    #1 irq0 = 1;
    #1 irq0 = 0;
    #1 irq1 = 0;
    #1 irq3 = 0;
    #1 $display("");
    $finish;
  end
endmodule
