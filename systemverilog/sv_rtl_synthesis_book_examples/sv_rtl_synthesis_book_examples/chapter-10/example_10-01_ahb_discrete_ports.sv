//
// Book, "RTL Modeling with SystemVerilog for Simulation and Synthesis"
// by Stuart Sutherland, published by Sutherland HDL, Inc.
//
// Using traditional Verilog discrete module ports for a simplified
// AMBA AHB bus.
//
// Copyright 2017, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//


///////////////////////////////////////////////////////////
// Master Module Port List -- Verilog-2001 style
///////////////////////////////////////////////////////////
//`begin_keywords "1364-2001"
module master (
 // simplified AHB bus signals
 input  wire        hclk,    // bus transfer clk        
 input  wire        hresetN, // bus reset, active low   
 output reg  [31:0] haddr,   // transfer start address                            
 output reg  [31:0] hwdata,  // data sent to slave      
 output reg         hwrite,  // return data from slave  
 output reg  [ 2:0] hsize,   // transfer size           
 input  wire [31:0] hrdata,  // 1 for write, 0 for read 
 input  wire        hready,  // 1 for transfer finished 
 // other signals
 input  wire        m_clk,   // master clock
 input  wire        rstN,    // reset, active low
 input  wire [7:0]  thing1,  // misc signal; not part of bus
 output reg  [7:0]  thing2   // misc signal; not part of bus
);
  //... // master module functionality not shown 
endmodule: master
//`end_keywords


///////////////////////////////////////////////////////////
// Slave Module Port List -- Verilog-2001 style
///////////////////////////////////////////////////////////
//`begin_keywords "1364-2001"
module slave (
 // simplified AHB bus signals
 input  wire        hclk,    // bus transfer clk       
 input  wire        hresetN, // bus reset, active low  
 input  wire [31:0] haddr,   // transfer start address 
 input  wire [31:0] hwdata,  // data sent to slave     
 input  wire        hwrite,  // return data from slave 
 input  wire [ 2:0] hsize,   // transfer size          
 output reg  [31:0] hrdata,  // 1 for write, 0 for read
 output reg         hready,  // 1 for transfer finished
 // other signals
 input  wire        s_clk,  // slave clock
 input  wire        rstN,   // reset, active low
 output reg  [7:0]  thing1, // misc. signal; not part of bus
 input  wire [7:0]  thing2  // misc. signal; not part of bus
);
  //... // slave module functionality not shown 
endmodule: slave
//`end_keywords


///////////////////////////////////////////////////////////
// Top-level Netlist Module -- Verilog-2001 style
///////////////////////////////////////////////////////////
//`begin_keywords "1364-2001"
module chip_top;
 // Simplified AHB bus signals
  wire        hclk;       // bus transfer clk
  wire        hresetN;    // bus reset, active low
  wire [31:0] haddr;      // transfer start address
  wire [31:0] hwdata;     // data sent to slave
  wire        hwrite;     // return data from slave
  wire [ 2:0] hsize;      // transfer size
  wire [31:0] hrdata;     // 1 for write, 0 for read
  wire        hready;     // 1 for transfer finished
 // Other signals
  wire        m_clk;      // master clock
  wire        s_clk;      // slave clock
  wire        chip_rstN;  // reset, active low
  wire [7:0]  thing1;     // misc signal; not part of bus
  wire [7:0]  thing2;     // misc signal; not part of bus

  master m (// simplified AHB bus connections
            .hclk(hclk), 
            .hresetN(hresetN), 
            .haddr(haddr),
            .hwdata(hwdata),
            .hsize(hsize),
            .hwrite(hwrite),
            .hrdata(hrdata),
            .hready(hready), 
            // 0ther connections
            .m_clk(m_clk),
            .rstN(chip_rstN),
            .thing1(thing1),
            .thing2(thing2)
           );

  slave  s (// simplified AHB bus connections
            .hclk(hclk), 
            .hresetN(hresetN), 
            .haddr(haddr),
            .hwdata(hwdata),
            .hsize(hsize),
            .hwrite(hwrite),
            .hrdata(hrdata),
            .hready(hready), 
            // 0ther connections
            .s_clk(s_clk),
            .rstN(chip_rstN),
            .thing1(thing1),
            .thing2(thing2)
           );

  //... // remaining chip-level code not shown 
  
endmodule: chip_top
//`end_keywords
