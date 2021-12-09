//
// Book, "RTL Modeling with SystemVerilog for ASIC and FPGA Design"
// by Stuart Sutherland
//
// Assignment operator snippets.
//
// Copyright 2016, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//

`begin_keywords "1800-2012"

//
// Snippet 1:
// Old style without assignment operators
//
module bitwise_unit
  #(parameter N = 8);
  typedef enum logic [1:0] {AND_OP, OR_OP, XOR_OP, RS1_OP} op_t;
  logic [N-1:0] a, b;
  op_t          opcode;
  logic [N-1:0] result;

  always_comb begin 
    result = a;    // transfer a input to result output
    case (opcode)  // modify result based on opcode
      AND_OP: result = a & b;
      OR_OP : result = a | b;
      XOR_OP: result = a ^ b;
      RS1_OP: result = a >> 1;
    endcase 
  end 

  initial begin
  	#(1*10);    // advance to unique time slot for this test number
  	$display();
  	$display("%m: Old-style assignments");
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


endmodule: bitwise_unit


//
// Snippet 2:
// xxx
//

`end_keywords
