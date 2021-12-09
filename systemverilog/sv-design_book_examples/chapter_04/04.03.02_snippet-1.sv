/**********************************************************************
 * Packed array declarations, references to bit selects, part selects
 * and slice selects
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
 *   1.10 21 Jul 2004 -- corrected errata as printed in the book
 *                       "SystemVerilog for Design" (first edition) and
 *                       to bring the example into conformance with the
 *                       final Accellera SystemVerilog 3.1a standard
 *                       (for a description of changes, see the file
 *                       "errata_SV-Design-book_26-Jul-2004.txt")
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

  wire [1:0][3:0][3:0] bus;  // 3-D packed array


  typedef struct packed {
    byte crc;
    int  data;
  } data_word;

  data_word [7:0] darray;  // 1-D packed array of
                           // packed structures


  bit [3:0][7:0] data;  // 2-D packed array


  wire [31:0] out = data;          // whole array

  wire sign = data[3][7];          // bit-select

  wire [3:0] nib = data [0][3:0];  // part-select

  byte high_byte = data[3];        // 8-bit slice (variable initialization)

  logic [15:0] word = data[1:0];   // 2 slices (variable initialization)

  byte high_byte2;
  assign high_byte2 = data[3];     // 8-bit slice (continuous assignment)

  logic [15:0] word2;
  assign word2 = data[1:0];        // 2 slices (continuous assignment)

  bit [3:0][15:0] a, b, result;    // packed arrays

  initial begin
    data = {16{2'b10}};
    #1
    $display("\n out = %b (expect 1010...1010 [32 bits])", out);
    $display("\n sign = %b (expect 1)", sign);
    $display("\n nib = %b (expect 1010)", nib);
    $display("\n high_byte  = %b (expect 00000000)", high_byte);
    $display(" high_byte2 = %b (expect 10101010)", high_byte2);
    $display("\n word  = %b (expect 0000...0000 [16 bits])", word);
    $display(" word2 = %b (expect 1010...1010 [16 bits])", word2);

    a = 2; b = 1;
    result = (a << 1) + b;
    #1
    $display("\n result = %0d (expect 5)\n", result);

    $finish;
  end
endmodule
