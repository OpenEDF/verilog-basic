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
`ifndef _AHB_LITE_BASE_TEST_SV_
`define _AHB_LITE_BASE_TEST_SV_

//--------------------------------------------------------------------------
// Include File
//--------------------------------------------------------------------------
`include "ahb_type.svh"
//--------------------------------------------------------------------------
// Class
//--------------------------------------------------------------------------
class ahb_lite_base_test extends uvm_test;

//--------------------------------------------------------------------------
// Design: declare and register
//--------------------------------------------------------------------------
ahb_lite_env      ahb_env;
ahb_lite_system_config sys_cfg;
`uvm_component_utils(ahb_lite_base_test)

//--------------------------------------------------------------------------
// Design: declare method
//--------------------------------------------------------------------------
extern function new(string name = "ahb_lite_base_test", uvm_component parent = null);
extern virtual function void build_phase(uvm_phase phase);
extern virtual function void end_of_elaboration_phase(uvm_phase phase);
extern virtual function void start_of_simulation_phase(uvm_phase phase);
extern virtual function void final_phase(uvm_phase phase);
extern virtual function void init_seq(ahb_mst_vseq seq);

endclass: ahb_lite_base_test
//--------------------------------------------------------------------------
// Design: new
//--------------------------------------------------------------------------
function ahb_lite_base_test::new(string name = "ahb_lite_base_test", uvm_component parent = null);
    super.new(name, parent);
endfunction

//--------------------------------------------------------------------------
// Design: build phase: create and configure of testbench structure
//--------------------------------------------------------------------------
function void ahb_lite_base_test::build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info(get_type_name(), "build_phase Entered ...", UVM_HIGH);
    ahb_env = ahb_lite_env::type_id::create("ahb_env", this);
    sys_cfg = ahb_lite_system_config::type_id::create("sys_cfg");

    sys_cfg.test_var = 10;
    sys_cfg.has_scoreboard = 1;
    sys_cfg.has_functional_coverage = 1;
    sys_cfg.enable_put_response = 1;
    sys_cfg.test_config_db = 0;
    uvm_config_db#(ahb_lite_system_config)::set(this, "*", "ahb_lite_system_config", sys_cfg);

    `uvm_info(get_type_name(), "build_phase Exited ...", UVM_HIGH);
endfunction

//--------------------------------------------------------------------------
// Design: init virtual sequence 
//--------------------------------------------------------------------------
function void ahb_lite_base_test::init_seq(ahb_mst_vseq seq);
    seq.SQR = ahb_env.mst_agt.mst_seqr;
endfunction

//--------------------------------------------------------------------------
// Design: end of elaboration phase
//--------------------------------------------------------------------------
function void ahb_lite_base_test::end_of_elaboration_phase(uvm_phase phase);
    /* show uvm class arch */
    `uvm_info(get_type_name(), "IN end_of_elaboration_phase...", UVM_HIGH);
    uvm_config_db#(int)::dump();
    uvm_factory::get().print();
endfunction

//--------------------------------------------------------------------------
// Design: Get ready for DUT to be simulated
//--------------------------------------------------------------------------
function void ahb_lite_base_test::start_of_simulation_phase(uvm_phase phase);
    `uvm_info(get_type_name(), "IN start_of_simulation_phase..", UVM_HIGH);
    /* display environment topology */
    uvm_root::get().print_topology(uvm_default_table_printer);
endfunction

//--------------------------------------------------------------------------
// Design: Tie up loose ends.
//--------------------------------------------------------------------------
function void ahb_lite_base_test::final_phase(uvm_phase phase);
    uvm_report_server svr;
    super.final_phase(phase);
    `uvm_info("final_phase", "ahb_lite_base_test FINAL-FLOW: Starting...",UVM_HIGH);

    svr = uvm_report_server::get_server();
    if (svr.get_severity_count(UVM_FATAL) + svr.get_severity_count(UVM_ERROR) +
	    svr.get_severity_count(UVM_WARNING) > 0) begin
        `uvm_info("final_phase", "\nSvtTestEpilog: Failed\n", UVM_LOW);
    end else begin
        `uvm_info("final_phase", "\nSvtTestEpilog: Passed\n", UVM_LOW);
    end
    `uvm_info("final_phase", "ahb_lite_base_test FINAL-FLOW: Finishing...",UVM_HIGH);
endfunction: final_phase

`endif /* _AHB_LITE_BASE_TEST_SV_ */
//--------------------------------------------------------------------------
