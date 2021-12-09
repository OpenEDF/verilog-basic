//
// Book, "RTL Modeling with SystemVerilog for ASIC and FPGA Design"
// by Stuart Sutherland
//
// Enumerated type snippets.
//
// Copyright 2016, Stuart Sutherland. All rights reserved.
//
// Version 1.0
//

`begin_keywords "1800-2012"

//
// Enumerated type variable using implicit defaults
//
module enum_test_1; 

  enum {WAITE, LOAD, READY} states_e;
  
  initial begin
  	#1;
  	$display("");
  	$display("In %m: WAITE's value is: %0d (expecting 0)", WAITE);
  	$display("");
  end
endmodule: enum_test_1


//
// Enumerated type variable using explicit base type
// and values
//
module enum_test_2; 

  enum logic [2:0] {WAITE = 3'b001,
                    LOAD  = 3'b010,
                    READY = 3'b100} states_e;

  initial begin
  	#2;
  	$display("");
  	$display("In %m: WAITE's value is: %b (expecting 001)", WAITE);
  	$display("");
  end
endmodule: enum_test_2


//
// Enumerated type variable with mix of explicit and
// default label values
//
module enum_test_3; 

  enum logic [3:0] {A=1, B, C, D=13, E, F} list1_e;
  
  initial begin
  	#3;
  	$display("");
  	$display("In %m: B's value is: %0d (expecting 2)", B);
  	$display("In %m: F's value is: %0d (expecting 15)", F);
  	$display("");
  end
endmodule: enum_test_3


//
// Enumerated type variable with mix of explicit and
// default label values, with illegal duplicate values
//
module enum_test_4; 
/***
  enum logic [3:0] {A=1, B, C, D=3} list2_e;   // ERROR

  initial begin
  	#4;
  	$display("");
  	$display("In %m: C's value is: %0d (expecting 3)", C);
  	$display("In %m: D's value is: %0d (expecting compilation error)", D);
  	$display("");
  end
***/
endmodule: enum_test_4


//
// Enumerated type variable with generated labels
//
module enum_test_5; 

  enum logic [1:0] {COUNT_[4]} counts1_e;
  
  initial begin
  	#5;
  	$display("");
  	$display("In %m: COUNT_0's value is: %0d (expecting 0)", COUNT_0);
  	$display("In %m: COUNT_3's value is: %0d (expecting 3)", COUNT_3);
  	$display("");
  end
endmodule: enum_test_5


//
// Enumerated type variable with generated label range
//
module enum_test_6; 

  enum logic [3:0] {COUNT_[8:11]=8} counts2_e;  

  initial begin
  	#6;
  	$display("");
  	$display("In %m: COUNT_8's value is: %0d (expecting 8)", COUNT_8);
  	$display("In %m: COUNT_11's value is: %0d (expecting 11)", COUNT_11);
  	$display("");
  end
endmodule: enum_test_6


//
// Enumerated types with conflicting label names
//
module enum_test_7; 
/***
  enum logic {GO=1'b1, STOP=1'b0} fsm1_states_e;
  //...
  enum logic [1:0] {READY=3'b001, SET=3'b010, GO=3'b100}
    fsm2_states_e;  // ERROR: GO has already been defined
  //...
  initial begin
  	#7;
  	$display("");
  	$display("In %m: Expecting compilation error)");
  	$display("");
  end
***/
endmodule: enum_test_7


//
// Enumerated types with scoped label names
//
module enum_test_8; 
  logic clock;
  
  initial clock <= 1'b1;
  
  always @(posedge clock) begin: fsm1
    enum logic {GO=1'b1, STOP=1'b0} fsm1_states_e;
    //...
  	#8;
  	$display("");
  	$display("In %m: GO's value is: %b (expecting 1)", GO);
  	$display("");
  end: fsm1 
  
  always @(posedge clock) begin: fsm2
    enum logic [2:0] {READY=3'b001, SET=3'b010, GO=3'b100}
      fsm2_states_e;
    //...
  	#8;
  	$display("");
  	$display("In %m: GO's value is: %b (expecting 100)", GO);
  	$display("");
  end: fsm2
  
endmodule: enum_test_8


//
// Typed enumerated types
//
module enum_test_9; 

  typedef enum logic [2:0] {WAITE = 3'b001,
                            LOAD  = 3'b010,
                            READY = 3'b100} states_t;

  states_t state_e, next_state_e;   // 2 enumerated variables

  initial begin
  	#9;
  	$display("");
  	$display("In %m: WAITE's value is: %b (expecting 001)", WAITE);
  	$display("");
  end
endmodule: enum_test_9


//
// Incorrect import of enumerated types from a package
// (enumerated labels not inported)
//
package chip_types;
  
  typedef enum logic [2:0] {WAITE = 3'b001,
                            LOAD  = 3'b010,
                            READY = 3'b100} states_t;
  
endpackage: chip_types

module enum_test_10; 
/***
  logic clk, rstN;
  
  import chip_types::states_t; // imports the states_t name,
                               // only
  states_t  state_e, next_state_e;
  
  always_ff @(posedge clk, negedge rstN)
    if (!rstN) state_e <= WAITE;  // ERROR: "WAITE" has not
                                  // been imported
    else state_e <= next_state_e;
  //... 
  initial begin
  	#10;
  	$display("");
  	$display("In %m: Expecting compilation error)");
  	$display("");
  end
***/
endmodule: enum_test_10


//
// Wildcard import of enumerated types from a package
//
module enum_test_11; 
  logic clk, rstN;
  
  import chip_types::*;   // wildcard import entire package

  states_t  state_e, next_state_e;
  
  always_ff @(posedge clk, negedge rstN)
    if (!rstN) state_e <= WAITE;
    else state_e <= next_state_e;
  //... 
  initial begin
  	#11;
  	$display("");
  	$display("In %m: WAITE's value is: %b (expecting 001)", WAITE);
  	$display("");
  end
endmodule: enum_test_11


//
// Legal and illegal assignments to enumerated variables
//
module enum_test_12; 
  typedef enum logic [2:0] {WAITE = 3'b001,
                            LOAD  = 3'b010,
                            DONE  = 3'b100} states_t;

  typedef enum logic [2:0] {READY = 3'b001,
                            SET   = 3'b010,
                            GO    = 3'b100} flags_t;

  states_t  state, next_state;
  flags_t   run_control;

  initial begin
    next_state = LOAD;  // legal: LOAD is in enumerated list
    
    state = next_state; // legal: state, next_state are same type
    
//    state = 0;  // illegal: must use labels, not literal values
    
//    state = 3'b100; // illegal: must use labels, even though
                    // is same value as the DONE label
    
//    state = READY;  // illegal: READY is not in state’s
                    // enumerated list
    
//    state = run_control;  // illegal: state and run_control are
                          // from different definitions
  end

  logic [2:0] temp;       // non-enumerated variable

  initial begin  
    temp = next_state + 1;  // legal: temp is loosely typed
    
//    state = temp + 1;       // illegal: temp + 1 is not
                            // an enumerated expression
    
//    state = next_state + 1; // illegal: next_state + 1 is not
                            // an enumerated expression
    
//    state++;                // illegal: result of ++ is not
                            // an enumerated expression
    
//    state += next_state;    // illegal: result of += is not
                            // an enumerated expression
  end
  
  initial begin
    state = states_t'(temp);  // legal, even if value of temp
                              // does not match any of the label
                              // values
    
    state = states_t'('X);    // legal: forces state to an
                              // uninitialized or don’t-care
  end
  
  initial begin
  	#12;
  	$display("");
  	$display("In %m: WAITE's value is: %b (expecting 001)", WAITE);
  	$display("In %m: READY's value is: %b (expecting 001)", READY);
  	$display("");
  end
endmodule: enum_test_12


module enum_test_13; 

  parameter [2:0]  WAITE = 3'b001,
                   LOAD  = 3'b010,
                   DONE  = 3'b100;

  logic [2:0] state, next_state;

  logic clk, rstN;
  
  always_ff @(posedge clk or negedge rstN)
    if (!rstN) state <= 0;  // BUG: 0 is not a valid state
    else       state <= next_state;

  initial begin
  	#13;
  	$display("");
  	$display("In %m: WAITE's value is: %b (expecting 001)", WAITE);
  	$display("");
  end
endmodule: enum_test_13

`end_keywords
