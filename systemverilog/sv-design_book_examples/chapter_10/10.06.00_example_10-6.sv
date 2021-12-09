/**********************************************************************
 * UtopiaMethod interface for encapsulating test methods
 *
 * To simulate this example with stimulus, invoke simulation on
 * 10.00.00_example_top.sv.  This top-level file includes all of the
 * example files in chapter 10.
 *
 * Author: Stuart Sutherland
 * Revision: 1.00
 * Last modified: 11/20/2003
 *
 * (c) Copyright 2003, Sutherland HDL, Inc. *** ALL RIGHTS RESERVED ***
 * www.sutherland-hdl.com
 *
 *  This source file may be used and distributed without restriction
 *  provided that this copyright statement is not removed from the file
 *  and that any derivative work contains this copyright notice.
 *
 * Used with permission in the book, "SystemVerilog for Design"
 *  By Simon Davidmann, Peter Flake and Stuart Sutherland
 *  Book copyright: 2003, Kluwer Academic Publishers, Norwell, MA, USA
 *  www.wkap.il
 *********************************************************************/

`include "10.00.00_definitions.sv"  // include external definitions

interface UtopiaMethod;
  task automatic Initialise ();
  endtask

  task automatic Send (input ATMCellType Pkt, input int PortID);
    static int PacketID;
    PacketID++;

    Pkt.tst.PortID = PortID;
    Pkt.tst.PacketID = PacketID;

    // iterate through bytes of packet, deasserting
    // Start Of Cell indicater
    @(negedge Utopia.clk_out);
    Utopia.clav <= 1;
    for (int i=0; i<=52; i++) begin
      // If not enabled, loop
      while (Utopia.en === 1'b1) @(negedge Utopia.clk_out);

      // Assert Start Of Cell indicater, assert enable,
      // send byte 0 (i==0)
      Utopia.soc <= (i==0) ? 1'b1 : 1'b0;
      Utopia.data <= Pkt.Mem[i];
      @(negedge Utopia.clk_out);
    end
    Utopia.data <= 8'bx;
    Utopia.clav <= 0;
  endtask

  task automatic Receive (input int PortID);
    ATMCellType Pkt;

    Utopia.clav = 1;
    while (Utopia.soc!==1'b1 && Utopia.en!==1'b0)
      @(negedge Utopia.clk_out);
    for (int i=0; i<=52; i++) begin
      // If not enabled, loop
      while (Utopia.en!==1'b0) @(negedge Utopia.clk_out);

      Pkt.Mem[i] = Utopia.data;
      @(negedge Utopia.clk_out);
    end

    Utopia.clav = 0;
    // Write Rxed data to logfile
    `ifdef VERBOSE
      $write("Received packet at port %0d from port %0d PKT(%0d)\n",
      PortID, Pkt.tst.PortID, Pkt.tst.PacketID);
      //PortID, Pkt.nni.Payload[0], Pkt.nni.Payload[1:4]);
    `endif
  endtask
endinterface
