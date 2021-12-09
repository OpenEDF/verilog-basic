//
// Book, "RTL Modeling with SystemVerilog for ASIC and FPGA Design"
// by Stuart Sutherland
//
// Always procedure snippets.
//
// Copyright 2016, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//

`begin_keywords "1800-2012"

//
// Snippet 1:
// Simple flip flop with no reset
//
module simple_ff; 
  logic       clock;
  logic [7:0] d, q;

always_ff @(posedge clock)
  q <= d;                // sequential logic flip-flop
  
  
  initial begin
    #(1*10);    // advance to unique time slot for this test number
    clock = 0;
    d = 8'h5;
    #1;
    clock = 1;
    #1;
    $display("\n%m: d=%0d  q=%0d (expect 5)\n", d, q);
  end

endmodule: simple_ff


//
// Snippet 2:
// Simple flip flop with asynchronous reset
//
module resetable_ff; 
  logic       clock, resetN;
  logic [7:0] d, q;

always_ff @(posedge clock or negedge resetN)
  if (!resetN) q <= '0;           // active-low reset
  else         q <= d;       
  
  initial begin
    #(2*10);    // advance to unique time slot for this test number
    clock = 0;
    d = 8'h5;
    resetN <= 0;
    #1;
    clock = 1;
    #1;
    $display("\n%m: resetN=%b  d=%0d  q=%0d (expect 0)", resetN, d, q);

    #1;
    clock = 0;
    d = 8'h5;
    resetN <= 1;
    #1;
    clock = 1;
    #1;
    $display("%m: resetN=%b  d=%0d  q=%0d (expect 5)\n", resetN, d, q);
  end

endmodule: resetable_ff


//
// Snippet 3:
// adder using generic always procedure
//
module adder_always; 
  logic [7:0] a, b, sum;

always @(a, b)
  sum = a + b;  
  
  initial begin
    #(3*10);    // advance to unique time slot for this test number
    a = 8'h2; b = 8'h3;
    #1;
    $display("\n%m: a=%0d  b=%0d  sum=%0d (expect 5)\n", a, b, sum);
  end

endmodule: adder_always


//
// Snippet 4:
// adder using always_comb procedure
//
module adder_always_comb; 
  logic [7:0] a, b, sum;

always_comb 
  sum = a + b;
  
  initial begin
    #(4*10);    // advance to unique time slot for this test number
    a = 8'h2; b = 8'h3;
    #1;
    $display("\n%m: a=%0d  b=%0d  sum=%0d (expect 5)\n", a, b, sum);
  end

endmodule: adder_always_comb


//
// Snippet 5:
// latch using generic always procedure
//
module latch_always; 
  logic [7:0] data, out;
  logic       enable;

always @(enable, data)
  if (enable) out <= data;
  
  initial begin
    #(5*10);    // advance to unique time slot for this test number
    enable = 1;  // not  latched
    data = 8'h5;
    #1;
    $display("\n%m: enable=%b  data=%0d  out=%0d (expect 5)", enable, data, out);

    #1;
    enable = 0;  // latched
    #1;
    data = 8'h7;
    #1;
    $display("%m: enable=%b  data=%0d  out=%0d (expect 5)\n", enable, data, out);
  end

endmodule: latch_always


//
// Snippet 6:
// latch using always_latch procedure
//
module latch_always_latch; 
  logic [7:0] data, out;
  logic       enable;

always_latch 
  if (enable) out <= data;
  
  initial begin
    #(6*10);    // advance to unique time slot for this test number
    enable = 1;  // not  latched
    data = 8'h5;
    #1;
    $display("\n%m: enable=%b  data=%0d  out=%0d (expect 5)", enable, data, out);

    #1;
    enable = 0;  // latched
    #1;
    data = 8'h7;
    #1;
    $display("%m: enable=%b  data=%0d  out=%0d (expect 5)\n", enable, data, out);
  end

endmodule: latch_always_latch


//
// Snippet 7:
// An always procedure with no begin...end
//
module single_statement_procedure; 
  logic       clock, resetN;
  logic [7:0] d, q;

always_ff @(posedge clock or negedge resetN)
  if (!resetN)           // if-else is the single statement
    q <= '0;     
  else 
    q <= d;     
  
  initial begin
    #(7*10);    // advance to unique time slot for this test number
    clock = 0;
    d = 8'h5;
    resetN <= 0;
    #1;
    clock = 1;
    #1;
    $display("\n%m: resetN=%b  d=%0d  q=%0d (expect 0)", resetN, d, q);

    #1;
    clock = 0;
    d = 8'h5;
    resetN <= 1;
    #1;
    clock = 1;
    #1;
    $display("%m: resetN=%b  d=%0d  q=%0d (expect 5)\n", resetN, d, q);
  end

endmodule: single_statement_procedure


//
// Snippet 8:
// An always procedure with a begin...end statement group
//
module multi_statement_procedure; 
  logic [7:0] a, b, sum, dif;

always_comb
  begin                  // begin...end is the single group
    sum = a + b;
    dif = a - b;
  end 
  
  initial begin
    #(8*10);    // advance to unique time slot for this test number
    a = 8'h3; b = 8'h2;
    #1;
    $display("\n%m: a=%0d  b=%0d  sum=%0d  dif=%0d (expect sum=5, dif=1)\n", a, b, sum, dif);
  end

endmodule: multi_statement_procedure


//
// Snippet 9:
// Named begin and named end, with a local variable
//
module named_begin_end; 
  logic [15:0] data_bus;
  logic [ 4:0] count_ones, total_bits;

always_comb begin : ones_counter 
  int i;
  count_ones = '0;
  for (i=0; i<=15; i++) begin
    if (data_bus[i]) count_ones++;
  end
  total_bits = i;
end:ones_counter 
  
  initial begin
    #(9*10);    // advance to unique time slot for this test number
    data_bus = 16'h5005;
    #1;
    $display("\n%m: data_bus=%h  count_ones=%0d  total_bits=%0d (expect count_ones=4, total_bits=16)\n", data_bus, count_ones, total_bits);
  end

endmodule: named_begin_end


//
// Snippet 10:
// Net and variable types
//
module variable_on_lhs; 

wire  [15:0] a, b;    // net types
logic [15:0] sum;     // variable type

always_comb 
  sum = a + b;

  assign a = 8'h2; 
  assign b = 8'h3;
  initial begin
    #(10*10);    // advance to unique time slot for this test number
    $display("\n%m: a=%0d  b=%0d  sum=%0d (expect 5)\n", a, b, sum);
  end

endmodule: variable_on_lhs


`end_keywords
