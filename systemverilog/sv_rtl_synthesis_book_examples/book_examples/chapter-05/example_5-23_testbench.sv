//
// Book, "RTL Modeling with SystemVerilog for ASIC and FPGA Design"
// by Stuart Sutherland
//
// Testbench
//
// Copyright 2016, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//

//`define GOTCHA

`begin_keywords "1800-2012"
module top;
  timeunit 1ns/1ns;
  parameter N = 8;
  logic signed [N-1:0] a, b; // adder inputs
  logic                ci;   // adder input
  logic signed [N-1:0] sum;  // adder output
  logic                ov;   // adder outputs

  signed_adder_test    #(.N(N)) test (.*);
  
  `ifdef GOTCHA
    signed_adder_gotcha #(.N(N)) dut  (.*);
  `else
     signed_adder_good  #(.N(N)) dut  (.*);
 `endif

endmodule: top

module signed_adder_test
#(parameter N = 8)
(output logic signed [N-1:0] a, b,   // signed inputs
 output logic                ci,     // unsigned 1-bit inputs
 input  logic signed [N-1:0] sum,    // signed output
 input  logic                ov  // unsigned 1-bit output
);
  timeunit 1ns/1ns;

  initial begin
  	$timeformat(-9, 0, "ns", 6);  // nanoseconds, no precision, 6 columns
    $display("\nSigned adder with carry-in cast to signed");
    $display("The adder size is %0d bits\n", N);

  	#5 a = +5;   b =   1; ci = '1;  #1 check_results(.s(7));  
  	#5 a = -5;   b =   1; ci = '1;  #1 check_results(.s(-3));  

    // The following examples come from http://sandbox.mc.edu/~bennet/cs110/tc/add.html.
    // The expected result values are based on 8-bit vector sizes.
  	#5 a = +104; b = +45; ci = '0;  #1 check_results(.s(149));  
  	#5 a = +127; b = +0;  ci = '1;  #1 check_results(.s(128));  
  	#5 a = -103; b = -69; ci = '0;  #1 check_results(.s(-172));  
  	#5 a = -1;   b = +1;  ci = '0;  #1 check_results(.s(0));  
  	#5 a = -1;   b = +1;  ci = '1;  #1 check_results(.s(1));  

  	#5 a = -128; b = +127;  ci = '1;  #1 check_results(.s(0));  

    $display("DEBUG: $typename(a + b + ci) = %s", $typename(a + b + ci) );
    $display("DEBUG: $typename(a + b + signed'({1'b0,ci}) = %s \n", $typename(a + b + signed'({1'b0,ci})) );


    #5 $finish;
  end

  task check_results(int s);
    logic v;  // expected value of overflow
    v = overflow_f(a,b,s);  // function needed because position of sign-bit is parameterized
    $display("a=%0d, b=%0d, ci=%b", a, b, ci);
    $display("EXPECT: sum=%4d, ov=%b", s, v);
    $write  ("ACTUAL: sum=%4d, ov=%b", sum, ov);
    if (v && ov)       $display(" -- PASS (overflow causes sum to not match expected)\n");
    else if (v && !ov) $display(" -- ERROR! (expected overflow)\n");
    else if (sum===s)  $display(" -- PASS \n");
    else               $display(" -- ERROR! \n");
  endtask

  function overflow_f([N-1:0] a, b, s);
    // An overflow has occurred if:
    // 1. If the sum of two positive numbers yields a negative result 
    // 2. If the sum of two negative numbers yields a positive result 
    return (   ({a[N-1],b[N-1],sum[N-1]}===3'b001)
            || ({a[N-1],b[N-1],sum[N-1]}===3'b110) 
           )? 1'b1: 1'b0;
  endfunction

endmodule: signed_adder_test

`end_keywords
