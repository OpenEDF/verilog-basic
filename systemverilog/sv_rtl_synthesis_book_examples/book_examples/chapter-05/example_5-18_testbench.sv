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
(output real   a, b, // double-precision floating point inputs to DUT
 input  real   sum   // double-precision floating point output from DUT
);
  timeunit 1ns/1ns;

  // generate stimulus
  initial begin
  	$timeformat(-9, 0, "ns", 6);  // nanoseconds, no precision, 6 columns
  	#5 a = 1.2; b = 1.5;   
  	#5 check_results;

  	#5 a = 1.2; b = -2.0;
  	#5 check_results;

  	#5 a = 1.2; b = 3.0E-3;
  	#5 check_results;

    #5 $finish;
  end

  // verify results
  task check_results;
    $write("At %t: a=%f, b=%f:  ", $time, a, b);
    $write("EXPECT: sum = %f, ACTUAL: %f", add_f(a, b), sum);
    if (sum == add_f(a, b)) $display(" OK");
    else                    $display(" ERROR!");
  endtask

  function real add_f(real a, b);
    return a + b;
  endfunction

endmodule: test
`end_keywords

`begin_keywords "1800-2012"
module top;
  timeunit 1ns/1ns;
  real a, b;
  real sum;

  test                  test (.*);
  floating_point_adder  dut  (.*);

endmodule: top
`end_keywords

