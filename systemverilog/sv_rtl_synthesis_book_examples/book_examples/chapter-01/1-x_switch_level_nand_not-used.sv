//
// Book, "RTL Modeling with SystemVerilog for ASIC and FPGA Design"
// by Stuart Sutherland
//
// Example 1-x (not-used)
// Switch-level model of a CMOS NAND gate
//
// Copyright 2016, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//
module switch_level_nand (
  input  wire a,
  input  wire b,
  output wire y
);
  timeunit 1ns/1ns;

  supply0 gnd;
  supply1 vcc;
  wire    n1;
  
  pmos g1 (y,  vcc, a);
  pmos g2 (y,  vcc, b);
  nmos g3 (y,  n1,  a);
  nmos g4 (n1, gnd, b);
endmodule: switch_level_nand
