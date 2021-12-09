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
#(parameter N = 8)               // data size (default 8-bits)
(input  logic         clk,       // clock input
 output logic         rstN,      // active-low async reset
 output logic [N-1:0] d1, d2,    // scalable input size
 input  logic         equivalent // set if true/false value of
);                               // d1 and d2 are the same
  timeunit 1ns/1ns;

  // generate stimulus
  initial begin
  	$timeformat(-9, 0, "ns", 6);  // nanoseconds, no precision, 6 columns
    rstN <= 0;                    // reset DUT (active low)
    repeat(2)  @(negedge clk) ;   // hold reset for 2 clock cycles
    rstN = 1;                     // remove reset
    repeat (20) begin
      @(negedge clk) ;
      void'(std::randomize(d1) with {d1 inside {0,1};});
      void'(std::randomize(d2) with {d2 inside {0,5};});
      @(negedge clk) check_results;
    end
    @(negedge clk) $finish;
  end

  // verify results
  task check_results;
    $write("At %t: d1=%b  d2=%b:  ", $time, d1, d2);
    if ((!d1 || d2) && (!d2 || d1)) begin
      $write("EXPECT: data_true = 1, ACTUAL: %b ", equivalent);
      if (equivalent === 1'b1) $display(" OK");
      else                     $display(" ERROR!");
    end
    else begin
      $write("EXPECT: data_true = 0, ACTUAL: %b ", equivalent);
      if (equivalent === 1'b0) $display(" OK");
      else                     $display(" ERROR!");
    end
  endtask

endmodule: test
`end_keywords

`begin_keywords "1800-2012"
module top;
  timeunit 1ns/1ns;
  parameter N = 8;

  logic         clk, rstN;
  logic [N-1:0] d1, d2;
  logic         equivalent;

  test        #(.N(N)) test (.*);
  status_flag #(.N(N)) dut  (.*);

  initial begin
    clk <= 0;
    forever #5 clk = ~clk;
  end
endmodule: top
`end_keywords

