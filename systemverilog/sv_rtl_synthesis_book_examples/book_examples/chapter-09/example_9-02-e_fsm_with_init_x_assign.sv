//
// Book, "RTL Modeling with SystemVerilog for ASIC and FPGA Design"
// by Stuart Sutherland
//
// FSM with one-hot next_state decoder -- infers latches.
//
// Copyright 2016, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//


//
// Simple FSM next state decoder with initial assignment to avoid latches.
//

`begin_keywords "1800-2012" // use SystemVerilog-2012 keywords
package fsm_types_pkg;
  timeunit 1ns/1ns;
  typedef enum logic [2:0] {READY = 3'b001,
                            SET   = 3'b010,
                            GO    = 3'b100} states_t;
endpackage: fsm_types_pkg
`end_keywords

`begin_keywords "1800-2012" // use SystemVerilog-2012 keywords
module simple_fsm
(input  logic clock, resetN,
 output logic get_ready, get_set, get_going
);
  timeunit 1ns/1ns;

  import fsm_types_pkg::*;
  states_t current_state, next_state;
  
  // state sequencer
  always_ff @(posedge clock or negedge resetN)
    if (!resetN) current_state <= READY;
    else         current_state <= next_state;
  
  // next state decoder
  always_comb begin  
    next_state = states_t'('x); // don’t care value
    case (current_state)
      READY  : next_state = SET;
      SET    : next_state = GO;
      GO     : next_state = READY;
    endcase 
  end 

  // output decoder  
  always_comb begin 
    {get_ready, get_set, get_going} = 3'b000;
    case (current_state)
      READY: get_ready = 1'b1;
      SET  : get_set   = 1'b1;
      GO   : get_going = 1'b1;
    endcase 
  end 
 
endmodule: simple_fsm
`end_keywords
