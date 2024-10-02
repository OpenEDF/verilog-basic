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
`ifndef _SLAVE_SEQ_SV_
`define _SLAVE_SEQ_SV_

//--------------------------------------------------------------------------
// Include File
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Class
//--------------------------------------------------------------------------
class slave_seq extends uvm_sequence #(slave_seq_item);

//--------------------------------------------------------------------------
// Design: declear and register
//--------------------------------------------------------------------------
`uvm_object_utils(slave_seq)

extern function new(string name = "slave_seq");
extern virtual task body();
endclass: slave_seq

//--------------------------------------------------------------------------
// Design: new
//--------------------------------------------------------------------------
function slave_seq::new(string name = "slave_seq");
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
task slave_seq::body();
    REQ req_item;
    RSP rsp_item;

    `uvm_info(get_type_name(), "body: Entered ...", UVM_HIGH)
    repeat(10) begin
        req_item = slave_seq_item::type_id::create("req_item");
        start_item(req_item);
        if (!req_item.randomize()) begin
            `uvm_fatal("body:", "req randomization failure")
        end
        finish_item(req_item);

        get_response(rsp_item);
        `uvm_info(get_type_name(), {"get response after:\n", rsp_item.sprint()}, UVM_LOW)
    end

    `uvm_info(get_type_name(), "body: Exited ...", UVM_HIGH)
endtask

`endif /* _SLAVE_SEQ_SV_ */
//--------------------------------------------------------------------------
