//--------------------------------------------------------------------------
//                            UVM Lab
//                         openedf.com
//                     Copyright 2023-2024
//
//                     makermuyi@gmail.com
//
//                       License: BSD
//--------------------------------------------------------------------------
//
// Copyright (c) 2020-2021, openedf.com
// All rights reserved.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
// "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
// LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
// A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE AUTHOR BE
// LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
// CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
// SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
// BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
// LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF
// THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
// SUCH DAMAGE.

//--------------------------------------------------------------------------
// Designer: macro
// Brief: The test is at the top of the hierarchical component that initiates
//        the environment component construction
// Change Log:
//--------------------------------------------------------------------------
`ifndef _AHB_LITE_IRQ_TEST_SV_
`define _AHB_LITE_IRQ_TEST_SV_

//--------------------------------------------------------------------------
// Include File
//--------------------------------------------------------------------------
`include "ahb_type.svh"
//--------------------------------------------------------------------------
// Class
//--------------------------------------------------------------------------
class ahb_lite_irq_test extends uvm_test;

//--------------------------------------------------------------------------
// Design: declare and register
//--------------------------------------------------------------------------
ahb_lite_env      ahb_env;
ahb_mst_int_seq   int_seq;
ahb_mst_init_seq  init_seq;
ahb_lite_system_config sys_cfg;
`uvm_component_utils(ahb_lite_irq_test)

//--------------------------------------------------------------------------
// Design: declare method
//--------------------------------------------------------------------------
extern function new(string name = "ahb_lite_irq_test", uvm_component parent = null);
extern function void build_phase(uvm_phase phase);
extern function void connect_phase(uvm_phase phase);
extern task pre_reset_phase(uvm_phase phase);
extern task reset_phase(uvm_phase phase);
extern task post_reset_phase(uvm_phase phase);
extern task pre_configure_phase(uvm_phase phase);
extern task configure_phase(uvm_phase phase);
extern task post_configure_phase(uvm_phase phase);
extern task pre_mian_phase(uvm_phase phase);
extern task main_phase(uvm_phase phase);
extern task post_main_phase(uvm_phase phase);
extern task pre_shutdown_phase(uvm_phase phase);
extern task shutdown_phase(uvm_phase phase);
extern task post_shutdown_phase(uvm_phase phase);
extern task run_phase(uvm_phase phase);
extern function void end_of_elaboration_phase(uvm_phase phase);
extern function void start_of_simulation_phase(uvm_phase phase);
extern function void extract_phase(uvm_phase phase);
extern function void check_phase(uvm_phase phase);
extern function void report_phase(uvm_phase phase);
extern function void final_phase(uvm_phase phase);

endclass: ahb_lite_irq_test
//--------------------------------------------------------------------------
// Design: new
//--------------------------------------------------------------------------
function ahb_lite_irq_test::new(string name = "ahb_lite_irq_test", uvm_component parent = null);
    super.new(name, parent);
endfunction

//--------------------------------------------------------------------------
// Design: build phase: create and configure of testbench structure
//--------------------------------------------------------------------------
function void ahb_lite_irq_test::build_phase(uvm_phase phase);
    `uvm_info(get_type_name(), "IN build_phase...", UVM_HIGH);
    super.build_phase(phase);
    ahb_env = ahb_lite_env::type_id::create("ahb_env", this);
    int_seq = ahb_mst_int_seq::type_id::create("int_seq");
    init_seq = ahb_mst_init_seq::type_id::create("init_seq");
    sys_cfg = ahb_lite_system_config::type_id::create("sys_cfg");
    sys_cfg.test_var = 10;
    sys_cfg.has_scoreboard = 1;
    sys_cfg.has_functional_coverage = 1;
    uvm_config_db #(ahb_lite_system_config)::set(this, "*", "ahb_lite_system_config", sys_cfg);
endfunction

//--------------------------------------------------------------------------
// Design: connect phase
//--------------------------------------------------------------------------
function void ahb_lite_irq_test::connect_phase(uvm_phase phase);
    `uvm_info(get_type_name(), "IN connect_phase...", UVM_HIGH);
endfunction

//--------------------------------------------------------------------------
// Design: Before reset is asserted.
//--------------------------------------------------------------------------
task ahb_lite_irq_test::pre_reset_phase(uvm_phase phase);
    `uvm_info(get_type_name(), "IN pre_reset_phase...", UVM_HIGH);
endtask

//--------------------------------------------------------------------------
// Design: Reset DUT/De-assert control signals
//--------------------------------------------------------------------------
task ahb_lite_irq_test::reset_phase(uvm_phase phase);
    `uvm_info(get_type_name(), "IN reset_phase...", UVM_HIGH);
endtask

//--------------------------------------------------------------------------
// Design: Wait for DUT to be at a known state
//--------------------------------------------------------------------------
task ahb_lite_irq_test::post_reset_phase(uvm_phase phase);
    `uvm_info(get_type_name(), "IN post_reset_phase...", UVM_HIGH);
endtask

//--------------------------------------------------------------------------
// Design: Setup/Wait for conditions to configure DUT
//--------------------------------------------------------------------------
task ahb_lite_irq_test::pre_configure_phase(uvm_phase phase);
    `uvm_info(get_type_name(), "IN pre_configure_phase...", UVM_HIGH);
endtask

//--------------------------------------------------------------------------
// Design: Configure the DUT
//--------------------------------------------------------------------------
task ahb_lite_irq_test::configure_phase(uvm_phase phase);
    `uvm_info(get_type_name(), "IN configure_phase...", UVM_HIGH);
endtask

//--------------------------------------------------------------------------
// Design: Wait for DUT to be at a known configured state
//--------------------------------------------------------------------------
task ahb_lite_irq_test::post_configure_phase(uvm_phase phase);
    `uvm_info(get_type_name(), "IN post_configure_phase...", UVM_HIGH);
endtask

//--------------------------------------------------------------------------
// Design: Setup/Wait for conditions to start testing DUT
//--------------------------------------------------------------------------
task ahb_lite_irq_test::pre_mian_phase(uvm_phase phase);
    `uvm_info(get_type_name(), "IN pre_configure_phase...", UVM_HIGH);
endtask

//--------------------------------------------------------------------------
// Design: Test DUT
//--------------------------------------------------------------------------
task ahb_lite_irq_test::main_phase(uvm_phase phase);
    `uvm_info(get_type_name(), "IN main_phase...", UVM_HIGH);
endtask

//--------------------------------------------------------------------------
// Design: Typically a no-op
//--------------------------------------------------------------------------
task ahb_lite_irq_test::post_main_phase(uvm_phase phase);
    `uvm_info(get_type_name(), "IN post_main_phase...", UVM_HIGH);
endtask

//--------------------------------------------------------------------------
// Design: Typically a no-op
//--------------------------------------------------------------------------
task ahb_lite_irq_test::pre_shutdown_phase(uvm_phase phase);
    `uvm_info(get_type_name(), "IN pre_shutdown_phase...", UVM_HIGH);
endtask

//--------------------------------------------------------------------------
// Design: Wait for data in DUT to be drained
//--------------------------------------------------------------------------
task ahb_lite_irq_test::shutdown_phase(uvm_phase phase);
    `uvm_info(get_type_name(), "IN main_phase...", UVM_HIGH);
endtask

//--------------------------------------------------------------------------
// Design: Perform final checks that consume simulation time
//--------------------------------------------------------------------------
task ahb_lite_irq_test::post_shutdown_phase(uvm_phase phase);
    `uvm_info(get_type_name(), "IN post_shutdown_phase...", UVM_HIGH);
endtask

//--------------------------------------------------------------------------
// Design: run phase: stmulate the DUT
//--------------------------------------------------------------------------
task ahb_lite_irq_test::run_phase(uvm_phase phase);
    `uvm_info(get_type_name(), "run phase Entered ...", UVM_HIGH);
    phase.raise_objection(this);

    fork
        /* Executes this sequence, returning when the sequence has completed  */

        /* init config sequence */
        init_seq.start(ahb_env.mst_agt.mst_seqr);

        /* isr sequence */
        forever begin
            sys_cfg.wait_for_irq();
            `uvm_info(get_type_name(), "wait irq event trigger", UVM_HIGH);
            int_seq.start(ahb_env.mst_agt.mst_seqr);
        end
    join_any
    disable fork;

    phase.phase_done.set_drain_time(this, 100);
    /* The drop is expected to be matched with an earlier raise */
    phase.drop_objection(this);
    `uvm_info(get_type_name(), "run phase Exited ...", UVM_HIGH);
endtask

//--------------------------------------------------------------------------
// Design: end of elaboration phase
//--------------------------------------------------------------------------
function void ahb_lite_irq_test::end_of_elaboration_phase(uvm_phase phase);
    /* show uvm class arch */
    `uvm_info(get_type_name(), "IN end_of_elaboration_phase...", UVM_HIGH);
    uvm_config_db#(int)::dump();
    uvm_factory::get().print();
endfunction

//--------------------------------------------------------------------------
// Design: Get ready for DUT to be simulated
//--------------------------------------------------------------------------
function void ahb_lite_irq_test::start_of_simulation_phase(uvm_phase phase);
    `uvm_info(get_type_name(), "IN start_of_simulation_phase..", UVM_HIGH);
    /* display environment topology */
    uvm_root::get().print_topology(uvm_default_table_printer);
endfunction

//--------------------------------------------------------------------------
// Design: Extract data from different points of the verification environment
//--------------------------------------------------------------------------
function void ahb_lite_irq_test::extract_phase(uvm_phase phase);
    `uvm_info(get_type_name(), "IN extract_phase...", UVM_HIGH);
endfunction

//--------------------------------------------------------------------------
// Design: Check for any unexpected conditions in the verification environment
//--------------------------------------------------------------------------
function void ahb_lite_irq_test::check_phase(uvm_phase phase);
    `uvm_info(get_type_name(), "IN check_phase...", UVM_HIGH);
endfunction

//--------------------------------------------------------------------------
// Design: Report results of the test.
//--------------------------------------------------------------------------
function void ahb_lite_irq_test::report_phase(uvm_phase phase);
    `uvm_info(get_type_name(), "IN report_phase...", UVM_HIGH);
endfunction

//--------------------------------------------------------------------------
// Design: Tie up loose ends.
//--------------------------------------------------------------------------
function void ahb_lite_irq_test::final_phase(uvm_phase phase);
    uvm_report_server svr;
    super.final_phase(phase);
    `uvm_info("final_phase", "ahb_lite_irq_test FINAL-FLOW: Starting...",UVM_HIGH);

    svr = uvm_report_server::get_server();
    if (svr.get_severity_count(UVM_FATAL) + svr.get_severity_count(UVM_ERROR) +
	    svr.get_severity_count(UVM_WARNING) > 0) begin
        `uvm_info("final_phase", "\nSvtTestEpilog: Failed\n", UVM_LOW);
    end else begin
        `uvm_info("final_phase", "\nSvtTestEpilog: Passed\n", UVM_LOW);
    end
    `uvm_info("final_phase", "ahb_lite_irq_test FINAL-FLOW: Finishing...",UVM_HIGH);
endfunction: final_phase

`endif /*_AHB_LITE_IRQ_TEST_SV_ */
//--------------------------------------------------------------------------
