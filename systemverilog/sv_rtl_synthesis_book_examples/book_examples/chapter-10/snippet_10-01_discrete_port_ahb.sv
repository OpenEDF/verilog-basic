//
// Book, "RTL Modeling with SystemVerilog for ASIC and FPGA Design"
// by Stuart Sutherland
//
// Interface concepts snippets.
//
// Copyright 2016, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//

`begin_keywords "1800-2012"

//
// Snippet 1:
// Using module ports for a simplified AMBA AHB bus
//

///////////////////////////////////////////////////////////
// Master Module Port List
///////////////////////////////////////////////////////////
module master (
 // simplified AHB bus signals
 input  wire        hclk,
 output reg  [31:0] haddr,
 output reg  [31:0] hwdata,
 output reg         hwrite,
 output reg  [ 1:0] htrans,
 input  wire [ 1:0] hresp,
 input  wire [31:0] hrdata,
 // other signals
 input  wire        m_clock, // master clock
 input  wire        resetN,  // reset, active low
 input  wire [7:0]  thing1,  // non AHB related input
 output reg  [7:0]  thing2   // non AHB related output
);
  // master module functionality not shown 
endmodule: master

///////////////////////////////////////////////////////////
// Slave Module Port List
///////////////////////////////////////////////////////////
module slave (
 // simplified AHB bus signals
 input  wire        hclk,
 input  wire [31:0] haddr,
 input  wire [31:0] hwdata,
 input  wire        hwrite,
 input  wire [ 1:0] htrans,
 output reg  [ 1:0] hresp,
 output reg  [31:0] hrdata,
 // other signals
 input  wire        s_clock, // master clock
 input  wire        resetN,  // reset, active low
 output reg  [7:0]  thing1,  // non AHB related input
 input  wire [7:0]  thing2   // non AHB related output
);
  // slave module functionality not shown 
endmodule: slave

///////////////////////////////////////////////////////////
// Top-level Netlist Module
///////////////////////////////////////////////////////////
module chip_top;
 // Simplified AHB bus signals
  wire        hclk;
  wire [31:0] haddr;
  wire [31:0] hwdata;
  wire        hwrite;
  wire [ 1:0] htrans;
  wire [ 1:0] hresp;
  wire [31:0] hrdata;
 // Other signals
  wire        m_clock; // master clock
  wire        s_clock; // master clock
  wire        resetN;  // reset, active low
  wire [7:0]  thing1;  // non AHB related input
  wire [7:0]  thing2;  // non AHB related output

  master m (// simplified AHB bus connections
            .hclk(hclk), 
            .haddr(haddr),
            .hwdata(hwdata),
            .htrans(htrans),
            .hwrite(hwrite),
            .hresp(hresp), 
            .hrdata(hrdata),
            // 0ther connections
            .m_clock(m_clock),
            .resetN(resetN),
            .thing1(thing1),
            .thing2(thing2)
           );

  slave  s (// simplified AHB bus connections
            .hclk(hclk), 
            .haddr(haddr),
            .hwdata(hwdata),
            .htrans(htrans),
            .hwrite(hwrite),
            .hresp(hresp), 
            .hrdata(hrdata),
            // 0ther connections
            .s_clock(s_clock),
            .resetN(resetN),
            .thing1(thing1),
            .thing2(thing2)
           );
  // other chip-level code not shown 
  
  initial begin
    #(1*10);    // advance to unique time slot for this test number
    $display("\n%m: No outputs -- only checking that code compiles.\n");
  end

endmodule: chip_top


`end_keywords
