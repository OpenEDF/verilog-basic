//
// Book, "RTL Modeling with SystemVerilog for ASIC and FPGA Design"
// by Stuart Sutherland
//
// SystemVerilog mixed RTL and gate-level model of a 1-bit adder,
// illustrating implicit nets for undeclared signals.
//
// Copyright 2016, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//

`begin_keywords "1800-2012"  // use SystemVerilog-2012 keywords
module mixed_rtl_and_gate_adder
(input        a,   // implicit wire net, logic data type
 input  logic b,   // implicit wire net, logic data type
 input  reg   ci,  // implicit wire net, logic data type
 output       sum, // implicit wire net, logic data type 
 output logic co   // implicit variable, logic data type
);
  timeunit 1ns/1ns;

  xor  g1 (n1, a, b);    // undeclared n1 is implicit wire net
  xor  g2 (sum, n1, ci);
  and  g3 (n2, a, b);    // undeclared n2 is implicit wire net

  assign n3 = n1 & ci;   // undeclared n3 is implicit wire net

  always_comb begin
    co = n2 | n3;
  end
endmodule: mixed_rtl_and_gate_adder
`end_keywords
