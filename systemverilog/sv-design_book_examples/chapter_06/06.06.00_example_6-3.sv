/**********************************************************************
 * Nested unnamed begin...end blocks
 *
 * Authors: Stuart Sutherland, Lee Moore
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

  bit clock, reset, Txsel_out, SquatState, forward,
      wait_rx_valid, wait_rx_not_valid, NumRx, ATMcell;
  bit [7:0] RoundRobin, RxATMcell, Rxready, Txvalid, Rxvalid;

  always_ff @(posedge clock, posedge reset)
    begin: FSM_procedure
      bit breakVar;
      if (reset) begin: reset_logic
        Rxready <= '1;
        Txvalid <= '0;
        Txsel_out <= '0;
        SquatState <= wait_rx_valid;
        forward <= 0;
        RoundRobin = 1;
      end: reset_logic
      else begin: clocked_logic
        case (SquatState)
          wait_rx_valid:
          begin: rx_valid_state
            Rxready <= '1;
            breakVar = 1;
            for (int j=0; j<NumRx; j+=1) begin: loop1
              for (int i=0; i<NumRx; i+=1) begin: loop2
                if (Rxvalid[i] && RoundRobin[i] && breakVar)
                  begin: match
                    ATMcell <= RxATMcell[i];
                    Rxready[i] <= 0;
                    SquatState <= wait_rx_not_valid;
                    breakVar = 0;
                  end: match
              end: loop2
            end: loop1
          end: rx_valid_state
          //... // process other SquatState states
        endcase
      end: clocked_logic
    end: FSM_procedure


  initial begin
    $display("\nNo simulation results--only checking that example compiles and elaborates\n");
    $finish;
  end
endmodule
