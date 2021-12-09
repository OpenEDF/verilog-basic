/**********************************************************************
 * Declaring nested modules
 *
 * Author: Stuart Sutherland
 * Revision: 1.00
 * Last modified: 11/20/2003
 *
 * (c) Copyright 2003, Sutherland HDL, Inc. *** ALL RIGHTS RESERVED ***
 * www.sutherland-hdl.com
 *
 *  This source file may be used and distributed without restriction
 *  provided that this copyright statement is not removed from the file
 *  and that any derivative work contains this copyright notice.
 *
 * Used with permission in the book, "SystemVerilog for Design"
 *  By Simon Davidmann, Peter Flake and Stuart Sutherland
 *  Book copyright: 2003, Kluwer Academic Publishers, Norwell, MA, USA
 *  www.wkap.il
 *********************************************************************/

bit sys_resetN = 1;  // system reset (active low)
bit resetN = 1;      // external reset (active low)

module chip;         // top level of design
  bit         clock;
  dreg    i1 (clock);
  ip_core i2 (clock);
  always #5 clock = ~clock;
endmodule: chip

module dreg (input wire clock /*,...*/);  // global module definition
  initial $display("module dreg hierarchy path is %m");
  //...
endmodule: dreg

module ip_core (input clock);             // global module definition

  bit        resetN = 1;  // local reset (active low)
  bit  [7:0] d1, d2;      // local variables in ip_core
  wire [7:0] q1, q2;      // local nets in ip_core

  sub1 u1 (.ck(clock), .d(d1), .q(q1));  // instance of nested module sub1
  sub2 u2 ();                            // instance of nested module sub2

  initial $display("module ip_core hierarchy path is %m");

  initial begin
    $monitor("At %0d: q1=%d  q2=%d", $time, q1, q2);
    d1 = 5; d2 = 128;
    #1 resetN = 0;  // assert local reset
    #5 resetN = 1;
    repeat (3) @(negedge clock) d1++;
    #1 sys_resetN = 0;  // assert system reset
    #5 sys_resetN = 1;
    repeat (3) @(negedge clock) d2--;
    //$stop;
    $finish;
  end

  module sub1 (input  wire        ck,
                      wire  [7:0] d,
               output logic [7:0] q);    // nested module definition
    initial $display("module sub1 hierarchy path is %m");
    always @(posedge ck)
      if (!resetN) q <= 0;
      else         q <= ++q ^ d;  // generate pseudo-random values
  endmodule: sub1

  module sub2;                           // nested module definition
    //sub2 does not have ports (looks in parent module for identifiers)
    assign q2 = (d1 >> 4) | (d2 << 4);
    initial $display("module sub2 hierarchy path is %m");
    initial @(negedge resetN)
      $display("sub2 saw negedge of ip_core resetN");
  endmodule: sub2

endmodule: ip_core

module test;

  chip dut ();  // instance of top-level of design

  initial begin
    $display("\nNo simulation results--just checking that example compiles and elaborates.\n");
    $finish;
  end
endmodule
