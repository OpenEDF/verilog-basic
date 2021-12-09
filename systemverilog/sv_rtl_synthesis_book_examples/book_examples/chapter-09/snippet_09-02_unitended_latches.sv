//
// Book, "RTL Modeling with SystemVerilog for ASIC and FPGA Design"
// by Stuart Sutherland
//
// Unintentional latch snippets.
//
// Copyright 2016, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//

`begin_keywords "1800-2012"


//
// Snippet 1:
// Fully specified case statement - no inferred latches
//
module mux_with_full_case; 
  logic [7:0] a, b, c, d, y;  // 8-bit variables
  logic [1:0] select;         // scalar (1-bit) variable

  always_comb begin 
    case (select)
      2'b00: y = a;
      2'b01: y = b;
      2'b10: y = c;
      2'b11: y = d;
    endcase 
  end 
  
  initial begin
    #(1*10);    // advance to unique time slot for this test number
    a=8'h01; b=8'h01; c=8'h02; d=8'h03; 
    select = 2'b01;  // select b input
    #1;
    $display("\n%m: a=%0d  b=%0d  c=%0d  d=%0d  select=%b  : y=%0d (expect y=1)", a, b, c, d, select, y);
    #1;
    select = 1'b0;  // y2 branch
    #1;
    select = 2'b11;  // select d input
    #1;
    $display("%m: a=%0d  b=%0d  c=%0d  d=%0d  select=%b  : y=%0d (expect y=3)\n", a, b, c, d, select, y);
  end
endmodule: mux_with_full_case


//
// Snippet 2:
// partially specified case statement - infers latches
//
module mux_with_partial_case; 
  logic [7:0] a, b, c, y;  // 8-bit variables
  logic [1:0] select;      // scalar (1-bit) variable

  always_comb begin 
    case (select)
      2'b00: y = a;
      2'b01: y = b;
      2'b10: y = c;
    endcase 
  end 
  
  initial begin
    #(2*10);    // advance to unique time slot for this test number
    a=8'h01; b=8'h01; c=8'h02; 
    select = 2'b01;  // select b input
    #1;
    $display("\n%m: a=%0d  b=%0d  c=%0d  select=%b  : y=%0d (expect y=1)", a, b, c, select, y);
    #1;
    select = 1'b0;  // y2 branch
    #1;
    select = 2'b11;  // select invalid input
    #1;
    $display("%m: a=%0d  b=%0d  c=%0d  select=%b  : y=%0d (expect y=1 -- previous value)\n", a, b, c, select, y);
  end
endmodule: mux_with_partial_case


//
// Snippet 3:
// one-hot decoder - infers latches
//
module one_hot_decoder_1; 
  logic [2:0] current_state;
  logic [4:0] control_bus;

always_comb begin 
  case (current_state)
    3'b001: control_bus = 5'b01101;
    3'b010: control_bus = 5'b10101;
    3'b100: control_bus = 5'b11100;
  endcase 
end  
  
  initial begin
    #(3*10);    // advance to unique time slot for this test number
    current_state = 3'b001; 
    #1;
    $display("\n%m: current_state=%b  : control_bus=%b (expect 01101)", current_state, control_bus);
    #1;
    current_state = 3'b100; 
    #1;
    $display("%m: current_state=%b  : control_bus=%b (expect 11100)\n", current_state, control_bus);
  end
endmodule: one_hot_decoder_1


//
// Snippet 4:
// Series of unique if-else decisions
//
module if_else_if_series; 
  logic [7:0] a, b, y;
  logic [1:0] opcode;

always_comb begin 
  unique if (opcode == 2'b00) y = a + b;
  else   if (opcode == 2'b01) y = a - b;
  else   if (opcode == 2'b10) y = a * b;
end 

  initial begin
    #(4*10);    // advance to unique time slot for this test number
    a = 8'h5; b = 8'h3;
    opcode = 2'b01;
    #1;
    $display("\n%m: opcode=%b  a=%0d  b=%0d  y=%0d  (expect y=2)\n", opcode, a, b, y);
    opcode = 2'b11;  // undefined operation
    #1;
    $display("\n%m: opcode=%b  a=%0d  b=%0d  y=%0d  (expect y=2 (retain previous value)\n", opcode, a, b, y);
  end

endmodule: if_else_if_series


//
// Snippet 5:
// 3-to-1 mux with incomplete case statement
//
module mux3to1_a;
  logic [7:0] y, a, b, c;
  logic [1:0] select;

always_comb begin 
  case (select)    // synthesis full_case
    2'b00: y = a;
    2'b01: y = b;
    2'b10: y = c;
  endcase 
end 
 
  initial begin
    #(5*10);    // advance to unique time slot for this test number
    select=2'b00;
    a=8'h01; b=8'h02; c=8'h03; 
    #1;
    $display("\n%m: select=%b  y=%0d : (expect y=1)", select, y);
    #0 select=2'b01;
    #1;
    $display("%m: select=%b  y=%0d : (expect y=2)", select, y);
    #0 select=2'b10;
    #1;
    $display("%m: select=%b  y=%0d : (expect y=3)", select, y);
    #0 select=2'b11;
    #1;
    $display("%m: select=%b  y=%0d : (expect y=3 with no warning about invalid select value)\n", select, y);
  end
  
endmodule: mux3to1_a


`end_keywords
