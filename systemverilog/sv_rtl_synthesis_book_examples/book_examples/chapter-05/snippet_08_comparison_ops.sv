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
// Pessimistic comparisons
//
module comparison_1; 

  logic [3:0] c, d;
  logic       gt;

  assign c = 4'b1001;    // the numeric value 9
  assign d = 4'b000z;    // ambiguous, could be numeric 0 or 1

  assign gt = (c > d);   // operation returns 1'bx (unknown)

  initial begin
  	#(1*10);    // advance to unique time slot for this test number
  	$display();
  	$display("%m: Greater-than op with pessimism");
  	$display("  4'b%b > 4'b%b: EXPECT x, ACTUAL %b", c, d, gt);
   	$display();
  end
endmodule: comparison_1


//
// Snippet 2:
// Signed and unsigned comparisons
//
module comparison_2; 
  logic        [7:0] u1, u2;
  logic signed [7:0] s1, s2;
  logic              r1, r2, r3;
  logic              gt;

  assign u1 = 3;       // unsigned 3
  assign u2 = 5;       // unsigned 5

  assign s1 = -3;      // negative 3
  assign s2 = -5;      // negative 5

  assign r1 = u1 > u2;    // expect 1'b0 (false)
  assign r2 = s1 > s2;    // expect 1'b1 (true)
  assign r3 = s1 > u2;    // expect 1'b1 (true) -- GOTCHA
  
  initial begin
  	#(2*10);    // advance to unique time slot for this test number
  	$display();
  	$display("%m: unsigned, signed and mixed signing compares");
  	$display("   %0d >  %0d:  EXPECT 0, ACTUAL %b", u1, u2, r1);
  	$display("  %0d > %0d:  EXPECT 0, ACTUAL %b", s1, s2, r2);
  	$display("  %0d >  %0d:  EXPECT 1, ACTUAL %b (a GOTCHA)", s1, u2, r3);
   	$display();
  end
endmodule: comparison_2


//
// Snippet 3:
// Mixed signed/unsigned comparisons with absolute function
//
module comparison_3; 
  parameter WIDTH = 8;
  logic        [7:0] u1;
  logic signed [7:0] s1;
  logic              gt1, gt2;

  assign u1 = 5;       // unsigned 5
  assign s1 = -3;      // negative 3

  assign gt1 = abs_f(s1) > abs_f(u1);   // expect 1'b0 (false)
  assign gt2 = abs_f(u1) > abs_f(s1);   // expect 1'b1 (true)
  
  initial begin
  	#(3*10);      // advance to unique time slot for this test number
  	$display();
  	$display("%m: Compare absolutes");
  	$display("  abs_f(%0d) > abs_f(%0d):  EXPECT 0, ACTUAL %b", s1, u1, gt1);
  	$display("  abs_f(%0d)  > abs_f(%0d): EXPECT 1, ACTUAL %b", u1, s1, gt2);
   	$display();
  end
  
  function [WIDTH-1:0] abs_f (logic signed [WIDTH-1:0] a);
    return (a >= 0)? a : -a;  // 2's complement negative values
  endfunction: abs_f

endmodule: comparison_3


`end_keywords
