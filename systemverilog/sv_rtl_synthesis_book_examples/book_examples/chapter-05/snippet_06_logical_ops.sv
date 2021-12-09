//
// Book, "RTL Modeling with SystemVerilog for ASIC and FPGA Design"
// by Stuart Sutherland
//
// Logical operator snippets.
//
// Copyright 2016, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//

`begin_keywords "1800-2012"

//
// Snippet 1:
// Logical AND
//
module logical_1; 
  logic [3:0] op1a, op1b, op2a, op2b, op2c, op2d;
  logic       r1, r2, r3, r4, r5, r6, r7, r8;

  assign op1a = 4'b0000;       // all bits are zero
  assign op1b = 4'b1000;       // all bits are zero

  assign op2a = 4'b0000;       // all bits are zero
  assign op2b = 4'b1000;       // some bits are one
  assign op2c = 4'b00zx;       // mix of 0, z, x
  assign op2d = 4'b01zx;       // mix of 0, 1, z, x

  assign r1 = op1a && op2a;    // results in 1'b0
  assign r2 = op1a && op2b;    // results in 1'b0
  assign r3 = op1a && op2c;    // results in 1'b0
  assign r4 = op1a && op2d;    // results in 1'b0

  assign r5 = op1b && op2a;    // results in 1'b0
  assign r6 = op1b && op2b;    // results in 1'b1
  assign r7 = op1b && op2c;    // results in 1'bx
  assign r8 = op1b && op2d;    // results in 1'b1

  initial begin
  	#(1*10);    // advance to unique time slot for this test number
  	$display();
  	$display("%m: Logical AND");
  	$display("  4'b%b && 4'b%b: EXPECT 0, ACTUAL %b", op1a, op2a, r1);
  	$display("  4'b%b && 4'b%b: EXPECT 0, ACTUAL %b", op1a, op2b, r2);
  	$display("  4'b%b && 4'b%b: EXPECT 0, ACTUAL %b", op1a, op2c, r3);
  	$display("  4'b%b && 4'b%b: EXPECT 0, ACTUAL %b", op1a, op2d, r4);
   	$display();
  	$display("  4'b%b && 4'b%b: EXPECT 0, ACTUAL %b", op1b, op2a, r5);
  	$display("  4'b%b && 4'b%b: EXPECT 1, ACTUAL %b", op1b, op2b, r6);
  	$display("  4'b%b && 4'b%b: EXPECT x, ACTUAL %b", op1b, op2c, r7);
  	$display("  4'b%b && 4'b%b: EXPECT 1, ACTUAL %b", op1b, op2d, r8);
   	$display();
  end
endmodule: logical_1


//
// Snippet 2:
// Logical OR
//
module logical_2; 
  logic [3:0] op1a, op1b, op2a, op2b, op2c, op2d;
  logic       r1, r2, r3, r4, r5, r6, r7, r8;

  assign op1a = 4'b0000;       // all bits are zero
  assign op1b = 4'b1000;       // all bits are zero

  assign op2a = 4'b0000;       // all bits are zero
  assign op2b = 4'b1000;       // some bits are one
  assign op2c = 4'b00zx;       // mix of 0, z, x
  assign op2d = 4'b01zx;       // mix of 0, 1, z, x

  assign r1 = op1a || op2a;    // results in 1'b0
  assign r2 = op1a || op2b;    // results in 1'b1
  assign r3 = op1a || op2c;    // results in 1'bx
  assign r4 = op1a || op2d;    // results in 1'b1

  assign r5 = op1b || op2a;    // results in 1'b1
  assign r6 = op1b || op2b;    // results in 1'b1
  assign r7 = op1b || op2c;    // results in 1'b1
  assign r8 = op1b || op2d;    // results in 1'b1
  
  initial begin
  	#(2*10);    // advance to unique time slot for this test number
  	$display();
  	$display("%m: Logical AND");
  	$display("  4'b%b || 4'b%b: EXPECT 0, ACTUAL %b", op1a, op2a, r1);
  	$display("  4'b%b || 4'b%b: EXPECT 1, ACTUAL %b", op1a, op2b, r2);
  	$display("  4'b%b || 4'b%b: EXPECT x, ACTUAL %b", op1a, op2c, r3);
  	$display("  4'b%b || 4'b%b: EXPECT 1, ACTUAL %b", op1a, op2d, r4);
   	$display();
  	$display("  4'b%b || 4'b%b: EXPECT 1, ACTUAL %b", op1b, op2a, r5);
  	$display("  4'b%b || 4'b%b: EXPECT 1, ACTUAL %b", op1b, op2b, r6);
  	$display("  4'b%b || 4'b%b: EXPECT 1, ACTUAL %b", op1b, op2c, r7);
  	$display("  4'b%b || 4'b%b: EXPECT 1, ACTUAL %b", op1b, op2d, r8);
   	$display();
  end
endmodule: logical_2


//
// Snippet 3:
// Logical negate
//
module logical_3; 
  logic [3:0] op1, opa, opb, opc, opd;
  logic       r1, r2, r3, r4;

  assign opa = 4'b0000;      // all bits are zero
  assign opb = 4'b1000;      // some bits are one
  assign opc = 4'b00zx;      // mix of 0, z, x
  assign opd = 4'b01zx;      // mix of 0, 1, z, x

  assign r1 = ! opa;         // results in 1'b1
  assign r2 = ! opb;         // results in 1'b0
  assign r3 = ! opc;         // results in 1'bx
  assign r4 = ! opd;         // results in 1'b0
  
  initial begin
  	#(3*10);    // advance to unique time slot for this test number
   	$display();
  	$display("%m: Logical OR");
  	$display("  ! 4'b%b: EXPECT 1, ACTUAL %b", opa, r1);
  	$display("  ! 4'b%b: EXPECT 0, ACTUAL %b", opb, r2);
  	$display("  ! 4'b%b: EXPECT x, ACTUAL %b", opc, r3);
  	$display("  ! 4'b%b: EXPECT 0, ACTUAL %b", opd, r4);
   	$display();
  end
endmodule: logical_3


`end_keywords
