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
`ifndef _VV_TEST_SV_
`define _VV_TEST_SV_

//--------------------------------------------------------------------------
// Include File
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Class
//--------------------------------------------------------------------------
class vv_test extends base_test;

//--------------------------------------------------------------------------
// Design: declare and register
//--------------------------------------------------------------------------
system_seq sys_seq;
`uvm_component_utils(vv_test)

//--------------------------------------------------------------------------
// Design: declare method
//--------------------------------------------------------------------------
extern function new(string name = "vv_test", uvm_component parent = null);
extern virtual function void build_phase(uvm_phase phase);
extern virtual task run_phase(uvm_phase phase);

endclass: vv_test
//--------------------------------------------------------------------------
// Design: new
//--------------------------------------------------------------------------
function vv_test::new(string name = "vv_test", uvm_component parent = null);
    super.new(name, parent);
endfunction

//--------------------------------------------------------------------------
// Design: build phase: create and configure of testbench structure
//--------------------------------------------------------------------------
function void vv_test::build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info(get_type_name(), "build_phase Entered ...", UVM_HIGH)
    sys_seq = system_seq::type_id::create("sys_seq", this);
    `uvm_info(get_type_name(), "build_phase Exited ...", UVM_HIGH)
endfunction

//--------------------------------------------------------------------------
// Design: Test DUT
//--------------------------------------------------------------------------
task vv_test::run_phase(uvm_phase phase);
    `uvm_info(get_type_name(), "run phase Entered ...", UVM_HIGH)

    phase.raise_objection(this);

    /* start virtual sequence and sequnencer */
    init_seq(sys_seq);
    sys_seq.start(null);

    phase.drop_objection(this);

    phase.phase_done.set_drain_time(this, 100);
    /* The drop is expected to be matched with an earlier raise */
    `uvm_info(get_type_name(), "run phase Exited ...", UVM_HIGH)
endtask

`endif /* _VV_TEST_SV_ */
//--------------------------------------------------------------------------
