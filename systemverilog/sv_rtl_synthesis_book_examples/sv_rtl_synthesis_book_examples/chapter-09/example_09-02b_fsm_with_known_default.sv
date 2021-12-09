//
// Book, "RTL Modeling with SystemVerilog for Simulation and Synthesis"
// by Stuart Sutherland, published by Sutherland HDL, Inc.
//
// FSM with one-hot next_state decoder.
//
// Copyright 2017, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//


//
// Simple FSM next state decoder with default branch to avoid latches.
//

//`begin_keywords "1800-2012" // use SystemVerilog-2012 keywords
module simple_fsm_with_default
(input  logic clk, rstN,
 output logic get_ready, get_set, get_going
);
  timeunit 1ns; timeprecision 1ns;

  typedef enum logic [2:0] {RESET = 3'b000, // Johnson Count
                            READY = 3'b001,
                            SET   = 3'b011,
                            GO    = 3'b111} states_t;

  states_t current_state, next_state;
  
  // state sequencer
  always_ff @(posedge clk or negedge rstN)  // async reset
    if (!rstN) current_state <= RESET;      // active-low reset
    else       current_state <= next_state;
  
  // next state decoder
always_comb begin  
  case (current_state)
    RESET  : next_state = READY;
    READY  : next_state = SET;
    SET    : next_state = GO;
    GO     : next_state = READY;
    default: next_state = RESET;  // reset if state error
  endcase 
end 

  // output decoder (using pre-case default assignment)
  always_comb begin 
    {get_ready, get_set, get_going} = '0; // clear all bits
    case (current_state)
      READY  : get_ready = '1;
      SET    : get_set   = '1;
      GO     : get_going = '1;
    endcase 
  end 
endmodule: simple_fsm_with_default
//`end_keywords 
