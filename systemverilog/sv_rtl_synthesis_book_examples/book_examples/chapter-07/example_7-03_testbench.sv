//
// Book, "RTL Modeling with SystemVerilog for ASIC and FPGA Design"
// by Stuart Sutherland
//
// Testbench
//
// Copyright 2016, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//
`begin_keywords "1800-2012"
module test
(output logic [ 7:0] a, b,  // inputs into DUT
 input  logic [15:0] result // output from DUT
);
  timeunit 1ns/1ns;

  // generate stimulus
  initial begin
  	$timeformat(-9, 0, "ns", 6);  // nanoseconds, no precision, 6 columns
	  $display();

  	a = 8'h4; b = 8'h2; 
	  #5 check_results;  // check last value after for-loop
	  $display();
    #5 $finish;
  end

  // verify results
  task check_results;
    $write("At %t: a=%0d, b=%0d:  ", $time, a, b);
    $write("EXPECT: result = %0d, ACTUAL: %0d", result_f(a, b), result);
    if (result === result_f(a, b)) $display(" OK");
    else                           $display(" ERROR!");
  endtask

  function [15:0] result_f([7:0] a, b);
  	return a * b;
  endfunction

endmodule: test
`end_keywords

`begin_keywords "1800-2012"
module top;
  timeunit 1ns/1ns;
  
  logic [ 7:0] a, b;
  logic [15:0] result;

  test                    test (.*);
  algorithmic_multiplier  dut  (.*);

endmodule: top
`end_keywords

