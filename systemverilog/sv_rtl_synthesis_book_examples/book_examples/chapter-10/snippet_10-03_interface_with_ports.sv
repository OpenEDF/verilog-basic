//
// Book, "RTL Modeling with SystemVerilog for ASIC and FPGA Design"
// by Stuart Sutherland
//
// Interface snippets.
//
// Copyright 2016, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//

`begin_keywords "1800-2012"

//
// Snippet 1:
// Interface with inputs
//

interface simple_ahb (input logic global_resetN);
  logic        hclk;    // bus transfer clock        
  logic [31:0] haddr;   // transfer address          
  logic [31:0] hwdata;  // data sent to slave        
  logic [31:0] hrdata;  // return data from slave    
  logic [ 1:0] htrans;  // transfer type             
  logic [ 1:0] hresp;   // status response from slave
  logic        hwrite;  // 1 for write, 0 for read   

  assign hrseteN = global_resetN;
  
  modport master_ports (
    input  hclk, hrseteN, hresp, hrdata,
    output haddr, hwdata, hwrite, htrans 
  );

  modport slave_ports (
    input  hclk, hrseteN, haddr, hwdata, hwrite, htrans,
    output hresp, hrdata
  );
endinterface: simple_ahb


///////////////////////////////////////////////////////////
// Master Module Port List
///////////////////////////////////////////////////////////
module master
(simple_ahb.master_ports ahb,     // interface port
 input  logic            m_clock, // master clock
 input  logic            resetN,  // reset, active low
 output logic [7:0]      thing1,  // non AHB related input
 input  logic [7:0]      thing2   // non AHB related output
);
  // master module functionality not shown 
endmodule: master

///////////////////////////////////////////////////////////
// Master Module Ports After Synthesis
///////////////////////////////////////////////////////////
module master2 (hclk, hresetN, hrdata, hresp, haddr,
               hwdata, hwrite, htrans, m_clock, resetN,
               thing1, thing2);
  input hclk;        
  input hresetN;         
  input [31:0] hrdata;
  input [1:0] hresp; 
  output [31:0] haddr; 
  output [31:0] hwdata;
  output hwrite;
  output [1:0] htrans;
  input m_clock;
  input resetN; 
  output [7:0] thing1; 
  input [7:0] thing2;  
 
  wire hclk;        
  wire hresetN;         
  wire [31:0] hrdata;
  wire [1:0] hresp; 
  wire [31:0] haddr; 
  wire [31:0] hwdata;
  wire hwrite;
  wire [1:0] htrans;
  wire m_clock;
  wire resetN; 
  wire [7:0] thing1; 
  wire [7:0] thing2;  

  // master module functionality not shown 
endmodule: master2


///////////////////////////////////////////////////////////
// Slave Module Port List
///////////////////////////////////////////////////////////
module slave
(simple_ahb  ahb,           // interface port but no modport
 input  logic       s_clock,// slave clock
 input  logic       resetN, // reset, active low
 input  logic [7:0] thing1, // non AHB related output
 output logic [7:0] thing2  // non AHB related input
);
  // slave module functionality not shown 
endmodule: slave

///////////////////////////////////////////////////////////
// Top-level Netlist Module
///////////////////////////////////////////////////////////
module chip_top;
  logic        m_clock; // master clock
  logic        s_clock; // master clock
  logic        resetN;  // reset, active low
  logic [7:0]  thing1;  // non AHB related input
  logic [7:0]  thing2;  // non AHB related output

  simple_ahb ahb1();    // instantiate the interface

  master m (.ahb(ahb1), // connect the interface port
            .*          // wildcard connect other ports
           );

  slave  s (.ahb(ahb1.slave_ports), // connect the interface
                                    // and select modport
            .*          // wildcard connect other ports
           );
  // other chip-level code not shown 
  
  initial begin
    #(1*10);    // advance to unique time slot for this test number
    $display("\n%m: No outputs -- only checking that code compiles.\n");
  end

endmodule: chip_top


`end_keywords
