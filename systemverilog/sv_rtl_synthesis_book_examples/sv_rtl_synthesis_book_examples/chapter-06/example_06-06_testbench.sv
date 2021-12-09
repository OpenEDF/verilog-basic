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
(output logic [3:0] d_in,   // input to DUT
 input  logic [1:0] d_out,  // output from DUT
 input  logic       error,  // output from DUT
 input  logic       clk     // testbench clk
);
  timeunit 1ns; timeprecision 1ns;

  // generate stimulus
  initial begin
  	$timeformat(-9, 0, "ns", 6);  // nanoseconds, no precision, 6 columns
    d_in = 4'b0001;
    @(negedge clk) check_results;

    d_in = 4'b0100;
    @(negedge clk) check_results;

    d_in = 4'b0000;  // illegal value
    @(negedge clk) check_results;

    @(negedge clk) $finish;

  end

  // verify results
  task check_results;
    logic [1:0] d_out_expected_value;
    logic       error_expected_value;
    expected_f(d_in, d_out_expected_value, error_expected_value);
    $write("At %t: d_in=%b:  ", $time, d_in);
    $write("EXPECT: d_out=%0d  error=%b, ACTUAL: d_out=%0d  error=%b ", d_out_expected_value, error_expected_value, d_out, error);
    if ( (d_out === d_out_expected_value) && (error === error_expected_value) ) $display(" OK");
    else                                                                        $display(" ERROR!");
  endtask
  
  function void expected_f(input [3:0] in, output [3:0] out, output err);
    {out,err} = '0;
    for (int i=0; i<=3; i++) 
      if (in[i]) out = i;
    if (in == 0) err = '1;
  endfunction

endmodule: test
//`end_keywords

//`begin_keywords "1800-2012"
module top;
  timeunit 1ns; timeprecision 1ns;

  logic [3:0] d_in;
  logic [1:0] d_out;
  logic       error;
  logic       clk;

  test                   test (.*);
  priority_4to2_encoder  dut  (.*);

  initial begin
    clk <= 0;
    forever #5 clk = ~clk;
  end
endmodule: top
//`end_keywords
