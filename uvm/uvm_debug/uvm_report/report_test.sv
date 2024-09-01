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
`ifndef _REPORT_TEST_SV_
`define _REPORT_TEST_SV_ 

//--------------------------------------------------------------------------
// Include File
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Class
//--------------------------------------------------------------------------
class report_test extends uvm_test;

//--------------------------------------------------------------------------
// Design: declare and register
//--------------------------------------------------------------------------
`uvm_component_utils(report_test)

//--------------------------------------------------------------------------
// Design: declare method
//--------------------------------------------------------------------------
extern function new(string name = "report_test", uvm_component parent = null);
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

endclass: report_test
//--------------------------------------------------------------------------
// Design: new
//--------------------------------------------------------------------------
function report_test::new(string name = "report_test", uvm_component parent = null);
    super.new(name, parent);
endfunction

//--------------------------------------------------------------------------
// Design: build phase: create and configure of testbench structure
//--------------------------------------------------------------------------
function void report_test::build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info(get_type_name(), "IN build_phase...", UVM_LOW);
endfunction

//--------------------------------------------------------------------------
// Design: connect phase
//--------------------------------------------------------------------------
function void report_test::connect_phase(uvm_phase phase);
    `uvm_info(get_type_name(), "IN connect_phase...", UVM_LOW);
endfunction

//--------------------------------------------------------------------------
// Design: Before reset is asserted.
//--------------------------------------------------------------------------
task report_test::pre_reset_phase(uvm_phase phase);
    `uvm_info(get_type_name(), "IN pre_reset_phase...", UVM_LOW);
endtask

//--------------------------------------------------------------------------
// Design: Reset DUT/De-assert control signals
//--------------------------------------------------------------------------
task report_test::reset_phase(uvm_phase phase);
    `uvm_info(get_type_name(), "IN reset_phase...", UVM_LOW);
endtask

//--------------------------------------------------------------------------
// Design: Wait for DUT to be at a known state
//--------------------------------------------------------------------------
task report_test::post_reset_phase(uvm_phase phase);
    `uvm_info(get_type_name(), "IN post_reset_phase...", UVM_LOW);
endtask

//--------------------------------------------------------------------------
// Design: Setup/Wait for conditions to configure DUT
//--------------------------------------------------------------------------
task report_test::pre_configure_phase(uvm_phase phase);
    `uvm_info(get_type_name(), "IN pre_configure_phase...", UVM_LOW);
endtask

//--------------------------------------------------------------------------
// Design: Configure the DUT
//--------------------------------------------------------------------------
task report_test::configure_phase(uvm_phase phase);
    `uvm_info(get_type_name(), "IN configure_phase...", UVM_LOW);
endtask

//--------------------------------------------------------------------------
// Design: Wait for DUT to be at a known configured state
//--------------------------------------------------------------------------
task report_test::post_configure_phase(uvm_phase phase);
    `uvm_info(get_type_name(), "IN post_configure_phase...", UVM_LOW);
endtask

//--------------------------------------------------------------------------
// Design: Setup/Wait for conditions to start testing DUT
//--------------------------------------------------------------------------
task report_test::pre_mian_phase(uvm_phase phase);
    `uvm_info(get_type_name(), "IN pre_configure_phase...", UVM_LOW);
endtask

//--------------------------------------------------------------------------
// Design: Test DUT
//--------------------------------------------------------------------------
task report_test::main_phase(uvm_phase phase);
    `uvm_info(get_type_name(), "IN main_phase...", UVM_LOW);
endtask

//--------------------------------------------------------------------------
// Design: Typically a no-op
//--------------------------------------------------------------------------
task report_test::post_main_phase(uvm_phase phase);
    `uvm_info(get_type_name(), "IN post_main_phase...", UVM_LOW);
endtask

//--------------------------------------------------------------------------
// Design: Typically a no-op
//--------------------------------------------------------------------------
task report_test::pre_shutdown_phase(uvm_phase phase);
    `uvm_info(get_type_name(), "IN pre_shutdown_phase...", UVM_LOW);
endtask

//--------------------------------------------------------------------------
// Design: Wait for data in DUT to be drained
//--------------------------------------------------------------------------
task report_test::shutdown_phase(uvm_phase phase);
    `uvm_info(get_type_name(), "IN main_phase...", UVM_LOW);
endtask

//--------------------------------------------------------------------------
// Design: Perform final checks that consume simulation time
//--------------------------------------------------------------------------
task report_test::post_shutdown_phase(uvm_phase phase);
    `uvm_info(get_type_name(), "IN post_shutdown_phase...", UVM_LOW);
endtask

//--------------------------------------------------------------------------
// Design: run phase: stmulate the DUT
//--------------------------------------------------------------------------
task report_test::run_phase(uvm_phase phase);
    phase.raise_objection(this);
    `uvm_info(get_type_name(), "******************* IN run_phase ***************", UVM_LOW);

    `uvm_info(get_type_name(), "verbosity test: NONE", UVM_NONE);
    `uvm_info(get_type_name(), "verbosity test: LOW", UVM_LOW);
    `uvm_info(get_type_name(), "verbosity test: MEDIUM", UVM_MEDIUM);
    `uvm_info(get_type_name(), "verbosity test: HIGH", UVM_HIGH);
    `uvm_info(get_type_name(), "verbosity test: FULL", UVM_FULL);
    `uvm_info(get_type_name(), "verbosity test: DEBUG", UVM_DEBUG);
    `uvm_fatal(get_type_name(), "verbosity test: FATAL test");

    `uvm_info(get_type_name(), "****************** EXIT run_phase **************", UVM_LOW);
    phase.drop_objection(this);
endtask

//--------------------------------------------------------------------------
// Design: end of elaboration phase
//--------------------------------------------------------------------------
function void report_test::end_of_elaboration_phase(uvm_phase phase);
    /* show uvm class arch */
    `uvm_info(get_type_name(), "IN end_of_elaboration_phase...", UVM_LOW);
    print();
    set_report_severity_action(UVM_FATAL | UVM_LOG, UVM_DISPLAY);
    set_report_id_action("CFG_ERROR", UVM_NO_ACTION);
    set_report_severity_id_action(UVM_ERROR, "CFG_ERROR", UVM_EXIT);
endfunction

//--------------------------------------------------------------------------
// Design: Get ready for DUT to be simulated
//--------------------------------------------------------------------------
function void report_test::start_of_simulation_phase(uvm_phase phase);
    `uvm_info(get_type_name(), "IN start_of_simulation_phase..", UVM_LOW);
endfunction

//--------------------------------------------------------------------------
// Design: Extract data from different points of the verification environment
//--------------------------------------------------------------------------
function void report_test::extract_phase(uvm_phase phase);
    `uvm_info(get_type_name(), "IN extract_phase...", UVM_LOW);
endfunction

//--------------------------------------------------------------------------
// Design: Check for any unexpected conditions in the verification environment
//--------------------------------------------------------------------------
function void report_test::check_phase(uvm_phase phase);
    `uvm_info(get_type_name(), "IN check_phase...", UVM_LOW);
endfunction

//--------------------------------------------------------------------------
// Design: Report results of the test.
//--------------------------------------------------------------------------
function void report_test::report_phase(uvm_phase phase);
    `uvm_info(get_type_name(), "IN report_phase...", UVM_LOW);
endfunction

//--------------------------------------------------------------------------
// Design: Tie up loose ends.
//--------------------------------------------------------------------------
function void report_test::final_phase(uvm_phase phase);
    `uvm_info(get_type_name(), "IN final_phase...", UVM_LOW);
endfunction

`endif /* _REPORT_TEST_SV_ */
//--------------------------------------------------------------------------
