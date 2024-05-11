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

//--------------------------------------------------------------------------
// Include File
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Class
//--------------------------------------------------------------------------
class base_test extends uvm_test;

//--------------------------------------------------------------------------
// Design: declare and register
//--------------------------------------------------------------------------
env env_o;
base_seq bseq;
intr_seq isr_seq;
`uvm_component_utils(base_test)

//--------------------------------------------------------------------------
// Design: new
//--------------------------------------------------------------------------
function new(string name = "base_test", uvm_component parent = null);
    super.new(name, parent);
endfunction

//--------------------------------------------------------------------------
// Design: build phase: create and configure of testbench structure
//--------------------------------------------------------------------------
function void build_phase(uvm_phase phase);
    `uvm_info(get_type_name, "IN build_phase...", UVM_LOW);
    super.build_phase(phase);
    env_o = env::type_id::create("env_o", this);
    bseq = base_seq::type_id::create("bseq");
    isr_seq = intr_seq::type_id::create("isr_seq");
endfunction

//--------------------------------------------------------------------------
// Design: connect phase
//--------------------------------------------------------------------------
virtual function void connect_phase(uvm_phase phase);
    `uvm_info(get_type_name, "IN connect_phase...", UVM_LOW);
endfunction

//--------------------------------------------------------------------------
// Design: Before reset is asserted.
//--------------------------------------------------------------------------
virtual task pre_reset_phase(uvm_phase phase);
    `uvm_info(get_type_name, "IN pre_reset_phase...", UVM_LOW);
endtask

//--------------------------------------------------------------------------
// Design: Reset DUT/De-assert control signals
//--------------------------------------------------------------------------
virtual task reset_phase(uvm_phase phase);
    `uvm_info(get_type_name, "IN reset_phase...", UVM_LOW);
endtask

//--------------------------------------------------------------------------
// Design: Wait for DUT to be at a known state
//--------------------------------------------------------------------------
virtual task post_reset_phase(uvm_phase phase);
    `uvm_info(get_type_name, "IN post_reset_phase...", UVM_LOW);
endtask

//--------------------------------------------------------------------------
// Design: Setup/Wait for conditions to configure DUT
//--------------------------------------------------------------------------
virtual task pre_configure_phase(uvm_phase phase);
    `uvm_info(get_type_name, "IN pre_configure_phase...", UVM_LOW);
endtask

//--------------------------------------------------------------------------
// Design: Configure the DUT
//--------------------------------------------------------------------------
virtual task configure_phase(uvm_phase phase);
    `uvm_info(get_type_name, "IN configure_phase...", UVM_LOW);
endtask

//--------------------------------------------------------------------------
// Design: Wait for DUT to be at a known configured state
//--------------------------------------------------------------------------
virtual task post_configure_phase(uvm_phase phase);
    `uvm_info(get_type_name, "IN post_configure_phase...", UVM_LOW);
endtask

//--------------------------------------------------------------------------
// Design: Setup/Wait for conditions to start testing DUT
//--------------------------------------------------------------------------
virtual task pre_mian_phase(uvm_phase phase);
    `uvm_info(get_type_name, "IN pre_configure_phase...", UVM_LOW);
endtask

//--------------------------------------------------------------------------
// Design: Test DUT
//--------------------------------------------------------------------------
virtual task main_phase(uvm_phase phase);
    `uvm_info(get_type_name, "IN main_phase...", UVM_LOW);
endtask

//--------------------------------------------------------------------------
// Design: Typically a no-op
//--------------------------------------------------------------------------
virtual task post_main_phase(uvm_phase phase);
    `uvm_info(get_type_name, "IN post_main_phase...", UVM_LOW);
endtask

//--------------------------------------------------------------------------
// Design: Typically a no-op
//--------------------------------------------------------------------------
virtual task pre_shutdown_phase(uvm_phase phase);
    `uvm_info(get_type_name, "IN pre_shutdown_phase...", UVM_LOW);
endtask

//--------------------------------------------------------------------------
// Design: Wait for data in DUT to be drained
//--------------------------------------------------------------------------
virtual task shutdown_phase(uvm_phase phase);
    `uvm_info(get_type_name, "IN main_phase...", UVM_LOW);
endtask

//--------------------------------------------------------------------------
// Design: Perform final checks that consume simulation time
//--------------------------------------------------------------------------
virtual task post_shutdown_phase(uvm_phase phase);
    `uvm_info(get_type_name, "IN post_shutdown_phase...", UVM_LOW);
endtask

//--------------------------------------------------------------------------
// Design: run phase: stmulate the DUT
//--------------------------------------------------------------------------
task run_phase(uvm_phase phase);
    `uvm_info(get_type_name, "IN run_phase...", UVM_LOW);
    phase.raise_objection(this);

    repeat(1) begin
        /* Executes this sequence, returning when the sequence has completed  */
        /* isr sequence */
        fork
            isr_seq.start(env_o.agt.seqr);
        //join_none

        /* main sequence */
        #10;
        bseq.start(env_o.agt.seqr);
        join
    end

    /* The drop is expected to be matched with an earlier raise */
    phase.drop_objection(this);
    `uvm_info(get_type_name, "end of testcase", UVM_LOW);
endtask

//--------------------------------------------------------------------------
// Design: end of elaboration phase
//--------------------------------------------------------------------------
virtual function void end_of_elaboration_phase(uvm_phase phase);
    /* show uvm class arch */
    `uvm_info(get_type_name, "IN end_of_elaboration_phase...", UVM_LOW);
    print();
endfunction

//--------------------------------------------------------------------------
// Design: Get ready for DUT to be simulated
//--------------------------------------------------------------------------
virtual function void start_of_simulation_phase(uvm_phase phase);
    `uvm_info(get_type_name, "IN start_of_simulation_phase..", UVM_LOW);
    /* display environment topology */
    uvm_root::get().print_topology(uvm_default_table_printer);
    uvm_root::get().print_topology(uvm_default_tree_printer);
    uvm_root::get().print_topology(uvm_default_line_printer);
endfunction

//--------------------------------------------------------------------------
// Design: Extract data from different points of the verification environment
//--------------------------------------------------------------------------
virtual function void extract_phase(uvm_phase phase);
    `uvm_info(get_type_name, "IN extract_phase...", UVM_LOW);
endfunction

//--------------------------------------------------------------------------
// Design: Check for any unexpected conditions in the verification environment
//--------------------------------------------------------------------------
virtual function void check_phase(uvm_phase phase);
    `uvm_info(get_type_name, "IN check_phase...", UVM_LOW);
endfunction

//--------------------------------------------------------------------------
// Design: Report results of the test.
//--------------------------------------------------------------------------
virtual function void report_phase(uvm_phase phase);
    `uvm_info(get_type_name, "IN report_phase...", UVM_LOW);
endfunction

//--------------------------------------------------------------------------
// Design: Tie up loose ends.
//--------------------------------------------------------------------------
virtual function void final_phase(uvm_phase phase);
    `uvm_info(get_type_name, "IN final_phase...", UVM_LOW);
endfunction

endclass: base_test
//--------------------------------------------------------------------------
