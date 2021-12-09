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
(output logic rstN,                         // to DUT
 input  logic clk,
 input  logic get_ready, get_set, get_going   // from DUT
);
  timeunit 1ns; timeprecision 1ns;

  // generate stimulus
  initial begin
  	$timeformat(-9, 0, "ns", 6);  // nanoseconds, no precision, 6 columns

    $display("\n");
    #0 rstN = 0;
    @(negedge clk);
    check_results;
    #0 rstN = 1;
    @(negedge clk);
    check_results;
    @(negedge clk);
    check_results;
    @(negedge clk);
    check_results;
    @(negedge clk);
    check_results;
    $display("\n");
    #0 $finish;
  end

  // verify results
  task check_results;
    $write("At %t: current_state=%-5s  get_ready=%b  get_set=%b  get_going=%b:  ", $time, top.dut.current_state.name, get_ready, get_set, get_going);
     case (top.dut.current_state)
       top.dut.RESET: if ({get_ready, get_set, get_going} === 3'b000) $display(" OK");
                      else                                            $display(" ERROR!");
       top.dut.READY: if ({get_ready, get_set, get_going} === 3'b100) $display(" OK");
                      else                                            $display(" ERROR!");
       top.dut.SET  : if ({get_ready, get_set, get_going} === 3'b010) $display(" OK");
                      else                                            $display(" ERROR!");
       top.dut.GO   : if ({get_ready, get_set, get_going} === 3'b001) $display(" OK");
                      else                                            $display(" ERROR!");
    endcase
  endtask

endmodule: test
//`end_keywords

//`begin_keywords "1800-2012"
module top;
  timeunit 1ns; timeprecision 1ns;
  logic rstN;
  logic clk;
  logic get_ready, get_set, get_going;

  test        test (.*);
  simple_fsm  dut  (.*);

  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

endmodule: top
//`end_keywords

