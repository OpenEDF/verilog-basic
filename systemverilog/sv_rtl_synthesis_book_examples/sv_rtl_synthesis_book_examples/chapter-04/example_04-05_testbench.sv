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
(output logic data_matches, compare_en, rstN,
 input  logic data_synched, clk
);
  timeunit 1ns; timeprecision 1ns;

  typedef enum  {Count[0:15]} states_t;
  states_t dut_state;
  assign dut_state = states_t'(top.dut.CurState);  // copy state variable in DUT to local variable

  // UNCOMMENT THIS LINE FOR ADDITIONAL DEBUG INFORMATION
  // initial $monitor(" state = %0s, data_synched = %b", dut_state.name, i1.data_synched);

  always @(negedge clk) begin
    $strobe("state = %0s   data_matches = %b   compare_en = %b   data_synched = %b",
            dut_state.name, data_matches, compare_en, data_synched);
  end

  initial begin
    data_matches = 0;
    compare_en   = 0;

    // test that counter resets
    begin: reset_test
      $display("\nTesting reset...");
      rstN = 1;
      #1 rstN = 0;
      repeat(4) @(negedge clk) ;
      rstN = 1;
      check_results(0);
    end: reset_test

    // test that counter stays at 0 until enabled, even though match is set
    begin: hold_in_zero_test
      $display("\nTesting hold until compare enabled...");
      @(negedge clk) data_matches = 1;
      repeat(5) @(negedge clk) ;
      @(negedge clk) data_matches = 0;
      check_results(0);
    end: hold_in_zero_test

    // test that counter increments on match when enabled.
    // The test pattern clears for 1 clk, then sets match for 4 clks.
    // The pattern is repeated 4 times.
    begin: increment_on_enable_test
      $display("\nTesting increment on match (compare is enabled)...");
      compare_en = 1;                    // enable matching
      repeat(4) begin
        data_matches = 0;                // clear match
        @(negedge clk) data_matches = 1; // set match
        repeat(4) @(negedge clk) ;       // hold for 4 clks
      end
      compare_en = 0;                    // disable matching
      check_results(1);
    end: increment_on_enable_test

    // test that counter holds current state when not enabled.
    begin: hold_on_not_enable_test
      $display("\nTesting hold current state when not enabled...");
      compare_en   = 0;                  // disable matching
      data_matches = 1;                  // set match, but not enabled
      repeat(4) @(negedge clk) ;         // hold for 4 clks
      check_results(1);
    end: hold_on_not_enable_test

    // test incrementing to full count.
    begin: increment_to_max_test
      $display("\nTesting increment to maximum count...");
      compare_en   = 1;                  // enable matching
      data_matches = 1;                  // set match
      repeat(10) @(negedge clk) ;        // hold for 10 clks
      compare_en = 0;                    // disable matching
      check_results(1);
    end: increment_to_max_test

    begin: decrement_to_zero_test
      $display("\nTesting decrement to zero...");
      compare_en   = 1;                  // enable matching
      data_matches = 0;                  // set match
      repeat(10) @(negedge clk) ;        // hold for 10 clks
      check_results(0);
    end: decrement_to_zero_test

    $display("\n Tests completed with %0d errors!\n", err_count);
    $finish;
  end

  // subroutine to check if state machine has correct values
  // (should add comparison to current state to this check)
  int err_count = 0;
  task check_results(input logic expected_sync);
    if (data_synched == expected_sync)
      $display("  Test passed");
    else  begin
      err_count++;
      $display (" Error: data_synched = %b, expected %b", data_synched, expected_sync);
      //$stop;
    end
  endtask
endmodule: test

module top;
  timeunit 1ns; timeprecision 1ns;

  logic data_matches, compare_en, rstN, data_synched, clk;

  test               test (.*);
  confidence_counter dut  (.*);

  initial begin
    clk <= 0;
    forever #5 clk = ~clk;
  end
endmodule: top
//`end_keywords


