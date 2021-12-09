//
// Book, "RTL Modeling with SystemVerilog for Simulation and Synthesis"
// by Stuart Sutherland, published by Sutherland HDL, Inc.
//
// Testbench
//
// Copyright 2017, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//
//`begin_keywords "1800-2012"
module test;
  timeunit 1ns; timeprecision 1ns;
  initial begin
    $display();
    $display("port i1.a type after parameter override is %s", $typename(top.i1.a));
    $display("port i1.b type after parameter override is %s", $typename(top.i1.b));
    $display("port i1.sum type after parameter override is %s", $typename(top.i1.sum));
    $display();
    $display("port i2.a type after parameter override is %s", $typename(top.i2.a));
    $display("port i2.b type after parameter override is %s", $typename(top.i2.b));
    $display("port i2.sum type after parameter override is %s", $typename(top.i2.sum));
    $display();
    $display("port i3.a type after parameter override is %s", $typename(top.i3.a));
    $display("port i3.b type after parameter override is %s", $typename(top.i3.b));
    $display("port i3.sum type after parameter override is %s", $typename(top.i3.sum));
    $display();
    $display("port i4.a type after parameter override is %s", $typename(top.i4.a));
    $display("port i4.b type after parameter override is %s", $typename(top.i4.b));
    $display("port i4.sum type after parameter override is %s", $typename(top.i4.sum));
    $display();
  end

  initial begin
    $display ("\n\n*** No simulation results expected ***");
    $display ("*** Only testing that the dut compiles and elaborates ***\n\n");
    #5 ;
    $finish;
  end
endmodule: test

module top;
  timeunit 1ns; timeprecision 1ns;
	parameter type ADD_REAL = real;       // type parameter
	typedef logic signed [23:0] bus24_t;  // user-definded type

  logic     a1, b1, s1;    // 1-bit logic variables
  int       ai, bi, si;    // 32-bit signed variables
  ADD_REAL  ar, br, sr;    // floating point variables
  bus24_t   a24, b24, s24; // 24-bit signed variables

  // instantiate an adder with default configuration (1-bit)
  add_type i1 (.a(a1), .b(b1), .sum(s1) );

  // instantiate an adder and configure as 32-bit signed type
  add_type #(.DTYPE(int) ) i2 (.a(ai), .b(bi), .sum(si) );

  // instantiate an adder and configure as floating point type
  add_type #(.DTYPE(ADD_REAL) ) i3 (.a(ar), .b(br), .sum(sr) );

  // instantiate an adder and configure as 24-bit signed type
  add_type #(.DTYPE(bus24_t)) i4 (.a(a24), .b(b24), .sum(s24));

endmodule: top
//`end_keywords


