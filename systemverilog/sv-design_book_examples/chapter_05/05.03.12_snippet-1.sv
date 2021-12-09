/**********************************************************************
 * Task/function ref args
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

module chip (/*...*/);
  bit clock;

  typedef struct packed {
    bit valid;
    bit [ 7:0] check;
    bit [63:0] data;
  } packet_t;

  packet_t  data_packet;
  bit [7:0] raw_data [0:7];

  always @(posedge clock)
    fill_packet (raw_data, data_packet);

  task fill_packet (
    ref  bit [7:0] data_in [0:7],  // ref arg
    ref  packet_t data_out );      // ref arg
    for (int i=0; i<=7; i++) begin
      data_out.data[(8*i)+:8] = data_in[i];
      data_out.check[i] = ^data_in[i];
    end
    data_out.valid = 1;
  endtask

  always #5 clock = ~clock;

  initial begin
    raw_data[0]=4; raw_data[1]=2; raw_data[3]=1;
    @(posedge clock) ;
    $display("\n data_packet.data  = %0d (expect 16777732)", data_packet.data);
    $display(" data_packet.check = %b (expect 00001011)\n", data_packet.check);
    $finish;
  end
endmodule
