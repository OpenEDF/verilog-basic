/**********************************************************************
 * Importing methods through modports using import prototypes
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

interface chip_bus (input wire clock, resetN);

  modport in (import task Read
                       (input  [63:0] data,
                        output [31:0] address),
              import function parity_gen
                       (input  [63:0] data),
              input  clock, resetN);

  task Read (input  [63:0] data,
             output [31:0] address);
    //...
    $display("   Read method called\n");
  endtask

  function parity_gen (input [63:0] data);
    //...
    $display("   parity_gen method called\n");
  endfunction

endinterface

module chip (chip_bus  bus,  // interface port
             input    clock, resetN);
  logic [63:0] data;
  logic [31:0] address;
  logic tmp;

  initial begin
    #1
    bus.Read (data, address);     // call Read method
    tmp = bus.parity_gen(data);   // call parity_gen method
  end
endmodule

module top;
  logic clock, resetN;
  chip_bus bus( clock, resetN);   // instantiate an interface
  chip i1 (bus, clock, resetN);

  initial begin
    $display("\nExpect to see one call each to the Read and parity_gen methods\n");
    #5 $finish;
  end
endmodule

