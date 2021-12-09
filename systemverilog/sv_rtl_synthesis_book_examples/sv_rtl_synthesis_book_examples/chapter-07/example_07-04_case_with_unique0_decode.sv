//
// Book, "RTL Modeling with SystemVerilog for Simulation and Synthesis"
// by Stuart Sutherland, published by Sutherland HDL, Inc.
//
// Reverse-case next_state decoder that infers priority-encoded logic.
//
// Copyright 2017, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//

//`begin_keywords "1800-2012" // use SystemVerilog-2012 keywords
module case_with_unique0_decode
(input  logic [2:0] current_state,
 output logic       get_ready, get_set, get_going
);

  typedef enum logic [2:0] {READY= 3'b001,
                            SET  = 3'b010,
                            GO   = 3'b100} states_t;
  
  always_comb begin 
    {get_ready, get_set, get_going} = 3'b000;
    unique0 case (1'b1)
 //   unique case (1'b1)                          // work-around if unique0 not supported
      current_state[0]: get_ready = '1;
      current_state[1]: get_set   = '1;
      current_state[2]: get_going = '1;
    endcase 
  end 

endmodule: case_with_unique0_decode
//`end_keywords