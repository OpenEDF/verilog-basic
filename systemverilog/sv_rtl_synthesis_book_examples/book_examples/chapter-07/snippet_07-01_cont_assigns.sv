//
// Book, "RTL Modeling with SystemVerilog for ASIC and FPGA Design"
// by Stuart Sutherland
//
// Continuous assignment snippets.
//
// Copyright 2016, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//

`begin_keywords "1800-2012"

//
// Snippet 1:
// Simple continous assignment and declarations
//
module adder (sum, a, b);
logic        [7:0] temp;  // infers a 4-state reg variable
output logic [7:0] sum;   // infers a 4-state reg variable
input  logic [7:0] a, b;  // infers two 4-state wire nets

assign sum = a + b;  
endmodule: adder

module test_1;
  logic [7:0] a, b, sum;
  adder i1 (.*);
  
  initial begin
    #(1*10);    // advance to unique time slot for this test number
    a = 8'h2; b = 8'h3;
    #1;
    $display("\n%m: a=%0d  b=%0h  sum=%0d (expect 5)\n", a, b, sum);
  end
endmodule: test_1


//
// Snippet 2:
// Sequential procedure with continous assignment for tri-state inout
//
module SRAM (inout wire  [7:0] data,
             input logic [7:0] addr,
             input logic       rw,   // 0 = read, 1 = write
             input logic       clock
            );
   
  logic [7:0] mem [0:255];  // array for RAM storage
  
  // drive data if rw = 0, tri-date data if rw = 1
  assign data = (!rw)? mem[addr] : 'Z;
   
  always @(posedge clock)
    // write into RAM if rw = 1
    if (rw) mem[addr] <= data;  
   
endmodule: SRAM

module test_2;
  logic [7:0] addr, test_data;
  wire  [7:0] data;
  logic       rw, clock;
  
  SRAM i1 (.*);
  assign data = (rw)? test_data : 'Z;

  initial begin
    #(2*10);    // advance to unique time slot for this test number
    clock = 0;
    rw = 1;    // write
    addr = 8'h00;  test_data = 8'h05;
    #1;
    clock = 1;
    #1;
    clock = 0;
    rw = 0;    // read
    #1;
    clock = 1;
    #1;
    $display("\n%m: addr=%h  data=%h (expect 5)\n", addr, data);
  end
endmodule: test_2


//
// Snippet 3:
// Net declaration inferred continuous assignment and variable initialization.
//
module adder_2; 
  logic [7:0] a, b;  // infers 4-state wire nets

wire [7:0] sum = a + b;

int i = 5;

  initial begin
    #(3*10);    // advance to unique time slot for this test number
    a = 8'h2; b = 8'h3;
    #1;
    $display("\n%m: i=%0d  a=%0d  b=%0h  sum=%0d (expect 5)\n", i, a, b, sum);
  end
endmodule: adder_2


`end_keywords
