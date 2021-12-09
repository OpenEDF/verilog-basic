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
(input  logic       clk,     // register clk
 output logic       rstN,    // active-low reset
 output logic       int_en,  // 1-bit interrupt enable
 output logic       zero,    // 1-bit result = 0 flag
 output logic       carry,   // 1-bit result overflow flag
 output logic       neg,     // 1-bit negative result flag
 output logic [1:0] parity,  // 2-bit parity bits
 input  logic [7:0] status   // 8-bit status register output
);
  timeunit 1ns; timeprecision 1ns;

  // generate stimulus
  initial begin
  	$timeformat(-9, 0, "ns", 6);  // nanoseconds, no precision, 6 columns
    rstN = 0;  // reset register
    @(negedge clk) ;
    @(negedge clk) check_results;
    rstN = 1;
    repeat (3) begin
      @(negedge clk) ;
      void'(std::randomize(int_en));
      void'(std::randomize(zero));
      void'(std::randomize(carry));
      void'(std::randomize(zero));
      void'(std::randomize(neg));
      void'(std::randomize(parity));
      @(negedge clk) check_results;
    end
    rstN = 0;  // reset register
    @(negedge clk) check_results;
    rstN = 1;
    @(negedge clk) $finish;
  end

  // verify results
  task check_results;
    $write("At %t: status = %b:  ", $time, status);
    case (rstN)
      1'b0: begin
              if (status === 8'b01100000) $display(" OK");
              else                        $display(" ERROR!");
            end
      1'b1: begin
              if (status === {int_en,2'b11,zero,carry,neg,parity}) $display(" OK");
              else                                                 $display(" ERROR!");
            end
    endcase
  endtask

endmodule: test
//`end_keywords

//`begin_keywords "1800-2012"
module top;
  timeunit 1ns; timeprecision 1ns;

  logic       clk;
  logic       rstN;
  logic       int_en;
  logic       zero;
  logic       carry;
  logic       neg;
  logic [1:0] parity;
  logic [7:0] status;

  test        test (.*);
  status_reg  dut  (.*);

  initial begin
    clk <= 0;
    forever #5 clk = ~clk;
  end
endmodule: top
//`end_keywords

