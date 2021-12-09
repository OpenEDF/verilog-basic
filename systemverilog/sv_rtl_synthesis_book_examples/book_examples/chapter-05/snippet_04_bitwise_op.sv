//
// Book, "RTL Modeling with SystemVerilog for ASIC and FPGA Design"
// by Stuart Sutherland
//
// Bitwise operator snippets.
//
// Copyright 2016, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//

`begin_keywords "1800-2012"

//
// Snippet 1:
// Bitwise negate
//
module bitwise_1; 
  logic [3:0] a, r1;

  assign a = 4'b01zx;        // some bits are X or Z

  assign r1 = ~a;            // results in 4'b10xx
  
  initial begin
  	#(1*10);    // advance to unique time slot for this test number
  	$display();
  	$display("%m: EXPECT: r1 is 10xx");
  	$display("%m: ACTUAL: r1 is %b", r1);
   	$display();
  end
endmodule: bitwise_1

//
// Snippet 2:
// Bitwise AND
//
module bitwise_2; 
  logic [3:0] a, b, c, r1, r2;

  assign a = 4'b01zx;        // some bits are X or Z
  assign b = 4'b0000;        // all bits are zero
  assign c = 4'b1111;        // all bits are one

  assign r1 = a & b;         // results in 4'b0000
  assign r2 = a & c;         // results in 4'b01xx
  
  initial begin
  	#(2*10);    // advance to unique time slot for this test number
  	$display();
  	$display("%m: EXPECT: r1 is 0000");
  	$display("%m: ACTUAL: r1 is %b", r1);
  	$display("%m: EXPECT: r2 is 01xx");
  	$display("%m: ACTUAL: r2 is %b", r2);
   	$display();
  end
endmodule: bitwise_2


//
// Snippet 3:
// Bitwise OR
//
module bitwise_3; 
  logic [3:0] a, b, c, r1, r2;

  assign a = 4'b01zx;        // some bits are X or Z
  assign b = 4'b0000;        // all bits are zero
  assign c = 4'b1111;        // all bits are one

  assign r1 = a | b;         // results in 4'b01xx
  assign r2 = a | c;         // results in 4'b1111
  
  initial begin
  	#(3*10);    // advance to unique time slot for this test number
  	$display();
  	$display("%m: EXPECT: r1 is 01xx");
  	$display("%m: ACTUAL: r1 is %b", r1);
  	$display("%m: EXPECT: r2 is 1111");
  	$display("%m: ACTUAL: r2 is %b", r2);
   	$display();
  end
endmodule: bitwise_3


//
// Snippet 4:
// Bitwise XOR
//
module bitwise_4; 
  logic [3:0] a, b, c, r1, r2;

  assign a = 4'b01zx;        // some bits are X or Z
  assign b = 4'b0000;        // all bits are zero
  assign c = 4'b1111;        // all bits are one

  assign r1 = a ^ b;         // results in 4'b01xx
  assign r2 = a ^ c;         // results in 4'b10xx
  
  initial begin
  	#(4*10);    // advance to unique time slot for this test number
  	$display();
  	$display("%m: EXPECT: r1 is 01xx");
  	$display("%m: ACTUAL: r1 is %b", r1);
  	$display("%m: EXPECT: r2 is 10xx");
  	$display("%m: ACTUAL: r2 is %b", r2);
   	$display();
  end
endmodule: bitwise_4


//
// Snippet 5:
// Bitwise XNOR
//
module bitwise_5; 
  logic [3:0] a, b, c, r1, r2;

  assign a = 4'b01zx;        // some bits are X or Z
  assign b = 4'b0000;        // all bits are zero
  assign c = 4'b1111;        // all bits are one

  assign r1 = a ~^ b;        // results in 4'b10xx
  assign r2 = a ^~ c;        // results in 4'b01xx
  
  initial begin
  	#(5*10);    // advance to unique time slot for this test number
  	$display();
  	$display("%m: EXPECT: r1 is 10xx");
  	$display("%m: ACTUAL: r1 is %b", r1);
  	$display("%m: EXPECT: r2 is 01xx");
  	$display("%m: ACTUAL: r2 is %b", r2);
   	$display();
  end
endmodule: bitwise_5


`end_keywords
