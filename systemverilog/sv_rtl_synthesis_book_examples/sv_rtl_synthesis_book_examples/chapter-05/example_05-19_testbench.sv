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
 import bitwise_types_pkg::*;
#(parameter N = 8)
(output logic [N-1:0]  a, b,   // input to DUT
 output op_t           opcode, // input to DUT
 input  logic [N-1:0]  result  // output from DUT
);
  timeunit 1ns; timeprecision 1ns;

  // generate stimulus
  initial begin
  	$timeformat(-9, 0, "ns", 6);  // nanoseconds, no precision, 6 columns

  	a = 8'h13; b = 8'h55; 
  	for (opcode=opcode.first; opcode!=opcode.last; opcode=opcode.next) begin
  	  #5 check_results;
  	end
  	  #5 check_results;  // check last value after for-loop
    #5 $finish;
  end

  // verify results
  task check_results;
    $write("At %t: a=%b, b=%b, opcode=%-6s:  ", $time, a, b, opcode.name);
    $write("EXPECT: result = %b, ACTUAL: %b", result_f(a, b, opcode), result);
    if (result === result_f(a, b, opcode)) $display(" OK");
    else                                   $display(" ERROR!");
  endtask

  function [N-1:0] result_f([N-1:0] a, b, op_t opcode);
    case (opcode)  // modify result based on opcode
    	AND_OP: return a & b;
    	OR_OP : return a | b;
    	XOR_OP: return a ^ b;
    	RS1_OP: return a >> 1;
    	default: $error("undefined opcode in testbench %b", opcode);
    endcase
  endfunction

endmodule: test
//`end_keywords

//`begin_keywords "1800-2012"
module top;
  timeunit 1ns; timeprecision 1ns;
  parameter N = 8;
  
  logic [N-1:0]            a, b;
  bitwise_types_pkg::op_t  opcode;
  logic [N-1:0]            result;

  test          #(.N(N)) test (.*);
  bitwise_unit  #(.N(N)) dut  (.*);

endmodule: top
//`end_keywords

