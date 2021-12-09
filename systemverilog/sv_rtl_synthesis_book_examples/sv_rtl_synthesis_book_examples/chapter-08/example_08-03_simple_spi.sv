//
// Book, "RTL Modeling with SystemVerilog for Simulation and Synthesis"
// by Stuart Sutherland, published by Sutherland HDL, Inc.
//
// Simple Serial-to-Parallel Interface (SPI).
//
// Copyright 2017, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//

//`begin_keywords "1800-2012" // use SystemVerilog-2012 keywords
module simple_spi
(output logic  [7:0] data,
 output logic        data_rdy,
 input  logic        serial_in, clk, rstN);

  timeunit 1ns; timeprecision 1ns;

  logic    [2:0] downcount;
  logic          cntr_rstN, shift_en;

  // One-hot-0 state machine encoding
  typedef enum logic [2:0] {
    RESET = 3'b000,
    WAITE = 3'b001,
    LOAD  = 3'b010,
    READY = 3'b100
  } states_t;
  
  states_t state, next_state;  // internal state variables

  //////////////////////////////////////////////////////////
  // 4-state State Machine with async active-low reset
  //////////////////////////////////////////////////////////

  // Current State Logic -- sequential logic
  always_ff @(posedge clk or negedge rstN)
    if (!rstN)
      state <= RESET;
    else 
      state <= next_state;

  // Next State logic -- combinational logic
  always_comb  begin 
    unique case (state)
      RESET:
        next_state = WAITE;    // move out of reset
      WAITE:
        if (serial_in == '0)
          next_state = LOAD;   // start bit sensed
        else 
          next_state = WAITE;  // no start bit
      LOAD:
        if (downcount == '0)
          next_state = READY;  // 8 bits are loaded
        else 
          next_state = LOAD;   // keep loading
      READY:
        next_state   = WAITE;  // return to wait state
    endcase 
  end 

  // FSM outputs -- Moore architecture
  always_comb begin 
    unique case (state)
      RESET: {cntr_rstN, shift_en, data_rdy} = 3'b000; 
      WAITE: {cntr_rstN, shift_en, data_rdy} = 3'b000; 
      LOAD:  {cntr_rstN, shift_en, data_rdy} = 3'b110;
      READY: {cntr_rstN, shift_en, data_rdy} = 3'b001;
    endcase 
  end 

  //////////////////////////////////////////////////////////
  //8-bit shift register with enable, async active-low reset
  //////////////////////////////////////////////////////////
  always_ff @(posedge clk or negedge rstN)
    if (!rstN)
      data <= '0;
    else if (shift_en)
      data <= {serial_in, data[7:1]};

  //////////////////////////////////////////////////////////
  // 3-bit Decrement Counter with async active-low reset
  //////////////////////////////////////////////////////////
  always_ff @(posedge clk)  // synchronous active-low reset
    if (!cntr_rstN)
      downcount <= '1;              // reset to full count
    else 
      downcount <= downcount - 1;   // decrement counter

endmodule: simple_spi
//`end_keywords 
