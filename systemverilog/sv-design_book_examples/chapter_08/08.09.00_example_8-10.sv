/**********************************************************************
 * Polymorphic models with parameterized data types
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

module adder #(parameter type ADDERTYPE = shortint)
              (input  ADDERTYPE  a, b,  // uses redefinable
               output ADDERTYPE  sum,   // data types
               output bit        carry);

  ADDERTYPE temp;  // local variable with redefinable type

  always @(a, b)
    temp = a + b;
  assign sum = temp;
endmodule

module big_chip( /*...*/ );
  shortint     a, b, r1;
  int          c, d, r2;
  int unsigned e, f, r3;
  wire         carry1, carry2, carry3;

  adder                    i1 (a, b, r1, carry1); // 16-bit
  adder #(.ADDERTYPE(int)) i2 (c, d, r2, carry2); // 32-bit signed adder
  adder #(.ADDERTYPE(int unsigned)) i3 (e, f, r3, carry1); // 32-bit unsigned adder

  initial begin
    a = 0; b = -2;
    c = 0; d = -2;
    e = 0; f = -2;
    #1
    $display("\n i1.temp is %0d (%b) (expect -2, 1111111111111110)", i1.temp, i1.temp);
    $display(" i2.temp is %0d (%b) (expect -2, 11111111111111111111111111111110)", i2.temp, i2.temp);
    $display(" i3.temp is %0d (%b) (expect 4294967294, 11111111111111111111111111111110)\n", i3.temp, i3.temp);
    $finish;
  end
endmodule

