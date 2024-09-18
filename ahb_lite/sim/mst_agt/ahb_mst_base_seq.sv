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
`ifndef _AHB_MST_BASE_SEQ_SV_
`define _AHB_MST_BASE_SEQ_SV_

//--------------------------------------------------------------------------
// Include File
//--------------------------------------------------------------------------
`define TEST_NUM 1024
`define WAIT_NUM (`TEST_NUM * 4)

//--------------------------------------------------------------------------
// Class
//--------------------------------------------------------------------------
class ahb_mst_base_seq extends uvm_sequence#(ahb_mst_tran);

//--------------------------------------------------------------------------
// Design: declear and register
//--------------------------------------------------------------------------
`uvm_object_utils(ahb_mst_base_seq);
int count;
logic [31:0] addr[`TEST_NUM];

extern function new(string name = "ahb_mst_base_seq");
extern task body();
extern function void response_handler(uvm_sequence_item response);
extern task ahb_read(input logic[31:0] addr, output logic[31:0] data);
extern task ahb_write(input logic[31:0] addr, input logic[31:0] data);
endclass: ahb_mst_base_seq

//--------------------------------------------------------------------------
// Design: new
//--------------------------------------------------------------------------
function ahb_mst_base_seq::new(string name = "ahb_mst_base_seq");
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
task ahb_mst_base_seq::body();
    REQ req_item;
    RSP rsp_item;
    int each_ctrl;
    int rdata, wdata, rwaddr;

    `uvm_info(get_type_name(), "base seq: inside body", UVM_HIGH);
    req_item = ahb_mst_tran::type_id::create("req_item");
    count = 0;
    each_ctrl = 0;

    /* --------------- AHB PERIPHERIAL READ & WRITE TEST ------------------- */
    wdata  = 32'h1234abcd;
    rwaddr = 32'h0004_4004;
    ahb_write(rwaddr, wdata);
    ahb_read(rwaddr, rdata);
    rwaddr = rwaddr + 4;
    wdata = wdata + 4;
    ahb_write(rwaddr, wdata);
    ahb_read(rwaddr, rdata);
    rwaddr = rwaddr + 4;
    wdata = wdata + 4;
    ahb_write(rwaddr, wdata);
    ahb_read(rwaddr, rdata);
    rwaddr = rwaddr + 8;
    wdata = 32'h0000_00F0;
    ahb_write(rwaddr, wdata);

    /* enable response handler */
    use_response_handler(1);
    /* ------------------------ ROM TEST -------------------------- */
    req_item.ahb_lite_addr.constraint_mode(0);
    repeat(`TEST_NUM) begin
        /* send item */
        start_item(req_item);
        if (each_ctrl == 0) begin
            if (!req_item.randomize() with { HWRITE == READ; HTRANS == NONSEQ;
                HADDR inside {[32'h0004_0000:32'h0004_03FF]}; }) begin
                `uvm_fatal("body:", "req randomization failure")
            end
        end else begin
            if (!req_item.randomize() with { HWRITE == READ; HTRANS == SEQ;
                HADDR inside {[32'h0004_0000:32'h0004_03FF]}; }) begin
                `uvm_fatal("body:", "req randomization failure")
            end
        end
        req_item.HRESETn = 1;
        each_ctrl++;
        finish_item(req_item);
    end

    /* --------------- RAM READ & WRITE TEST ---------------------- */
    each_ctrl = 0;
    repeat(`TEST_NUM) begin
        /* send item */
        start_item(req_item);

        if (each_ctrl == 0) begin
            if (!req_item.randomize() with { HWRITE == WRITE; HTRANS == NONSEQ;
                HADDR inside {[32'h4_1000:32'h4_13FF]}; }) begin
                `uvm_fatal("body:", "req randomization failure")
            end
        end else begin
            if (!req_item.randomize() with { HWRITE == WRITE; HTRANS == SEQ;
                HADDR inside {[32'h4_1000:32'h4_13FF]}; }) begin
                `uvm_fatal("body:", "req randomization failure")
            end
        end
        req_item.HRESETn = 1;
        addr[each_ctrl] = req_item.HADDR;
        each_ctrl++;

        finish_item(req_item);

        /* receive item */
        // get_response(rsp_item);
        //`uvm_info(get_type_name(), {"get response after:\n", rsp_item.sprint()}, UVM_HIGH);
    end

    foreach (addr[index]) begin
        start_item(req_item);
        req_item.HADDR  = addr[index];
        req_item.HWRITE = READ;
        finish_item(req_item);
    end

    /* --------------- RAM ROM MULTI READ & WRITE TEST ---------------------- */
    req_item.ahb_lite_addr.constraint_mode(1);
    each_ctrl = 0;
    repeat(`TEST_NUM) begin
        /* send item */
        start_item(req_item);

        if (!req_item.randomize() with {HTRANS == SEQ; }) begin
            `uvm_fatal("body:", "req randomization failure")
        end
        req_item.HRESETn = 1;

        finish_item(req_item);
    end

    /* wait all operation complete */
    wait(count == `WAIT_NUM);
endtask

//--------------------------------------------------------------------------
// Design: response handler
//--------------------------------------------------------------------------
function void ahb_mst_base_seq::response_handler(uvm_sequence_item response);
    `uvm_info(get_type_name(), "IN response_handler", UVM_HIGH);
    count++;
endfunction: response_handler

//--------------------------------------------------------------------------
// Design: ahb nonseq read
//--------------------------------------------------------------------------
task ahb_mst_base_seq::ahb_read(input logic[31:0] addr, output logic[31:0] data);
    REQ req_item;
    RSP rsp_item;
    `uvm_info(get_type_name(), "ahb read data.", UVM_HIGH);
    req_item = ahb_mst_tran::type_id::create("req_item");
    rsp_item = ahb_mst_tran::type_id::create("req_item");
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
task ahb_mst_base_seq::ahb_write(input logic[31:0] addr, input logic[31:0] data);
    REQ req_item;
    `uvm_info(get_type_name(), "ahb read data.", UVM_HIGH);
    req_item = ahb_mst_tran::type_id::create("req_item");
    start_item(req_item);
    if (!req_item.randomize() with {HTRANS == NONSEQ; HWRITE == WRITE; HADDR == addr; HWDATA == data;}) begin
        `uvm_fatal("body:", "req randomization failure")
    end
    req_item.HRESETn = 1;
    finish_item(req_item);
endtask: ahb_write
`endif /* _AHB_MST_BASE_SEQ_SV_ */
//--------------------------------------------------------------------------
