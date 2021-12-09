//
// Book, "RTL Modeling with SystemVerilog for Simulation and Synthesis"
// by Stuart Sutherland, published by Sutherland HDL, Inc.
//
// Higher-level netlist to connect a master and slave that use 
// a simplified AMBA AHB bus.
//
// Copyright 2017, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//

///////////////////////////////////////////////////////////
// Top-level Netlist Module -- SystemVerilog-2012 style
///////////////////////////////////////////////////////////
//`begin_keywords "1800-2012"
module chip_top;
  logic        m_clk;       // master clock
  logic        s_clk;       // slave clock
  logic        hclk;        // AHB bus clock
  logic        hresetN;     // AHB bus reset, active low
  logic        chip_rstN;   // reset, active low
  logic [7:0]  thing1;      // misc signal; not part of bus
  logic [7:0]  thing2;      // misc signal; not part of bus

  //
  // instantiate the interface 
  // (using same syntax as a module instance)
  simple_ahb ahb1(.hclk(hclk), 
                  .hresetN(hresetN)
                 );

  // instantiate master and connect the interface instance
  // to the interface port
  master m (.ahb(ahb1),     // connect interface port
            .rstN(chip_rstN),
            .m_clk,         // dot-name connection shortcut
            .thing1,        //   for the other ports
            .thing2
           );

  // instantiate slave and connect the interface instance
  // to the interface port
  slave  s (.ahb(ahb1),     // connect interface port                                 
            .rstN(chip_rstN),
            .*              // wildcard connection shortcut
           );               //   for the other ports

  // instantiate slave and pick modport in the connection
//  slave  s (.ahb(ahb1.slave_ports), // select slave modport
//            .rstN(chip_rstN),
//            .*              // wildcard connection shortcut
//           );

  //... // remaining chip-level code not shown 
  
endmodule: chip_top
//`end_keywords
