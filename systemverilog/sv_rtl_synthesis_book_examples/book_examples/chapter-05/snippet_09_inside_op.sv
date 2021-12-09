//
// Book, "RTL Modeling with SystemVerilog for ASIC and FPGA Design"
// by Stuart Sutherland
//
// inside operator snippets.
//
// Copyright 2016, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//

`begin_keywords "1800-2012"

//
// Snippet 1:
// Expression is inside a set of values
//
module inside_1;
  logic        clk, rstN;
  logic [15:0] address;
  logic        boundary;

  always_ff @(posedge clk, negedge rstN)
    if (address inside {0, 32, 64, 128, 256, 512, 1024})
      boundary <= 1'b1;
    else
      boundary <= 1'b0;

  initial begin
  	#(0*10);    // advance to unique time slot for this test number
  	$display();
  	$display("%m: address is inside a set of literal values");
  	rstN = 1;
  	clk = 0;
  	address = 5;
  	#1;
  	clk = 1;
  	#1;
  	clk = 0;
  	$write("  address = 5:    EXPECT boundary=0, ACTUAL %b", boundary);
    if (boundary === 1'b0) $display(" - OK");
    else                    $display(" - ERROR!");
  	address = 1024;
  	#1;
  	clk = 1;
  	#1;
  	clk = 0;
  	#1;
  	$write("  address = 1024: EXPECT boundary=1, ACTUAL %b", boundary);
    if (boundary === 1'b1) $display(" - OK");
    else                    $display(" - ERROR!");
   	$display();
  end
endmodule: inside_1


//
// Snippet 2:
// Expression is inside a range of values
//
module inside_2;
  logic [15:0] data;
  logic        small_value;

  always_comb begin
    small_value = data inside {[0:255]};
end   // true if data matches a value between 0 and 255

  initial begin
  	#(2*10);    // advance to unique time slot for this test number
  	$display();
  	$display("%m: data is inside a range of literal values");
  	#1;
  	data = 5;
  	#1;
  	$write("  data = 5:    EXPECT small_value=1, ACTUAL %b", small_value);
    if (small_value === 1'b1) $display(" - OK");
    else                       $display(" - ERROR!");
  	#1;
  	data = 1024;
  	#1;
  	$write("  data = 1024: EXPECT small_value=0, ACTUAL %b", small_value);
    if (small_value === 1'b0) $display(" - OK");
    else                       $display(" - ERROR!");
   	$display();
  end
endmodule: inside_2

//
// Snippet 3:
// Expression is inside a wildcard value
//
module inside_3;
  logic [7:0] data;
  logic       pattern_flag;

    always_comb begin
      pattern_flag = data inside {8'b??1010??};
    end   // true if the middle bits of data match 1010

  initial begin
  	#(3*10);    // advance to unique time slot for this test number
  	$display();
  	$display("%m: data is inside a range of literal values");
  	#1;
  	data = 8'b00101011;
  	#1;
  	$write("  data = 8'b00101011: EXPECT pattern_flag=1, ACTUAL %b", pattern_flag);
    if (pattern_flag === 1'b1) $display(" - OK");
    else                       $display(" - ERROR!");
  	#1;
  	data = 8'b00111010;
  	#1;
  	$write("  data = 8'b00111010: EXPECT pattern_flag=0, ACTUAL %b", pattern_flag);
    if (pattern_flag === 1'b0) $display(" - OK");
    else                       $display(" - ERROR!");
   	$display();
  end
endmodule: inside_3


//
// Snippet 4:
// Expression is inside a set of other variables
//
module inside_4;
  logic [7:0] data, a, b, c;
  logic       data_matches;

  always_comb begin
    data_matches = data inside {a, b, c};
  end   // true if data matches the current value of a, b or c

  initial begin
  	#(4*10);    // advance to unique time slot for this test number
  	$display();
  	$display("%m: data is inside a range of literal values");
  	#1;
  	a = 0; b = 5; c = 7;
  	data = 5;
  	#1;
  	$write("  data = 5:  EXPECT data_matches=1, ACTUAL %b", data_matches);
    if (data_matches === 1'b1) $display(" - OK");
    else                       $display(" - ERROR!");
  	#1;
  	data = 10;
  	#1;
  	$write("  data = 10: EXPECT data_matches=0, ACTUAL %b", data_matches);
    if (data_matches === 1'b0) $display(" - OK");
    else                       $display(" - ERROR!");
   	$display();
  end
endmodule: inside_4


//
// Snippet 5:
// Expression is inside values in an array
//
module inside_5;
  logic [7:0] data;
  logic       prime_val;

localparam int PRIMES [8] = '{2,3,5,7,11,13,17,19};

  always_comb begin
    prime_val = data inside {PRIMES};
  end   // true if data matches a value inside the PRIMES array

  initial begin
  	#(5*10);    // advance to unique time slot for this test number
  	$display();
  	$display("%m: data is inside a range of literal values");
  	#1;
  	data = 5;
  	#1;
  	$write("  data = 5:  EXPECT prime_val=1, ACTUAL %b", prime_val);
    if (prime_val === 1'b1) $display(" - OK");
    else                    $display(" - ERROR!");
  	#1;
  	data = 10;
  	#1;
  	$write("  data = 10: EXPECT prime_val=0, ACTUAL %b", prime_val);
    if (prime_val === 1'b0) $display(" - OK");
    else                    $display(" - ERROR!");
   	$display();
  end
endmodule: inside_5


//
// Snippet 6:
// Expression is inside values in an array
//
module inside_6;
  logic [7:0] data;
  logic       prime_val;

localparam int PRIMES [8] = '{2,3,5,7,11,13,17,19};

assign prime_val = data inside {PRIMES};
// true if data matches a value inside the PRIMES array

  initial begin
  	#(6*10);    // advance to unique time slot for this test number
  	$display();
  	$display("%m: data is inside a range of literal values");
  	#1;
  	data = 5;
  	#1;
  	$write("  data = 5:  EXPECT prime_val=1, ACTUAL %b", prime_val);
    if (prime_val === 1'b1) $display(" - OK");
    else                    $display(" - ERROR!");
  	#1;
  	data = 10;
  	#1;
  	$write("  data = 10: EXPECT prime_val=0, ACTUAL %b", prime_val);
    if (prime_val === 1'b0) $display(" - OK");
    else                    $display(" - ERROR!");
   	$display();
  end
endmodule: inside_6


`end_keywords
