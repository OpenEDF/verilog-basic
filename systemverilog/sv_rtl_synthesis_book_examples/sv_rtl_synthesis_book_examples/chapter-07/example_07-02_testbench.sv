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
#(parameter N=4)
(output logic [N-1:0]     a, b,  // inputs into DUT
 input  logic [(N*2)-1:0] result // output from DUT
);
  timeunit 1ns; timeprecision 1ns;

  // generate stimulus
  initial begin
  	$timeformat(-9, 0, "ns", 6);  // nanoseconds, no precision, 6 columns
	  $display();
  	a = 'h2;
  	for (b=0; b<(2**N)-1; b++) begin 
  	  #5 check_results;
  	end
  	#5 check_results;  // check last value after for-loop
  	#5 $display();
    $finish;
  end

  // verify results
  task check_results;
    $write("At %t: a=%0d, b=%0d:  ", $time, a, b);
    $write("EXPECT: result = %0d, ACTUAL: %0d", result_f(a, b), result);
    if (result === result_f(a, b)) $display(" OK");
    else                           $display(" ERROR!");
  endtask

  function [(N*2)-1:0] result_f([N-1:0] a, b);
  	return a * b;
  endfunction

endmodule: test
//`end_keywords

//`begin_keywords "1800-2012"
module top;
  timeunit 1ns; timeprecision 1ns;
  parameter N=4;
  
  logic [N-1:0]     a, b;
  logic [(N*2)-1:0] result;

  test                   #(.N(N)) test (.*);
  algorithmic_multiplier          dut  (.*);

endmodule: top
//`end_keywords

