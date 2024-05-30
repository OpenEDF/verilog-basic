package router_env_pkg;

import uvm_pkg::*;
import router_stimulus_pkg::*;

`include "driver.sv"
`include "input_agent.sv"

// Lab 3 - Task 2, Step 3
//
// Declare a virtual_reset_sequencer handle called v_reset_sqr
//
// virtual_reset_sequencer  v_reset_sqr;
//
// ToDo
`include "reset_agent.sv"


`include "router_env.sv"

endpackage
