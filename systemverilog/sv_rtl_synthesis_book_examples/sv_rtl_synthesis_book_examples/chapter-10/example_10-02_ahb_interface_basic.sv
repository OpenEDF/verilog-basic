//
// Book, "RTL Modeling with SystemVerilog for Simulation and Synthesis"
// by Stuart Sutherland, published by Sutherland HDL, Inc.
//
// Using a SystemVerilog interface for a simplified AMBA AHB bus.
//
// Copyright 2017, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//

///////////////////////////////////////////////////////////
// Simple AMBA AHB Interface -- SystemVerilog-2012 style
///////////////////////////////////////////////////////////
//`begin_keywords "1800-2012"
interface simple_ahb (
  input logic  hclk,    // bus transfer clk
  input logic  hresetN  // bus reset, active low
);
  logic [31:0] haddr;   // transfer start address
  logic [31:0] hwdata;  // data sent to slave
  logic [31:0] hrdata;  // return data from slave
  logic [ 2:0] hsize;   // transfer size
  logic        hwrite;  // 1 for write, 0 for read
  logic        hready;  // 1 for transfer finished

  // master module port directions
  modport master_ports (
    output haddr, hwdata, hsize, hwrite, // to AHB slave
    input  hrdata, hready,               // from AHB slave
    input  hclk, hresetN                 // from chip level
  );

  // slave module port directions
  modport slave_ports (
    output hrdata, hready,               // to AHB master
    input  haddr, hwdata, hsize, hwrite, // from AHB master
    input  hclk, hresetN                 // from chip level
  );
endinterface: simple_ahb
//`end_keywords 
