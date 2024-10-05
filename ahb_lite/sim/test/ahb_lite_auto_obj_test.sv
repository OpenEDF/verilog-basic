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
`ifndef _AHB_LITE_AUTO_OBJ_TEST_SV_
`define _AHB_LITE_AUTO_OBJ_TEST_SV_

//--------------------------------------------------------------------------
// Include File
//--------------------------------------------------------------------------
`include "ahb_type.svh"
//--------------------------------------------------------------------------
// Class
//--------------------------------------------------------------------------
class ahb_lite_auto_obj_test extends ahb_lite_base_test;

//--------------------------------------------------------------------------
// Design: declare and register
//--------------------------------------------------------------------------
bit status;
auto_object_seq   auto_seq;
`uvm_component_utils(ahb_lite_auto_obj_test)

//--------------------------------------------------------------------------
// Design: declare method
//--------------------------------------------------------------------------
extern function new(string name = "ahb_lite_auto_obj_test", uvm_component parent = null);
extern virtual function void build_phase(uvm_phase phase);
extern virtual task main_phase(uvm_phase phase);

endclass: ahb_lite_auto_obj_test
//--------------------------------------------------------------------------
// Design: new
//--------------------------------------------------------------------------
function ahb_lite_auto_obj_test::new(string name = "ahb_lite_auto_obj_test", uvm_component parent = null);
    super.new(name, parent);
endfunction

//--------------------------------------------------------------------------
// Design: build phase: create and configure of testbench structure
//--------------------------------------------------------------------------
function void ahb_lite_auto_obj_test::build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info(get_type_name(), "build_phase Entered ...", UVM_HIGH);
    auto_seq = auto_object_seq::type_id::create("auto_seq");
    sys_cfg.enbale_heartbeat = 1;

    `uvm_info(get_type_name(), "build_phase Exited ...", UVM_HIGH);
endfunction

//--------------------------------------------------------------------------
// Design: Test DUT
//--------------------------------------------------------------------------
task ahb_lite_auto_obj_test::main_phase(uvm_phase phase);
    `uvm_info(get_type_name(), "run phase Entered ...", UVM_HIGH);

    auto_seq.set_starting_phase(phase);
    auto_seq.set_automatic_phase_objection(1);
    status = auto_seq.get_automatic_phase_objection();
    `uvm_info(get_name(), $sformatf("during seq is running, get_automatic_phase_objection: %b", status), UVM_LOW)
    auto_seq.start(ahb_env.mst_agt.mst_seqr);

    phase.phase_done.set_drain_time(this, 100);
    /* The drop is expected to be matched with an earlier raise */
    `uvm_info(get_type_name(), "run phase Exited ...", UVM_HIGH);
endtask

`endif /* _AHB_LITE_AUTO_OBJ_TEST_SV_ */
//--------------------------------------------------------------------------
