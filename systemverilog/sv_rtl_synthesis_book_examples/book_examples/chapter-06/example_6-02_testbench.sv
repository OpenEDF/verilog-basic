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
#(parameter N = 4)          // bus size
(output logic         ena,  // input to DUT
 output logic [N-1:0] in,   // input to DUT
 input  logic [N-1:0] out,  // output from DUT
 input  logic         clk   // testbench clock
);
  timeunit 1ns/1ns;

  // generate stimulus
  initial begin
  	$timeformat(-9, 0, "ns", 6);  // nanoseconds, no precision, 6 columns
    @(negedge clk) ;
    void'(std::randomize(in));
    ena = 1; // transparent mode
    @(negedge clk) check_results;

    @(negedge clk) ;
    void'(std::randomize(in));
    @(negedge clk) check_results;

    @(negedge clk) ;
    ena = 0; // latched mode
    @(negedge clk) check_results;

    @(negedge clk) ;
    void'(std::randomize(in));
    @(negedge clk) check_results;

    @(negedge clk) $finish;
  end

  // verify results
  task check_results;
    $write("At %t: in=%h  ena=%b:  ", $time, in, ena);
    case (ena)
      0: begin  // latched
      	   $write("EXPECT: out = %h, ACTUAL: %h ", out, out);
      	   if (out === out) $display(" OK");
      	   else             $display(" ERROR!");
      	 end
      1: begin
      	   $write("EXPECT: out = %h, ACTUAL: %h ", in, out);
      	   if (out === in) $display(" OK");
      	   else            $display(" ERROR!");
      	 end
    endcase
  endtask

endmodule: test
`end_keywords

`begin_keywords "1800-2012"
module top;
  timeunit 1ns/1ns;
  parameter N = 4;

  logic         clk;
  logic         ena;
  logic [N-1:0] in;
  logic [N-1:0] out;

  test   #(.N(N)) test (.*);
  latch  #(.N(N)) dut  (.*);

  initial begin
    clk <= 0;
    forever #5 clk = ~clk;
  end
endmodule: top
`end_keywords

