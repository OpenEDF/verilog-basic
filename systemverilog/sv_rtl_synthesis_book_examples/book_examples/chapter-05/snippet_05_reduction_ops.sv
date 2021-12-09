//
// Book, "RTL Modeling with SystemVerilog for ASIC and FPGA Design"
// by Stuart Sutherland
//
// Reduction operator snippets.
//
// Copyright 2016, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//

`begin_keywords "1800-2012"

/*
Operand   &    ~&    |     ~|    ^     ~^
4'b0000	1'b0	1'b1	1'b0	1'b1	1'b0	1'b1
4'b1111	1'b1	1'b0	1'b1	1'b0	1'b0	1'b1
4'b1000	1'b0	1'b1	1'b1	1'b0	1'b1	1'b0
4'b000z	1'b0	1'b1	1'bx	1'bx	1'bx	1'bx
4'b100x	1'b0	1'b1	1'b1	1'b0	1'bx	1'bx
*/

//
// Snippet 1:
// Reduction AND
//
module reduction_1; 
  initial begin
  	#(1*10);    // advance to unique time slot for this test number
  	$display();
  	$display("%m: Reduction AND");
  	$display("  & 4'b0000: EXPECT 0, ACTUAL %b", & 4'b0000);
  	$display("  & 4'b1111: EXPECT 1, ACTUAL %b", & 4'b1111);
  	$display("  & 4'b1000: EXPECT 0, ACTUAL %b", & 4'b1000);
  	$display("  & 4'b000z: EXPECT 0, ACTUAL %b", & 4'b000z);
  	$display("  & 4'b100x: EXPECT 0, ACTUAL %b", & 4'b100x);
   	$display();
  end
endmodule: reduction_1


//
// Snippet 2:
// Reduction NAND
//
module reduction_2; 
  initial begin
  	#(2*10);    // advance to unique time slot for this test number
  	$display();
  	$display("%m: Reduction NAND");
  	$display("  ~& 4'b0000: EXPECT 1, ACTUAL %b", ~& 4'b0000);
  	$display("  ~& 4'b1111: EXPECT 0, ACTUAL %b", ~& 4'b1111);
  	$display("  ~& 4'b1000: EXPECT 1, ACTUAL %b", ~& 4'b1000);
  	$display("  ~& 4'b000z: EXPECT 1, ACTUAL %b", ~& 4'b000z);
  	$display("  ~& 4'b100x: EXPECT 1, ACTUAL %b", ~& 4'b100x);
   	$display();
  end
endmodule: reduction_2


//
// Snippet 3:
// Reduction OR
//
module reduction_3; 
  initial begin
  	#(3*10);    // advance to unique time slot for this test number
  	$display();
  	$display("%m: Reduction OR");
  	$display("  | 4'b0000: EXPECT 0, ACTUAL %b", | 4'b0000);
  	$display("  | 4'b1111: EXPECT 1, ACTUAL %b", | 4'b1111);
  	$display("  | 4'b1000: EXPECT 1, ACTUAL %b", | 4'b1000);
  	$display("  | 4'b000z: EXPECT x, ACTUAL %b", | 4'b000z);
  	$display("  | 4'b100x: EXPECT 1, ACTUAL %b", | 4'b100x);
   	$display();
  end
endmodule: reduction_3


//
// Snippet 4:
// Reduction NOR
//
module reduction_4; 
  initial begin
  	#(4*10);    // advance to unique time slot for this test number
  	$display();
  	$display("%m: Reduction NOR");
  	$display("  ~| 4'b0000: EXPECT 1, ACTUAL %b", ~| 4'b0000);
  	$display("  ~| 4'b1111: EXPECT 0, ACTUAL %b", ~| 4'b1111);
  	$display("  ~| 4'b1000: EXPECT 0, ACTUAL %b", ~| 4'b1000);
  	$display("  ~| 4'b000z: EXPECT x, ACTUAL %b", ~| 4'b000z);
  	$display("  ~| 4'b100x: EXPECT 0, ACTUAL %b", ~| 4'b100x);
   	$display();
  end
endmodule: reduction_4


//
// Snippet 5:
// Reduction XOR
//
module reduction_5; 
  initial begin
  	#(5*10);    // advance to unique time slot for this test number
  	$display();
  	$display("%m: Reduction XOR");
  	$display("  ^ 4'b0000: EXPECT 0, ACTUAL %b", ^ 4'b0000);
  	$display("  ^ 4'b1111: EXPECT 0, ACTUAL %b", ^ 4'b1111);
  	$display("  ^ 4'b1000: EXPECT 1, ACTUAL %b", ^ 4'b1000);
  	$display("  ^ 4'b000z: EXPECT x, ACTUAL %b", ^ 4'b000z);
  	$display("  ^ 4'b100x: EXPECT x, ACTUAL %b", ^ 4'b100x);
   	$display();
  end
endmodule: reduction_5


//
// Snippet 6:
// Reduction XNOR
//
module reduction_6; 
  initial begin
  	#(6*10);    // advance to unique time slot for this test number
  	$display();
  	$display("%m: Reduction XNOR");
  	$display("  ~^ 4'b0000: EXPECT 1, ACTUAL %b", ~^ 4'b0000);
  	$display("  ~^ 4'b1111: EXPECT 1, ACTUAL %b", ~^ 4'b1111);
  	$display("  ~^ 4'b1000: EXPECT 0, ACTUAL %b", ~^ 4'b1000);
  	$display("  ~^ 4'b000z: EXPECT x, ACTUAL %b", ~^ 4'b000z);
  	$display("  ~^ 4'b100x: EXPECT x, ACTUAL %b", ~^ 4'b100x);
   	$display();
  end
endmodule: reduction_6

`end_keywords
