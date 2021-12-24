`ifndef EXAMPLE_PKG
`define EXAMPLE_PKG

package example_pkg;

import uvm_pkg::*;

/* include all file */
`include "seq_item.svh"
`include "driver.svh"
`include "sequencer.svh"
`include "sequence.svh"
`include "monitor.svh"
`include "agent.svh"
`include "scoreboard.svh"
`include "env.svh"
`include "test.svh"
`include "wr_rd_test.svh"

endpackage : example_pkg

/* import the package */
//import example_pkg::*;

`endif /* EXAMPLE_PKG*/
