/**********************************************************************
 * Netlist using .* port connecitons with net aliases
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

module chip (input wire master_clock,
             input wire master_reset //,
             /*...*/);

  initial begin
    $display("\nNo simulation results--only checking that example compiles and elaborates\n");
    $finish;
  end

  wire [31:0] address, data, new_address, jump_address,
              next_address, next_addr, current_addr;

  alias clk = clock = master_clock;
  alias rstN = reset_n = master_reset;
  alias data = new_address = jump_address;
  alias next_address = next_addr;
  alias current_addr = address;

  ROM           i1 ( .* );
  program_count i2 ( .* );
  address_reg   i3 ( .* );

endmodule

module ROM (output wire [31:0] data,
            input  wire [31:0] address,
            input  wire        clk);
  //...
endmodule

module program_count (output logic [31:0] next_address,
                      input  wire  [31:0] jump_address,
                      input  wire         clock, reset_n);
  //...
endmodule

module address_reg (output wire [31:0] current_addr,
                    input  wire [31:0] next_addr,
                    input  wire        clk, rstN);
  //...
endmodule
