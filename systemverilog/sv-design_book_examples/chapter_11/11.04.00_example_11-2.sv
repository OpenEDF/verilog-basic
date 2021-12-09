/**********************************************************************
 * Two memory subsystems connected by an interface
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

module TopTLM;

  Membus Mbus();
  Tester T(Mbus);
  Memory #(.Lo(20'h00000), .Hi(20'h3ffff))
           M1(Mbus);  // lower addrs
  Memory #(.Lo(20'h40000), .Hi(20'h7ffff))
           M2(Mbus);  // higher addrs

endmodule : TopTLM


// Interface header
interface Membus;

  extern forkjoin task ReadMem  (input  logic [19:0] Address,
                                 output logic [15:0] Data,
                                        bit          Error);

  extern forkjoin task WriteMem (input  logic [19:0] Address,
                                 input  logic [15:0] Data,
                                 output bit          Error);

  extern task Request();
  extern task Relinquish();

endinterface

module Tester (interface Bus);

  logic [15:0] D;
  logic E;

  int A;

  initial begin
    $display("\nExpect 2 write/read transactions with no errors, ");
    $display("followed by 2 write/read transactions with bus errors...\n");
    for (A = 0; A < 21'h100000; A = A + 21'h40000) begin
      fork
        #1000;
        Bus.WriteMem(A[19:0], 0, E);
      join
      if (E) $display ("%t bus error on write %h", $time, A);
        else $display ("%t write OK %h", $time, A);

      fork
        #1000;
        Bus.ReadMem(A[19:0], D, E);
      join
      if (E) $display ("%t bus error on read %h", $time, A);
        else $display ("%t read OK %h", $time, A);
    end
    $display("");
    $finish;
  end
endmodule


// Memory Modules
// forkjoin task model delays if OK (last wins)
module Memory(interface Bus);

  parameter Lo = 20'h00000;
  parameter Hi = 20'h3ffff;
  logic [15:0] Mem[Lo:Hi];

  task Bus.ReadMem(input  logic [19:0] Address,
                   output logic [15:0] Data,
                   output bit          Error);

    if (Address >= Lo && Address <= Hi) begin
      #100 Data = Mem[Address];
      Error = 0;
    end
    else Error = 1;
  endtask

  task Bus.WriteMem(input  logic [19:0] Address,
                    input  logic [15:0] Data,
                    output bit          Error);

    if (Address >= Lo && Address <= Hi) begin
      #100 Mem[Address] = Data;
      Error = 0;
    end
    else Error = 1;
  endtask

endmodule
