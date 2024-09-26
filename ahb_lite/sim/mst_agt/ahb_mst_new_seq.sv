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
// Brief: uvm sequence
// Change Log:
//--------------------------------------------------------------------------
`ifndef _AHB_MST_NEW_SEQ_SV_
`define _AHB_MST_NEW_SEQ_SV_

//--------------------------------------------------------------------------
// Include File
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Class
//--------------------------------------------------------------------------
class ahb_mst_new_seq extends uvm_sequence #(ahb_mst_tran);

//--------------------------------------------------------------------------
// Design: declear and register
//--------------------------------------------------------------------------
`uvm_object_utils(ahb_mst_new_seq);

extern function new(string name = "ahb_mst_new_seq");
extern virtual task pre_body();
extern virtual task post_body();
extern virtual task body();
endclass: ahb_mst_new_seq

//--------------------------------------------------------------------------
// Design: new
//--------------------------------------------------------------------------
function ahb_mst_new_seq::new(string name = "ahb_mst_new_seq");
    super.new(name);
endfunction

//--------------------------------------------------------------------------
// Design: Raise an objection if this is the parent sequence
//--------------------------------------------------------------------------
task ahb_mst_new_seq::pre_body();
    uvm_phase phase;
    super.pre_body();
    phase = get_starting_phase();

    if (phase != null) begin
        phase.raise_objection(this);
    end
endtask: pre_body

//--------------------------------------------------------------------------
// Design: Drop an objection if this is the parent sequence
//--------------------------------------------------------------------------
task ahb_mst_new_seq::post_body();
    uvm_phase phase;
    super.post_body();
    phase = get_starting_phase();

    if (phase != null) begin
        phase.drop_objection(this);
    end
endtask: post_body

//--------------------------------------------------------------------------
// Design: sequence, your stimulus code, this is the user-defined task
//         whers the main sequence code resides.
// uvm_do:
//        start_item(item);
//        item.randaomize();
//        finish_item(item);
//--------------------------------------------------------------------------
task ahb_mst_new_seq::body();
    REQ req_item;
    RSP rsp_item;

    logic [31:0] data;
    logic [31:0] addr;
    data  = 32'h1234_abcd;
    addr  = 32'h0004_4004;
    `uvm_info(get_type_name(), "ahb_mst_new_seq: Entered ...", UVM_HIGH);

    repeat(10) begin
        req_item = ahb_mst_tran::type_id::create("req_item");
        start_item(req_item);
        if (!req_item.randomize() with {
                        HTRANS == NONSEQ;
                        HWRITE == WRITE;
                        HADDR  == addr;
                        HWDATA == data;
            }) begin
            `uvm_fatal("body:", "req randomization failure")
        end
        req_item.HRESETn = 1;
        finish_item(req_item);
        req_item.end_event.wait_on();

        data += 32'h1;
        get_response(rsp_item);
        `uvm_info(get_type_name(), {"get response after:\n", rsp_item.sprint()}, UVM_HIGH);
    end

    `uvm_info(get_type_name(), "ahb_mst_new_seq: Exited ...", UVM_HIGH);
endtask

`endif /* _AHB_MST_NEW_SEQ_SV_ */
//--------------------------------------------------------------------------
