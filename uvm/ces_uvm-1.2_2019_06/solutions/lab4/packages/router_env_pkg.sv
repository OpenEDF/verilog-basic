package router_env_pkg;

import uvm_pkg::*;
import router_stimulus_pkg::*;

`include "driver.sv"
`include "iMonitor.sv"
`include "input_agent.sv"

`include "oMonitor.sv"
`include "output_agent.sv"

`include "reset_agent.sv"

`include "scoreboard.sv"

// Lab 4 - Task 8, Step 9
// Add the multi-stream scoreboard to the package
//
// `include "ms_scoreboard.sv"
//
// ToDo
`include "ms_scoreboard.sv"

`include "router_env.sv"

endpackage
