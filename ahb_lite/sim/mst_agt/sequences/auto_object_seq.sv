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
`ifndef _AUTO_OBJECT_SEQ_SV_
`define _AUTO_OBJECT_SEQ_SV_ 

//--------------------------------------------------------------------------
// Include File
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Class
//--------------------------------------------------------------------------
class auto_object_seq extends ahb_base_seq;

//--------------------------------------------------------------------------
// Design: declear and register
//--------------------------------------------------------------------------
`uvm_object_utils(auto_object_seq);

extern function new(string name = "auto_object_seq");
extern virtual task pre_body();
extern virtual task post_body();
extern task body();
endclass: auto_object_seq

//--------------------------------------------------------------------------
// Design: new
//--------------------------------------------------------------------------
function auto_object_seq::new(string name = "auto_object_seq");
    super.new(name);
endfunction

//--------------------------------------------------------------------------
// Design: Raise an objection if this is the parent sequence
//--------------------------------------------------------------------------
task auto_object_seq::pre_body();
    /*
    uvm_phase phase;
    super.pre_body();
    phase = get_starting_phase();

    if (phase != null) begin
        phase.raise_objection(this);
    end
    */
    `uvm_info(get_type_name(), "pre_body Entered ...", UVM_LOW);
    `uvm_info(get_type_name(), "pre_body Exited ...", UVM_LOW);
endtask: pre_body

//--------------------------------------------------------------------------
// Design: Drop an objection if this is the parent sequence
//--------------------------------------------------------------------------
task auto_object_seq::post_body();
    /*
    uvm_phase phase;
    super.post_body();
    phase = get_starting_phase();

    if (phase != null) begin
        phase.drop_objection(this);
    end
    */
    `uvm_info(get_type_name(), "post_body Entered ...", UVM_LOW);
    `uvm_info(get_type_name(), "post_body Exited ...", UVM_LOW);
endtask: post_body

//--------------------------------------------------------------------------
// Design: sequence, your stimulus code, this is the user-defined task
//         whers the main sequence code resides.
// uvm_do:
//        start_item(item);
//        item.randaomize();
//        finish_item(item);
//--------------------------------------------------------------------------
task auto_object_seq::body();
    logic [31:0] rdata;
    logic [31:0] wdata;
    logic [31:0] addr;
    `uvm_info(get_type_name(), "body Entered", UVM_HIGH);

    /* --------------- AHB PERIPHERIAL READ & WRITE TEST ------------------- */
    wdata  = 32'h1;
    addr   = 32'h0004_4004;
    ahb_write(addr, wdata);
    ahb_read(addr, rdata);

    addr   = 32'h0004_4008;
    wdata = wdata + 1;
    ahb_write(addr, wdata);
    ahb_read(addr, rdata);

    `uvm_info(get_type_name(), "body Entered", UVM_HIGH);
endtask

`endif /* _AUTO_OBJECT_SEQ_SV_ */
//--------------------------------------------------------------------------
