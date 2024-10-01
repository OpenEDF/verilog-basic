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
class ahb_lite_irq_test extends ahb_lite_base_test;

//--------------------------------------------------------------------------
// Design: declare and register
//--------------------------------------------------------------------------
ahb_mst_int_seq   int_seq;
ahb_mst_init_seq  init_cfg_seq;
`uvm_component_utils(ahb_lite_irq_test)

//--------------------------------------------------------------------------
// Design: declare method
//--------------------------------------------------------------------------
extern function new(string name = "ahb_lite_irq_test", uvm_component parent = null);
extern function void build_phase(uvm_phase phase);
extern task run_phase(uvm_phase phase);

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
    int_seq = ahb_mst_int_seq::type_id::create("int_seq");
    init_cfg_seq = ahb_mst_init_seq::type_id::create("init_cfg_seq");
endfunction

//--------------------------------------------------------------------------
// Design: run phase: stmulate the DUT
//--------------------------------------------------------------------------
task ahb_lite_irq_test::run_phase(uvm_phase phase);
    `uvm_info(get_type_name(), "run phase Entered ...", UVM_HIGH);
    phase.raise_objection(this);

    fork
        /* Executes this sequence, returning when the sequence has completed  */

        /* init config sequence */
        init_cfg_seq.start(ahb_env.mst_agt.mst_seqr);

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

`endif /*_AHB_LITE_IRQ_TEST_SV_ */
//--------------------------------------------------------------------------
