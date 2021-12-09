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
// Using an interface for a simplified AMBA AHB bus
//

///////////////////////////////////////////////////////////
// Simple AHB Interface
///////////////////////////////////////////////////////////
interface simple_ahb;
  logic        hclk;    // bus transfer clock        
  logic [31:0] haddr;   // transfer address          
  logic [31:0] hwdata;  // data sent to slave        
  logic [31:0] hrdata;  // return data from slave    
  logic [ 1:0] htrans;  // transfer type             
  logic [ 1:0] hresp;   // status response from slave
  logic        hwrite;  // 1 for write, 0 for read   

  modport master_ports (
    input  hclk, hresp, hrdata,
    output haddr, hwdata, hwrite, htrans 
  );

  modport slave_ports (
    input  hclk, haddr, hwdata, hwrite, htrans,
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
// Slave Module Port List
///////////////////////////////////////////////////////////
module slave
(simple_ahb.slave_ports  ahb,     // interface port
 input  logic            s_clock, // slave clock
 input  logic            resetN,  // reset, active low
 input  logic [7:0]      thing1,  // non AHB related output
 output logic [7:0]      thing2   // non AHB related input
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

  slave  s (.ahb(ahb1), // connect the interface port
            .*          // wildcard connect other ports
           );
  // other chip-level code not shown 
  
  initial begin
    #(1*10);    // advance to unique time slot for this test number
    $display("\n%m: No outputs -- only checking that code compiles.\n");
  end

endmodule: chip_top


`end_keywords
