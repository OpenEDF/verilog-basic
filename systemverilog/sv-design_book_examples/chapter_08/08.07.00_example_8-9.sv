/**********************************************************************
 *  passing a reference to an array through a module ref port
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

typedef struct packed {
  byte opcode;
  int  operand;
  bit  carry, zero;
} instruction_t;

module decoder (output logic [23:0]  microcode,
                input  instruction_t instruction,
                ref    logic [23:0]  TABLE [255:0]
               );

  always @(instruction)
    microcode = TABLE[instruction];

endmodule

module DSP (input clk, resetN );

  logic [23:0]  microcode;
  instruction_t instruction;

  logic [23:0] LUT [255:0];  // Look Up Table

  decoder i1 (microcode, instruction, LUT);   // instance of the decoder

  initial begin
    //$readmemb("microcode.dat", LUT, 0, 1);  // load the look up table
    LUT[0] = 24'b1010_1111_1100_0000_0101_0011;
    LUT[1] = 24'b1100_0000_0101_0011_1010_1111;
    instruction={0,0,0,1};
    #1 $display("\n microcode=%b (expect 110000000101001110101111)\n", microcode);
    $finish;
  end
  //...
endmodule
