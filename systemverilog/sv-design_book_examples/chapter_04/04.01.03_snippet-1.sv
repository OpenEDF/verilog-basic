/**********************************************************************
 * Packed structures
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

  typedef struct packed {
    bit  valid;
    byte tag;
    bit  [31:0] data;
  } data_word_t;

  data_word_t packet_in, packet_out;

  always @(posedge clock)
    packet_out <= packet_in << 2;

  always #5 clock = ~clock;

  initial begin
    packet_in = {1, '1, 1024};
    $display("\npacket_in:  valid=%b, tag=%h, data=%0d (expect 1, ff, 1024)",
             packet_in.valid, packet_in.tag, packet_in.data);
    @(negedge clock)
    $display("packet_out: valid=%b, tag=%h, data=%0d (expect 1, fc, 4096)\n",
             packet_out.valid, packet_out.tag, packet_out.data);
    @(negedge clock) $finish;
  end
endmodule
