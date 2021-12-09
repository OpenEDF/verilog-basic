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
#(parameter           N   = 8,   // data bus size
        logic [N-1:0] MIN = 'h7, // minimum must-have value
        logic [N-1:0] MAX = 'hC  // maximum must-have value
)
(input  logic         clk,       // clk input
 output logic         rstN,      // active-low async reset
 output logic [N-1:0] d1, d2,    // scalable input size
 input  logic         in_range   // set if either d1 or d2 is
);                               // within MIN/MAX reange
  timeunit 1ns; timeprecision 1ns;

  // generate stimulus
  initial begin
  	$timeformat(-9, 0, "ns", 6);  // nanoseconds, no precision, 6 columns
    rstN <= 0;                    // reset DUT (active low)
    repeat(2)  @(negedge clk) ;   // hold reset for 2 clk cycles
    rstN = 1;                     // remove reset
    repeat (20) begin
      @(negedge clk) ;
      void'(std::randomize(d1) with {d1 inside {'h0,'hA};});
      void'(std::randomize(d2) with {d2 inside {'hA,'hF};});
      @(negedge clk) check_results;
    end
    @(negedge clk) $finish;
  end

  // verify results
  task check_results;
    $write("At %t: d1=%d  d2=%d:  ", $time, d1, d2);
    if ( (d1 inside {[MIN:MAX]}) || (d2 inside {[MIN:MAX]}) )
    begin
      $write("EXPECT: in_range = 1, ACTUAL: %b ", in_range);
      if (in_range === 1'b1) $display(" OK");
      else                   $display(" ERROR!");
    end
    else begin
      $write("EXPECT: in_range = 0, ACTUAL: %b ", in_range);
      if (in_range === 1'b0) $display(" OK");
      else                   $display(" ERROR!");
    end
  endtask

endmodule: test
//`end_keywords

//`begin_keywords "1800-2012"
module top;
  timeunit 1ns; timeprecision 1ns;
  parameter         N   = 8;
  parameter [N-1:0] MIN = 'h7;  // minimum must-have value
  parameter [N-1:0] MAX = 'hC;  // maximum must-have value

  logic         clk, rstN;
  logic [N-1:0] d1, d2;
  logic         in_range;

  test        #(.N(N)) test (.*);
  status_flag #(.N(N)) dut  (.*);

  initial begin
    clk <= 0;
    forever #5 clk = ~clk;
  end
endmodule: top
//`end_keywords

