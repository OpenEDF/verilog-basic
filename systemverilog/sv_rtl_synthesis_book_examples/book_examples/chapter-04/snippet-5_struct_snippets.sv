//
// Book, "RTL Modeling with SystemVerilog for ASIC and FPGA Design"
// by Stuart Sutherland
//
// Structure snippets.
//
// Copyright 2016, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//

`begin_keywords "1800-2012"

//
// Snippet 1:
// Anonymous structure with an assignment to one member
//
module struct_test_1; 
	logic clk, init;

  typedef enum logic [2:0] {NOP, ADD, SUB, MULT, DIV} opcode_t;
  
  struct {
    int          a, b;     // 32-bit variables
    opcode_t opcode;       // user-defined type
    logic [23:0] address;  // 24-bit variable
    bit          error;    // 1-bit 2-state variable
  } instruction_word;
  
  always @(posedge clk)
    if (init) instruction_word.address = 32'hF000001E;
    else      ;//... 

  initial begin
  	#(1*10);    // advance to unique time slot for this test number
  	clk = 0;
  	init = 1;
  	$strobe();
  	$strobe("%m: Before first posedge clock:");
  	$strobe("   instruction_word.a = %0d", instruction_word.a);
  	$strobe("   instruction_word.b = %0d", instruction_word.b);
  	$strobe("   instruction_word.opcode = %s", instruction_word.opcode.name);
  	$strobe("   instruction_word.address = %h", instruction_word.address);
  	$strobe("   instruction_word.error = %b", instruction_word.error);
 
   	#1;
   	clk = 1;
   	$strobe();
  	$strobe("%m: After first posedge clock:");
  	$strobe("   instruction_word.a = %0d", instruction_word.a);
  	$strobe("   instruction_word.b = %0d", instruction_word.b);
  	$strobe("   instruction_word.opcode = %s", instruction_word.opcode.name);
  	$strobe("   instruction_word.address = %h", instruction_word.address);
  	$strobe("   instruction_word.error = %b", instruction_word.error);
  end

endmodule: struct_test_1


//
// Snippet 2:
// Anonymous structure with an assignment to all members
//
module struct_test_2; 
	logic clk, init;

  typedef enum logic [2:0] {NOP, ADD, SUB, MULT, DIV} opcode_t;
  
  struct {
    logic [31:0] a, b;
    opcode_t     opcode;
    logic [23:0] address;
  } instruction_word;
  
  always @(posedge clk)
    if (init) instruction_word <= '{3, 5, ADD, 24'hC4};
    else      ;//... 

  initial begin
  	#(2*10);    // advance to unique time slot for this test number
  	clk = 0;
  	init = 1;
  	$strobe();
  	$strobe("%m: Before first posedge clock:");
  	$strobe("   instruction_word.a = %0d", instruction_word.a);
  	$strobe("   instruction_word.b = %0d", instruction_word.b);
  	$strobe("   instruction_word.opcode = %s", instruction_word.opcode.name);
  	$strobe("   instruction_word.address = %h", instruction_word.address);
 
   	#1;
   	clk = 1;
   	$strobe();
  	$strobe("%m: After first posedge clock:");
  	$strobe("   instruction_word.a = %0d", instruction_word.a);
  	$strobe("   instruction_word.b = %0d", instruction_word.b);
  	$strobe("   instruction_word.opcode = %s", instruction_word.opcode.name);
  	$strobe("   instruction_word.address = %h", instruction_word.address);
  end

endmodule: struct_test_2

//
// Snippet 3:
// Anonymous structure with tagged structure expressions
//
module struct_test_3; 
	logic clk, init;

  typedef enum logic [2:0] {NOP, ADD, SUB, MULT, DIV} opcode_t;
  
  struct {
    logic [31:0] a, b;
    opcode_t     opcode;
    logic [23:0] address;
  } instruction_word;
  
  always @(posedge clk)
    if (init) instruction_word <= '{address:0, opcode:SUB, a:100, b:7};
    else      ;//... 

  initial begin
  	#(3*10);    // advance to unique time slot for this test number
  	clk = 0;
  	init = 1;
  	$strobe();
  	$strobe("%m: Before first posedge clock:");
  	$strobe("   instruction_word.a = %0d", instruction_word.a);
  	$strobe("   instruction_word.b = %0d", instruction_word.b);
  	$strobe("   instruction_word.opcode = %s", instruction_word.opcode.name);
  	$strobe("   instruction_word.address = %h", instruction_word.address);
 
   	#1;
   	clk = 1;
   	$strobe();
  	$strobe("%m: After first posedge clock:");
  	$strobe("   instruction_word.a = %0d", instruction_word.a);
  	$strobe("   instruction_word.b = %0d", instruction_word.b);
  	$strobe("   instruction_word.opcode = %s", instruction_word.opcode.name);
  	$strobe("   instruction_word.address = %h", instruction_word.address);
  end

endmodule: struct_test_3


//
// Snippet 4:
// Anonymous structure with a default structure expression
//
module struct_test_4; 
	logic clk, rstN;

  typedef enum logic [2:0] {NOP, ADD, SUB, MULT, DIV} opcode_t;
  
  struct {
    logic [31:0] a, b;
//    opcode_t     opcode;
    int          opcode;
    logic [23:0] address;
  } instruction_word;
  
  always @(posedge clk)
    if (!rstN) instruction_word <= '{default:0}; // set all members to 0
    else      ;//... 

  initial begin
  	#(4*10);    // advance to unique time slot for this test number
  	rstN = 1;
  	clk = 0;
  	$strobe();
  	$strobe("%m: Before first posedge clock:");
  	$strobe("   instruction_word.a = %0d", instruction_word.a);
  	$strobe("   instruction_word.b = %0d", instruction_word.b);
//  	$strobe("   instruction_word.opcode = %s", instruction_word.opcode.name);
  	$strobe("   instruction_word.opcode = %0d", instruction_word.opcode);
  	$strobe("   instruction_word.address = %h", instruction_word.address);
 
   	#1;
  	rstN = 0;
   	clk <= 1;
   	$strobe();
  	$strobe("%m: After first posedge clock:");
  	$strobe("   instruction_word.a = %0d", instruction_word.a);
  	$strobe("   instruction_word.b = %0d", instruction_word.b);
//  	$strobe("   instruction_word.opcode = %s", instruction_word.opcode.name);
  	$strobe("   instruction_word.opcode = %0d", instruction_word.opcode);
  	$strobe("   instruction_word.address = %h", instruction_word.address);
  end

endmodule: struct_test_4


//
// Snippet 5:
// Anonymous structure with a mix of tagged and default in structure expression
//
module struct_test_5; 
	logic clk, rstN;

  typedef enum logic [2:0] {NOP, ADD, SUB, MULT, DIV} opcode_t;
  
  struct {
    logic [31:0] a, b;
//    opcode_t     opcode;
    int          opcode;
    logic [23:0] address;
  } instruction_word;
  
  always @(posedge clk)
    if (!rstN) instruction_word <= '{address:'1, default:0};
    else      ;//... 

  initial begin
  	#(5*10);    // advance to unique time slot for this test number
  	rstN = 1;
  	clk = 0;
  	$strobe();
  	$strobe("%m: Before first posedge clock:");
  	$strobe("   instruction_word.a = %0d", instruction_word.a);
  	$strobe("   instruction_word.b = %0d", instruction_word.b);
//  	$strobe("   instruction_word.opcode = %s", instruction_word.opcode.name);
  	$strobe("   instruction_word.opcode = %0d", instruction_word.opcode);
  	$strobe("   instruction_word.address = %h", instruction_word.address);
 
   	#1;
  	rstN = 0;
   	clk <= 1;
   	$strobe();
  	$strobe("%m: After first posedge clock:");
  	$strobe("   instruction_word.a = %0d", instruction_word.a);
  	$strobe("   instruction_word.b = %0d", instruction_word.b);
//  	$strobe("   instruction_word.opcode = %s", instruction_word.opcode.name);
  	$strobe("   instruction_word.opcode = %0d", instruction_word.opcode);
  	$strobe("   instruction_word.address = %h", instruction_word.address);
  end

endmodule: struct_test_5


//
// Snippet 6:
// Anonymous structure with default structure expression containing an enum
//
module struct_test_6; 
	logic clk, rstN;

  typedef enum logic [2:0] {NOP, ADD, SUB, MULT, DIV} opcode_t;
  
  struct {
    logic [31:0] a, b;
    opcode_t     opcode;
    logic [23:0] address;
  } instruction_word;
  

  always @(posedge clk or negedge rstN)
    if (!rstN) instruction_word <= '{opcode:NOP, default:0};
    else      ;//... 

  initial begin
  	#(6*10);    // advance to unique time slot for this test number
  	rstN = 1;
  	clk <= 0;
  	$strobe();
  	$strobe("%m: Before first posedge clock:");
  	$strobe("   instruction_word.a = %0d", instruction_word.a);
  	$strobe("   instruction_word.b = %0d", instruction_word.b);
  	$strobe("   instruction_word.opcode = %s", instruction_word.opcode.name);
  	$strobe("   instruction_word.address = %h", instruction_word.address);
 
   	#1;
  	rstN = 0;
   	clk <= 1;
   	$strobe();
  	$strobe("%m: After reset:");
  	$strobe("   instruction_word.a = %0d", instruction_word.a);
  	$strobe("   instruction_word.b = %0d", instruction_word.b);
  	$strobe("   instruction_word.opcode = %s", instruction_word.opcode.name);
  	$strobe("   instruction_word.address = %h", instruction_word.address);
  end

endmodule: struct_test_6


//
// Snippet 7:
// Typed structures and copying structures
//
module struct_test_7; 
	logic clk, rstN;

  typedef enum logic [2:0] {NOP, ADD, SUB, MULT, DIV} opcode_t;
  
  typedef struct {  // structure definition
    logic [31:0] a, b;
    opcode_t     opcode;
    logic [23:0] address;
  } instruction_word_t;
  
  instruction_word_t iw_var;  // variable of the structure type
  wire instruction_word_t iw_net; // net of the structure type
  
  always @(posedge clk or negedge rstN)
    if (!rstN) iw_var <= '{opcode:NOP, default:0};
    else       iw_var <= iw_net;   // copy iw_net structure
  
  initial begin
  	#(7*10);    // advance to unique time slot for this test number
  	rstN = 1;
  	clk <= 0;
  	$strobe();
  	$strobe("%m: Before first posedge clock:");
  	$strobe("   iw_var.a = %0d", iw_var.a);
  	$strobe("   iw_var.b = %0d", iw_var.b);
  	$strobe("   iw_var.opcode = %s", iw_var.opcode.name);
  	$strobe("   iw_var.address = %h", iw_var.address);
 
   	#1;
  	rstN = 0;
   	clk <= 1;
   	$strobe();
  	$strobe("%m: After reset:");
  	$strobe("   iw_var.a = %0d", iw_var.a);
  	$strobe("   iw_var.b = %0d", iw_var.b);
  	$strobe("   iw_var.opcode = %s", iw_var.opcode.name);
  	$strobe("   iw_var.address = %h", iw_var.address);
  end

endmodule: struct_test_7


//
// Snippet 8:
// Packed structure, comparing packed structures
//
module struct_test_8; 
	logic clk, rstN;

  struct packed {
    logic        valid;
    logic [ 7:0] tag;
    logic [31:0] data;
  } data_word;
  
  always @(posedge clk)
    data_word[39:32] = 8'hf0;  // same bits as tag
  
  initial begin
  	#(8*10);    // advance to unique time slot for this test number
  	clk <= 0;
  	$strobe();
  	$strobe("%m: Before first posedge clock:");
  	$strobe("   data_word.valid = %b", data_word.valid);
  	$strobe("   data_word.tag = %h", data_word.tag);
  	$strobe("   data_word.data = %0d", data_word.data);
 
   	#1;
   	clk <= 1;
   	$strobe();
  	$strobe("%m: After first clock:");
  	$strobe("   data_word.valid = %b", data_word.valid);
  	$strobe("   data_word.tag = %h", data_word.tag);
  	$strobe("   data_word.data = %0d", data_word.data);
  end

endmodule: struct_test_8


//
// Snippet 9:
// Signed packed structure, comparing packed structures
//
  module struct_test_9; 
  	logic lt, gt;
  
  typedef struct packed signed {
    logic               valid;
    logic        [ 7:0] tag;
    logic signed [31:0] data;
  } data_word_t;
  
  data_word_t d1, d2;
  
  always_comb begin 
    lt = 0; gt = 0;
    if      (d1 < d2) lt = '1;   // signed comparison
    else if (d1 > d2) gt = '1;
  end 
  
  initial begin
  	#(9*10);    // advance to unique time slot for this test number
  	d1 = '{default:0};
  	d2 = '{default:0};
  	$strobe();
  	$strobe("%m: After resetting structures:");
  	$strobe("   lt = %b", lt);
  	$strobe("   gt = %b", gt);
 
   	#1;
  	d1 = '{0,1,2};
  	d2 = '{1,2,3};
  	$strobe();
  	$strobe("%m: After loading structures:");
  	$strobe("   lt = %b", lt);
  	$strobe("   gt = %b", gt);
  end

endmodule: struct_test_9


//
// Snippet 10:
// Passing structures through ports
//
package definitions;
  typedef enum logic [2:0] {ADD, SUB, MULT, DIV} opcode_t;

  typedef struct { 
    logic [31:0]  a, b;
    opcode_t      opcode;
    logic [23:0]  address;
  } instruction_word_t;
endpackage: definitions 

module alu 
 import definitions::*;         // wildcard import
(input instruction_word_t iw,   // user-defined port type
 input wire               clk
);

  initial begin
  	#(10*10);    // advance to unique time slot for this test number
  	$strobe();
  	$strobe("%m: No results printed -- just verifying that example compiles.");
   end

endmodule: alu


//
// Snippet 11:
// Passing structures through function args
//
module processor (/*...*/);
  //...
  typedef enum logic [2:0] {ADD, SUB, MULT, DIV} opcode_t;

  typedef struct {  // typedef is local to this module
    logic [31:0]  a, b;
    opcode_t      opcode;
    logic [23:0]  address;
  } instruction_word_t;
  
  function calculate_result (input instruction_word_t iw);
    //...
  endfunction: calculate_result

  initial begin
  	#(11*10);    // advance to unique time slot for this test number
  	$strobe();
  	$strobe("%m: No results printed -- just verifying that example compiles.");
   end
   
endmodule: processor

`end_keywords
