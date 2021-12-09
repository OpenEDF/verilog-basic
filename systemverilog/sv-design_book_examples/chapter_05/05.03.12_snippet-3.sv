/**********************************************************************
 * Task/function ref arg -- sensitivity to calling scope
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
  bit done;

  typedef struct packed {
    bit valid;
    bit [ 7:0] check;
    bit [63:0] data;
  } packet_t;

  packet_t  send_packet, receive_packet;

  task automatic check_results (
    input packet_t sent,
    ref   packet_t received,
    ref   done );
    static int error_count = 0;
    wait (done)
    if (sent !== received) begin
      error_count++;
      $display("ERROR! received bad packet");
    end
    $display("check_results task finished, error_count = %0d", error_count);
  endtask

  initial fork
    send_packet.check = 2; send_packet.data = 5;
    receive_packet.check = 2; receive_packet.data = 7;
    $display("\nExpect code to report bad_packet error...\n");
    #05 check_results(send_packet, receive_packet, done);
    #10 done = 1;
    #15 done = 0;
    #15 $display("\n");
    #30 $finish;
  join
endmodule
