/**********************************************************************
 * Finite State Machine modeled with reversed case and enumerated types
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

module traffic_light (output bit   green_light,
                                   yellow_light,
                                   red_light,
                      input        sensor,
                      input [15:0] green_downcnt,
                                   yellow_downcnt,
                      input        clock, resetN);

  enum bit [2:0] {RED    = 3'b001,
                  GREEN  = 3'b010,
                  YELLOW = 3'b100} State, Next;

  enum {R_BIT = 0,  // index of RED state in State register
        G_BIT = 1,  // index of GREEN state in State register
        Y_BIT = 2} state_bit;

  always_ff @(posedge clock, negedge resetN)
    if (!resetN) State <= RED;  // reset to red light
    else         State <= Next;

  always_comb begin: set_next_state
    Next = State;  // the default for each branch below
    unique case (1'b1)  // reversed case statement
      State[R_BIT]: if (sensor) Next = GREEN;
      State[G_BIT]: if (green_downcnt==0) Next = YELLOW;
      State[Y_BIT]: if (yellow_downcnt == 0) Next = RED;
    endcase
  end: set_next_state

  always_comb begin: set_outputs
    {red_light, green_light, yellow_light} = 3'b000;
    unique case (1'b1)  // reversed case statement
      State[R_BIT]: red_light = 1;
      State[G_BIT]: green_light = 1;
      State[Y_BIT]: yellow_light = 1;
    endcase
  end: set_outputs
endmodule

module test;

  wire  green_light, yellow_light, red_light;
  bit   sensor, clock, resetN = 1;
  bit   [15:0] green_downcnt, yellow_downcnt;

  traffic_light dut (.green_light(green_light),
                     .yellow_light(yellow_light),
                     .red_light(red_light),
                     .sensor(sensor),
                     .green_downcnt(green_downcnt),
                     .yellow_downcnt(yellow_downcnt),
                     .clock(clock),
                     .resetN(resetN) );

  always #5 clock = ~clock;

  initial begin
    #1 resetN = 0;
    @(negedge clock)
      $display("\n red_light=%b  green_light=%b  yellow_light=%b (expect 1, 0, 0)",
               red_light, green_light, yellow_light);
      resetN = 1;
    @(negedge clock)
      $display("\n red_light=%b  green_light=%b  yellow_light=%b (expect 1, 0, 0)",
               red_light, green_light, yellow_light);
      sensor = 1;
    @(negedge clock)
      $display("\n red_light=%b  green_light=%b  yellow_light=%b (expect 0, 1, 0)",
               red_light, green_light, yellow_light);
      sensor = 0;
    @(negedge clock) ;
      $display("\n red_light=%b  green_light=%b  yellow_light=%b (expect 0, 0, 1)",
               red_light, green_light, yellow_light);
    @(negedge clock) ;
      $display("\n red_light=%b  green_light=%b  yellow_light=%b (expect 1, 0, 0)",
               red_light, green_light, yellow_light);

    @(negedge clock)
      $display("");
      $finish;
  end
endmodule