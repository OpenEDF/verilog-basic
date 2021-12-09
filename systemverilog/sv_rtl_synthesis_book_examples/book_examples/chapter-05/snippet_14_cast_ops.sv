//
// Book, "RTL Modeling with SystemVerilog for ASIC and FPGA Design"
// by Stuart Sutherland
//
// Cast operator snippets.
//
// Copyright 2016, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//

`begin_keywords "1800-2012"

//
// Snippet 1:
// Chapter Intro: Assignments with type or size mismatches
//
module mismatch_1;
logic [15:0] u16;  // 16-bit unsigned 4-state variable
logic [31:0] u32;  // 32-bit unsigned 4-state variable

//initial begin
always @* begin
  u32 = u16;  // u16 is left-extended to be 32 bits wide
end

  initial begin
    #(1*10);    // advance to unique time slot for this test number
    $display();
    $display("%m: 16-bit assigned to 32-bit mismatch test");

    #1 u16 = 16'hFACE;
    #1 ;
    $write(" u16=%h  u32=%h:  EXPECTED 0000face", u16, u32);
    if (u32 === 32'h0000FACE) $display(" - OK");
    else                      $display(" - ERROR!");
    $display();
  end
endmodule: mismatch_1

module mismatch_2;
logic [15:0] u16;  // 16-bit unsigned 4-state variable
logic [31:0] u32;  // 32-bit unsigned 4-state variable

always @* begin
  u16 = u32;  // u32 is left-truncated to be 16 bits wide
end

  initial begin
    #(2*10);    // advance to unique time slot for this test number
    $display();
    $display("%m: 32-bit assigned to 16-bit mismatch test");

    #1 u32 = 32'hDEADBEEF;
    #1 ;
    $write(" u32=%h  u16=%h:  EXPECTED beef", u32, u16);
    if (u16 === 16'hBEEF) $display(" - OK");
    else                  $display(" - ERROR!");
    $display();
  end
endmodule: mismatch_2

module mismatch_3;
logic [31:0] u32;  // 32-bit unsigned 4-state variable
int          s32;  // 32-bit signed 2-state variable

always @* begin
  s32 = u32;  // u32 is converted to a signed 2-state value
end

  initial begin
    #(3*10);    // advance to unique time slot for this test number
    $display();
    $display("%m: unsigned assigned to signed mismatch test");

    #1 u32 = -5;
    #1 ;
    $write(" u32=%0d  s32=%0d:  EXPECTED -5", u32, s32);
    if (u32 === -5) $display(" - OK");
    else            $display(" - ERROR!");
    $display();
  end
endmodule: mismatch_3

module mismatch_4;
logic [31:0] u32;  // 32-bit unsigned 4-state variable
int          s32;  // 32-bit signed 2-state variable

always @* begin
  u32 = s32;  // s32 is converted to an unsigned 4-state val
end

  initial begin
    #(4*10);    // advance to unique time slot for this test number
    $display();
    $display("%m: signed assigned to unsigned mismatch test");

    #1 s32 = -1;
    #1 ;
    $write(" s32=%0d  u32=%0d (%h):  EXPECTED 4294967295 (hex FFFFFFFF)", s32, u32, u32);
    if (u32 === 32'hFFFFFFFF) $display(" - OK");
    else                      $display(" - ERROR!");
    $display();
  end
endmodule: mismatch_4

module mismatch_5;
int          s32;  // 32-bit signed 2-state variable
real         r64;  // double-precision floating-point var.

always @* begin
  r64 = s32;  // s32 is converted to a floating-point value
end

  initial begin
    #(5*10);    // advance to unique time slot for this test number
    $display();
    $display("%m: integer assigned to real mismatch test");

    #1 s32 = -3;
    #1 ;
    $write(" s32=%0d  r64=%0f:  EXPECTED -3.0", s32, r64);
    if (r64 == -3.0) $display(" - OK");
    else             $display(" - ERROR!");
    $display();
  end
endmodule: mismatch_5

module mismatch_6;
int          s32;  // 32-bit signed 2-state variable
real         r64;  // double-precision floating-point var.

//initial begin
always @* begin
  s32 = r64;  // r64 is rounded to a 32-bit integer value
end

  initial begin
    #(6*10);    // advance to unique time slot for this test number
    $display();
    $display("%m: real assigned to integer mismatch test");

    #1 r64 = -4.56789;
    #1 ;
    $write(" r64=%0f  s32=%0d:  EXPECTED -5", r64, s32);
    if (s32 == -5) $display(" - OK");
    else           $display(" - ERROR!");
    $display();
  end
endmodule: mismatch_6

//
// Snippet 2:
// Operations with type or size mismatches
//
module mismatch_7;
logic [15:0] u16;  // 16-bit unsigned 4-state variable
logic [31:0] u32;  // 32-bit unsigned 4-state variable

assign u32 = u32 + u16;  // 32-bit add operation

  initial begin
    #(7*10);    // advance to unique time slot for this test number
    $display();
    $display("%m: Add op with 16-bit and 32-bit operands test");

    #1 ;
    $write(" $bits(u32 + u16)=%0d:  EXPECTED 32", $bits(u32 + u16));
    if ($bits(u32 + u16) == 32) $display(" - OK");
    else                        $display(" - ERROR!");
    $display();
  end
endmodule: mismatch_7

module mismatch_8;
logic [31:0] u32;  // 32-bit unsigned 4-state variable
int          s32;  // 32-bit signed 2-state variable

assign s32 = s32 < u32;  // 32-bit unsigned comparison

  initial begin
    #(8*10);    // advance to unique time slot for this test number
    $display();
    $display("%m: Add op with signed and unsigned operands test");

    #1 ;
    $display(" $typename(s32 < u32) = %s:  EXPECTED reg or logic (an unsigned type)", $typename(s32 < u32));
    $display();
  end
endmodule: mismatch_8

//
// Snippet 3:
// Operations with type casting
//

module mismatch_9;
typedef enum logic {ARITHMETIC, BRANCH} instruction_t;
typedef enum logic [2:0] {NOP, ADD, SUB, MULT,
                          DIV, AND, OR,  XOR} opcode_t;

instruction_t  instruction;
opcode_t       opcode;
logic [15:0]   data;

always_comb begin
  case (instruction)
//    ARITHMETIC : opcode = data[2:0];  // illegal assignment
    ARITHMETIC : opcode = opcode_t'(data[2:0]);
    BRANCH     : opcode = NOP;
  endcase
end

  initial begin
    #(9*10);    // advance to unique time slot for this test number
    $display();
    $display("%m: enumerated type assignment with type casting");

    instruction = ARITHMETIC; data = 16'h0123;
    #1 ;
    $write(" instruction=%s, opcode=%s:  EXPECTED MULT", instruction.name, opcode.name);
    if (opcode === MULT) $display(" - OK");
    else                 $display(" - ERROR!");
    $display();

  end
endmodule: mismatch_9



module mismatch_10;
parameter PI = 3.14159;
logic [31:0] a, b, result;

assign result = a + (b * PI);

  initial begin
    #(10*10);    // advance to unique time slot for this test number
    $display();
    $display("%m: compound op with mix or integer and real types test");

    #1 ;
    $display(" $typename(a + (b * PI)) = %s:  EXPECTED real", $typename(a + (b * PI)));
    $display();
  end
endmodule: mismatch_10

module mismatch_11;
parameter PI = 3.14159;
logic [31:0] a, b, result;

assign result = a + integer'(b * PI);
//assign result = a + logic[31:0]'(b * PI); // illegal syntax
//assign result = a + [31:0]'(b * PI); // illegal syntax

  initial begin
    #(11*10);    // advance to unique time slot for this test number
    $display();
    $display("%m: compound op with built-in type casting test");

    #1 ;
    $display(" $typename(a + integer'(b * PI)) = %s:  EXPECTED reg or logic", $typename(a + integer'(b * PI)));
    $display();
  end
endmodule: mismatch_11

module mismatch_12;
parameter PI = 3.14159;
typedef logic [31:0] DTYPE;
DTYPE a, b, result;

assign result = a + DTYPE'(b * PI);
  initial begin
    #(12*10);    // advance to unique time slot for this test number
    $display();
    $display("%m: compound op with user-defined type casting test");

    #1 ;
    $display(" $typename(a + DTYPE'(b * PI)) = %s:  EXPECTED reg or logic", $typename(a + DTYPE'(b * PI)));
    $display();
  end
endmodule: mismatch_12

module mismatch_13;
parameter PI = 3.14159;
parameter type DTYPE = logic [31:0];
DTYPE a, b, result;

assign result = a + DTYPE'(b * PI);
  initial begin
    #(13*10);    // advance to unique time slot for this test number
    $display();
    $display("%m: compound op with parmaterized type casting test");

    #1 ;
    $display(" $typename(a + DTYPE'(b * PI)) = %s:  EXPECTED reg or logic", $typename(a + DTYPE'(b * PI)));
    $display();
  end
endmodule: mismatch_13



//
// Snippet 3:
// Operations with size casting
//
module mismatch_14;
logic [7:0] in, out;
logic [2:0] rfactor;

assign out = {in,in} >> rfactor;  // variable rotate right

  initial begin
    #(14*10);    // advance to unique time slot for this test number
    $display();
    $display("%m: rotate op without casting");

    #1 ;
    $write(" $bits({in,in} >> rfactor)=%0d:  EXPECTED 16", $bits({in,in} >> rfactor));
    if ($bits({in,in} >> rfactor) == 16) $display(" - OK");
    else                                 $display(" - ERROR!");
    $display();
  end
endmodule: mismatch_14

module mismatch_15;
logic [7:0] in, out;
logic [2:0] rfactor;

assign out = 8'({in,in} >> rfactor);  // variable rotate right

  initial begin
    #(15*10);    // advance to unique time slot for this test number
    $display();
    $display("%m: rotate op with size casting");

    #1 ;
    $write(" $bits(8'({in,in} >> rfactor))=%0d:  EXPECTED 8", $bits(8'({in,in} >> rfactor)));
    if ($bits(8'({in,in} >> rfactor)) == 8) $display(" - OK");
    else                                    $display(" - ERROR!");
    $display();
  end
endmodule: mismatch_15

module mismatch_16;
parameter N = 8;
logic [N-1:0]       in;         // N-bit vector
logic [$clog2(N):0] rfactor; // log2 ceiling of N 
logic [N-1:0]       out;        // N-bit vector

assign out = N'({in,in} >> rfactor);  // variable rotate right

  initial begin
    #(16*10);    // advance to unique time slot for this test number
    $display();
    $display("%m: parameterized rotate op with parameter size casting");

    #1 ;
    $write(" $bits(N'({in,in} >> rfactor))=%0d:  EXPECTED 8", $bits(N'({in,in} >> rfactor)));
    if ($bits(N'({in,in} >> rfactor)) == 8) $display(" - OK");
    else                                    $display(" - ERROR!");
    $display();
  end
endmodule: mismatch_16

module mismatch_17;
parameter N = 8;
logic [N-1:0]       in;         // N-bit vector
logic [$clog2(N):0] rfactor; // log2 ceiling of N 
logic [N-1:0]       out;        // N-bit vector

assign out = $bits(out)'({in,in} >> rfactor);

  initial begin
    #(17*10);    // advance to unique time slot for this test number
    $display();
    $display("%m: parameterized rotate op with $bits size casting");

    #1 ;
    $write(" $bits($bits(out)'({in,in} >> rfactor))=%0d:  EXPECTED 8", $bits($bits(out)'({in,in} >> rfactor)));
    if ($bits($bits(out)'({in,in} >> rfactor)) == 8) $display(" - OK");
    else                                             $display(" - ERROR!");
    $display();
  end
endmodule: mismatch_17



//
// Snippet 4:
// Operations with signing casting
//
module mismatch_18;
logic        [7:0] u1; // 8-bit unsigned variable
logic signed [7:0] s1; // 8-bit signed variables

  initial begin 
    #(18*10);    // advance to unique time slot for this test number
    $display();
    $display("%m: comparison op without sign casting");
    #1 ;
    
  s1 = -5;
  u1 = 1;
  if (s1 < u1)
    $display("%0d is less than %0d", s1, u1);
  else
    $display("%0d is equal or greater than %0d", s1, u1);

    $display();
end 
endmodule: mismatch_18

module mismatch_19;
logic        [7:0] u1; // 8-bit unsigned variable
logic signed [7:0] s1; // 8-bit signed variables

  initial begin 
    #(19*10);    // advance to unique time slot for this test number
    $display();
    $display("%m: comparison op with signed'(u1) casting");
    #1 ;
    
  s1 = -5;
  u1 = 1;
  if (s1 < signed'(u1))
    $display("%0d is less than %0d", s1, u1);
  else
    $display("%0d is equal or greater than %0d", s1, u1);

    $display();
end 
endmodule: mismatch_19

module mismatch_20;
logic        [7:0] u1; // 8-bit unsigned variable
logic signed [7:0] s1; // 8-bit signed variables

initial begin 
    #(20*10);    // advance to unique time slot for this test number
  $display();
  $display("%m: comparison op with unsigned'(s1) casting");
  #1 ;
    
  s1 = -5;
  u1 = 1;
  if (unsigned'(s1) < u1)
    $display("%0d is less than %0d", s1, u1);
  else
    $display("%0d is equal or greater than %0d", s1, u1);

    $display();
end 
endmodule: mismatch_20

`end_keywords
