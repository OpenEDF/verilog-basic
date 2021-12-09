//
// Book, "RTL Modeling with SystemVerilog for ASIC and FPGA Design"
// by Stuart Sutherland
//
// Streaming operator snippets.
//
// Copyright 2016, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//

`begin_keywords "1800-2012"

//
// Snippet 1:
// Bit reversal of a vector
//
module stream_1;
logic [ 7:0] a;
logic [ 7:0] b;

assign a = 8'b11000101;

always_comb begin
  b = { << { a }}; // sets b to 8'b10101100 (bit reverse of a)
end

  initial begin
  	#(1*10);    // advance to unique time slot for this test number
  	$display();
  	$display("%m: Pack bits of a vector in reverse order");
    #1 ;
    $write(" a=%b  b=%b:  EXPECTED 10100011", a, b);
    if (b === 8'b10100011) $display(" - OK");
    else                   $display(" - ERROR!");
   	$display();
  end
endmodule: stream_1


//
// Snippet 2:
// Byte reversal of a vector
//
module stream_2;
logic [31:0] in, out;

assign out = {<<8{in}}; // repack bytes in opposite order

//always_comb begin
//  out = {<<8{in}}; // repack bytes in opposite order
//end

  initial begin
  	#(2*10);    // advance to unique time slot for this test number
  	$display();
  	$display("%m: Pack bytes of a vector in reverse order");
    #1 ;
  	in = 32'hAABBCCDD;
    #1 ;
    $write(" in=%h  out=%h:  EXPECTED ddccbbaa", in, out);
    if (out === 32'hddccbbaa) $display(" - OK");
    else                      $display(" - ERROR!");
   	$display();
  end
endmodule: stream_2


//
// Snippet 3:
// Byte reversal of a vector
//
module stream_3;
logic [31:0] in;       // 32-bit vector
logic [ 7:0] a [0:3];  // array of 4 8-bit variables

assign in = 32'hAABBCCDD;

always_comb begin
  {>>8{a}} = in; // sets a[0]=AA, a[1]=BB, a[2]=CC, a[3]=DD
end

  initial begin
  	#(3*10);    // advance to unique time slot for this test number
  	$display();
  	$display("%m: Unpack a vector a load into an array");
    #1 ;
    $write(" in=%h  a[0]=%h  a[3]=%h:  EXPECTED aa  dd", in, a[0], a[3]);
    if ((a[0]===8'haa) && (a[3]===8'hdd)) $display(" - OK");
    else                                  $display(" - ERROR!");
   	$display();
  end
endmodule: stream_3

`end_keywords
