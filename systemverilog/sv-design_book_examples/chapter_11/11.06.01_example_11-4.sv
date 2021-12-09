/**********************************************************************
 * Adapter modeled as a module
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

module TopTLMPLM;

  Multibus TLMbus();
  Multibus PLMbus();

  Tester T(TLMbus);
  MultibusMaster MM (TLMbus, PLMbus);
  MultibusArbiter MA (PLMbus);
  Clock Clk(PLMbus);
  MultibusMonitor MO(PLMbus);

  MemoryPIN  #(.Lo(20'h00000), .Hi(20'h3ffff))
    M1 (PLMbus.ADR, PLMbus.DAT, PLMbus.MRDC, PLMbus.MWTC,
        PLMbus.XACK, PLMbus.BCLK);
  MemoryPIN  #(.Lo(20'h40000), .Hi(20'h7ffff))
    M2 (PLMbus.ADR, PLMbus.DAT, PLMbus.MRDC, PLMbus.MWTC,
        PLMbus.XACK, 	PLMbus.BCLK);

  initial begin
    $display("\nNo simulation results--only testing if the example compiles and elaborates\n");
    $finish;
  end
endmodule : TopTLMPLM

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
  //...  // fully defined in example 11-5
endinterface

module Tester (interface Bus);
  //...  // fully defined in example 11-3
endmodule

module Clock (Multibus Bus);
  //...  // fully defined in example 11-5
endmodule

module MultibusMaster (interface Tasks, interface Wires);
  //...  // fully defined in example 11-6
endmodule

module MultibusArbiter (interface Bus);
  //...  // fully defined in example 11-6
endmodule

module MultibusMonitor (interface Bus);
  //...  // fully defined in example 11-6
endmodule

module MemoryPIN (
    input  [19:0]            ADR,     // address bus
    inout  [15:0]            DAT,     // data bus
    input  /*active0*/       MRDC,    // memory read
    input  /*active0*/       MWTC,    // memory write
    output logic /*active0*/ XACK,    // acknowledge
    input                    CCLK
  );
  parameter Lo = 20'h00000;
  parameter Hi = 20'h3ffff;
  //...  // fully defined in example 11-7
endmodule

