/**********************************************************************
 * Packed union declarations with structures and arrays
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

module test;
  bit clock, resetN = 1;
  bit load_data, data_ready;
  byte byte_in;
  int i;

  typedef struct packed {
    bit [15:0] source_address;
    bit [15:0] destination_address;
    bit [23:0] data;
    bit [ 7:0] opcode;
  } data_packet_t;

  union packed {
    data_packet_t  packet;  // packed structure
    bit [7:0][7:0] bytes;   // packed array
  } dreg;

  always @(posedge clock, negedge resetN)
    if (!resetN) begin
      dreg.packet <= '0;  // store as packet type
      i <= 0;
    end
    else if (load_data) begin
      dreg.bytes[i] <= byte_in; // store as bytes
      i <= i + 1;
    end

  always @(posedge clock)
    if (data_ready)
      case (dreg.packet.opcode) // read as packet
        //...
        default: ;
      endcase

  always #5 clock = ~clock;

  initial begin
    byte_in = 8'hF0;
    @(negedge clock) resetN = 0;
    @(negedge clock) resetN = 1;
    load_data = 1;
    repeat (4) @(negedge clock) ;
    load_data = 0;
    data_ready = 1;
    @(negedge clock) $display("\ndreg.packet.opcode=%h (expect f0 (hex))\n", dreg.packet.opcode);
    @(negedge clock) $finish;
  end

endmodule
