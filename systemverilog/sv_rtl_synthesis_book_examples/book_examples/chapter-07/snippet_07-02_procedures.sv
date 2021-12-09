//
// Book, "RTL Modeling with SystemVerilog for ASIC and FPGA Design"
// by Stuart Sutherland
//
// Always and always_comb snippets.
//
// Copyright 2016, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//

`begin_keywords "1800-2012"

//
// Snippet 1:
// Simple always procedure
//
module adder_1; 
  logic [7:0] a, b; 
  logic [7:0] sum;

always @(a, b) begin 
  sum = a + b;
end 

  initial begin
    #(1*10);    // advance to unique time slot for this test number
    a = 8'h1; b = 8'h2;
    #1;
    $display("\n%m: a=%0d  b=%0h  : sum=%0d  (expect sum=3)\n", a, b, sum);
  end
endmodule: adder_1


//
// Snippet 2:
// Sensitity list example
//
module adder_2; 
  logic [7:0] a, b; 
  logic       ci, co;
  logic [7:0] sum;

always @(a, b, ci) begin 
  {co,sum} = a + b + ci;
end 

  initial begin
    #(2*10);    // advance to unique time slot for this test number
    a = 8'h1; b = 8'h2; ci = 1'b1;
    #1;
    $display("\n%m: a=%0d  b=%0h  ci=%b : sum=%0d  co=%b (expect sum=4  co=0)\n", a, b, ci, sum, co);
  end
endmodule: adder_2


//
// Snippet 3:
// always procedure with complete sensitivity list
//
module alu_complete_sensitivity;
  logic [7:0] a, b, result;

typedef enum logic [1:0] {ADD, SUB, MUL, DIV} op_t;
op_t opcode;

always @(opcode, a, b) begin 
  case (opcode)
    ADD: result = a + b;
    SUB: result = a - b;
    MUL: result = a * b;
    DIV: result = a / b;
  endcase 
end 

 
  initial begin
    #(3*10);    // advance to unique time slot for this test number
    a = 8'h2;  b = 8'h3;
    opcode = ADD;
    #1;
    $display("\n%m: a=%0d  b=%0d  opcode=%s:  result=%0d (expect 5)", a, b, opcode.name, result);
    #1;
    opcode = MUL;
    #1;
    $display("%m: a=%0d  b=%0d  opcode=%s:  result=%0d (expect 6)\n", a, b, opcode.name, result);
  end
endmodule: alu_complete_sensitivity


//
// Snippet 4:
// always procedure with incomplete sensitivity list
//
module alu_incomplete_sensitivity;
  logic [7:0] a, b, result;

typedef enum logic [1:0] {ADD, SUB, MUL, DIV} op_t;
op_t opcode;

always @(a, b) begin 
  case (opcode)
    ADD: result = a + b;
    SUB: result = a - b;
    MUL: result = a * b;
    DIV: result = a / b;
  endcase 
end 

 
  initial begin
    #(4*10);    // advance to unique time slot for this test number
    a = 8'h2;  b = 8'h3;
    opcode = ADD;
    #1;
    $display("\n%m: a=%0d  b=%0d  opcode=%s:  result=%0d (expect 5)", a, b, opcode.name, result);
    #1;
    opcode = MUL;
    #1;
    $display("%m: a=%0d  b=%0d  opcode=%s:  result=%0d (expect 6 if ALU works correctly)\n", a, b, opcode.name, result);
  end
endmodule: alu_incomplete_sensitivity


//
// Snippet 5:
// always procedure with @* sensitivity list
//
module alu_at_star_sensitivity;
  logic [7:0] a, b, result;

typedef enum logic [1:0] {ADD, SUB, MUL, DIV} op_t;
op_t opcode;

always @* begin 
  case (opcode)
    ADD: result = a + b;
    SUB: result = a - b;
    MUL: result = a * b;
    DIV: result = a / b;
  endcase 
end 

 
  initial begin
    #(5*10);    // advance to unique time slot for this test number
    a = 8'h2;  b = 8'h3;
    opcode = ADD;
    #1;
    $display("\n%m: a=%0d  b=%0d  opcode=%s:  result=%0d (expect 5)", a, b, opcode.name, result);
    #1;
    opcode = MUL;
    #1;
    $display("%m: a=%0d  b=%0d  opcode=%s:  result=%0d (expect 6)\n", a, b, opcode.name, result);
  end
endmodule: alu_at_star_sensitivity


//
// Snippet 6:
// always_comb procedure with inferred sensitivity list
//
module alu_always_comb;
  logic [7:0] a, b, result;

typedef enum logic [1:0] {ADD, SUB, MUL, DIV} op_t;
op_t opcode;

always_comb begin 
  case (opcode)
    ADD: result = a + b;
    SUB: result = a - b;
    MUL: result = a * b;
    DIV: result = a / b;
  endcase 
end 

 
  initial begin
    #(6*10);    // advance to unique time slot for this test number
    a = 8'h2;  b = 8'h3;
    opcode = ADD;
    #1;
    $display("\n%m: a=%0d  b=%0d  opcode=%s:  result=%0d (expect 5)", a, b, opcode.name, result);
    #1;
    opcode = MUL;
    #1;
    $display("%m: a=%0d  b=%0d  opcode=%s:  result=%0d (expect 6)\n", a, b, opcode.name, result);
  end
endmodule: alu_always_comb


//
// Snippet 7:
// always procedure with dataflow assignments
//
module dataflow;
  logic [7:0] a, b, c, factor, sum, prod, result;

always_comb begin 
  sum    = a + b;
  prod   = sum * factor;
  result = prod - c;
end 
 
  initial begin
    #(7*10);    // advance to unique time slot for this test number
    a = 8'h2;  b = 8'h3; c = 8'h1; factor=8'h1;
    #1;
    $display("\n%m: a=%0d  b=%0d  c=%0d  factor=%0d:  result=%0d (expect 4)\n", a, b, c, factor, result);
  end
endmodule: dataflow


//
// Snippet 8:
// always procedure with incomplete case statement (latch inferrence)
//
module alu_with_inferred_latch;
  logic [7:0] a, b, result;
  logic [1:0] opcode;

always_comb begin 
  case (opcode)
    2'b00: result = a + b;
    2'b01: result = a - b;
    2'b10: result = a * b;
  endcase 
end 

  initial begin
    #(8*10);    // advance to unique time slot for this test number
    a = 8'h2;  b = 8'h3;
    opcode = 2'b00;
    #1;
    $display("\n%m: a=%0d  b=%0d  opcode=%b:  result=%0d (expect 5)", a, b, opcode, result);
    #1;
    opcode = 2'b11; // unused opcode value
    #1;
    a = 8'h5;  b = 8'h5;
    #1;
    $display("%m: a=%0d  b=%0d  opcode=%b:  result=%0d (expect 5 -- retain previous value)\n", a, b, opcode, result);
  end
endmodule: alu_with_inferred_latch


`end_keywords
