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
 import definitions_pkg::*;
(output logic   rstN,
 output data_t  data_in,
 input  logic   error,
 input  logic   clk
);
  timeunit 1ns/1ns;

  // generate stimulus
  initial begin
  	$timeformat(-9, 0, "ns", 6);  // nanoseconds, no precision, 6 columns
    rstN <= 0;                    // reset DUT (active low)
    repeat(2)  @(negedge clk) ;   // hold reset for 2 clock cycles
    rstN = 1;                     // remove reset
    repeat (10) begin
      @(negedge clk) ;
      data_in.data = $urandom();
      data_in.parity_bit = $urandom()%2;  // randomly wrong parity value
      @(negedge clk) check_results;
    end
    @(negedge clk) $finish;
  end

  // verify results
  task check_results;
    $write("At %t: data=%b  parity_bit=%b:  ", $time, data_in.data, data_in.parity_bit);
    if (^data_in.data === data_in.parity_bit) begin: good_data_in
      $write("Good data_in. EXPECT: error = 0, ACTUAL: %b ", error);
      if (error === 1'b0) $display(" OK");
      else                $display(" ERROR!");
    end: good_data_in
    else begin: bad_data_in
      $write("Bad data_in.  EXPECT: error = 1, ACTUAL: %b ", error);
      if (error === 1'b1) $display(" OK");
      else                $display(" ERROR!");
    end: bad_data_in
  endtask

endmodule: test
`end_keywords

`begin_keywords "1800-2012"
module top;
  timeunit 1ns/1ns;
  import definitions_pkg::*;
  parameter WIDTH = 8;

  logic  clk, rstN;
  data_t data_in;
  logic  error;

  test           test (.*);
  parity_checker dut  (.*);

  initial begin
    clk <= 0;
    forever #5 clk = ~clk;
  end
endmodule: top
`end_keywords

