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
    $display("port ram1.addr type after parameter override is %s", $typename(top.ram1.addr));
    $display("port ram1.data type after parameter override is %s", $typename(top.ram1.data));
    $display();
    $display("port ram2.addr type after parameter override is %s", $typename(top.ram2.addr));
    $display("port ram2.data type after parameter override is %s", $typename(top.ram2.data));
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
  logic        rdN, wrN;
  logic [ 9:0] addr1;
  tri   [ 7:0] data1;
  logic [15:0] addr2;
  tri   [ 7:0] data2;

  test test ();
  ram                 ram1  (.addr(addr1),.data(data1), .*);
  ram #(.SIZE(65536)) ram2  (.addr(addr2),.data(data2), .*);

endmodule: top
`end_keywords


