//
// Book, "RTL Modeling with SystemVerilog for Simulation and Synthesis"
// by Stuart Sutherland, published by Sutherland HDL, Inc.
//
// Master and Slave modules with interface ports for the
// simplified AMBA AHB bus.
//
// Copyright 2017, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//

///////////////////////////////////////////////////////////
// Master Module Port List -- SystemVerilog-2012 style
///////////////////////////////////////////////////////////
//`begin_keywords "1800-2012"
module master
(simple_ahb.master_ports ahb, // interface port & modport
 // other ports
 input  logic       m_clk,  // master clock
 input  logic       rstN,   // reset, active low
 input  logic [7:0] thing1, // misc signal; not part of bus
 output logic [7:0] thing2  // misc signal; not part of bus
);
  //... // master module functionality not shown 
endmodule: master
//`end_keywords

///////////////////////////////////////////////////////////
// Slave Module Port List -- SystemVerilog-2012 style
///////////////////////////////////////////////////////////
//`begin_keywords "1800-2012"
module slave
(simple_ahb.slave_ports ahb, // interface port & modport
 // other ports
 input  logic       s_clk,  // slave clock
 input  logic       rstN,   // reset, active low
 output logic [7:0] thing1, // misc signal; not part of bus
 input  logic [7:0] thing2  // misc signal; not part of bus
);
  //... // slave module functionality not shown 
endmodule: slave

/////// version with no modport selection ///////
//module slave
//(simple_ahb         ahb, // interface port without modport
// // other ports
// input  logic       s_clk,  // slave clock
// input  logic       rstN,   // reset, active low
// output logic [7:0] thing1, // misc signal; not part of bus
// input  logic [7:0] thing2  // misc signal; not part of bus
//);
//  //  //... // slave module functionality not shown 
//endmodule: slave
//`end_keywords
