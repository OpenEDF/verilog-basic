/**********************************************************************
 * Unpacked array declarations, slice-to-slice and array-to-array
 * assignments
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

  // a 1-dimensional unpacked array of
  // 1024 1-bit nets
  wire n [0:1023];

  // a 1-dimensional unpacked array of
  // 256 8-bit variables
  reg [7:0] LUT [0:255];

  // a 1-dimensional unpacked array of
  // 1024 real variables
  real r [0:1023];

  //a 3-dimensional unpacked array of
  // 32-bit int variables
  integer i [7:0][3:0][7:0];

  bit [63:0] d_array [1:128]; // array of vectors

  shortreal cosines [0:90];  // array of floats

  typedef enum {Mo, Tu, We, Th, Fr, Sa, Su} Week;
  Week Year [1:52];  // array of Week types


  bit   a1 [7:0][1023:0]; // unpacked array
  logic a2 [1:8][1:1024]; // unpacked array

  initial begin: loop_i  // initialize array a1 the hard way
    int i, j;
    for (i=0; i<=7; i=i+1) begin: loop_j
      for (j=0; j<=1023; j=j+1) begin
        a1[i][j] = j[0];
      end
    end

    a2[3] = a1[0];  // copy a slice of an array
    $display("\n a2[3][1] = %b (expect 1)\n", a2[3][1]);
    $display("\n a2[1][1] = %b (expect x)\n", a2[1][1]);

    a2 = a1;        // copy an entire array
    $display("\n a2[1][1] = %b (expect 1)\n", a2[1][1]);
    #10 $finish;
  end
endmodule
