//
// Book, "RTL Modeling with SystemVerilog for ASIC and FPGA Design"
// by Stuart Sutherland
//
// Operator rules snippets.
//
// Copyright 2016, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//

`begin_keywords "1800-2012"

//
// Snippet 1:
// X-optimism with predictable silicon behavior
//
module op_rules_1;
  logic [3:0] a, b, result;

  assign a = 4'b01zx;        // some bits are X or Z
  assign b = 4'b0000;        // all bits of are zero

  assign result = a & b;     // bitwise AND a with b

  initial begin
  	#(1*10);    // advance to unique time slot for this test number
  	$display();
  	$display("%m: EXPECT: result is 0000");
  	$display("%m: ACTUAL: result is %b", result);
   	$display();
  end
endmodule: op_rules_1


//
// Snippet 2:
// X-optimism with unpredictable silicon behavior
//
module op_rules_2;
  logic [3:0] a, b, result;

  assign a = 4'b01zx;        // some bits are X or Z
  assign b = 4'b1111;        // all bits of are one

  assign result = a & b;     // bitwise AND a with b

  initial begin
  	#(2*10);    // advance to unique time slot for this test number
  	$display();
  	$display("%m: EXPECT: result is 01xx");
  	$display("%m: ACTUAL: result is %b", result);
   	$display();
  end
endmodule: op_rules_2


//
// Snippet 3:
// X-pessimism
//
module op_rules_3;
  logic [3:0] a, b, result;

  assign a = 4'b000x;        // some bits are X or Z
  assign b = 4'b0101;        // a value of 5 in decimal

  assign result = a + b;     // add the values of a and b

  initial begin
  	#(3*10);    // advance to unique time slot for this test number
  	$display();
  	$display("%m: EXPECT: result is xxxx");
  	$display("%m: ACTUAL: result is %b", result);
   	$display();
  end
endmodule: op_rules_3


//
// Snippet 4:
// self-determined operands
//
module op_rules_4;
  logic [15:0] a;
  logic [31:0] b;
  logic        result;

  assign result = a && b;   // test a and b for true or false

  initial begin
  	#(4*10);    // advance to unique time slot for this test number
  	a = 1;
  	b = 2;
  	#1;
  	$display();
  	$display("%m: EXPECT: result is 1");
  	$display("%m: ACTUAL: result is %b", result);
   	$display();
  end
endmodule: op_rules_4


//
// Snippet 5:
// context-determined operands, bitwise op
//
module op_rules_5;
  logic [ 7:0] a;          // 8-bit variable
  logic [15:0] b;          // 16-bit variable
  logic [15:0] result;     // 16-bit variable

  assign result = a & b;   // 16-bit operation

  initial begin
  	#(5*10);    // advance to unique time slot for this test number
  	a = 3;
  	b = 5;
  	#1;
  	$display();
  	$display("%m: EXPECT: result is 0000000000000001");
  	$display("%m: ACTUAL: result is %b", result);
   	$display();
  end
endmodule: op_rules_5


//
// Snippet 6:
// context-determined operands, arithmetic op
//
module op_rules_6;
  logic [ 7:0] a;          //  8-bit variable
  logic [15:0] b;          // 16-bit variable
  logic [23:0] result;     // 24-bit variable

  assign result = a + b;   // 24-bit operation

  initial begin
  	#(6*10);    // advance to unique time slot for this test number
  	a = 3;
  	b = 5;
  	#1;
  	$display();
  	$display("%m: EXPECT: $bits(a+b) is 16");
  	$display("%m: ACTUAL: $bits(a+b) is %0d", $bits(a+b));
  	$display("%m: EXPECT: result is 000000000000000000001000");
  	$display("%m: ACTUAL: result is %b", result);
   	$display();
  end
endmodule: op_rules_6


//
// Snippet 7:
// sign context
//
module op_rules_7;
  logic        [15:0] a, b, u1, u2;  // unsigned types
  logic signed [15:0] c, d, s1, s2;  // signed types

  assign u1 = a + b;                 // unsigned operation
  assign u2 = a + c;                 // unsigned operation
  assign s1 = c + d;                 // signed operation
  assign s2 = c + d + a;             // unsigned operation

  initial begin
  	#(7*10);    // advance to unique time slot for this test number
  	a = 1;
  	b = 3;
  	c = -1;
  	d = -2;
  	#1;
  	$display();
  	$display("%m: EXPECT: $typename(a+b) is logic [15:0]");
  	$display("%m: ACTUAL: $typename(a+b) is %s", $typename(a+b));
  	$display("%m: EXPECT: u1 is 0000000000000100");
  	$display("%m: ACTUAL: u1 is %b", u1);
  	$display();

  	$display("%m: EXPECT: $typename(a+c) is logic [15:0]");
  	$display("%m: ACTUAL: $typename(a+c) is %s", $typename(a+c));
  	$display("%m: EXPECT: u2 is 0000000000000000");
  	$display("%m: ACTUAL: u2 is %b", u2);
  	$display();

  	$display("%m: EXPECT: $typename(c+d) is logic signed [15:0]");
  	$display("%m: ACTUAL: $typename(c+d) is %s", $typename(c+d));
  	$display("%m: EXPECT: s1 is 1111111111111101");
  	$display("%m: ACTUAL: s1 is %b", s1);
  	$display();

  	$display("%m: EXPECT: $typename(c+d+a) is logic [15:0]");
  	$display("%m: ACTUAL: $typename(c+d+a) is %s", $typename(c+d+a));
  	$display("%m: EXPECT: s2 is 1111111111111110");
  	$display("%m: ACTUAL: s2 is %b", s2);
   	$display();
  end
endmodule: op_rules_7



`end_keywords
