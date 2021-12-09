//
// Book, "RTL Modeling with SystemVerilog for ASIC and FPGA Design"
// by Stuart Sutherland
//
// Priority decision snippets.
//
// Copyright 2016, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//

`begin_keywords "1800-2012"


//
// Snippet 1:
// Priority encoded logic using if-else-if
//
module bcd_decoder_if_else; 
  logic [3:0] data_in;
  logic [7:0] bcd_out;

always_comb begin 
  if      (data_in[3]) bcd_out = 4;  // bit 3 is set
  else if (data_in[2]) bcd_out = 3;  // bit 2 is set
  else if (data_in[1]) bcd_out = 2;  // bit 1 is set
  else if (data_in[0]) bcd_out = 1;  // bit 0 is set
  else                 bcd_out = 0;  // no bits are set
end 
  
  initial begin
    #(1*10);    // advance to unique time slot for this test number
    data_in=4'h3; 
    #1;
    $display("\n%m: data_in=%b  : bcd_out=%0d (expect 2)", data_in, bcd_out);
    #1;
    data_in=4'hA; 
    #1;
    $display("%m: data_in=%b  : bcd_out=%0d (expect 4)\n", data_in, bcd_out);
  end
endmodule: bcd_decoder_if_else


//
// Snippet 2:
// Priority encoded logic using case statement
//
module bcd_decoder_case; 
  logic [3:0] data_in;
  logic [7:0] bcd_out;

always_comb begin 
  case (1'b1)
    data_in[3]: bcd_out = 4;  // bit 3 is set
    data_in[2]: bcd_out = 3;  // bit 2 is set
    data_in[1]: bcd_out = 2;  // bit 1 is set
    data_in[0]: bcd_out = 1;  // bit 0 is set
    default   : bcd_out = 0;  // no bits are set
  endcase 
end 
  
  initial begin
    #(2*10);    // advance to unique time slot for this test number
    data_in=4'h3; 
    #1;
    $display("\n%m: data_in=%b  : bcd_out=%0d (expect 2)", data_in, bcd_out);
    #1;
    data_in=4'hA; 
    #1;
    $display("%m: data_in=%b  : bcd_out=%0d (expect 4)\n", data_in, bcd_out);
  end
endmodule: bcd_decoder_case


//
// Snippet 3:
// FSM next state decoder with inferred latches
//
module fsm_next_state_1;
  logic get_ready, get_set, get_going, clock, resetN;

typedef enum logic [2:0] {READY= 3'b001,
                          SET  = 3'b010,
                          GO   = 3'b100} states_t;

states_t current_state, next_state;

always_comb begin 
  case (current_state)
    3'b001: next_state = SET;
    3'b010: next_state = GO;
    3'b100: next_state = READY;
  endcase 
end 

  always_ff @(posedge clock or negedge resetN)
    if (!resetN) current_state <= READY;
    else         current_state <= next_state;
  
  always_comb begin
    {get_ready, get_set, get_going} = 3'b000;
    case (current_state)
      READY: get_ready = 1'b1;
      SET  : get_set   = 1'b1;
      GO   : get_going = 1'b1;
    endcase 
  end 
 
  initial begin
    #(3*10);    // advance to unique time slot for this test number
    #0 resetN = 0;
    #1 clock = 0;
    #1 clock = 1;
    #1 clock = 0;
    $display("\n%m: current_state=%-5s  next_state=%-5s: (expect READY, SET)", current_state.name, next_state.name);
    #0 resetN = 1;
    #1 clock = 1;
    #1 clock = 0;
    $display  ("%m: current_state=%-5s  next_state=%-5s: (expect SET, GO)", current_state.name, next_state.name);
    #1 clock = 1;
    #1 clock = 0;
    $display  ("%m: current_state=%-5s  next_state=%-5s: (expect GO, READY)\n", current_state.name, next_state.name);
  end
  
endmodule: fsm_next_state_1


//
// Snippet 4:
// FSM next state decoder with reverse case statement
//
module reverse_case_1;
  logic get_ready, get_set, get_going;
  logic [2:0] current_state;

always_comb begin 
  {get_ready, get_set, get_going} = 3'b000;
  case (1'b1)
    current_state[0]: get_ready = 1'b1;
    current_state[1]: get_set   = 1'b1;
    current_state[2]: get_going = 1'b1;
  endcase 
end 
 
  initial begin
    #(4*10);    // advance to unique time slot for this test number
    current_state=3'b001; 
    #1;
    $display("\n%m: current_state=%b  : {get_ready,get_set, get_going}=%b (expect 100)", current_state, {get_ready,get_set, get_going} );
    #1;
    current_state=3'b010; 
    #1;
    $display("%m: current_state=%b  : {get_ready,get_set, get_going}=%b (expect 010)\n", current_state, {get_ready,get_set, get_going} );
  end
  
endmodule: reverse_case_1


`end_keywords
