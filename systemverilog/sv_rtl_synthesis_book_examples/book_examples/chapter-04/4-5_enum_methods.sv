//
// Book, "RTL Modeling with SystemVerilog for ASIC and FPGA Design"
// by Stuart Sutherland
//
// State machine model for a confidence counter modeled using
// enumerated type methods.
//
// Copyright 2016, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//

`begin_keywords "1800-2012" // use SystemVerilog-2012 keywords
module confidence_counter
(input  logic data_matches, compare_en, rstN, clk,
 output logic data_synched
);
  timeunit 1ns/1ns;

  typedef enum  logic [3:0] {COUNT[0:15]} states_enum_t;

  states_enum_t CurState, NextState;

  // sequential block
  always_ff @(posedge clk, negedge rstN)
    if (!rstN) CurState <= COUNT0;
    else       CurState <= NextState;

  // next state combination logic block
  always_comb begin
    if (!compare_en)
      NextState = CurState;  // not comparing (no state change)
    else if (data_matches)   // compare_en && data_matches
      case (CurState)
        COUNT15 : ; // can't increment past 15
        default: NextState = CurState.next;  // increment by 1
      endcase
    else                     // compare_en && !data_matches
      case (CurState)
        COUNT0 : ; // can't decrement below 0
        COUNT1 : NextState = CurState.prev(1);  // decrement by 1
        default: NextState = CurState.prev(2);  // decrement by 2
      endcase
  end

  // register output block
  always_ff @(posedge clk, negedge rstN)
    if (!rstN)
      data_synched <= 0;
    else
      begin
        if (CurState == COUNT8)
          data_synched <= 1;
        else if (CurState == COUNT0)
          data_synched <= 0;
      end
endmodule: confidence_counter
`end_keywords
