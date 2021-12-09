//
// Book, "RTL Modeling with SystemVerilog for Simulation and Synthesis"
// by Stuart Sutherland, published by Sutherland HDL, Inc.
//
// Using a SystemVerilog interface with parity methods.
//
// Copyright 2017, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//

///////////////////////////////////////////////////////////
// Simple AHB Interface with parity methods
///////////////////////////////////////////////////////////
//`begin_keywords "1800-2012"
interface simple_ahb (
  input logic  hclk,    // bus transfer clk
  input logic  hresetN  // bus reset, active low
);
  logic [31:0] haddr;   // transfer start address
  logic [32:0] hwdata;  // data to slave, with parity bit
  logic [32:0] hrdata;  // data from slave, with parity bit
  logic [ 2:0] hsize;   // transfer size
  logic        hwrite;  // 1 for write, 0 for read
  logic        hready;  // 1 for transfer finished

  function automatic logic parity_gen(logic [31:0] data);
    return(^data); // calculate parity of data (odd parity)
  endfunction

  function automatic logic parity_chk(logic [31:0] data,
                                      logic        parity);
    return (parity === ^data); // 1=OK, 0=parity error
  endfunction

  // master module port directions
  modport master_ports (
    output haddr, hwdata, hsize, hwrite, // to AHB slave
    input  hrdata, hready,               // from AHB slave
    input  hclk, hresetN,                // from chip level
    import parity_gen, parity_check      // function import
  );

  // slave module port directions
  modport slave_ports (
    output hrdata, hready,               // to AHB master
    input  haddr, hwdata, hsize, hwrite, // from AHB master
    input  hclk, hresetN,                // from chip level
    import parity_check                  // function import
  );

  // slave module port directions
  modport slave_ports_alt (
    output hrdata, hready,               // to AHB master
    input  haddr, hwdata, hsize, hwrite, // from AHB master
    input  hclk, hresetN,                // from chip level
    import function logic parity_chk(logic [31:0] data,
                                     logic        parity)
  );
endinterface: simple_ahb
//`end_keywords 
