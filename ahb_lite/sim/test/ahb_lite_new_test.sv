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
`ifndef _AHB_LITE_NEW_TEST_SV_
`define _AHB_LITE_NEW_TEST_SV_

//--------------------------------------------------------------------------
// Include File
//--------------------------------------------------------------------------
`include "ahb_type.svh"
//--------------------------------------------------------------------------
// Class
//--------------------------------------------------------------------------
class ahb_lite_new_test extends ahb_lite_base_test;

//--------------------------------------------------------------------------
// Design: declare and register
//--------------------------------------------------------------------------
//ahb_lite_system_config sys_cfg;
`uvm_component_utils(ahb_lite_new_test)

//--------------------------------------------------------------------------
// Design: declare method
//--------------------------------------------------------------------------
extern function new(string name = "ahb_lite_new_test", uvm_component parent = null);
extern virtual function void build_phase(uvm_phase phase);
extern virtual task main_phase(uvm_phase phase);

endclass: ahb_lite_new_test
//--------------------------------------------------------------------------
// Design: new
//--------------------------------------------------------------------------
function ahb_lite_new_test::new(string name = "ahb_lite_new_test", uvm_component parent = null);
    super.new(name, parent);
endfunction

//--------------------------------------------------------------------------
// Design: build phase: create and configure of testbench structure
//--------------------------------------------------------------------------
function void ahb_lite_new_test::build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info(get_type_name(), "build_phase Entered ...", UVM_HIGH);

    /* system config */
    sys_cfg.test_config_db = 1;

    /*
    ahb_mst_new_seq new_seq;
    new_seq = new("new_seq");
    uvm_config_db#(uvm_sequence_base)::set(this,
                              "ahb_env.mst_agt.mst_seqr.main_phase",
                              "default_sequence",
                              new_seq);
    */
    uvm_config_db#(uvm_object_wrapper)::set(this,
                              "ahb_env.mst_agt.mst_seqr.main_phase",
                              "default_sequence",
                              ahb_mst_new_seq::type_id::get());

    /* uvm config db test */
    if (sys_cfg.test_config_db == 1) begin
        uvm_config_db#(int)::set(this, "*", "db_test_val", 32'h12345678);
        uvm_config_db#(int)::set(null, "", "db_test_val_1", 32'h5678abcd);
        uvm_config_db#(int)::set(null, "uvm_test_top", "db_test_val_2", 32'habcd1234);
    end

    `uvm_info(get_type_name(), "build_phase Exited ...", UVM_HIGH);
endfunction

//--------------------------------------------------------------------------
// Design: Test DUT
//--------------------------------------------------------------------------
task ahb_lite_new_test::main_phase(uvm_phase phase);
    `uvm_info(get_type_name(), "run phase Entered ...", UVM_HIGH);

    phase.phase_done.set_drain_time(this, 100);
    /* The drop is expected to be matched with an earlier raise */
    `uvm_info(get_type_name(), "run phase Exited ...", UVM_HIGH);
endtask

`endif /*_AHB_LITE_NEW_TEST_SV_ */
//--------------------------------------------------------------------------
