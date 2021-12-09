/**********************************************************************
 * Exporting tasks/functions from a module, through an interface
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

interface chip_bus (input clock, resetN);
  bit          request, grant, ready;
  logic [63:0] address, data;

  modport master (output request, //...
                  export check );

  modport slave  (input  request, //...
                  import function check (input bit parity,
                                         input logic [63:0] data) );
endinterface

module CPU (chip_bus.master io);

  function check (input bit parity, input logic [63:0] data);
    //...
  endfunction
  //...
endmodule

module top;
  bit clock, resetN = 1;

  chip_bus bus (clock, resetN);
  CPU CPU (bus);

  initial begin
    $display("\nNo simulation results--just checking that example compiles and elaborates\n");
    $finish;
  end
endmodule
