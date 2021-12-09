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
(output logic [7:0] select,
 input  logic [3:0] high_bit_old, high_bit_new
);
  timeunit 1ns/1ns;

  initial begin
    select = 5;
    #5 ;
    select = 115;
    #5 ;
    $finish;
  end

  initial begin
    $timeformat(-9,0," ns",10);
    $monitor("At %t: \t select=%b  high_bit_old=%0d  high_bit_new=%0d",
             $realtime, select, high_bit_old, high_bit_new);
  end
endmodule: test

module top;
  timeunit 1ns/1ns;

  logic [7:0] select;
  logic [3:0] high_bit_old, high_bit_new;

  test                 test (.*);
  priority_decoder_new dut1 (.select(select), .high_bit(high_bit_new));
  priority_decoder_old dut2 (select, high_bit_old);

endmodule: top
`end_keywords


