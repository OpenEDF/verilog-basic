//
// Book, "RTL Modeling with SystemVerilog for ASIC and FPGA Design"
// by Stuart Sutherland
//
// Decision statement snippets.
//
// Copyright 2016, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//

`begin_keywords "1800-2012"

//
// Snippet 1:
// Multiplexor with an if-else decision
//
module mux; 
  logic [7:0] a, b, y;
  logic       select;

always_comb 
  if (select == 1'b0) y = a;    // true branch
  else                y = b;    // false branch

  initial begin
    #(1*10);    // advance to unique time slot for this test number
    a = 8'h03; b = 8'h05;
    select = 0;
    #1;
    $display("\n%m: select=%b  a=%0d  b=%0d  y=%0d  (expect y=3)", select, a, b, y);
    #1;
    select = 1;
    #1;
    $display("%m: select=%b  a=%0d  b=%0d  y=%0d  (expect y=5)\n", select, a, b, y);
  end

endmodule: mux


//
// Snippet 2:
// Simple flip flop with asynchronous reset
//
module if_vector_condition; 

logic [7:0] a, b, y;
always_comb 
  if (a & b) y = a & b;    // true branch
  else       y = a ^ b;    // false branch

  initial begin
    #(2*10);    // advance to unique time slot for this test number
    a = 8'h30; b = 8'h50;
    #1;
    $display("\n%m: a=%b  b=%b  y=%b  (expect y=00010000)\n", a, b, y);
  end

endmodule: if_vector_condition


//
// Snippet 3:
// if-else with multiple statements in a branch
//
module if_else_multi_statement; 
  logic       clock, resetN;
  logic [7:0] a, b;
  logic       lt, eq, gt;

always_ff @(posedge clock or negedge resetN)
    if (!resetN) begin  // reset branch
      lt <= '0;
      eq <= '0;
      gt <= '0;
    end 
    else begin          // clocked branch
      lt <= (a < b); 
      eq <= (a == b);
      gt <= (a > b);
    end 
  
  initial begin
    #(3*10);    // advance to unique time slot for this test number
    clock = 1'b0;
    a = 8'h3; b = 8'h5;
    resetN <= 1'b0;  // reset registers
    #1;
    clock = 1'b1;
    #1;
    $display("\n%m: resetN=%b  a=%0d  b=%0d  lt=%b  eq=%b  gt=%b (expect lt=0, eq=0, gt=0)", resetN, a, b, lt, eq, gt);
    #1;
    clock = 1'b0;
    resetN <= 1'b1;  // turn off reset
    #1;
    clock = 1'b1;
    #1;
    $display("%m: resetN=%b  a=%0d  b=%0d  lt=%b  eq=%b  gt=%b (expect lt=1, eq=0, gt=0)\n", resetN, a, b, lt, eq, gt);
  end

endmodule: if_else_multi_statement

//
// Snippet 4:
// If statement withou an else branch
//
module latch_always; 
  logic [7:0] data, out;
  logic       enable;

always @(enable, data)
  if (enable) out <= data;
  
  initial begin
    #(4*10);    // advance to unique time slot for this test number
    enable = 1;  // not  latched
    data = 8'h5;
    #1;
    $display("\n%m: enable=%b  data=%0d  out=%0d (expect out=5)", enable, data, out);

    #1;
    enable = 0;  // latched
    #1;
    data = 8'h7;
    #1;
    $display("%m: enable=%b  data=%0d  out=%0d (expect out=5)\n", enable, data, out);
  end

endmodule: latch_always


//
// Snippet 5:
// Series of if-else decisions
//
module if_else_if_series; 
  logic [7:0] a, b, y;
  logic [1:0] opcode;

always_comb begin 
  if      (opcode == 2'b00) y = a + b;
  else if (opcode == 2'b01) y = a - b;
  else if (opcode == 2'b10) y = a * b;
  else                      y = a / b;
end 

  initial begin
    #(5*10);    // advance to unique time slot for this test number
    a = 8'h5; b = 8'h3;
    opcode = 2'b01;
    #1;
    $display("\n%m: opcode=%b  a=%0d  b=%0d  y=%0d  (expect y=2)\n", opcode, a, b, y);
  end

endmodule: if_else_if_series


//
// Snippet 6:
// Series of if-else decisions with nested indentation
//
module if_else_if_series_2; 
  logic [7:0] a, b, y;
  logic [1:0] opcode;

always_comb begin 
  if (opcode == 2'b00)     y = a + b;
  else 
    if (opcode == 2'b01)   y = a - b;
    else 
      if (opcode == 2'b10) y = a * b;
      else                 y = a / b;
end 

  initial begin
    #(6*10);    // advance to unique time slot for this test number
    a = 8'h5; b = 8'h3;
    opcode = 2'b01;
    #1;
    $display("\n%m: opcode=%b  a=%0d  b=%0d  y=%0d  (expect y=2)\n", opcode, a, b, y);
  end

endmodule: if_else_if_series_2


//
// Snippet 7:
// Flip flop with if-else-if decision series showing reset priority
//
module set_reset_ff; 
  logic       clk, rstN, setN;
  logic [7:0] d, q;

always_ff @(posedge clk or negedge rstN or negedge setN)
  if      (rstN == 1'b0) q <= '0;  // reset register (active low)
  else if (setN == 1'b0) q <= '1;  // set register (active low)
  else                   q <= d;   // clock the register  
  
  initial begin
    #(7*10);    // advance to unique time slot for this test number
    clk = 1'b0;
    d = 8'h5;
    rstN  = 1'b1;  // reset off (active low)
    setN = 1'b1;   // preset off
    #1;
    clk = 1'b1;
    #1;
    clk = 1'b0;
    $display("\n%m: rstN=%b  setN=%b  d=%0h  q=%0h (expect q=5)", rstN, setN, d, q);

    rstN  = 1'b0;  // reset on (active low)
    setN = 1'b0;   // preset also on
    #1;
    $display("%m: rstN=%b  setN=%b  d=%0h  q=%0h (expect q=0)", rstN, setN, d, q);
    rstN  = 1'b1;  // reset off
    setN = 1'b0;   // preset still on
    #1;
    clk = 1'b1;
    #1;
    clk = 1'b0;
    $display("%m: rstN=%b  setN=%b  d=%0h  q=%0h (expect q=ff)\n", rstN, setN, d, q);
  end

endmodule: set_reset_ff


//
// Snippet 8:
// Case statement with default
//
module case_statement; 
  logic [1:0] opcode;
  logic [3:0] a, b, result;

always_comb begin 
  case (opcode)
    2'b00  : result = a & b;
    2'b01  : result = a | b;
    2'b10  : result = a ^ b;
    2'b11  : result = a >> 1;
    default: result = 'X;
  endcase 
end 
  
  initial begin
    #(8*10);    // advance to unique time slot for this test number
    a=4'h5; b=4'hA;
    opcode = 2'b00;
    #1;
    $display("\n%m: a=%h   b=%h  opcode=%b   result=%h (expect result=0)", a, b, opcode, result);
    #1;
    opcode = 2'b01;
    #1;
    $display("%m: a=%h   b=%h  opcode=%b   result=%h (expect result=F)\n", a, b, opcode, result);
  end

endmodule: case_statement


//
// Snippet 9:
// Case statement with default
//
module case_item_list; 
  logic [1:0] opcode;
  logic [3:0] a, b, result;

always_comb begin 
  case (opcode)
    2'b00, 2'b01: result = a & b;
    2'b10, 2'b11: result = a | b;
  endcase 
end 
  
  initial begin
    #(9*10);    // advance to unique time slot for this test number
    a=4'h5; b=4'hA;
    opcode = 2'b00;
    #1;
    $display("\n%m: a=%h   b=%h  opcode=%b   result=%h (expect result=0)", a, b, opcode, result);
    #1;
    opcode = 2'b11;
    #1;
    $display("%m: a=%h   b=%h  opcode=%b   result=%h (expect result=F)\n", a, b, opcode, result);
  end

endmodule: case_item_list


//
// Snippet 10:
// Case statement with default
//
module mux_4_state; 
  logic       select;
  logic [3:0] a, b, y;

always_comb begin 
  case (select)
    1'b0: y = a;
    1'b1: y = b;
    1'bz: y = 'Z;
    1'bx: y = 'X;
  endcase 
end  
  
  initial begin
    #(10*10);    // advance to unique time slot for this test number
    a=4'h3; b=4'h5;
    select = 1'b1;
    #1;
    $display("\n%m: a=%h   b=%h  select=%b   y=%h (expect y=5)", a, b, select, y);
    #1;
    select = 1'bz;
    #1;
    $display("%m: a=%h   b=%h  opcode=%b   y=%h (expect seelct=z)\n", a, b, select, y);
  end

endmodule: mux_4_state


//
// Snippet 11:
// Case statement with default
//
module case_inside; 
  logic [3:0] selector;
  logic [3:0] a, b, c, d, out;

always_comb begin 
  case (selector) inside 
    4'b1???: out = a;  // msb is set
    4'b01??: out = b;
    4'b001?: out = c;
    4'b0001: out = d;
    default: out = 0;  // no bits are set
  endcase 
end   
  
  initial begin
    #(11*10);    // advance to unique time slot for this test number
    a=4'hA; b=4'hB; c=4'hC; d=4'hD;
    selector = 4'b1011;
    #1;
    $display("\n%m: a=%h   b=%h   c=%h   d=%h  selector=%b   out=%h (expect out=a)", a, b, c, d, selector, out);
    #1;
    selector = 4'b0011;
    #1;
    $display("%m: a=%h   b=%h   c=%h   d=%h  selector=%b   out=%h (expect out=c)\n", a, b, c, d, selector, out);
  end

endmodule: case_inside


//
// Snippet 12:
// Case statement with default
//
module unique_case; 
  logic [1:0] state;
  logic       ok, busy, done;

always_comb begin // 3-state FSM output decoder
  unique case (state) 
    2'b00: {ok,busy,done} = 3'b100;
    2'b01: {ok,busy,done} = 3'b010;
    2'b10: {ok,busy,done} = 3'b101;
  endcase 
end 
  
  initial begin
    #(12*10);    // advance to unique time slot for this test number
    state = 2'b00;
    #1;
    $display("\n%m: state=%b   ok=%b   busy=%b   done=%b (expect ok=1, busy=0, done=0)", state, ok, busy, done);
    #1;
    state = 4'b11;
    #1;
    $display("%m: state=%b   ok=%b   busy=%b   done=%b (expect ok=1, busy=0, done=0)\n", state, ok, busy, done);
  end

endmodule: unique_case



`end_keywords
