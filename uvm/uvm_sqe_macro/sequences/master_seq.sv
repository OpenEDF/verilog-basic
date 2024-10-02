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
`ifndef _MASTER_SEQ_SV_
`define _MASTER_SEQ_SV_

//--------------------------------------------------------------------------
// Include File
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Class
//--------------------------------------------------------------------------
class master_seq extends uvm_sequence #(master_seq_item);

//--------------------------------------------------------------------------
// Design: declear and register
//--------------------------------------------------------------------------
`uvm_object_utils(master_seq);

extern function new(string name = "master_seq");
extern virtual virtual task body();
endclass: master_seq

//--------------------------------------------------------------------------
// Design: new
//--------------------------------------------------------------------------
function master_seq::new(string name = "master_seq");
    super.new(name);
endfunction

//--------------------------------------------------------------------------
// Design: sequence, your stimulus code, this is the user-defined task
//         whers the main sequence code resides.
// uvm_do:
//        start_item(item);
//        item.randaomize();
//        finish_item(item);
//--------------------------------------------------------------------------
//`define UVM_RAND_SEND 
task master_seq::body();
    REQ req_item;
    RSP rsp_item;

    `uvm_info(get_type_name(), "body: Entered ...", UVM_HIGH);
    repeat(10) begin
`ifdef UVM_DO_SEQ
        `uvm_do(req_item);
`elsif UVM_DO_WITH_SEQ
        `uvm_do_with(req_item, {
                    req_item.HADDR == 32'h12345678;
                    req_item.HWDATA == 32'h1234abcd;
                });
`elsif UVM_CREATE_AND_SEND
        `uvm_create(req_item);
        if (!req_item.randomize()) begin
            `uvm_fatal("body:", "req randomization failure")
        end
        `uvm_send(req_item);
`elsif UVM_RAND_SEND 
        `uvm_create(req_item);
        `uvm_rand_send(req_item);
`else
        req_item = master_seq_item::type_id::create("req_item");
        start_item(req_item);

        if (!req_item.randomize()) begin
            `uvm_fatal("body:", "req randomization failure")
        end
        finish_item(req_item);
`endif
        get_response(rsp_item);
        `uvm_info(get_type_name(), {"get response after:\n", rsp_item.sprint()}, UVM_LOW);
    end

    `uvm_info(get_type_name(), "body: Exited ...", UVM_HIGH);
endtask

`endif /* _MASTER_SEQ_SV_ */
//--------------------------------------------------------------------------
