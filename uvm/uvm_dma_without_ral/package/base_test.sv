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
write_seq wr_seq;
read_seq  rd_seq;
`uvm_component_utils(base_test)

`define INTR_SFR_ADDR     32'h0000_0400
`define CTRL_SFR_ADDR     32'h0000_0404
`define IO_ADDR_SFR_ADDR  32'h0000_0408
`define MEM_ADDR_SFR_ADDR 32'h0000_040C

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

    /* create environment */
    env_o = env::type_id::create("env_o", this);

    /* create sequence */
    wr_seq = write_seq::type_id::create("wr_seq");
    rd_seq = read_seq::type_id::create("rd_seq");
endfunction

//--------------------------------------------------------------------------
// Design: run phase: stmulate the DUT
//--------------------------------------------------------------------------
task run_phase(uvm_phase phase);
    `uvm_info(get_type_name, "IN run_phase...", UVM_LOW);
    phase.raise_objection(this);

    /* write test */
    wr_seq.t_addr = `INTR_SFR_ADDR;
    wr_seq.t_data = 32'h1234_5678;;
    wr_seq.start(env_o.agt.seqr);

    wr_seq.t_addr = `CTRL_SFR_ADDR;
    wr_seq.t_data = 32'h1234_abcd;;
    wr_seq.start(env_o.agt.seqr);

    wr_seq.t_addr = `IO_ADDR_SFR_ADDR;
    wr_seq.t_data = 32'h12ab_cd78;;
    wr_seq.start(env_o.agt.seqr);

    wr_seq.t_addr = `MEM_ADDR_SFR_ADDR;
    wr_seq.t_data = 32'hab12_34cd;;
    wr_seq.start(env_o.agt.seqr);

    /* read test */
    rd_seq.t_addr = `INTR_SFR_ADDR;
    rd_seq.start(env_o.agt.seqr);

    rd_seq.t_addr = `CTRL_SFR_ADDR;
    rd_seq.start(env_o.agt.seqr);

    rd_seq.t_addr = `IO_ADDR_SFR_ADDR;
    rd_seq.start(env_o.agt.seqr);

    rd_seq.t_addr = `MEM_ADDR_SFR_ADDR;
    rd_seq.start(env_o.agt.seqr);

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
// Design: Report results of the test.
//--------------------------------------------------------------------------
function void report_phase(uvm_phase phase);
    uvm_report_server svr;
    svr = uvm_report_server::get_server();
    super.report_phase(phase);
    `uvm_info(get_type_name, "IN report_phase...", UVM_LOW);
    if (svr.get_severity_count(UVM_FATAL) + svr.get_severity_count(UVM_ERROR) > 0) begin
        `uvm_info(get_type_name(), "-----------------------------------------------------", UVM_NONE);
        `uvm_info(get_type_name(), "--------               TEST FAIL             --------", UVM_NONE);
        `uvm_info(get_type_name(), "-----------------------------------------------------", UVM_NONE);
    end else begin
        `uvm_info(get_type_name(), "-----------------------------------------------------", UVM_NONE);
        `uvm_info(get_type_name(), "--------               TEST PASS             --------", UVM_NONE);
        `uvm_info(get_type_name(), "-----------------------------------------------------", UVM_NONE);
    end
endfunction

endclass: base_test
//--------------------------------------------------------------------------
