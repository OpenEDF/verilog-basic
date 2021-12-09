//
// Book, "RTL Modeling with SystemVerilog for ASIC and FPGA Design"
// by Stuart Sutherland
//
// Bitwise and arithmetic shift operator snippets.
//
// Copyright 2016, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//

`begin_keywords "1800-2012"

//
// Snippet 1:
// Bitwize and arithmetic left shifts of an unsigned value
//
module shift_1;
  initial begin
  	#(1*10);    // advance to unique time slot for this test number
  	$display();
  	$display("%m: Left shift, unsigned value");
  	$write("  8'b11000101 << 2:  EXPECT 8'b00010100, ACTUAL %b", (8'b11000101 << 2));
    if ((8'b11000101 << 2) === 8'b00010100) $display(" - OK");
    else                                    $display(" - ERROR!");
  	$write("  8'b11000101 <<< 2: EXPECT 8'b00010100, ACTUAL %b", (8'b11000101 <<< 2));
    if ((8'b11000101 <<< 2) === 8'b00010100) $display(" - OK");
    else                                     $display(" - ERROR!");
   	$display();
  end
endmodule: shift_1


//
// Snippet 2:
// Bitwize and arithmetic right shifts of an unsigned value
//
module shift_2;
  initial begin
  	#(2*10);    // advance to unique time slot for this test number
  	$display();
  	$display("%m: Right shift, unsigned value");
  	$write("  8'b11000101 >> 2:  EXPECT 8'b00110001, ACTUAL %b", (8'b11000101 >> 2));
    if ((8'b11000101 >> 2) === 8'b00110001) $display(" - OK");
    else                                    $display(" - ERROR!");
  	$write("  8'b11000101 >>> 2: EXPECT 8'b00110001, ACTUAL %b", (8'b11000101 >>> 2));
    if ((8'b11000101 >>> 2) === 8'b00110001) $display(" - OK");
    else                                     $display(" - ERROR!");
   	$display();
  end
endmodule: shift_2


//
// Snippet 3:
// Bitwize and arithmetic right shifts of a signed value
//
module shift_3;
  initial begin
  	#(3*10);    // advance to unique time slot for this test number
  	$display();
  	$display("%m: Right shift, signed value");
  	$write("  8'sb11000101 >> 2:  EXPECT 8'sb00110001, ACTUAL %b", (8'sb11000101 >> 2));
    if ((8'sb11000101 >> 2) === 8'sb00110001) $display(" - OK");
    else                                      $display(" - ERROR!");
  	$write("  8'sb11000101 >>> 2: EXPECT 8'sb11110001, ACTUAL %b", (8'sb11000101 >>> 2));
    if ((8'sb11000101 >>> 2) === 8'sb11110001) $display(" - OK");
    else                                       $display(" - ERROR!");
   	$display();
  end
endmodule: shift_3


//
// Snippet 4:
// Shift operation using concatenate op
//
module shift_4;
  logic [7:0] in, out1, out2;

  assign out1 = in >> 1;         // shift using shift op
  assign out2 = {1'b0,in[7:1]};  // shift using concatenate op

  initial begin
  	#(4*10);    // advance to unique time slot for this test number
  	$display();
  	$display("%m: Shift using concatenate op");
    in = 8'b11000101;
    #1 ;
    $write(" in=%b  out1=%b:  EXPECTED 01100010", in, out1);
    if (out1 === 8'b01100010) $display(" - OK");
    else                      $display(" - ERROR!");
    $write(" in=%b  out2=%b:  EXPECTED 01110001", in, out2);
    if (out2 === 8'b01100010) $display(" - OK");
    else                      $display(" - ERROR!");
   	$display();
  end
endmodule: shift_4


//
// Snippet 5:
// Shift operation using concatenate op with parameterized vector size
//
module shift_5;
  parameter N = 8;
  logic [N-1:0] in, out1, out2;

  assign out1 = in >> 1;            // shift using shift op
  assign out2 = {1'b0,in[(N-1):1]}; // shift using concat op

  initial begin
  	#(5*10);    // advance to unique time slot for this test number
  	$display();
  	$display("%m: Shift using concatenate op with parameterized vector size");
    in = 8'b11000101;
    #1 ;
    $write(" in=%b  out1=%b:  EXPECTED 01100010", in, out1);
    if (out1 === 8'b01100010) $display(" - OK");
    else                      $display(" - ERROR!");
    $write(" in=%b  out2=%b:  EXPECTED 01110001", in, out2);
    if (out2 === 8'b01100010) $display(" - OK");
    else                      $display(" - ERROR!");
   	$display();
  end
endmodule: shift_5


//
// Snippet 6:
// Variable rotate right, using assignment truncation
//
module rotate_6;
  logic [ 7:0] in, out;
  logic [ 2:0] rfactor;

  assign out = {in,in} >> rfactor;  // assignment truncates
                                    // the upper bits
  initial begin
  	#(6*10);    // advance to unique time slot for this test number
  	$display();
  	$display("%m: Rotate right N times");
    in = 8'b11000101;
    rfactor = 2;
    #1 ;
    $write(" in=%b  rfactor=%0d  out=%b: EXPECTED 01110001", in, rfactor, out);
    if (out === 8'b01110001) $display(" - OK");
    else                     $display(" - ERROR!");
   	$display();
  end
endmodule: rotate_6


//
// Snippet 7:
// Variable rotate right, using size casting
//
module rotate_7;
  logic [ 7:0] in, out;
  logic [ 2:0] rfactor;

  assign out = 8'({in,in} >> rfactor); // cast result to 8 bits

  initial begin
  	#(7*10);    // advance to unique time slot for this test number
  	$display();
  	$display("%m: Rotate right N times");
    in = 8'b11000101;
    rfactor = 2;
    #1 ;
    $write(" in=%b  rfactor=%0d  out=%b: EXPECTED 01110001", in, rfactor, out);
    if (out === 8'b01110001) $display(" - OK");
    else                     $display(" - ERROR!");
   	$display();
  end
endmodule: rotate_7


//
// Snippet 8:
// Variable rotate right using loops (not synthesizable)
//
module rotate_8;
  logic [7:0] in, out;
  logic [2:0] rfactor;
  logic [7:0] temp;
  logic       old_lsb;

  always_comb begin
    temp = in;                // copy input to work variable
    repeat(rfactor) begin
      old_lsb = temp[0];      // save lsb value
      temp    = temp >> 1;    // shift right
      temp[7] = old_lsb;      // copy old lsb into msb
    end
    out = temp;               // move work variable to out
  end

  initial begin
  	#(8*10);    // advance to unique time slot for this test number
  	$display();
  	$display("%m: Rotate right N times");
    in = 8'b11000101;
    rfactor = 2;
    #1 ;
    $write(" in=%b  rfactor=%0d  out=%b: EXPECTED 01110001", in, rfactor, out);
    if (out === 8'b01110001) $display(" - OK");
    else                     $display(" - ERROR!");
   	$display();
  end
endmodule: rotate_8

`end_keywords
