/**********************************************************************
 * Extern interface declarations (interface prototypes)
 * (Not in book)
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

extern interface basic_bus (input wire clock, resetN, test_mode);

extern module core (basic_bus bus,
                    output logic  [63:0] jump_address,
                    input  wire [47:0] instruction
                   );

extern module slave (basic_bus bus);

extern module dual_port_ram (basic_bus bus,
                             input  wire [63:0] program_address,
                             output logic  [47:0] data_b
                            );
extern module instruction_reg (output logic  [63:0] program_address,
                               output logic  [47:0] instruction,
                               input  wire [63:0] jump_address,
                               input  wire [47:0] next_instruction,
                               input  wire        clock,
                               input  wire        resetN
                              );
extern module test_generator (basic_bus bus);


module top (input wire clock, resetN, test_mode);

  initial begin
    $display("\nNo simulation results--just checking that example compiles and elaborates\n");
    $finish;
  end

  wire [63:0] program_address, jump_address;
  wire [47:0] instruction, next_instruction, data_b;

  alias data_b = next_instruction;  // equivalent nets

  basic_bus bus ( .* );  // instance of an interface (instance name is bus)

  core core ( .* );      // instances of modules; implicit port connections
  slave slave1 ( .* );
  slave slave2 ( .* );
  instruction_reg ir ( .* );
  dual_port_ram ram ( .* );
  test_generator test_gen( .* );
endmodule



