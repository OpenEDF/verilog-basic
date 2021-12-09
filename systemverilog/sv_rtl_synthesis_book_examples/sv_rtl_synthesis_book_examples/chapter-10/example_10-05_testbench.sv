//
// Book, "RTL Modeling with SystemVerilog for Simulation and Synthesis"
// by Stuart Sutherland, published by Sutherland HDL, Inc.
//
// // Testbench plus master and slave modules.
//
// Copyright 2017, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//

///////////////////////////////////////////////////////////
// Master Module Port List
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
// Slave Module Port List
///////////////////////////////////////////////////////////
//`begin_keywords "1800-2012"
module slave
(simple_ahb         ahb, // interface port without modport
 // other ports
 input  logic       s_clk,  // slave clock
 input  logic       rstN,   // reset, active low
 output logic [7:0] thing1, // misc signal; not part of bus
 input  logic [7:0] thing2  // misc signal; not part of bus
);
  //... // slave module functionality not shown 
endmodule: slave
//`end_keywords

///////////////////////////////////////////////////////////
// Top-level Netlist Module
///////////////////////////////////////////////////////////
//`begin_keywords "1800-2012"
module chip_top;
  logic        m_clk;       // master clock
  logic        s_clk;       // slave clock
  logic        chip_rstN;   // reset, active low
  logic [7:0]  thing1;      // misc signal; not part of bus
  logic [7:0]  thing2;      // misc signal; not part of bus

  //
  // instantiate the interface 
  // (using same syntax as a module instance)
  //
  simple_ahb ahb1(.hclk(hclk), 
                  .hresetN(hresetN)
                 );

  // instantiate master and connect the interface instance
  // to the interface port
  master m (.ahb(ahb1),     // connect interface instance to the module's interface port
            .rstN(chip_rstN),
            .m_clk,         // dot-name connection shortcut
            .thing1,
            .thing2
           );

  // instantiate slave and connect the interface instance
  // to the interface port
  slave  s (.ahb(ahb1.slave_ports), // select slave modport                                 
            .rstN(chip_rstN),
            .*              // wildcard connection shortcut
           );

  //... // remaining chip-level code not shown 
  
  initial begin
    #(1*10);    // advance to unique time slot for this test number
    $display("\n%m: No outputs -- only checking that code compiles.\n");
  end
endmodule: chip_top
//`end_keywords
