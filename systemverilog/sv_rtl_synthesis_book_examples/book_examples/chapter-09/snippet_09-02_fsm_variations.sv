//
// Book, "RTL Modeling with SystemVerilog for ASIC and FPGA Design"
// by Stuart Sutherland
//
// Snippets of coding style variations to avoid unintentional latches.
//
// Copyright 2016, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//

`begin_keywords "1800-2012"


//
// Snippet 1:
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
    READY: next_state = SET;
    SET  : next_state = GO;
    GO   : next_state = READY;
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
    #(1*10);    // advance to unique time slot for this test number
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
// Snippet 2:
// FSM next state decoder with default assignment of a known value
//
module fsm_next_state_2;
  logic get_ready, get_set, get_going, clock, resetN;

  typedef enum logic [2:0] {READY= 3'b001,
                            SET  = 3'b010,
                            GO   = 3'b100} states_t;
  
  states_t current_state, next_state;

always_comb begin 
  case (current_state)
    READY  : next_state = SET;
    SET    : next_state = GO;
    GO     : next_state = READY;
    default: next_state = READY;
  endcase 
end 

  always @(posedge clock or negedge resetN)
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
    #(2*10);    // advance to unique time slot for this test number
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
    #1 current_state = states_t'(3'b000);  // undefined state
    #1 clock = 0;
    $display  ("%m: current_state=%3b    next_state=%3b  :  expect 000, xxx)\n", current_state, next_state);
  end
  
endmodule: fsm_next_state_2


//
// Snippet 3:
// FSM next state decoder with initial assignment of a known value
//
module fsm_next_state_3;
  logic get_ready, get_set, get_going, clock, resetN;

  typedef enum logic [2:0] {READY= 3'b001,
                            SET  = 3'b010,
                            GO   = 3'b100} states_t;
  
  states_t current_state, next_state;

always_comb begin 
  next_state = READY;
  case (current_state)
    READY: next_state = SET;
    SET  : next_state = GO;
    GO   : next_state = READY;
  endcase 
end 

  always @(posedge clock or negedge resetN)
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
    #1 current_state = states_t'(3'b000);  // undefined state
    #1 clock = 0;
    $display  ("%m: current_state=%3b    next_state=%3b  :  expect 000, xxx)\n", current_state, next_state);
  end
  
endmodule: fsm_next_state_3


//
// Snippet 47:
// FSM next state decoder with unique case
//
module fsm_next_state_4;
  logic get_ready, get_set, get_going, clock, resetN;

  typedef enum logic [2:0] {READY= 3'b001,
                            SET  = 3'b010,
                            GO   = 3'b100} states_t;
  
  states_t current_state, next_state;

always_comb begin 
  unique case (current_state)
    READY: next_state = SET;
    SET  : next_state = GO;
    GO   : next_state = READY;
  endcase 
end 

  always @(posedge clock or negedge resetN)
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
    #(4*10);    // advance to unique time slot for this test number
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
    #1 current_state = states_t'(3'b000);  // undefined state
    #1 clock = 0;
    $display  ("%m: current_state=%3b    next_state=%3b  :  expect 000, xxx)\n", current_state, next_state);
  end
  
endmodule: fsm_next_state_4


//
// Snippet 5:
// FSM next state decoder with X default assignment
//
module fsm_next_state_5;
  logic get_ready, get_set, get_going, clock, resetN;

  typedef enum logic [2:0] {READY= 3'b001,
                            SET  = 3'b010,
                            GO   = 3'b100} states_t;
  
  states_t current_state, next_state;

always_comb begin 
  case (current_state)
    READY  : next_state = SET;
    SET    : next_state = GO;
    GO     : next_state = READY;
    default: next_state = states_t'('x); //don’t care branch
  endcase 
end 

  always @(posedge clock or negedge resetN)
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
    #(5*10);    // advance to unique time slot for this test number
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
    #1 current_state = states_t'(3'b000);  // undefined state
    #1 clock = 0;
    $display  ("%m: current_state=%3b    next_state=%3b  : (expect 000, xxx)\n", current_state, next_state);
  end
  
endmodule: fsm_next_state_5


//
// Snippet 6:
// FSM next state decoder with X default assignment
//
module fsm_next_state_6;
  logic get_ready, get_set, get_going, clock, resetN;

  typedef enum logic [2:0] {READY= 3'b001,
                            SET  = 3'b010,
                            GO   = 3'b100} states_t;
  
  states_t current_state, next_state;

always_comb begin 
  next_state = states_t'('x); // don’t care value
  case (current_state)
    READY  : next_state = SET;
    SET    : next_state = GO;
    GO     : next_state = READY;
  endcase 
end 

  always @(posedge clock or negedge resetN)
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
    #(6*10);    // advance to unique time slot for this test number
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
    #1 current_state = states_t'(3'b000);  // undefined state
    #1 clock = 0;
    $display  ("%m: current_state=%3b    next_state=%3b  : (expect 000, xxx)\n", current_state, next_state);
  end
  
endmodule: fsm_next_state_6


//
// Snippet 7:
// FSM next state decoder with full_case pragma
//
module fsm_next_state_7;
  logic get_ready, get_set, get_going, clock, resetN;

  typedef enum logic [2:0] {READY= 3'b001,
                            SET  = 3'b010,
                            GO   = 3'b100} states_t;
  
  states_t current_state, next_state;

always_comb begin // synthesis full_case 
  case (current_state)
    READY  : next_state = SET;
    SET    : next_state = GO;
    GO     : next_state = READY;
  endcase 
end 

  always @(posedge clock or negedge resetN)
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
    #(7*10);    // advance to unique time slot for this test number
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
    #1 current_state = states_t'(3'b000);  // undefined state
    #1 clock = 0;
    $display  ("%m: current_state=%3b    next_state=%3b  : (expect 000, 001)\n", current_state, next_state);
  end
  
endmodule: fsm_next_state_7

`end_keywords
