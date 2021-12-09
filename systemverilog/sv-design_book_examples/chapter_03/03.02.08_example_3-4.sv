/**********************************************************************
 * Using enumerated type methods
 *
 * Author:  Don Mills, Stuart Sutherland
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

module confidence_counter(input  wire  synced, compare, resetN, clock,
                          output logic in_sync);

//  enum  {cnt[0:15]} State, NextState;
  enum  {cnt0,  cnt1,  cnt2,  cnt3,  cnt4,
         cnt5,  cnt6,  cnt7,  cnt8,  cnt9,
         cnt10, cnt11, cnt12, cnt13, cnt15} State, NextState;

  always_ff @(posedge clock, negedge resetN)
    if (!resetN) State <= cnt0;
    else         State <= NextState;

  always_comb  begin
    NextState = State;  // default NextState value
    case (State)
      cnt0   : if (compare &&  synced) NextState = State.next;
      cnt1   : begin
                 if (compare &&  synced) NextState = State.next;
                 if (compare && !synced) NextState = State.first;
               end
      cnt15  : if (compare && !synced) NextState = State.prev(2);
      default: begin
                 if (compare &&  synced) NextState = State.next;
                 if (compare && !synced) NextState = State.prev(2);
               end
    endcase
  end

  always_ff @(posedge clock, negedge resetN)
    if (!resetN) in_sync <= 0;
    else begin
      if (State == cnt8) in_sync <= 1;
      if (State == cnt0) in_sync <= 0;
    end

endmodule


module conf_counter_test;

  logic clock, resetN, synced, compare, in_sync;

  confidence_counter dut (.synced(synced),
                          .compare(compare),
                          .resetN(resetN),
                          .clock(clock),
                          .in_sync(in_sync)
                         );

  always @(negedge clock) begin
    $strobe("State = %0s   synced = %b   compare = %b   in_sync = %b",
            dut.State.name, synced, compare, in_sync);
  end

  initial begin
    clock = 0;
    forever #5 clock = ~clock;
  end

  initial begin
    synced      = 0;
    compare = 0;

    // test that counter resets
    $display("\nTesting reset... (expect State=cnt0, in_sync=0)");
    #1 resetN   = 0;
    repeat(4) @(negedge clock) ;
    resetN = 1;
    // test that counter increments on synced when enabled.
    // The test pattern clears for 1 clock, then sets synced for 4 clocks.
    // The pattern is repeated 4 times.
    $display("\nTesting increment/decrement (at end, expect State = cnt9, in_sync = 1)");
    compare = 1;                 // enable matching
    repeat(4) begin
      synced = 0;                    // clear synced
      @(negedge clock) synced = 1;     // set synced
      repeat(4) @(negedge clock) ;    // hold for 4 clocks
    end
    compare = 0;                 // disable matching
    $display("");
    $finish;
  end
endmodule
