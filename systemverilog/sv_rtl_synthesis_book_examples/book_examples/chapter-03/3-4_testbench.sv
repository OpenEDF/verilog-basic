//
// Book, "RTL Modeling with SystemVerilog for ASIC and FPGA Design"
// by Stuart Sutherland
//
// Testbench
//
// Copyright 2016, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//
`begin_keywords "1800-2012"
module test;
  timeunit 1ns/1ns;
  initial begin
    $display();
    $display("port a type after parameter override is %s", $typename(top.dut.add32.a));
    $display("port b type after parameter override is %s", $typename(top.dut.add32.b));
    $display("port sum type after parameter override is %s", $typename(top.dut.add32.sum));
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
  timeunit 1ns/1ns;

  test test ();
  alu  dut  ();

endmodule: top
`end_keywords


