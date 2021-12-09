/**********************************************************************
 * Simple Multibus TLM example with master adapter as a module
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

module MultibusMaster (interface Tasks, interface Wires);
    parameter int Number = 1;   // number of masters for
                                // request/grant


  enum {IDLE, READY, READ, WRITE} Master_State;

  logic [19:0] adr  = 'z;  assign Wires.ADR = adr;
  logic [15:0] dat  = 'z;  assign Wires.DAT = dat;
  logic        mrdc = 1;   assign Wires.MRDC = mrdc;
  logic        mwtc = 1;   assign Wires.MWTC = mwtc;
  logic        breq = 1;   assign Wires.BREQ[Number] = breq;
  logic        cbrq = 1;   assign Wires.CBRQ = cbrq;
  logic        busy = 1;   assign Wires.BUSY = busy;

  assign Wires.BCLK = Wires.CCLK;

  task Tasks.ReadMem (input  logic [19:0] Address,
                      output logic [15:0] Data,
                      output bit          Error);

    if (Master_State == IDLE) GetBus();
      else assert (Master_State == READY);
    Master_State = READ;
    Data = 'x; Error = 1;  // default if no slave responds
    adr = ~Address;
    #50 mrdc = 0;  //min delay
    fork
      begin: ok
        @(negedge Wires.XACK) Data = ~ Wires.DAT;
        EndRead();
        @(posedge Wires.XACK) Error = 0;
        disable timeout;
      end
      begin: timeout  // Timeout if no acknowledgement
        #900 Error = 1;
        EndRead();
        disable ok;
      end
    join
    FreeBus();
  endtask

  task Tasks.WriteMem (input  logic [19:0] Address,
                       input  logic [15:0] Data,
                       output bit          Error);
    if (Master_State == IDLE) GetBus();
      else assert (Master_State == READY);
    Master_State = WRITE;
    Error = 1;  // default if no slave responds
    GetBus();
    adr = ~Address;
    dat = ~Data;
    #50 mwtc = 0;
    fork
      begin: ok
        @(negedge Wires.XACK) EndWrite();
        @(posedge Wires.XACK) Error = 0;
        disable timeout;
      end

      begin: timeout  // Timeout if no acknowledgement
        #900 Error = 1;
        EndWrite();
        disable ok;
      end
    join
    FreeBus();
  endtask

  task EndRead();
    mrdc = 1;
    #50 adr = 'z;
  endtask

  task EndWrite();
    mwtc = 1;
    #60 adr = 'z;
    dat = 'z;
  endtask

  task GetBus();
    @(negedge Wires.BCLK) breq = 0;
    cbrq = 0;
    @(negedge Wires.BPRN[Number]);
    @(negedge Wires.BCLK iff !Wires.BPRN[Number]);
    #50 busy = 0;
    cbrq = 1;
  endtask

  task FreeBus();
    breq = 1;
    if (Wires.CBRQ) Master_State = READY;
    else begin
      Master_State = IDLE;
      busy = 1;  // relinquish the bus if CBRQ asserted
    end
  endtask

endmodule: MultibusMaster


module Tester (interface Bus); // repeated from previous example
  logic [15:0] D;
  logic        E;
  int          A;

  initial begin
    $display("\n*** Expected results are in \"11.06.02_example_11-6.log\" ***\n");
    for (A = 0; A < 21'h100000; A = A + 21'h40000)
    begin
      fork #1000; Bus.WriteMem(A[19:0], 0, E); join
      if (E) $display ("%t bus error on write %h", $time, A);
        else $display ("%t write OK %h", $time, A);
      fork #1000; Bus.ReadMem(A[19:0], D, E); join
      if (E) $display ("%t bus error on read %h", $time, A);
        else $display ("%t read OK %h", $time, A);
    end
  end

  initial # 10000 $finish;

endmodule


module MultibusArbiter #(parameter MASTERS = 1)(interface Bus);
  logic [1:MASTERS] bprn = '1; assign Bus.BPRN = bprn;
  int last = 0;
  int i;

  always @(negedge Bus.BCLK)
    if (Bus.CBRQ == 0) begin // request
      i = last+1;
      forever begin
        if (i > MASTERS) i = 1;
        if (Bus.BREQ[i] == 0) break;
        assert (i != last); else $fatal(0, "no bus master");
        i++;
        if (i > MASTERS) i = 1;
      end
      last = i;
      #50 bprn [i] = 0; //$display("bprn[%b] = %b", i, bprn);
    end
    else if (Bus.BUSY == 0) begin // relinquish
      #50 bprn [last] = 1;
    end
endmodule : MultibusArbiter


module MultibusMonitor (interface Bus);

  initial $monitor(
       "ADR=%h DAT=%h MRDC=%b MWTC=%b XACK=%b BREQ=%b CBRQ=%b BUSY=%b BPRN=%b",
        Bus.ADR, Bus.DAT, Bus.MRDC, Bus.MWTC, Bus.XACK,
        Bus.BREQ, Bus.CBRQ, Bus.BUSY, Bus.BPRN);
endmodule


// Memory Module with pin level interface
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
  logic [15:0] Mem[Lo:Hi];
  logic [15:0] Bufdat;
  logic        Bufena = 0;  //default disables buffers

  initial XACK = 1; // default disables

  assign DAT = Bufena ? Bufdat : 'z;

  always @(posedge CCLK)
  begin
    automatic logic [19:0] Address = ~ADR;
    if (MRDC == 0 && Address >= Lo && Address <= Hi)   // read
    begin
      Bufdat <= ~Mem[Address];
      Bufena <= 1;
      XACK <= 0;
    end
    else if (MWTC == 0 && Address >= Lo && Address <= Hi)
    begin                                              // write
      Mem[Address] = ~DAT;
      XACK <= 0;
    end
    else begin
      XACK <= 1;
      Bufena <= 0;
    end
  end

endmodule: MemoryPIN

/*** Code from earlier examples that are used by this example ***/
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

endmodule : TopTLMPLM
