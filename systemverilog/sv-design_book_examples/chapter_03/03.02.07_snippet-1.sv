/**********************************************************************
 * Casting enumerated type assignments
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

  typedef enum {WAIT, LOAD, READY} states_t;
  states_t state, next_state;

  initial begin // legal assignments using casting
    state = LOAD;
    next_state = states_t'(state + 1);    // legal, within range
    $display("\n state=%0d   next_state=%0d (expect 1, 2)",
             state, next_state);

    state = READY;
    next_state = states_t'(state + 1);    // legal, out of range
    $display("\n state=%0d   next_state=%0d (expect 2, ? [ambiguous in SV standard])",
             state, next_state);

    next_state = READY;
    $cast(next_state, state + 1);       // legal, out of range
    $display("\n state=%0d   next_state=%0d (expect 2, 2)",
             state, next_state);

    $finish;
  end
endmodule
