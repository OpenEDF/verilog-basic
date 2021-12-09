/**********************************************************************
 * Using parameters in an interface
 *
 * NOTE: The modules in this example do not contain functionality.
 * The purpose of the example is to illustrate connections between
 * module instances.
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
 *   1.10 21 Jul 2004 -- corrected errata as printed in the book
 *                       "SystemVerilog for Design" (first edition) and
 *                       to bring the example into conformance with the
 *                       final Accellera SystemVerilog 3.1a standard
 *                       (for a description of changes, see the file
 *                       "errata_SV-Design-book_26-Jul-2004.txt")
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

interface math_bus #(parameter type DTYPE = int)
                    (input bit clock);

  DTYPE a, b, result; // parameterized data types
  //...

  task Read (output DTYPE   a, b);
    //... // do handshaking to fetch a and b values
  endtask

  modport int_io (import Read,
                  input  clock,
                  output result);

  modport fp_io  (import Read,
                  input  clock,
                  output result);
endinterface

module top (input wire clock, resetN, test_mode);
  math_bus                 bus_a (clock);  // interface uses int data
  math_bus #(.DTYPE(real)) bus_b (clock);  // interface uses real data

  integer_math_unit   i1 (bus_a.int_io);
    // connect to interface using integer data types

  floating_point_unit i2 (bus_b.fp_io);
    // connect to interface using real data types

  initial begin
    $display("\nNo simulation results--just checking that example compiles and elaborates\n");
    $finish;
  end
endmodule // end of module top

module integer_math_unit (interface bus);
  //...
endmodule

module floating_point_unit (interface bus);
  //...
endmodule

