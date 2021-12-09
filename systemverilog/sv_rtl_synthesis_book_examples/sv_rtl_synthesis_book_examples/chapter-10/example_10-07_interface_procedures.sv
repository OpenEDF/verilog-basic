//
// Book, "RTL Modeling with SystemVerilog for Simulation and Synthesis"
// by Stuart Sutherland, published by Sutherland HDL, Inc.
//
// Using a SystemVerilog interface with procedural code.
//
// Copyright 2017, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//

///////////////////////////////////////////////////////////
// Simple AHB Interface with clock generator and reset
// synchronizer procedural code
///////////////////////////////////////////////////////////
//`begin_keywords "1800-2012"
interface simple_ahb (
  input logic  chip_clk,  // external clock from the chip
  input logic  chip_rstN  // bus reset, active low
);
  logic        hclk;    // local bus transfer clk
  logic        hresetN; // local bus reset, active low
  logic [31:0] haddr;   // transfer start address
  logic [31:0] hwdata;  // data sent to slave
  logic [31:0] hrdata;  // return data from slave
  logic [ 2:0] hsize;   // transfer size
  logic        hwrite;  // 1 for write, 0 for read
  logic        hready;  // 1 for transfer finished

  // generate AHB clock (divide-by-two of chip_clk)
  always_ff @(posedge chip_clk or negedge chip_rstN)
    if (!chip_rstN) hclk <= '0;
    else            hclk <= ~hclk;

  // sync trailing edge of hresetN to hclk
  logic rstN_tmp; // temp variable used inside the interface
  always_ff @(posedge hclk or negedge chip_rstN)
    if (!chip_rstN) begin   // asynchronous active-low reset
      rstN_tmp <= '0;
      hresetN  <= '0;
    end 
    else begin 
      rstN_tmp <= '1;       // begin end of reset
      hresetN  <= rstN_tmp; // stabilize reset
    end 

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
