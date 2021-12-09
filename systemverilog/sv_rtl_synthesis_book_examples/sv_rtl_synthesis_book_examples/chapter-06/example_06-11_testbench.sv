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
#(parameter N = 8)                         // bus size
(output logic [N-1:0]         data,        // input to DUT
 output logic [$clog2(N)-1:0] start_range, // input from DUT
                              end_range,   // input from DUT
 input  logic [$clog2(N)-1:0] low_bit,     // output from DUT
 input                        clk          // testbench clk
);
  timeunit 1ns; timeprecision 1ns;

  // generate stimulus
  initial begin
  	$timeformat(-9, 0, "ns", 6);  // nanoseconds, no precision, 6 columns
    @(negedge clk) ;
    data='hA1;
    start_range = 3;
    end_range = 6;
    @(negedge clk) check_results;
    @(negedge clk) $finish;
  end

  // verify results
  task check_results;
    $write("\nAt %t: data=%b  ", $time, data);
    $write("EXPECT: low_bit=%0d, ACTUAL: %0d ", lowest_f(), low_bit);
    if (low_bit === lowest_f()) $display(" OK \n");
    else                        $display(" ERROR! \n");
  endtask
  
  function int lowest_f();
    logic [15:0] temp;  // local temporary variable
    temp = data;
    for (int i=0; i<N; i++) begin
      if (i >= start_range) 
        if (temp[0]) return(i<end_range? i : 0);
      temp >>= 1;
    end 
  endfunction

endmodule: test
//`end_keywords

//`begin_keywords "1800-2012"
module top;
  timeunit 1ns; timeprecision 1ns;

  parameter N = 8;       // bus size
  logic [N-1:0]          data;
  logic [$clog2(N)-1:0]  low_bit, start_range, end_range;
  logic                  clk;      // testbench clk

  test                #(.N(N)) test (.*);
  find_bit_in_range_2 #(.N(N)) dut  (.*);

  initial begin
    clk <= 0;
    forever #5 clk = ~clk;
  end
endmodule: top
//`end_keywords

