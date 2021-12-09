//
// Book, "RTL Modeling with SystemVerilog for Simulation and Synthesis"
// by Stuart Sutherland, published by Sutherland HDL, Inc.
//
// Testbench
//
// Copyright 2017, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//
//`begin_keywords "1800-2012"
module test
#(parameter N = 4)                     // bus size
(output logic [N-1:0]       data,      // input to DUT
 input logic [$clog2(N):0]  low_bit,   // output from DUT
 input                      clk        // testbench clk
);
  timeunit 1ns; timeprecision 1ns;

  // generate stimulus
  initial begin
  	$timeformat(-9, 0, "ns", 6);  // nanoseconds, no precision, 6 columns
    @(negedge clk) ;
    data='hC;
    @(negedge clk) check_results;
    @(negedge clk) $display(); 
    $finish;
  end

  // verify results
  task check_results;
    $write("\nAt %t: data=%b  ", $time, data);
    $write("EXPECT: low_bit=%0d, ACTUAL: %0d ", lowest_f(), low_bit);
    if (low_bit === lowest_f()) $display(" OK");
    else                        $display(" ERROR!");
  endtask
  
  function [$clog2(N):0] lowest_f();
    return 2;
  endfunction

endmodule: test
//`end_keywords

//`begin_keywords "1800-2012"
module top;
  timeunit 1ns; timeprecision 1ns;

  parameter N = 4;               // bus size
  logic [N-1:0]        data;
  logic [$clog2(N):0]  low_bit;
  logic                clk;      // testbench clk

  test             test (.*);
  find_lowest_bit  dut  (.*);

  initial begin
    clk <= 0;
    forever #5 clk = ~clk;
  end
endmodule: top
//`end_keywords

