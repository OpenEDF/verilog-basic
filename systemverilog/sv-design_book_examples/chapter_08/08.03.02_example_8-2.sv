/**********************************************************************
 * Nested modules with hierarchy
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

module ip_core (input clock);

  sub1 sub1 ();  // instance of nested module sub1

  initial #1 $display("1) ip_core hierarchy: %m (expect test.ip_core)");

  module sub1 ( /*...*/ );
    sub2 sub2 ();                   // instance of module nested in ip_core

    initial #2 $display("2) sub1 hierarchy: %m (expect test.ip_core.sub1)");

  endmodule: sub1

  module sub2 (/*...*/); // NOTE: sub2 is defined in ip_core, but is
                         // not instantiated in ip_core; it is
                         // instantiated in sub1, which is instantiated
                         // in ip_core
    // sub2 does not have ports; it should look in its source
    // code parent module (ip_core) for identifiers
    sub3 sub3 (.clk(clock));         // instance of module nested in ip_core

    initial #3 $display("3) sub2 hierarchy: %m (expect test.ip_core.sub1.sub2)");

  endmodule: sub2

  module sub3 (input clk);
    initial #4 $display("4) sub3 hierarchy: %m (expect test.ip_core.sub1.sub2.sub3)");

    dff dff ();  //dff is defined in global space

  endmodule: sub3

  module sub4 ; // NOTE: sub4 is nested in ip_core, but is not
                // explicitly instantiated; it should be implicitly
                // instantiated one time in ip_core

    initial #5 $display("5) sub4: is %m (expect test.ip_core.sub4)");

  endmodule: sub4

endmodule: ip_core

module dff (/*...*/);    // global module name
  initial #6 $display("6) dff hierarchy: %m (expect test.ip_core.sub1.sub2.sub3.dff)");
  //...
endmodule: dff

module test;

  ip_core ip_core (.clock(clock));  // instance of top-level of design

  initial begin
    $display("\nExpect *** 6 *** module instance hierarchy paths to print...");
    #10 $display("");
    $finish;
  end
endmodule
