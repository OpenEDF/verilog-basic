/**********************************************************************
 * Utopia ATM testbench
 *
 * To simulate this example with stimulus, invoke simulation on
 * 10.00.00_example_top.sv.  This top-level file includes all of the
 * example files in chapter 10.
 *
 * Author: Lee Moore, Stuart Sutherland
 *
 * (c) Copyright 2003, Sutherland HDL, Inc. *** ALL RIGHTS RESERVED ***
 * www.sutherland-hdl.com
 *
 * This example is based on an example from Janick Bergeron's
 * Verification Guild[1].  The original example is a non-synthesizable
 * behavioral model written in Verilog-1995 of a quad Asynchronous
 * Transfer Mode (ATM) user-to-network interface and forwarding node.
 * This example modifies the original code to be synthesizable, using
 * SystemVerilog constructs.  Also, the model has been made to be
 * configurable, so that it can be easily scaled from a 4x4 quad switch
 * to a 16x16 switch, or any other desired configuration.  The example,
 * including a nominal test bench, is partitioned into 8 files,
 * numbered 10.xx.xx_example_10-1.sv through 10-8.sv (where xx
 * represents section and subsection numbers in the book "SystemVerilog
 * for Design" (first edition).  The file 10.00.00_example_top.sv
 * includes all of the other files.  Simulation only needs to be
 * invoked on this one file.  Conditional compilation switches (`ifdef)
 * is used to compile the examples for simulation or for synthesis.
 *
 * [1] The Verification Guild is an independent e-mail newsletter and
 * moderated discussion forum on hardware verification.  Information on
 * the original Verification Guild example can be found at
 * www.janick.bergeron.com/guild/project.html.
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

// The following include file listed in the book text is in an example
// file that is included by 10.00.00_example_top.sv
//`include "methods.sv"

`include "10.00.00_definitions.sv"  // include external definitions

module test;
  parameter int NumRx = `RxPorts;
  parameter int NumTx = `TxPorts;

  // NumRx x Level 1 Utopia Rx Interfaces
  Utopia Rx[0:NumRx-1] ();

  // NumTx x Level 1 Utopia Tx Interfaces
  Utopia Tx[0:NumTx-1] ();

  // Intel-style Utopia parallel management interface
  //CPU mif;
  CPU mif ();

  // Miscellaneous control interfaces
  logic rst;
  logic clk;
  logic Initialised;

  initial begin
    $display("\n*** Expected simulation results are in \"10.00.00_example_top.log\" ***\n");
    $display("\nSimulation was run with conditional compilation settings of:");
    $display("`define TxPorts %0d", `TxPorts);
    $display("`define RxPorts %0d", `RxPorts);
    `ifdef VERBOSE
      $display("`define VERBOSE");
    `endif
    `ifdef FWDALL
      $display("`define FWDALL");
    `endif
    `ifdef SYNTHESIS
      $display("`define SYNTHESIS");
    `endif
    $display("");
  end

  //`include "./testbench_instance.sv"
  squat #(NumRx, NumTx) squat(Rx, Tx, mif, rst, clk);

  task automatic RandomPkt (inout ATMCellType Pkt, inout seed);
    Pkt.uni.GFC = $random(seed);
    Pkt.uni.VPI = $random(seed) & 8'hff;
    Pkt.uni.VCI = $random(seed);
    Pkt.uni.CLP = $random(seed);
    Pkt.uni.PT  = $random(seed);
    Pkt.uni.HEC = hec(Pkt.Mem[0:3]);
    for (int i=0; i<=47; i++) begin
      Pkt.uni.Payload[i] = 47-i; //$random(seed);
    end
  endtask

  logic [7:0] syndrom[0:255];
  initial begin: gen_syndrom
    int i;
    logic [7:0] sndrm;
    for (i = 0; i < 256; i = i + 1 ) begin
      sndrm = i;
      repeat (8) begin
        if (sndrm[7] === 1'b1)
          sndrm = (sndrm << 1) ^ 8'h07;
        else
          sndrm = sndrm << 1;
      end
      syndrom[i] = sndrm;
    end
  end

  // Function to compute the HEC value
  function automatic bit [7:0] hec (bit [31:0] hdr);
    bit [7:0] rtn;
    rtn = 8'h00;
    repeat (4) begin
      rtn = syndrom[rtn ^ hdr[31:24]];
      hdr = hdr << 8;
    end
    rtn = rtn ^ 8'h55;
    return rtn;
  endfunction

  // System Clock and Reset
  initial begin
    #0 rst = 0; clk = 0;
    #5 rst = 1;
    #5 clk = 1;
    #5 rst = 0; clk = 0;
    forever begin
      #5 clk = 1;
      #5 clk = 0;
    end
  end

  CellCfgType lookup [255:0]; // copy of look-up table

  function bit [0:NumTx-1] find (bit [11:0] VPI);
    for (int i=0; i<=255; i++) begin
      if (lookup[i].VPI == VPI) begin
        return lookup[i].FWD;
      end
    end
    return 0;
  endfunction

  // Stimulus
  initial begin
    automatic int seed=1;
    CellCfgType CellFwd;

    $display("Configuration RxPorts=%0d TxPorts=%0d",
             `RxPorts, `TxPorts);
    mif.Method.Initialise_Host();

    // Configure through Host interface
    repeat (10) @(negedge clk);
    $display("Loading Memory");
    for (int i=0; i<=255; i++) begin
      CellFwd.FWD = i;
      `ifdef FWDALL
        CellFwd.FWD = '1;
      `endif
      CellFwd.VPI = i;
      mif.Method.HostWrite(i, CellFwd);
      lookup[i] = CellFwd;
    end

    // Verify memory
    $display("Verifying Memory");
    for (int i=0; i<=255; i++) begin
      mif.Method.HostRead(i, CellFwd);
      if (lookup[i] != CellFwd) begin
        $display("Error, Mem Location 0x%x contains 0x%x, expected 0x%x",
                 i, lookup[i], CellFwd);
        $stop;
      end
    end
    $display("Memory Verified");

    Initialised=1;
    repeat (5000000) @(negedge clk);
    $display("Error Timeout");
    $finish;
  end

  int TxPktCtr [0:NumTx-1];
  bit [0:NumRx-1] RxGenInProgress;
  genvar RxIter;
  genvar TxIter;
  generate // replicate access to ports
    for (RxIter=0; RxIter<NumRx; RxIter++) begin: RxGen
      initial begin: Sender
        int seed;
        bit [0:NumTx-1] TxPortTarget;
        ATMCellType Pkt;

        Rx[RxIter].data=0;
        Rx[RxIter].soc=0;
        Rx[RxIter].en=1;
        Rx[RxIter].clav=0;
        Rx[RxIter].ready=0;

        RxGenInProgress[RxIter] = 1;
        wait (Initialised === 1'b1);
        seed=RxIter+1;
        Rx[RxIter].Method.Initialise();
        repeat (200) begin
          RandomPkt(Pkt, seed);
          TxPortTarget = find(Pkt.uni.VPI);

          // Increment counter if output packet expected
          for (int i=0; i<NumTx; i++) begin
            if (TxPortTarget[i]) begin
              TxPktCtr[i]++;
              //$display("port %0d ->> %0d", RxIter, i);
            end
          end

          Rx[RxIter].Method.Send(Pkt, RxIter);
          //$display("Port %d sent packet", RxIter);
          repeat ($random(seed)%200) @(negedge clk);
        end
        RxGenInProgress[RxIter] = 0;
      end
    end
  endgenerate

  // Response - open files for response
  generate
    for (TxIter=0; TxIter<NumTx; TxIter++) begin: TxGen
      initial begin: Receiver
        wait (Tx[TxIter].reset===1);
        wait (Tx[TxIter].reset===0);
        forever begin
          Tx[TxIter].Method.Receive(TxIter);
          TxPktCtr[TxIter]--;
        end
      end
    end
  endgenerate

  // Check for all detected packets
  bit [0:NumTx-1] TxDetectEnd;
  generate
    for (TxIter=0; TxIter<NumTx; TxIter++) begin: TxDetect
      initial begin
        TxDetectEnd[TxIter] = 1'b1;
        wait (Initialised === 1'b1);
        wait (RxGenInProgress === 0);
        wait (TxPktCtr[TxIter] == 0)
        TxDetectEnd[TxIter] = 1'b0;
        $display("TxPktCtr[%0d] == %d",
                 TxIter, TxPktCtr[TxIter]);
      end
    end
  endgenerate

  initial begin
    wait (Initialised === 1'b1);
    wait (RxGenInProgress === 0);
    wait (TxDetectEnd === 0);
    $finish;
  end
endmodule
