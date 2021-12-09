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
#(parameter WIDTH = 4)                 // register size
(output logic             data_select, // 1-bit input
 output logic [WIDTH-1:0] d1, d2,      // scalable input size
 input  logic [WIDTH-1:0] q_out,       // scalable output size
 input  logic             clk
);
  timeunit 1ns; timeprecision 1ns;

  // generate stimulus
  initial begin
  	$timeformat(-9, 0, "ns", 6);  // nanoseconds, no precision, 6 columns
    repeat (3) begin
      @(negedge clk) ;
      void'(std::randomize(d1));
      void'(std::randomize(d2));
      void'(std::randomize(data_select));
      @(negedge clk) check_results;
    end
    @(negedge clk) $finish;
  end

  // verify results
  task check_results;
    $write("At %t: d1=%b  d2=%b  data_select=%b:  ", $time, d1, d2, data_select);
    case (data_select)
      0: begin
      	   $write("EXPECT: q_out = %b, ACTUAL: %b ", d2, q_out);
      	   if (q_out === d2) $display(" OK");
      	   else              $display(" ERROR!");
      	 end
      1: begin
      	   $write("EXPECT: q_out = %b, ACTUAL: %b ", d1, q_out);
      	   if (q_out === d1) $display(" OK");
      	   else              $display(" ERROR!");
      	 end
    endcase
  endtask

endmodule: test
//`end_keywords

//`begin_keywords "1800-2012"
module top;
  timeunit 1ns; timeprecision 1ns;
  parameter WIDTH = 4;

  logic             clk;
  logic             data_select;
  logic [WIDTH-1:0] d1, d2;
  logic [WIDTH-1:0] q_out;

  test           #(.WIDTH(WIDTH)) test (.*);
  muxed_register #(.WIDTH(WIDTH)) dut  (.*);

  initial begin
    clk <= 0;
    forever #5 clk = ~clk;
  end
endmodule: top
//`end_keywords

