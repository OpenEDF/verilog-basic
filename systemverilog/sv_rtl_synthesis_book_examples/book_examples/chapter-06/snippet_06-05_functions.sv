//
// Book, "RTL Modeling with SystemVerilog for ASIC and FPGA Design"
// by Stuart Sutherland
//
// Functions and tasks snippets.
//
// Copyright 2016, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//

`begin_keywords "1800-2012"

//
// Snippet 1:
// Factorial function using return keyword 
//
module factorial_function_1; 
  parameter N = 8;
  
  logic [N-1:0] a, b, out;
  logic         clock;

function automatic logic [N-1:0] factorial_f([N-1:0] in);
  logic [N-1:0] f;
  if (in <= 1) f = 1;
  else         f = in * factorial_f(in-1);
  return f;
endfunction: factorial_f

always_ff @(posedge clock) 
  out <= factorial_f(a) + factorial_f(b);


  initial begin 
    #(1*10);    // advance to unique time slot for this test number
    a = 3; b = 5;
    clock = '0;
    #1;
    clock = '1;
    #1;
    clock = '0;
    $display("\n%m: a=%0d  b=%0d  out=%0d (expect out=%0d)", a, b, out, (test_f(a) + test_f(b)) );
  end
  
  function automatic int test_f (int n);
    if (n >=2) test_f = test_f(n-1) * n;
    else       test_f = 1;
  endfunction

endmodule: factorial_function_1


//
// Snippet 2:
// Factorial function using function name
//
module factorial_function_2; 
  parameter N = 8;
  
  logic [N-1:0] a, b, out;
  logic         clock;

function automatic logic [N-1:0] factorial_f([N-1:0] in);
  if (in <= 1) factorial_f = 1;
  else         factorial_f = in * factorial_f(in-1);
endfunction: factorial_f

always_ff @(posedge clock) 
  out <= factorial_f(a) + factorial_f(b);


  initial begin 
    #(2*10);    // advance to unique time slot for this test number
    a = 1; b = 2;
    clock = '0;
    #1;
    clock = '1;
    #1;
    clock = '0;
    $display("\n%m: a=%0d  b=%0d  out=%0d (expect out=%0d)", a, b, out, (test_f(a) + test_f(b)) );
  end
  
  function automatic int test_f (int n);
    if (n >=2) test_f = test_f(n-1) * n;
    else       test_f = 1;
  endfunction

endmodule: factorial_function_2


//
// Snippet 3:
// void function with output arg
//
module void_function; 

typedef struct {
  logic [31:0] data;
  logic [ 3:0] check;
  logic        valid;
} packet_t;

function void set_packet_f ([31:0] in, output packet_t out);
  out.data = in;
  for (int i=0; i<=7; i++)
    out.check[i] = ^in[(8*i)+:8];
  out.valid = 1;
endfunction 

  logic [31:0] in;
  packet_t result;

  initial begin 
    #(3*10);    // advance to unique time slot for this test number
    in = 32'hDEADBEEF;
    #1;
    set_packet_f(in, result);
    $display("\n%m: in=%h  result.data=%h  result.check=%b  result.valid=%b  (expect data=%h  check=%h  valid=%b \n)", in, result.data, result.valid, result.check, in, '1, check_f(in) );
  end
  
  function [3:0] check_f ([31:0] in);
    check_f[0] = ^in[ 7: 0];
    check_f[1] = ^in[15: 8];
    check_f[2] = ^in[23:16];
    check_f[3] = ^in[31:24];
  endfunction

endmodule: void_function


//
// Snippet 4:
// Pass-by-order and pass-by-name function calls
//
module function_calls; 
  int m_data, s_data, data_bus;
  logic master_clock, slave_clock;

function automatic int inc_f(int count, step);
  return (count + step);
endfunction

always_ff @(posedge master_clock)
  m_data <= inc_f(data_bus, 1); // pass-by-order
 
always_ff @(posedge slave_clock)   // pass-by-name
  s_data <= inc_f(.count(data_bus), .step(8) );

  initial begin 
    #(4*10);    // advance to unique time slot for this test number
    data_bus = 3;
    master_clock = '0; slave_clock = '0;
    #1;
    master_clock = '1; slave_clock = '1;
    #1;
    master_clock = '0; slave_clock = '0;
    $display("\n%m: data_bus=%0d  m_data=%0d  s_data=%0d  (expect m_data=%0d  s_data=%0d) \n)", data_bus, m_data, s_data, 4, 11 );
  end
  
endmodule: function_calls


//
// Snippet 5:
// Function with default input value
//
module default_input; 
  int m_data, s_data, data_bus;
  logic master_clock, slave_clock;

function automatic int inc_f(int count, step=1);
  return (count + step);
endfunction
 
always_ff @(posedge master_clock)
  m_data <= inc_f( .count(data_bus) );
 
always_ff @(posedge slave_clock)
  s_data <= inc_f( .count(data_bus), .step(8) );

  initial begin 
    #(5*10);    // advance to unique time slot for this test number
    data_bus = 3;
    master_clock = '0; slave_clock = '0;
    #1;
    master_clock = '1; slave_clock = '1;
    #1;
    master_clock = '0; slave_clock = '0;
    $display("\n%m: data_bus=%0d  m_data=%0d  s_data=%0d  (expect m_data=%0d  s_data=%0d) \n)", data_bus, m_data, s_data, 4, 11 );
  end
  
endmodule: default_input


//
// Snippet 6:
// Function with multiple return points
//
module exit_early; 

parameter N = 32;

function automatic void sum_to_endpoint_f 
(output [N-1:0] result,
 input  [$clog2(N)-1:0] endpoint,
 inout  [N-1:0] data_array [64] // look-up-table array
);
    result = data_array[0];
    if (endpoint == 0) return; // exit the function early
    for (int i=1; i<=63; i++) begin 
      result = result + data_array[i];
      if (i == endpoint) return; // exit the function early
    end 
endfunction // exit at completion of function

logic [N-1:0] result;

logic [N-1:0] LUT [64]; // look-up-table array

  initial begin 
    #(6*10);    // advance to unique time slot for this test number

    LUT[0] = 0; 
    foreach ( LUT [i] ) LUT[i] = i; // load the table

    #1;
    sum_to_endpoint_f(result, 10, LUT);
    $display("\n%m: result=%0d  (expect %0d) \n)", result, 55 );
  end
  
endmodule: exit_early


//
// Snippet 7:
// Parameterized function
//
module parameterized_function; 
  logic [15:0] y16, a16, b16;
  logic [31:0] y32, a32, b32;

virtual class Functions #(parameter SIZE=8);
  static function [SIZE-1:0] adder_f (input [SIZE-1:0] a, b);
    return a + b; // defaults to 8-bit adder 
  endfunction 
endclass 

always_comb begin 
  y16 = Functions #(.SIZE(32))::adder_f(a16, b16); 
             // reconfigure to 16-bit adder

  y32 = Functions #(.SIZE(32))::adder_f(a32, b32); 
             // reconfigure to 32-bit adder
end 

  initial begin 
    #(7*10);    // advance to unique time slot for this test number

    #1;
    a16=1; b16=3;
    a32=2; b32=5;
    #1;
    $display("\n%m: a16=%0d  b16=%0d  y16=%0d  (expect y16=%0d) )", a16, b16, y16, 4 );
    $display("%m: a32=%0d  b32=%0d  y32=%0d  (expect y32=%0d) \n)", a32, b32, y32, 7 );
  end
  
endmodule: parameterized_function


//
// Snippet 8:
// Example task that reverses the bits of a vector
//
module example_task; 
  parameter N = 8;
  logic [N-1:0] a, a_reversed;
  logic [N-1:0] b, b_reversed;
  logic         clock;

task automatic ReverseBits (input  [N-1:0] in,
                            output [N-1:0] out);
    for (int i=0; i<N; i++)
      out[(N-1)-i] = in[i];
endtask 

always_ff @(posedge clock) begin 
    ReverseBits(a, a_reversed);
    ReverseBits(b, b_reversed);  
end 

  initial begin 
    #(8*10);    // advance to unique time slot for this test number

    #1;
    a = 8'h0F;
    b = 8'hF0;
    clock = '0;
    #1;
    clock = '1;
    #1;
    clock = '0;
    $display("\n%m: a=%b  a_reversed=%b  (expect a_reversed=%b) )", a, a_reversed, 8'hF0 );
    $display("%m: b=%b  b_reversed=%b  (expect b_reversed=%b)\n )", b, b_reversed, 8'h0F );
  end
  
endmodule: example_task



`end_keywords


