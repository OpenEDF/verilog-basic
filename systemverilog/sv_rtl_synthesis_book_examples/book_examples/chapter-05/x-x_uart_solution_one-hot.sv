/***********************************************************************
 * A simple UART receiver with a Finite State Machine, decrement
 * counter and a shift register.
 *
 * SystemVerilog Training Workshop.
 *
 * Copyright by Sutherland HDL, Inc.
 * Tualatin, Oregon, USA.
 * www.sutherland-hdl.com
 * All rights reserved.
 **********************************************************************/

module uart
(output logic  [7:0] data,
 output logic        data_rdy,
 input  logic        serial_in, clock, reset);

  timeunit 1ns/1ns;

  logic    [2:0] bit_cnt;
  logic          cntr_rst, shift_en;

  //One-hot state machine encoding
  enum logic [2:0] {
    WAIT  = 3'b001,
    LOAD  = 3'b010,
    READY = 3'b100
  } state, next_state;

  //////////////////////////////////////////////////////////////////////
  // 3-bit Decrement Counter with Synchronous Low-true Reset
  //////////////////////////////////////////////////////////////////////
  always_ff @(posedge clock)
    if (!cntr_rst)
      bit_cnt <= 3'h7;              //reset to full count
    else
      bit_cnt <= bit_cnt - 1'b1;    //decrement counter

  //////////////////////////////////////////////////////////////////////
  // 8-bit Shift Register with Enable and Asyncronous Low-true Preset
  //////////////////////////////////////////////////////////////////////
  always_ff @(posedge clock or negedge reset)
    if (!reset)
      data <= 8'h0;                    //reset
    else if (shift_en)
      data <= {serial_in, data[7:1]};  //shift right

  //////////////////////////////////////////////////////////////////////
  // 3-state State Machine with Asynchronous Reset
  //////////////////////////////////////////////////////////////////////
  // Current State Logic -- sequential logic
  always_ff @(posedge clock or negedge reset)
    if (!reset)
      state <= WAIT;               //reset to wait state
    else
      state <= next_state;

  // Next State logic -- combinational logic
  always_comb  begin  // infers @(state or serial_in or bit_cnt)
    unique case (state)
      WAIT:
        if (serial_in == 1'b0)
          next_state = LOAD;      //start bit sensed
        else
          next_state = WAIT;      //no start bit
      LOAD:
        if (bit_cnt == 3'h0)
          next_state = READY;     //8 bits have been shifted in
        else
          next_state = LOAD;      //need to shift in more bits
      READY:
        next_state   = WAIT;      //return to wait state
      default:
        begin
          $display("ILLEGAL STATE IN FSM %m AT TIME %0d", $time);
          next_state = WAIT;      //return to wait state
        end
    endcase
  end

  // FSM outputs -- Moore architecture
  always_comb begin  // infers @(state)
    unique case (state)
      LOAD:    {cntr_rst,shift_en,data_rdy} = 3'b110;
      READY:   {cntr_rst,shift_en,data_rdy} = 3'b001;
      default: {cntr_rst,shift_en,data_rdy} = 3'b000; //WAIT state values
    endcase
  end

endmodule: uart

