//
// Book, "RTL Modeling with SystemVerilog for Simulation and Synthesis"
// by Stuart Sutherland, published by Sutherland HDL, Inc.
//
// SystemVerilog mixed RTL and gate-level model of a 1-bit adder,
// illustrating the use of `default_nettype for implicit nets.
//
// Copyright 2017, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//

`default_nettype tri1        // change default for implicit nets
//`default_nettype uwire      // change default for implicit nets
//`begin_keywords "1800-2012" // use SystemVerilog-2012 keywords
module mixed_rtl_and_gate_adder
(input        a,   // implicit uwire net, logic data type
 input  logic b,   // implicit uwire net, logic data type
 input  reg   ci,  // implicit uwire net, logic data type
 output       sum, // implicit uwire net, logic data type 
 output logic co   // implicit variable, logic data type
);
  timeunit 1ns; timeprecision 1ns;

  xor  g1 (n1, a, b);    // undeclared n1 is implicit uwire net
  xor  g2 (sum, n1, ci);
  and  g3 (n2, a, b);    // undeclared n2 is implicit uwire net

  assign n3 = n1 & ci;   // undeclared n3 is implicit uwire net

  always_comb begin
    co = n2 | n3;
  end
endmodule: mixed_rtl_and_gate_adder
//`end_keywords
`default_nettype wire    // reset default for implicit nets
