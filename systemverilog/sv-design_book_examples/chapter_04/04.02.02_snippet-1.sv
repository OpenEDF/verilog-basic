/**********************************************************************
 * Unpacked union declarations with int/real
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

  bit  read, write;
  int  int_operand;
  real real_operand;
  enum {INT, FP} operation_type;

  struct {
    bit is_real;
    union {
      int  i;
      real r;
    } value;
  } data;
  //...
  always @(posedge write) begin
    case (operation_type)
      INT: begin
             data.value.i <= 5;
             data.is_real <= 0;
           end
      FP:  begin
             data.value.r <= 3.1415;
             data.is_real <= 1;
           end
    endcase
  end
  //...
  always @(posedge read) begin
    if (data.is_real)
      real_operand <= data.value.r;
    else
      int_operand <= data.value.i;
  end


  initial begin
    operation_type = FP;
    #1 write = 1;
    #1 write = 0;
    #1 read = 1;
    #1 read = 0;
    #1 if (data.is_real)
         $display("\n data is %f (expect 3.1415)\n", real_operand);
       else
         $display("\n Test failed: expected the is_real flag to be set\n");
    #1 $finish;
  end
endmodule
