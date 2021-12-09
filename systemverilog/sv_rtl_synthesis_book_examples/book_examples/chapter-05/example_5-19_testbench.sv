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
#(parameter N = 8)
(output logic [N-1:0]       data_bus,  // input to DUT
 input  logic [$clog2(N):0] count      // output from DUT
);
  timeunit 1ns/1ns;

  // generate stimulus
  initial begin
  	$timeformat(-9, 0, "ns", 6);  // nanoseconds, no precision, 6 columns

  	#5 data_bus = 8'h0F;   
  	#5 check_results;

  	#5 data_bus = 8'hA1;   
  	#5 check_results;

    #5 $finish;
  end

  // verify results
  task check_results;
    $write("At %t: data_bus=%0d:  ", $time, data_bus);
    $write("EXPECT: count = %0d, ACTUAL: %0d", count_f(data_bus), count);
    if (count === count_f(data_bus)) $display(" OK");
    else                             $display(" ERROR!");
  endtask

  function int count_f([N-1:0] bus);
    return $countones(bus);
  endfunction

endmodule: test
`end_keywords

`begin_keywords "1800-2012"
module top;
  timeunit 1ns/1ns;
  parameter N = 8;
  
  logic [N-1:0]       data_bus;
  logic [$clog2(N):0] count;

  test        #(.N(N)) test (.*);
  count_ones  #(.N(N)) dut  (.*);

endmodule: top
`end_keywords

