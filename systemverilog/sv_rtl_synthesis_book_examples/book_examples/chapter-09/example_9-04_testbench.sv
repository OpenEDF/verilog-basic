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
module test (
  output logic [2:0] current_state,                 // to DUT
  input  logic       get_ready, get_set, get_going  // from DUT
);
  timeunit 1ns/1ns;

  // generate stimulus
  initial begin
  	$timeformat(-9, 0, "ns", 6);  // nanoseconds, no precision, 6 columns
    current_state=3'b001; 
    #1;
    check_results;
    #1;
    current_state=3'b010; 
    #1;
    check_results;
    #1;
    current_state=3'b100; 
    #1;
    check_results;
    #1 $finish;
  end

  // verify results
  task check_results;
    logic [2:0] out;
    out = {get_ready,get_set, get_going};
    $write("At %t: current_state=%b:  ", $time, current_state);
    $write("EXPECT: {get_ready,get_set, get_going}=%b, ACTUAL: %b ", decoder_f(current_state), out);
    if (out === decoder_f(current_state)) $display(" OK");
    else                                  $display(" ERROR!");
  endtask
  
  function [2:0] decoder_f([2:0] current_state);
    case (current_state)
      3'b001: decoder_f = 3'b100;
      3'b010: decoder_f = 3'b010;
      3'b100: decoder_f = 3'b001;
    endcase 
  endfunction

endmodule: test
`end_keywords

`begin_keywords "1800-2012"
module top;
  timeunit 1ns/1ns;

  logic [2:0] current_state;
  logic       get_ready, get_set, get_going;

  test                               test (.*);
  reverse_case_with_unique_modifier  dut  (.*);

endmodule: top
`end_keywords

