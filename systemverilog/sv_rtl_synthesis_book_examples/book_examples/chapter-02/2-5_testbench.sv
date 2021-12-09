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
(output logic [3:0] select,
 input  logic [2:0] high_bit
);
  timeunit 1ns/1ns;

  initial begin
    select = 3;
    #5 ;
    select = 12;
    #5 ;
    $finish;
  end

  initial begin
    $timeformat(-9,0," ns",10);
    $monitor("At %t: \t select=%b  high_bit=%0d",
             $realtime, select, high_bit);
  end
endmodule: test

module top;
  timeunit 1ns/1ns;

  logic [3:0] select;
  logic [2:0] high_bit;

  test               test (.*);
  priority_decoder_2 dut1 (.*);

endmodule: top
`end_keywords


