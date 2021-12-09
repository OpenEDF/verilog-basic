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
(output logic [3:0] data_in,   // input to DUT
 input  logic [2:0] bcd_out,   // output from DUT
 input  logic       clk        // testbench clock
);
  timeunit 1ns/1ns;

  // generate stimulus
  initial begin
  	$timeformat(-9, 0, "ns", 6);  // nanoseconds, no precision, 6 columns
    repeat (3) begin
      @(negedge clk) ;
      void'(std::randomize(data_in));
      @(negedge clk) check_results;
    end
    @(negedge clk) $finish;
  end

  // verify results
  task check_results;
    $write("At %t: data_in=%b:  ", $time, data_in);
    $write("EXPECT: bcd_out = %0d, ACTUAL: %0d ", encoder_f(data_in), bcd_out);
    if (bcd_out === encoder_f(data_in)) $display(" OK");
    else                                $display(" ERROR!");
  endtask
  
  function int encoder_f([3:0] d);
    encoder_f <= '0;
    for (int i=0; i<=3; i++) 
      if (d[i]) encoder_f = i + 1;
  endfunction

endmodule: test
`end_keywords

`begin_keywords "1800-2012"
module top;
  timeunit 1ns/1ns;

  logic [3:0] data_in;
  logic [2:0] bcd_out;
  logic       clk;

  test                  test (.*);
  priority_bcd_encoder  dut  (.*);

  initial begin
    clk <= 0;
    forever #5 clk = ~clk;
  end
endmodule: top
`end_keywords

