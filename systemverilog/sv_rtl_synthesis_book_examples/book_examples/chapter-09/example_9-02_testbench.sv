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
(output logic resetN,                         // to DUT
 input  logic clock,
 input  logic get_ready, get_set, get_going   // from DUT
);
  timeunit 1ns/1ns;

  import fsm_types_pkg::*;
  states_t current_state, next_state;
  
  // generate stimulus
  initial begin
  	$timeformat(-9, 0, "ns", 6);  // nanoseconds, no precision, 6 columns

    $display("\n");
    #0 resetN = 0;
    @(negedge clock);
    check_results;
    #0 resetN = 1;
    @(negedge clock);
    check_results;
    @(negedge clock);
    check_results;
    @(negedge clock);
    check_results;
    $display("\n");
    #0 $finish;
  end

  // verify results
  task check_results;
    $write("At %t: get_ready=%b  get_set=%b  get_going=%b:  ", $time, get_ready, get_set, get_going);
     case (top.dut.current_state)
       READY: if ({get_ready, get_set, get_going} === 3'b100) $display(" OK");
              else                                            $display(" ERROR!");
       SET  : if ({get_ready, get_set, get_going} === 3'b010) $display(" OK");
              else                                            $display(" ERROR!");
       GO   : if ({get_ready, get_set, get_going} === 3'b001) $display(" OK");
              else                                            $display(" ERROR!");
    endcase
  endtask

endmodule: test
`end_keywords

`begin_keywords "1800-2012"
module top;
  timeunit 1ns/1ns;
  logic resetN;
  logic clock;
  logic get_ready, get_set, get_going;

  test        test (.*);
  simple_fsm  dut  (.*);

  initial begin
    clock = 0;
    forever #5 clock = ~clock;
  end

endmodule: top
`end_keywords

