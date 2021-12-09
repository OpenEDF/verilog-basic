/**********************************************************************
 * Counter with latched enable, using always_latch
 *
 * Author: Don Mills, Stuart Sutherland
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

module register_reader (input  clk, ready, resetN,
                        output logic [4:0] read_pointer
                       );

  logic enable;    // internal enable signal for the counter
  logic overflow;  // internal counter overflow flag

   always_latch begin  // latch the ready input
     if (!resetN)
       enable <= 0;
     else if (ready)
       enable <= 1;
     else if (overflow)
       enable <= 0;
   end

  always @(posedge clk, negedge resetN) begin  // 5-bit counter
    if (!resetN)
      {overflow,read_pointer} <= 0;
    else if (enable)
      {overflow,read_pointer} <= read_pointer + 1;
  end
endmodule


module test;
  bit        clk, ready;
  bit        resetN = 1;  //start in non-reset state
  wire [4:0] read_pointer;

  register_reader dut (.clk(clk),
                       .ready(ready),
                       .resetN(resetN),
                       .read_pointer(read_pointer)
                      );

  always #5 clk = ~clk;

  initial begin
    @(negedge clk) resetN = 0;  //reset the counter
    @(negedge clk) resetN = 1;  //turn-off reset
    $strobe("\n read_pointer=%b  enable=%b  (expect 00000, 0)", read_pointer, dut.enable);
    @(negedge clk) ready = 1;   //set instruction register ready flag
    @(negedge clk) ready = 0;   //turn-off instruction register ready flag
    $strobe("\n read_pointer=%b  enable=%b  (expect 00001, 1)", read_pointer, dut.enable);
    repeat (40) @(negedge clk) ; //run 20 clock cycles
    $strobe("\n read_pointer=%b  enable=%b  (expect 00000, 0)", read_pointer, dut.enable);
    @(negedge clk)
    $display("");
    $finish;
  end
endmodule
