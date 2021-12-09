//
// Book, "RTL Modeling with SystemVerilog for ASIC and FPGA Design"
// by Stuart Sutherland
//
// Memory model snippets.
//
// Copyright 2016, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//

`begin_keywords "1800-2012"


//
// Snippet 1:
// Asynchronous RAM
//
module RAM
(inout logic [7:0] data,  // bidirectional port
 input logic [7:0] addr,
 input logic       nrd,   // active-low read control
                   nwr,   // active-low write control
                   ncs    // active-low chip select
);
   
  logic [7:0] mem [0:255];
   
  assign data = (!nrd && !ncs)? mem[addr] : 'Z;
   
  always @(nwr, ncs, addr, data)
    if (!nwr && !ncs) mem[addr] <= data;
   
endmodule: RAM

module RAM_test;

  wire  [7:0] data;
  logic [7:0] addr;
  logic       nrd, nwr, ncs;

  logic [7:0] test_data;
  
  RAM RAM (.*);  // connect to RAM instance
  
  assign data = (!ncs && !nwr)? test_data: 'Z;
  
  initial begin
    #(1*10);    // advance to unique time slot for this test number
    nrd = '1;
    nwr = '1;
    ncs = '0;
    test_data = 8'h03;
    addr = 8'h03;
    #1 ;
    nwr = '0;  // write into RAM
    #1;
    nwr = '1;
    #1;
    nrd = '0;  // read from RAM
    #1;
    $display("\n%m: test_data=%h  data=%h (expect 03)", test_data, data);
    #1;
    nrd = '1;  // read from RAM
    #1;
    $display("%m: test_data=%h  data=%h (expect zz)\n", test_data, data);
  end
endmodule: RAM_test

//
// Snippet 2:
// Synchronous RAM
//
module SRAM
(inout logic [7:0] data,  // bidirectional port
 input logic [7:0] addr,
 input logic       clock,
                   nrd,   // active-low read control
                   nwr,   // active-low write control
                   ncs    // active-low chip select
);
   
  logic [7:0] mem [0:255];
   
  assign data = (!nrd && !ncs)? mem[addr] : 'Z;
   
  always @(posedge clock)
    if (!nwr && !ncs) mem[addr] <= data;
   
endmodule: SRAM

module SRAM_test;

  wire  [7:0] data;
  logic [7:0] addr;
  logic       nrd, nwr, ncs;
  logic       clock;

  logic [7:0] test_data;
  
  SRAM SRAM (.*);  // connect to RAM instance
  
  initial begin: clock_osc
    clock <= 0;
    forever #1 clock = ~clock;
  end
  
  assign data = (!ncs && !nwr)? test_data: 'Z;
  
  initial begin
    #(2*10);    // advance to unique time slot for this test number
    nrd = '1;
    nwr = '1;
    ncs = '0;
    test_data = 8'h05;
    addr = 8'h05;
    @(negedge clock);
    nwr = '0;  // write into RAM
    @(negedge clock);
    nwr = '1;
    @(negedge clock);
    nrd = '0;  // read from RAM
    @(negedge clock);
    $display("\n%m: test_data=%h  data=%h (expect 05)", test_data, data);
    @(negedge clock);
    nrd = '1;  // read from RAM
    @(negedge clock);
    $display("%m: test_data=%h  data=%h (expect zz)\n", test_data, data);
    disable clock_osc;
  end
endmodule: SRAM_test


`end_keywords
