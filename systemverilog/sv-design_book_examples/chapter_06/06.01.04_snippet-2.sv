/**********************************************************************
 * Using inside operator with list of variables
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

  bit [2:0] data, bus1, bus2, bus3, bus4;

  initial begin
     data = 3'b010;
     bus1 = 3'b000;
     bus2 = 3'b001;
     bus3 = 3'b010;
     bus4 = 3'b100;
     if ( data inside {bus1, bus2, bus3, bus4} )
       //...
       $display("\nTest passed: value of data (%b) is inside {bus1, bus2, bus3, bus4}\n", data);
     else
       $display("\nTest failed: value of data (%b) was not inside {bus1, bus2, bus3, bus4}\n", data);

     data = 3'b111;
     if ( data inside {bus1, bus2, bus3, bus4} )
       $display("\nTest failed: value of data (%b) is inside {bus1, bus2, bus3, bus4}\n", data);
     else
       $display("\nTest passed: value of data (%b) was not inside {bus1, bus2, bus3, bus4}\n", data);

     $finish;
  end

endmodule
