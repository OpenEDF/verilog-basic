//
// Book, "RTL Modeling with SystemVerilog for ASIC and FPGA Design"
// by Stuart Sutherland
//
// Continuous assignment snippets.
//
// Copyright 2016, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//

`begin_keywords "1800-2012"


//
// Snippet 1:
// Simple flip flop with no reset
//
module simple_ff; 
  logic       clock;
  logic [7:0] d, q;

always_ff @(posedge clock)
  q <= d;

  initial begin
    #(1*10);    // advance to unique time slot for this test number
    clock = 0;
    d = 8'h5;
    #1;
    clock = 1;
    #1;
    $display("\n%m: d=%0d  q=%0d (expect 5)\n", d, q);
  end

endmodule: simple_ff


//
// Snippet 2:
// Johnson counter with out-of-order statements
//
module jcounter_2; 
  logic       clock, resetN;
  logic [0:3] cnt;

always_ff @(posedge clock)
  if (!resetN) begin    // reset the counter
    cnt <= '0;
  end 
  else begin            // shift the count
    cnt[1] <=  cnt[0];
    cnt[3] <=  cnt[2];
    cnt[0] <= ~cnt[3];
    cnt[2] <=  cnt[1];
  end 
  
  initial begin
    #(2*10);    // advance to unique time slot for this test number
    clock = 0;
    resetN <= 0;
    #1;
    clock = 1;
    #1;
    clock = 0;
    #1;
    resetN <= 1;
    #1;
    clock = 1;
    #1;
    clock = 0;
    #1;
    clock = 1;
    #1;
     $display("%m: cnt=%b (expect 1100)\n", cnt);
  end

endmodule: jcounter_2


//
// Snippet 3:
// Johnson counter with separate always procedures
//
module jcounter_3; 
  logic       clock, resetN;
  logic [0:3] cnt;

always_ff @(posedge clock)
  if (!resetN) cnt <= '0; // reset
  else cnt[0] <= ~cnt[3]; // store

always_ff @(posedge clock)
  if (!resetN) cnt <= '0; // reset
  else cnt[2] <=  cnt[1]; // store

always_ff @(posedge clock)
  if (!resetN) cnt <= '0; // reset
  else cnt[1] <=  cnt[0]; // store

always_ff @(posedge clock)
  if (!resetN) cnt <= '0; // reset
  else cnt[3] <=  cnt[2]; // store

  initial begin
    #(3*10);    // advance to unique time slot for this test number
    clock = 0;
    resetN <= 0;
    #1;
    clock = 1;
    #1;
    clock = 0;
    #1;
    resetN <= 1;
    #1;
    clock = 1;
    #1;
    clock = 0;
    #1;
    clock = 1;
    #1;
     $display("%m: cnt=%b (expect 1100)\n", cnt);
  end

endmodule: jcounter_3


//
// Snippet 4:
// Johnson counter using incorrect blocking assignments
//
module jcounter_4; 
  logic       clock, resetN;
  logic [0:3] cnt;

always_ff @(posedge clock)
  if (!resetN) begin    // reset the counter
    cnt <= '0;
  end 
  else begin            // shift the count
    cnt[0] = ~cnt[3];
    cnt[1] =  cnt[0];
    cnt[2] =  cnt[1];
    cnt[3] =  cnt[2];
  end 
  
  initial begin
    #(4*10);    // advance to unique time slot for this test number
    clock = 0;
    resetN <= 0;
    #1;
    clock = 1;
    #1;
    clock = 0;
    #1;
    resetN <= 1;
    #1;
    clock = 1;
    #1;
    clock = 0;
    #1;
    clock = 1;
    #1;
     $display("%m: cnt=%b (expect 1100)\n", cnt);
  end

endmodule: jcounter_4


//
// Snippet 5:
// Johnson counter using incorrect blocking assignments in an order that fools simulation
//
module jcounter_5; 
  logic       clock, resetN;
  logic [0:3] cnt;

logic tmp;

always_ff @(posedge clock)
  if (!resetN) begin      // reset the counter
    cnt <= '0;
  end 
  else begin            // shift the count
    tmp    =  cnt[3];
    cnt[3] =  cnt[2];
    cnt[2] =  cnt[1];
    cnt[1] =  cnt[0];
    cnt[0] = ~tmp;
  end 
  
  initial begin
    #(5*10);    // advance to unique time slot for this test number
    clock = 0;
    resetN <= 0;
    #1;
    clock = 1;
    #1;
    clock = 0;
    #1;
    resetN <= 1;
    #1;
    clock = 1;
    #1;
    clock = 0;
    #1;
    clock = 1;
    #1;
    $display("%m: cnt=%b (expect 1100)\n", cnt);
  end

endmodule: jcounter_5


//
// Snippet 6:
// Appropriate use of blocking assignment in a sequential procedure
//
module compound_assignment; 
  logic       clock;
  logic [7:0] a, b, c, tmp, out;

always_ff @(posedge clock) begin
  tmp  = a + b;   // calculate tmp immediately
  out <= c - tmp; // store final result in a register
end

  initial begin
    #(6*10);    // advance to unique time slot for this test number
    clock = 0;
    a = 8'h1; b = 8'h3; c = 8'h5;
    #1;
    clock = 1;
    #1;
    clock = 0;
    #1;
    $display("\n%m: a=%0d  b=%0d  c=%0d :  out=%0d (expect 1)\n", a, b, c, out);
  end

endmodule: compound_assignment


//
// Snippet 7:
// Simple flip flop modeled with a generic always procedure
//
module generic_always; 
  logic       clock;
  logic [7:0] d, q;

always @(posedge clock)
  q <= d;

  initial begin
    #(7*10);    // advance to unique time slot for this test number
    clock = 0;
    d = 8'h5;
    #1;
    clock = 1;
    #1;
    $display("\n%m: d=%0d  q=%0d (expect 5)\n", d, q);
  end

endmodule: generic_always


//
// Snippet 8:
// Nonsynthesizable lip flop modeled with a generic always procedure
//
module nonsynthesizable_sensitivity; 
  logic       clock, enable;
  logic [7:0] d, q;

always @(posedge clock or enable)
  if (enable) q <= d;

  initial begin
    #(8*10);    // advance to unique time slot for this test number
    clock = 0;
    enable = 1;  // load flip-flop
    d = 8'h3;
    #1;
    clock = 1;
    #1;
    clock = 0;
    $display("\n%m: d=%0d  eanble=%b  q=%0d (expect 3 -- ff loaded d input)", d, enable, q);
    enable = 0;  // turn off flip-flop
    d = 8'h5;
    #1;
    clock = 1;
    #1;
    clock = 0;
    #1;
    $display("%m: d=%0d  eanble=%b  q=%0d (expect 3 -- ff did not load d input)", d, enable, q);
  end

endmodule: nonsynthesizable_sensitivity


//
// Snippet 9:
// Nonsynthesizable lip flop modeled with a generic always procedure
//
module warning_expected; 
  logic       clock, enable;
  logic [7:0] d, q;

always_ff @(posedge clock or enable)
  if (enable) q <= d;

  initial begin
    #(9*10);    // advance to unique time slot for this test number
    $display("\n%m: Expect simulation warning regarding sensitivity list)");
  end

endmodule: warning_expected


//
// Snippet 10:
// Flip flop with no reset
//
module ff_no_reset; 
  logic       clock;
  logic [7:0] d, q;

always_ff @(posedge clock)
  q <= d;
  
  
  initial begin
    #(10*10);    // advance to unique time slot for this test number
    clock = 0;
    d = 8'h1;
    #1;
    clock = 1;
    #1;
    $display("\n%m: d=%0d  q=%0d (expect 1)\n", d, q);
  end

endmodule: ff_no_reset


//
// Snippet 11:
// Flip flop with synchronous active-high reset
//
module ff_synchronous_reset; 
  logic       clock, reset;
  logic [7:0] d, q;

always_ff @(posedge clock)
  if (reset) q <= '0;  // active-high synchronous reset
  else       q <= d;       
  
  initial begin
    #(11*10);    // advance to unique time slot for this test number
    clock = 0;
    d = 8'h2;
    reset <= 1;  // reset on
    #1;
    clock = 1;
    #1;
    $display("\n%m: reset=%b  d=%0d  q=%0d (expect 0)", reset, d, q);

    #1;
    clock = 0;
    reset <= 0;  // reset off
    #1;
    clock = 1;
    #1;
    $display("%m: reset=%b  d=%0d  q=%0d (expect 2)\n", reset, d, q);
  end

endmodule: ff_synchronous_reset


//
// Snippet 12:
// Flip flop with asynchronous reset
//
module ff_asynchronous_reset; 
  logic       clock, resetN;
  logic [7:0] d, q;

always_ff @(posedge clock or negedge resetN)
  if (!resetN) q <= '0;  // active-low asynchronous reset
  else         q <= d;       
  
  initial begin
    #(12*10);    // advance to unique time slot for this test number
    clock = 0;
    d = 8'h3;
    resetN <= 0;
    #1;
    clock = 1;
    #1;
    $display("\n%m: resetN=%b  d=%0d  q=%0d (expect 0)", resetN, d, q);

    #1;
    clock = 0;
    resetN <= 1;
    #1;
    clock = 1;
    #1;
    $display("%m: resetN=%b  d=%0d  q=%0d (expect 3)\n", resetN, d, q);
  end

endmodule: ff_asynchronous_reset


//
// Snippet 13:
// Set-Reset Flip flop with asynchronous inputs
//
module srff; 
  logic clk, rstN, setN;
  logic d, q;

always_ff @(posedge clk or negedge rstN or negedge setN)
  if      (rstN == 1'b0) q <= '0;  // reset (active low)
  else if (setN == 1'b0) q <= '1;  // set (active low)
  else                   q <= d;   // clock   
  
  initial begin
    #(13*10);    // advance to unique time slot for this test number
    clk = 0;
    d = 1;
    rstN <= 0;
    setN <= 0;
    #1;
    clk = 1;
    #1;
    $display("\n%m: rstN=%b  setN=%b  d=%0d  q=%0d (expect 0)", rstN, setN, d, q);

    #1;
    clk = 0;
    d = 0;
    rstN <= 1;
    #1;
    clk = 1;
    #1;
    $display("%m: rstN=%b  setN=%b  d=%0d  q=%0d (expect 1)", rstN, setN, d, q);

    #1;
    clk = 0;
    setN <= 1;
    #1;
    clk = 1;
    #1;
    $display("%m: rstN=%b  setN=%b  d=%0d  q=%0d (expect 0)\n", rstN, setN, d, q);

  end

endmodule: srff


//
// Snippet 14:
// Set-Reset Flip flop with glitch fix
//
module srff_no_glitch; 
  logic clk, rstN, setN;
  logic d, q;

always_ff @(    posedge clk                    
             or negedge rstN
             or negedge setN
// synthesis translate_off
             or posedge (rstN & ~setN)
// synthesis translate_on
           )
  if       (rstN == 1'b0) q <= '0;  // reset (active low)
  else if  (setN == 1'b0) q <= '1;  // set (active low)
  else                    q <= d;   // clock   
  
  initial begin
    #(14*10);    // advance to unique time slot for this test number
    clk = 0;
    d = 1;
    rstN <= 0;
    setN <= 0;
    #1;
    clk = 1;
    #1;
    $display("\n%m: rstN=%b  setN=%b  d=%0d  q=%0d (expect 0)", rstN, setN, d, q);

    #1;
    clk = 0;
    d = 0;
    rstN <= 1;
    #1;
    clk = 1;
    #1;
    $display("%m: rstN=%b  setN=%b  d=%0d  q=%0d (expect 1)", rstN, setN, d, q);

    #1;
    clk = 0;
    setN <= 1;
    #1;
    clk = 1;
    #1;
    $display("%m: rstN=%b  setN=%b  d=%0d  q=%0d (expect 0)\n", rstN, setN, d, q);

  end

endmodule: srff_no_glitch


//
// Snippet 15:
// Clock synchronizer flip-flops
//
module synch_ff; 
  logic clock, resetN;
  logic req, req_tmp, req_synced;

always_ff @(posedge clock or negedge resetN)
  if (!resetN) begin 
    req_tmp    <= '0;
    req_synced <= '0;
  end 
  else begin 
    req_tmp    <= req;     // register req input
    req_synced <= req_tmp; // stabilize req
  end 
  
  initial begin
    #(15*10);    // advance to unique time slot for this test number
    clock = 0;
    req = 1;
    resetN <= 0;
    #1;
    clock = 1;
    #1;
    clock = 0;
    $display("\n%m: resetN=%b  req=%b  req_tmp=%b  req_sync=%b (expect 0)", resetN, req, req_tmp, req_synced);

    resetN <= 1;
    #1;
    clock = 1;
    #1;
    clock = 0;
    $display("%m: resetN=%b  req=%b  req_tmp=%b  req_sync=%b (expect 0)", resetN, req, req_tmp, req_synced);

    #1;
    clock = 1;
    #1;
    clock = 0;
    $display("%m: resetN=%b  req=%b  req_tmp=%b  req_sync=%b (expect 1)\n", resetN, req, req_tmp, req_synced);
  end

endmodule: synch_ff


//
// Snippet 16:
// Clock synchronizer flip-flops
//
module reset_synch_ff; 
  logic clock, resetN;
  logic resetN_tmp, resetN_synced;

always_ff @(posedge clock or negedge resetN)
  if (!resetN) begin 
    resetN_tmp    <= '0;         // asynchronous reset
    resetN_synced <= '0;
  end 
  else begin 
    resetN_tmp    <= '1;         // begin trailing edge of reset
    resetN_synced <= resetN_tmp; // stabilize reset
  end 

  initial begin
    #(16*10);    // advance to unique time slot for this test number
    clock = 0;
    resetN <= 0;
    #1;
    clock = 1;
    #1;
    clock = 0;
    $display("\n%m: resetN=%b  resetN_tmp=%b  resetN_sync=%b (expect 0)", resetN, resetN_tmp, resetN_synced);

    resetN <= 1;
    #1;
    clock = 1;
    #1;
    clock = 0;
    $display("%m: resetN=%b  resetN_tmp=%b  resetN_sync=%b (expect 0)", resetN, resetN_tmp, resetN_synced);

    #1;
    clock = 1;
    #1;
    clock = 0;
    $display("%m: resetN=%b  resetN_tmp=%b  resetN_sync=%b (expect 1)", resetN, resetN_tmp, resetN_synced);
  end

endmodule: reset_synch_ff


//
// Snippet 17:
// Data enabled Flip flop
//
module enable_ff; 
  logic clock, resetN, enable;
  logic d, q;

always_ff @(posedge clock or negedge resetN)
  if      (!resetN) q <= '0;  // reset (active low)
  else if (enable)  q <= d;   // store data if enabled   
  
  initial begin
    #(17*10);    // advance to unique time slot for this test number
    clock = 0;
    d = 1;
    resetN <= 0;
    enable <= 1;
    #1;
    clock = 1;
    #1;
    $display("\n%m: resetN=%b  enable=%b  d=%0d  q=%0d (expect 0)", resetN, enable, d, q);

    #1;
    clock = 0;
    d = 1;
    resetN <= 1;
    enable <= 1;
    #1;
    clock = 1;
    #1;
    $display("%m: resetN=%b  enable=%b  d=%0d  q=%0d (expect 1)", resetN, enable, d, q);

    #1;
    clock = 0;
    d = 0;
    resetN <= 1;
    enable <= 0;
    #1;
    clock = 1;
    #1;
    $display("%m: resetN=%b  enable=%b  d=%0d  q=%0d (expect 1)\n", resetN, enable, d, q);

  end

endmodule: enable_ff


//
// Snippet 18:
// blocking delay vs. intra-assignment delay
//
module delayed_ff; 
//timeunit 1ns/1ns;

  logic       clock, resetN;
  logic [7:0] d1, d2, q1, q2;

  always @(posedge clock) begin 
#2ns q1 <= d1;  // 2 nanosecond blocking delay
  end
  
  always @(posedge clock) begin 
q2 <= #2ns d2;  // 2 nanosecond intra-assignment delay
  end
  
  initial begin
    #(18*10);    // advance to unique time slot for this test number
    clock = 0;
    d1 = 3;  d2 = 5;
    #1;
    clock = 1;
    #3;
    clock = 0;
    $display("\n%m: d1=%0d  q1=%0d (expect 3)", d1, q1);
    $display("%m: d2=%0d  q2=%0d (expect 5)\n", d2, q2);

  end

endmodule: delayed_ff


//
// Snippet 19:
// Flip flop with unit delays
//
module unit_delay_ff; 
  logic        clock, resetN;
  logic [31:0] d, q;

//timeunit 1ns/1ns;

always_ff @(posedge clock or negedge resetN)
  if (!resetN) q <= #1 '0;  // 1ns intra-assignment delay
  else         q <= #1 d;   // 1ns intra-assignment delay
  
  initial begin
    #(19*10);    // advance to unique time slot for this test number
    clock = 0;
    d = 8'h3;
    resetN <= 0;
    #2;
    clock = 1;
    #2;
    $display("\n%m: resetN=%b  d=%0d  q=%0d (expect 0)", resetN, d, q);

    clock = 0;
    resetN <= 1;
    #2;
    clock = 1;
    #2;
    $display("%m: resetN=%b  d=%0d  q=%0d (expect 3)\n", resetN, d, q);
  end

endmodule: unit_delay_ff

`end_keywords
