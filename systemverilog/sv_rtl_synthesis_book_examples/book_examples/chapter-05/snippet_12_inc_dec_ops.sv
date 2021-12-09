//
// Book, "RTL Modeling with SystemVerilog for ASIC and FPGA Design"
// by Stuart Sutherland
//
// Increment and decrement operator snippets.
//
// Copyright 2016, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//

`begin_keywords "1800-2012"

//
// Snippet 1:
// Pre-increment
//
module pre_inc;
  logic [ 7:0] n;
  logic [ 7:0] y;
  event        trigger;

  always @(trigger) begin
  	n = 8'd5;
  	y = ++n;  // y=6, n=6
  end

  initial begin
  	#(1*10);    // advance to unique time slot for this test number
  	$display();
  	$display("%m: Pre-increment");
  	-> trigger;
    #1 ;
    $write(" n=%0d  y=%0d:  EXPECTED 6", n, y);
    if (y === 8'd6) $display(" - OK");
    else            $display(" - ERROR!");
   	$display();
  end
endmodule: pre_inc


//
// Snippet 2:
// Post-increment
//
module post_inc;
  logic [ 7:0] n;
  logic [ 7:0] y;
  event        trigger;

  always @(trigger) begin
  	n = 8'd5;
  	y = n++;  // y=5, n=6
  end

  initial begin
  	#(2*10);    // advance to unique time slot for this test number
  	$display();
  	$display("%m: Post-increment");
  	-> trigger;
    #1 ;
    $write(" n=%0d  y=%0d:  EXPECTED 5", n, y);
    if (y === 8'd5) $display(" - OK");
    else            $display(" - ERROR!");
   	$display();
  end
endmodule: post_inc


//
// Snippet 3:
// Post-decrement
//
module pre_post_dec;
  logic [ 7:0] n;
  logic [ 7:0] y;
  event        trigger;

  always @(trigger) begin
  	n = 8'd5;
    y = --n;  // y=4, n=4
    y = n--;  // y=4, n=3
  end

  initial begin
  	#(3*10);    // advance to unique time slot for this test number
  	$display();
  	$display("%m: Pre- then post-decrement");
  	-> trigger;
    #1 ;
    $write(" n=%0d  y=%0d:  EXPECTED 4", n, y);
    if (y === 8'd4) $display(" - OK");
    else            $display(" - ERROR!");
   	$display();
  end
endmodule: pre_post_dec

//
// Snippet 4:
// Count number of ones
//
module count_ones;
logic [15:0] data_bus;
logic [ 3:0] count_ones;

always_comb begin 
  count_ones = '0;
  for (int i=15; i>=0; i--) 
    if (data_bus[i]) count_ones++;
end 

  initial begin
  	#(4*10);    // advance to unique time slot for this test number
  	$display();
  	$display("%m: Count number of bits set to one");
    data_bus = 16'hFACE;
    #1 ;
    $write(" data_bus=%b  count_ones=%0d:  EXPECTED 11", data_bus, count_ones);
    if (count_ones === 4'd11) $display(" - OK");
    else                      $display(" - ERROR!");
   	$display();
  end
endmodule: count_ones

//
// Snippet 5:
// Counter with race condition
//
module bad_counter;
parameter MAX = 12;
logic [7:0] count, data, q;
logic       clock, resetN;

always_ff @(posedge clock or negedge resetN)
  if (!resetN) count <= '0;
  else         count++; // increment count value

always_ff @(posedge clock)
  if (count < MAX) q = data + count; // read count value
  else             q = data + MAX;

  initial begin
  	#(5*10);    // advance to unique time slot for this test number
  	$display();
  	$display("%m: Counter with race condition");
    clock = '0;
    resetN <= '0;
    #1 resetN <= '1;
    #1 data = 8'h05; clock = '1;
    #1 ;
    $write(" count=%0d  q=%0d:  EXPECTED 5", count, q);
    if (q === 8'd5) $display(" - OK");
    else            $display(" - ERROR!");
   	$display();
  end
endmodule: bad_counter

//
// Snippet 6:
// Counter with race condition
//
module good_counter;
parameter MAX = 12;
logic [7:0] count, data, q;
logic       clock, resetN;

always_ff @(posedge clock or negedge resetN)
  if (!resetN) count <= '0;
  else         count <= count + 1'b1; // increment count
  
always_ff @(posedge clock)
  if (count < MAX) q = data + count;  // read count
  else             q = data + MAX;

  initial begin
  	#(6*10);    // advance to unique time slot for this test number
  	$display();
  	$display("%m: Counter without race condition");
    clock = '0;
    resetN <= '0;
    #1 resetN <= '1;
    #1 data = 8'h05; clock = '1;
    #1 ;
    $write(" count=%0d  q=%0d:  EXPECTED 5", count, q);
    if (q === 8'd5) $display(" - OK");
    else            $display(" - ERROR!");
   	$display();
  end
endmodule: good_counter

//
// Snippet 7:
// Highest bit set detector
//
module high_bit;
logic [15:0] data_bus;
logic [ 3:0] highest_bit;
logic        clock;

always_ff @(posedge clock) begin
  highest_bit <= '0;
  for (int i=0; i<=15; i++) 
    if (data_bus[i]) highest_bit <= i;
end

  initial begin
  	#(7*10);    // advance to unique time slot for this test number
  	$display();
  	$display("%m: Find higest bit set");
    clock = '0;
    data_bus = 16'h0123;
    #1 clock = '1;
    #1 ;
    $write(" data_bus=%b  highest_bit=%0d:  EXPECTED 8", data_bus, highest_bit);
    if (highest_bit === 4'd8) $display(" - OK");
    else                      $display(" - ERROR!");
   	$display();
  end
endmodule: high_bit

//
// Snippet 8:
// Post-increment with other operators
//
module two_ops;
  logic [ 7:0] n;
  logic [ 7:0] y;
  event        trigger;

  always @(trigger) begin
  	n = 8'd5;
  	y = n + ++n; // y could be assigned 11 or 12
  end

  initial begin
  	#(8*10);    // advance to unique time slot for this test number
  	$display();
  	$display("%m: Add plus Post-increment");
  	-> trigger;
    #1 ;
    $write(" n=%0d  y=%0d:  EXPECTED 11 or 12", n, y);
    if (y inside {8'd11,8'd12}) $display(" - OK");
    else                        $display(" - ERROR!");
   	$display();
  end
endmodule: two_ops

`end_keywords
