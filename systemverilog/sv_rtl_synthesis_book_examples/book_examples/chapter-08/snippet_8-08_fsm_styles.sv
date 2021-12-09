//
// Book, "RTL Modeling with SystemVerilog for ASIC and FPGA Design"
// by Stuart Sutherland
//
// FSM coding style snippets.
//
// Copyright 2016, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//

`begin_keywords "1800-2012"


//
// Snippet 1:
// Moore architecture output decoding
//
module moore_decode; 
  logic cntr_rstN, shift_en, ready;

  enum logic [2:0] {RESET, WAITE, LOAD, READY} state;

always_comb begin 
  case (state)
    RESET: begin 
             cntr_rstN = 0; shift_en = 0; ready = 0;
           end 
    WAITE: begin 
             cntr_rstN = 0; shift_en = 0; ready = 0;
           end 
    LOAD : begin 
             cntr_rstN = 1; shift_en = 1; ready = 0;
           end 
    READY: begin 
             cntr_rstN = 0; shift_en = 0; ready = 1;
           end 
  endcase 
end 

  initial begin
    #(1*10);    // advance to unique time slot for this test number
    state = WAITE;
    #1;
    $display("\n%m: state=%-6s {cntr_rstN,shift_en,ready}=%b (expect 000)", state.name, {cntr_rstN,shift_en,ready});
    state = LOAD;
    #1;
    $display("%m: state=%-6s {cntr_rstN,shift_en,ready}=%b (expect 110)", state.name, {cntr_rstN,shift_en,ready});
    state = READY;
    #1;
    $display("%m: state=%-6s {cntr_rstN,shift_en,ready}=%b (expect 001)\n", state.name, {cntr_rstN,shift_en,ready});
  end

endmodule: moore_decode


//
// Snippet 2:
// Mealy architecture output decoding
//
module mealy_decode; 
  logic cntr_rstN, shift_en, ready;
  logic data_valid;

  enum logic [2:0] {RESET, WAITE, LOAD, READY} state;

always_comb begin 
  case (state)
    RESET: begin 
             cntr_rstN = 0; shift_en = 0; ready = 0;
           end 
    WAITE: begin 
             cntr_rstN = 0; shift_en = 0; ready = 0;
           end 
    LOAD : begin 
             cntr_rstN = 1; shift_en = 1; ready = 0;
           end 
    READY: begin 
             cntr_rstN = 0; shift_en = 0;
             if (data_valid) ready   = 1;
             else            ready   = 0;
           end 
  endcase 
end 

  initial begin
    #(2*10);    // advance to unique time slot for this test number
    data_valid = 0;
    state = WAITE;
    #1;
    $display("\n%m: state=%-6s data_valid=%b  {cntr_rstN,shift_en,ready}=%b (expect 000)", state.name, data_valid, {cntr_rstN,shift_en,ready});
    state = LOAD;
    #1;
    $display("%m: state=%-6s data_valid=%b  {cntr_rstN,shift_en,ready}=%b (expect 110)", state.name, data_valid, {cntr_rstN,shift_en,ready});
    state = READY;
    #1;
    $display("%m: state=%-6s data_valid=%b  {cntr_rstN,shift_en,ready}=%b (expect 000)\n", state.name, data_valid, {cntr_rstN,shift_en,ready});
  end

endmodule: mealy_decode


//
// Snippet 3:
// Binary encoding
//
module default_binary_encoding; 

// default binary encoding (RESET=0, WAITE=1, LOAD=2, ...)
typedef enum logic [1:0] {RESET,WAITE,LOAD,READY} states_t;

states_t state, next_state;

  initial begin
    #(3*10);    // advance to unique time slot for this test number
    $display("%m: No simulation output -- only verifying that the code compiles.\n");
  end

endmodule: default_binary_encoding


//
// Snippet 4:
// Binary encoding
//
module explicit_binary_encoding; 

// explicit binary encoding
typedef enum logic [1:0] {RESET = 0,
                          WAITE = 1,
                          LOAD  = 2,
                          READY = 3
                         } states_t;

states_t state, next_state;

  initial begin
    #(4*10);    // advance to unique time slot for this test number
    $display("%m: No simulation output -- only verifying that the code compiles.\n");
  end

endmodule: explicit_binary_encoding


//
// Snippet 5:
// One-hot encoding
//
module onehot_encoding; 

// one-hot encoding
typedef enum logic [3:0] {RESET = 4'b0001,
                          WAITE = 4'b0010,
                          LOAD  = 4'b0100,
                          READY = 4'b1000
                         } states_t;

states_t state, next_state;

  initial begin
    #(5*10);    // advance to unique time slot for this test number
    $display("%m: No simulation output -- only verifying that the code compiles.\n");
  end

endmodule: onehot_encoding


//
// Snippet 6:
// One-hot-0 encoding
//
module onehot0_encoding; 

// one-hot-0 encoding
typedef enum logic [2:0] {RESET = 3'b000,
                          WAITE = 3'b001,
                          LOAD  = 3'b010,
                          READY = 3'b100
                         } states_t;

states_t state, next_state;

  initial begin
    #(6*10);    // advance to unique time slot for this test number
    $display("%m: No simulation output -- only verifying that the code compiles.\n");
  end

endmodule: onehot0_encoding


//
// Snippet 7:
// Gray code encoding
//
module gray_code_encoding; 

// Gray code encoding
typedef enum logic [1:0] {RESET = 2'b00,
                          WAITE = 2'b01,
                          LOAD  = 2'b10,
                          READY = 2'b11
                         } states_t;

states_t state, next_state;

  initial begin
    #(7*10);    // advance to unique time slot for this test number
    $display("%m: No simulation output -- only verifying that the code compiles.\n");
  end

endmodule: gray_code_encoding


//
// Snippet 8:
// Johnson count encoding
//
module johnson_count_encoding; 

// Johnson count encoding
typedef enum logic [1:0] {RESET = 2'b00,
                          WAITE = 2'b10,
                          LOAD  = 2'b11,
                          READY = 2'b01
                         } states_t;

states_t state, next_state;

  initial begin
    #(8*10);    // advance to unique time slot for this test number
    $display("%m: No simulation output -- only verifying that the code compiles.\n");
  end

endmodule: johnson_count_encoding


//
// Snippet 9:
// State parameters
//
module fsm_parameters; 

// one-hot encoding
localparam [3:0] RESET = 4'b0001,
                 WAITE = 4'b0010,
                 LOAD  = 4'b0100,
                 READY = 4'b1000;

logic [3:0] state, next_state;

  initial begin
    #(9*10);    // advance to unique time slot for this test number
    $display("%m: No simulation output -- only verifying that the code compiles.\n");
  end

endmodule: fsm_parameters


//
// Snippet 10:
// Three process FSM with incomplete pseudocode
//
module three_process_fsm_pseudocode; 
  typedef enum logic [1:0] {RESET,WAITE,LOAD,READY} states_t;
  states_t state, next_state;

  logic clock, resetN, output_signals;

//////////////////////////////////////////////////
// Current State Sequencer -- sequential logic
//////////////////////////////////////////////////
always_ff @(posedge clock or negedge resetN)
  if (!resetN)
    state <= RESET;
  else 
    state <= next_state;

//////////////////////////////////////////////////
// Next State Decoder -- combinational logic
//////////////////////////////////////////////////
always_comb  begin 
  case (state)
    RESET: next_state = WAITE; //...
    WAITE: next_state = LOAD;  //...
    LOAD:  next_state = READY; //...
    READY: next_state = WAITE; //...
  endcase 
end 

//////////////////////////////////////////////////
// Output Decoder -- combinational logic
//////////////////////////////////////////////////
always_comb begin 
  case (state)
    RESET: output_signals = 0; //... 
    WAITE: output_signals = 0; //... 
    LOAD:  output_signals = 0; //...
    READY: output_signals = 0; //...
  endcase 
end 

  initial begin
    #(10*10);    // advance to unique time slot for this test number
    $display("%m: No simulation output -- only verifying that the code compiles.\n");
  end

endmodule: three_process_fsm_pseudocode


//
// Snippet 11:
// Highly enncoded state values
//
module highly_encoded_states; 
  logic cntr_rstN, shift_en, ready;
  
// highly encoded states -- lower 3 bits equal output values
typedef enum logic [3:0] {RESET = 4'b0_000,
                          WAITE = 4'b1_000,
                          LOAD  = 4'b1_110,
                          READY = 4'b1_001
                         } states_t;

states_t state, next_state;

assign {cntr_rstN,shift_en,ready} = state[2:0];

  initial begin
    #(11*10);    // advance to unique time slot for this test number
    $display("%m: No simulation output -- only verifying that the code compiles.\n");
  end

endmodule: highly_encoded_states


//
// Snippet 12:
// One process FSM with incomplete pseudocode
//
module one_process_fsm_pseudocode; 
  typedef enum logic [1:0] {RESET,WAITE,LOAD,READY} states_t;
  states_t state, next_state;

  logic clock, resetN, serial_in, downcount, output_signals;

/// State Sequencer with next state and output decoding ///
always_ff @(posedge clock or negedge resetN)
  if (!resetN)
    state <= RESET;
  else begin 
    case (state)
      RESET: begin 
        state <= WAITE; //...
        output_signals = 0; //...
      end 
      WAITE: begin 
        if (serial_in) begin 
          state <= WAITE; //...
          output_signals = 0; //...
        end 
        else begin 
          state <= LOAD; //...
          output_signals = 0; //...
        end 
      end 
      LOAD:  begin 
        if (downcount) begin 
          state <= LOAD; //...
          output_signals = 0; //...
        end 
        else begin 
          state <= READY; //...
          output_signals = 0; //...
        end 
      end 
      READY: begin 
        state <= WAITE; //...
        output_signals = 0; //...
      end 
    endcase 
  end 

  initial begin
    #(12*10);    // advance to unique time slot for this test number
    $display("%m: No simulation output -- only verifying that the code compiles.\n");
  end

endmodule: one_process_fsm_pseudocode

//
// Snippet 13:
// Conventional style case statement
//
module conventional_case; 
  logic serial_in, downcount;
  
  // one-hot values
  typedef enum logic [3:0] {RESET = 4'b0001,
                            WAITE = 4'b0010,
                            LOAD  = 4'b0100,
                            READY = 4'b1000
                           } states_t;
  
  states_t state, next;

always_comb begin 
  unique case (state)
    RESET: next = WAITE;
    WAITE: next = serial_in? WAITE : LOAD;
    LOAD:  next = downcount? LOAD : READY;
    READY: next = WAITE;
  endcase 
end 

  initial begin
    #(13*10);    // advance to unique time slot for this test number
    $display("%m: No simulation output -- only verifying that the code compiles.\n");
  end

endmodule: conventional_case


//
// Snippet 14:
// Reverse case statement with literal values
//
module reverse_case_1; 
  logic serial_in, downcount;
  
typedef enum logic [3:0] {
  RESET = 4'b0001, // one-hot encoding
  WAITE = 4'b0010,
  LOAD  = 4'b0100,
  READY = 4'b1000
} states_t;

states_t state, next;

always_comb begin 
  unique case (1'b1)
    state[0]: next = WAITE;
    state[1]: next = serial_in? WAITE : LOAD;
    state[2]: next = downcount? LOAD : READY;
    state[3]: next = WAITE;
  endcase 
end 

  initial begin
    #(14*10);    // advance to unique time slot for this test number
    $display("%m: No simulation output -- only verifying that the code compiles.\n");
  end

endmodule: reverse_case_1

//
// Snippet 15:
// Reverse case statement with bit-number parameters
//
module reverse_case_2; 
  logic serial_in, downcount;
  
localparam RESET_BIT = 0,  // index of RESET one-hot bit
           WAITE_BIT = 1,  // index of WAITE one-hot bit
           LOAD_BIT  = 2,  // index of LOAD  one-hot bit
           READY_BIT = 3;  // index of READY one-hot bit

logic [3:0] state, next;

always_comb begin 
  next = '0;  // clear all bits in next
  unique case (1'b1)
    state[RESET_BIT]:                next[WAITE_BIT] = 1'b1;
    state[WAITE_BIT]: if (serial_in) next[WAITE_BIT] = 1'b1;
                      else           next[LOAD_BIT ] = 1'b1;
    state[LOAD_BIT ]: if (downcount) next[LOAD_BIT ] = 1'b1;
                      else           next[READY_BIT] = 1'b1;
    state[READY_BIT]:                next[WAITE_BIT] = 1'b1;
  endcase 
end 

  initial begin
    #(15*10);    // advance to unique time slot for this test number
    $display("%m: No simulation output -- only verifying that the code compiles.\n");
  end

endmodule: reverse_case_2


//
// Snippet 16:
// Reverse case statement with bit-number parameters
//
module reverse_case_3; 
  logic serial_in, downcount;
  
localparam RESET_BIT = 0,  // index of RESET one-hot bit
           WAITE_BIT = 1,  // index of WAITE one-hot bit
           LOAD_BIT  = 2,  // index of LOAD  one-hot bit
           READY_BIT = 3;  // index of READY one-hot bit

typedef enum logic [3:0] {
  RESET = 4'b0001 << RESET_BIT, // set the RESET bit
  WAITE = 4'b0001 << WAITE_BIT, // set the WAITE bit
  LOAD  = 4'b0001 << LOAD_BIT,  // set the LOAD bit
  READY = 4'b0001 << READY_BIT  // set the READY bit
} states_t;

states_t state, next;

always_comb begin 
  unique case (1'b1)
    state[RESET_BIT]: next = WAITE;
    state[WAITE_BIT]: next = serial_in? WAITE : LOAD;
    state[LOAD_BIT ]: next = downcount? LOAD : READY;
    state[READY_BIT]: next = WAITE;
  endcase 
end 

  initial begin
    #(16*10);    // advance to unique time slot for this test number
    $display("%m: No simulation output -- only verifying that the code compiles.\n");
  end

endmodule: reverse_case_3



`end_keywords
