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

module test (
  output logic a,
  output logic b,
  input  logic y
);
  timeunit 1ns/1ns;

  initial begin
    for (int i=0; i<=1; i++) begin
      for (int j=0; j<=1; j++) begin
        a = i;
        b = j;
        #5;
        $display("  %b NAND %b is %b", a, b, y);
        #5;
      end
    end
    $finish;
  end
endmodule: test

module top;
  timeunit 1ns/1ns;

  logic a;
  logic b;
  logic y;

  test              i1 (.*);
  switch_level_nand i2 (.*);
endmodule: top


