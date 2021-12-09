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
 import operation_types_pkg::*;
#(parameter N = 4)
(output logic [N-1:0]  a, b,   // input to DUT
 output op_t           opcode, // input to DUT
 input  logic [N-1:0]  result  // output from DUT
);
  timeunit 1ns/1ns;

  // generate stimulus
  initial begin
  	$timeformat(-9, 0, "ns", 6);  // nanoseconds, no precision, 6 columns

  	a = 8'h6; b = 8'h2; 
  	for (opcode=opcode.first; opcode!=opcode.last; opcode=opcode.next) begin
  	  #5 check_results;
  	end
  	  #5 check_results;  // check last value after for-loop
    #5 $finish;
  end

  // verify results
  task check_results;
    $write("At %t: a=%0d, b=%0d, opcode=%-3s:  ", $time, a, b, opcode.name);
    $write("EXPECT: result = %0d, ACTUAL: %0d", result_f(a, b, opcode), result);
    if (result === result_f(a, b, opcode)) $display(" OK");
    else                                   $display(" ERROR!");
  endtask

  function [N-1:0] result_f([N-1:0] a, b, op_t opcode);
    case (opcode)  // modify result based on opcode
    	ADD: return a + b;
    	SUB: return a - b;
    	MUL: return a * b;
    	DIV: return a / b;
    	default: $error("undefined opcode in testbench %b", opcode);
    endcase
  endfunction

endmodule: test
`end_keywords

`begin_keywords "1800-2012"
module top;
  timeunit 1ns/1ns;
  parameter N = 4;
  
  logic [N-1:0]               a, b;
  operation_types_pkg::op_t  opcode;
  logic [N-1:0]              result;

  test        #(.N(N)) test (.*);
  simple_alu  #(.N(N)) dut  (.*);

endmodule: top
`end_keywords

