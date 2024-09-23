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
`ifndef _AHB_BASE_SEQ_SV_
`define _AHB_BASE_SEQ_SV_

//--------------------------------------------------------------------------
// Include File
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Class
//--------------------------------------------------------------------------
class ahb_base_seq extends uvm_sequence#(ahb_mst_tran);

//--------------------------------------------------------------------------
// Design: declear and register
//--------------------------------------------------------------------------
`uvm_object_utils(ahb_base_seq);

extern function new(string name = "ahb_base_seq");
extern task ahb_read(input logic[31:0] addr, output logic[31:0] data);
extern task ahb_write(input logic[31:0] addr, input logic[31:0] data);
endclass: ahb_base_seq

//--------------------------------------------------------------------------
// Design: new
//--------------------------------------------------------------------------
function ahb_base_seq::new(string name = "ahb_base_seq");
    super.new(name);
endfunction

//--------------------------------------------------------------------------
// Design: ahb nonseq read
//--------------------------------------------------------------------------
task ahb_base_seq::ahb_read(input logic[31:0] addr, output logic[31:0] data);
    REQ req_item;
    RSP rsp_item;
    `uvm_info(get_type_name(), "ahb read data.", UVM_HIGH);
    req_item = ahb_mst_tran::type_id::create("req_item");
    start_item(req_item);
    if (!req_item.randomize() with {HTRANS == NONSEQ; HWRITE == READ; HADDR == addr;}) begin
        `uvm_fatal("body:", "req randomization failure")
    end
    req_item.HRESETn = 1;
    finish_item(req_item);
    req_item.end_event.wait_on();
    get_response(rsp_item);
    data = rsp_item.HRDATA;
    `uvm_info(get_type_name(), {"get response after:\n", rsp_item.sprint()}, UVM_HIGH);
endtask: ahb_read

//--------------------------------------------------------------------------
// Design: ahb nonseq write
//--------------------------------------------------------------------------
task ahb_base_seq::ahb_write(input logic[31:0] addr, input logic[31:0] data);
    REQ req_item;
    RSP rsp_item;
    `uvm_info(get_type_name(), "ahb read data.", UVM_HIGH);
    req_item = ahb_mst_tran::type_id::create("req_item");
    start_item(req_item);
    if (!req_item.randomize() with {HTRANS == NONSEQ; HWRITE == WRITE; HADDR == addr; HWDATA == data;}) begin
        `uvm_fatal("body:", "req randomization failure")
    end
    req_item.HRESETn = 1;
    finish_item(req_item);
    req_item.end_event.wait_on();
    get_response(rsp_item);
    `uvm_info(get_type_name(), {"get response after:\n", rsp_item.sprint()}, UVM_HIGH);
endtask: ahb_write

`endif /* _AHB_BASE_SEQ_SV_ */
//--------------------------------------------------------------------------
