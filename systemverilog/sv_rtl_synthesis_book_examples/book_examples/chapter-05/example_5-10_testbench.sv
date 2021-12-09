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
#(parameter N = 16)
(output logic [N-1:0] address,      // address bus
 input  logic         boundary_flag // set when address is at a
);                                  // quadrant boundary
  timeunit 1ns/1ns;

  // generate stimulus
  initial begin
  	$timeformat(-9, 0, "ns", 6);  // nanoseconds, no precision, 6 columns
  	#5 address = 0;                  // at 1st quadrant boundary
  	#5 check_results;

  	#5 address = (((2**N)/4)*1) - 1; // before 2nd quadrant boundary
  	#5 check_results;
  	#5 address++;                    // at quadrant boundary
  	#5 check_results;
  	#5 address++;                    // after quadrant boundary
  	#5 check_results;

  	#5 address = (((2**N)/4)*1) - 2; // before 3rd quadrant boundary
  	#5 check_results;
  	#5 address++;                    // at quadrant boundary
  	#5 check_results;
  	#5 address++;                    // after quadrant boundary
  	#5 check_results;

  	#5 address = (((2**N)/4)*1) - 3; // before 4th quadrant boundary
  	#5 check_results;
  	#5 address++;                    // at quadrant boundary
  	#5 check_results;
  	#5 address++;                    // after quadrant boundary
  	#5 check_results;

    #5 $finish;
  end

  // verify results
  task check_results;
    $write("At %t: address=%0d:  ", $time, address);
    case (address)
      (((2**N)/4)*1)*0: begin
      	   $write("EXPECT: boundary_flag = 1, ACTUAL: %b ", boundary_flag);
      	   if (boundary_flag) $display(" OK");
      	   else               $display(" ERROR!");
      	 end
      (((2**N)/4)*1)*1: begin
      	   $write("EXPECT: boundary_flag = 1, ACTUAL: %b ", boundary_flag);
      	   if (boundary_flag) $display(" OK");
      	   else               $display(" ERROR!");
      	 end
      (((2**N)/4)*1)*2: begin
      	   $write("EXPECT: boundary_flag = 1, ACTUAL: %b ", boundary_flag);
      	   if (boundary_flag) $display(" OK");
      	   else               $display(" ERROR!");
      	 end
      (((2**N)/4)*1)*3: begin
      	   $write("EXPECT: boundary_flag = 1, ACTUAL: %b ", boundary_flag);
      	   if (boundary_flag) $display(" OK");
      	   else               $display(" ERROR!");
      	 end
      default: begin
      	   $write("EXPECT: boundary_flag = 0, ACTUAL: %b ", boundary_flag);
      	   if (!boundary_flag) $display(" OK");
      	   else                $display(" ERROR!");
      	 end
    endcase
  endtask

endmodule: test
`end_keywords

`begin_keywords "1800-2012"
module top;
  timeunit 1ns/1ns;
  parameter N = 16;
  logic [N-1:0] address;
  logic        boundary_flag;

  test              #(.N(N)) test (.*);
  boundary_detector #(.N(N)) dut  (.*);

endmodule: top
`end_keywords

