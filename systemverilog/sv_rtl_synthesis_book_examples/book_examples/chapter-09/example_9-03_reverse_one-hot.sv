//
// Book, "RTL Modeling with SystemVerilog for ASIC and FPGA Design"
// by Stuart Sutherland
//
// 4-bit priority binary-coded-decimal encoder modeled with a series of if-else-if statements.
//
// Copyright 2016, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//

`begin_keywords "1800-2012" // use SystemVerilog-2012 keywords
module reverse_case_without_modifier (
  input  logic [2:0] current_state,
  output logic       get_ready, get_set, get_going
);
  timeunit 1ns/1ns;

always_comb begin 
  {get_ready, get_set, get_going} = 3'b000;
  case (1'b1)
    current_state[0]: get_ready = 1'b1;
    current_state[1]: get_set   = 1'b1;
    current_state[2]: get_going = 1'b1;
  endcase 

//    if      (current_state[0]) get_ready = 1'b1;
//    else if (current_state[1]) get_set   = 1'b1;
//    else if (current_state[2]) get_going = 1'b1;
end 
 
endmodule: reverse_case_without_modifier
`end_keywords
