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

`begin_keywords "1800-2012"
module test
(output logic [2:0] current_state,
 input  logic       get_ready, get_set, get_going,
 input              clk
);
  timeunit 1ns; timeprecision 1ns;

  typedef enum logic [2:0] {READY= 3'b001,
                            SET  = 3'b010,
                            GO   = 3'b100} states_t;

  // generate stimulus
  initial begin
  	$timeformat(-9, 0, "ns", 6);  // nanoseconds, no precision, 6 columns
    current_state = READY;
    @(negedge clk) check_results;

    current_state = SET;
    @(negedge clk) check_results;

    current_state = GO;
    @(negedge clk) check_results;

    @(negedge clk) $finish;
  end

  // verify results
  task check_results;
    $write("At %t: current_state=%b  :  ", $time, current_state );
    $write("EXPECT: {get_ready, get_set, get_going}=%b , ACTUAL: %b ", expect_f(current_state), {get_ready,get_set,get_going} );
    if ({get_ready,get_set,get_going} === expect_f(current_state)) $display(" OK");
    else                                                           $display(" ERROR!");
  endtask
  
  function logic [2:0] expect_f([2:0] current_state);
    expect_f = 'X;
    unique0 case (current_state)
      READY: expect_f = 3'b100;
      SET:   expect_f = 3'b010;
      GO:    expect_f = 3'b001;
    endcase 
  endfunction

endmodule: test

module top;
  timeunit 1ns; timeprecision 1ns;

  logic [2:0] current_state;
  logic       get_ready, get_set, get_going;
  logic       clk;

  test                       test (.*);
  case_with_priority_decode  dut  (.*);

  initial begin
    clk <= 0;
    forever #5 clk = ~clk;
  end
endmodule: top
`end_keywords

