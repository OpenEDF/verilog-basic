/**********************************************************************
 * Mixed ways to declare time units and time precision; priority rules
 * apply if there is a mix of declarations
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

timeunit 1ns;        // external time unit and precision
timeprecision 1ns;

module my_chip /* ( ... ); */
  ( output wire [31:0] result,
    input  wire [31:0] data,
    input  wire        clock, resetN);

  timeprecision 1ps;  // local precision (priority over external)

  FSM FSM (result, data_request, data, clock, resetN);

  always @(posedge data_request) begin
    #2.5 send_packet;  // uses external units and local precision
    #3.75ns check_crc; // specific units take precedence
    end

  task send_packet();  /* stub for testing */
    begin
      //...
      $display("  send_packet task called");
    end
  endtask

  task check_crc();  /* stub for testing */
    begin
      //...
      $display("  check_crc task called");
    end
  endtask

endmodule

`timescale 1ps/1ps  // directive takes precedence over externals
module FSM /* ( ... ) */
  ( output int   data_out, output bit data_request,
    input [31:0] data_in,  input clock, resetN);

  timeunit 1ns;  // local units take priority over directive

  enum {LOAD, WAITE} State, Next;

  always @(State) begin
    #1.2 case (State) // uses local units & timescale precision
      WAITE: #20ps Next = LOAD;  // specific units take precedence
      LOAD:  #75ps Next = WAITE;
    endcase
  end

  always @(posedge clock, negedge resetN) begin
    if (!resetN) State <= WAITE;
    else State <= Next;
  end

  always @(State) begin
    case (State)
      WAITE: begin data_request = 1; data_out = 0; end
      LOAD:  begin data_request = 0; data_out = data_in << 2; end
    endcase
  end
endmodule

`timescale 1ns/1ps  // directive takes precedence over externals
module test;
  bit clock;
  bit resetN = 1;  // active low reset
  int data_in;
  wire [31:0] data_out;

  my_chip dut (data_out, data_in, clock, resetN);

  always #5 clock = ~clock;

  initial begin
    $timeformat(-9, 3, "ns", 10);
    $display("\nExpect send_packet and check_crc tasks to be called twice...");
    data_in = 10;
    resetN <= 0;
    @(negedge clock) resetN = 1;
    repeat(3) @(negedge clock) ;
    $display("At %t: data_in=%0d  data_out=%0d (expect 10, 40)\n",
             $realtime, data_in, data_out);
    $finish;
  end

endmodule
  