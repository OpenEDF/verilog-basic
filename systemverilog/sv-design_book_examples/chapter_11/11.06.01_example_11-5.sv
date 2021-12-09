/**********************************************************************
 * Simplified Intel Multibus with multiple masters and slaves
 *
 * Author: Peter Flake, Stuart Sutherland
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

// Interface header
interface Multibus;
  parameter int MASTERS = 1; // number of bus masters

  // structural communication
  tri [19:0]                   ADR;  // address bus (inverted)
  tri [15:0]                   DAT;  // data bus (inverted)
  wand /*active0*/       MRDC, MWTC; // mem read/write commands
  wand /*active0*/             XACK; // transfer acknowledge
  wand /*active0*/ [1:MASTERS] BREQ; // bus request
  wand /*active0*/             CBRQ; // common bus request
  wire /*active0*/             BUSY; // bus busy
  wire /*active0*/ [1:MASTERS] BPRN; // bus priority to master
  logic                        BCLK; // bus clock; driven
                                     // by only one master
  logic                        CCLK; // constant clock
  wand                         INIT; // initialize


  // Tasks - Behavioral communication

  extern task Request (input int n);
  extern task Relinquish (input int n);
  extern forkjoin task ReadMem  (input  logic [19:0] Address,
                                 output logic [15:0] Data,
                                        bit          Error);

  extern forkjoin task WriteMem (input  logic [19:0] Address,
                                 input  logic [15:0] Data,
                                 output bit          Error);
endinterface


module Clock (Multibus Bus);

  always begin  // clock
    #50 Bus.CCLK = 0;
    #50 Bus.CCLK = 1;
  end

endmodule : Clock


module Tester;

  Multibus bus ();
  Clock i1 (bus);

  initial begin
    $display("\nNo simulation results--only testing if the example compiles and elaborates\n");
    $finish;
  end
endmodule

