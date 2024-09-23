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
`ifndef _AHB_MST_INT_SEQ_SV_
`define _AHB_MST_INT_SEQ_SV_

//--------------------------------------------------------------------------
// Include File
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Class
//--------------------------------------------------------------------------
class ahb_mst_int_seq extends ahb_base_seq;

//--------------------------------------------------------------------------
// Design: declear and register
//--------------------------------------------------------------------------
`uvm_object_utils(ahb_mst_int_seq);

extern function new(string name = "ahb_mst_int_seq");
extern task body();
endclass: ahb_mst_int_seq

//--------------------------------------------------------------------------
// Design: new
//--------------------------------------------------------------------------
function ahb_mst_int_seq::new(string name = "ahb_mst_int_seq");
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
task ahb_mst_int_seq::body();
    logic [31:0] addr;
    logic [31:0] wdata;
    logic [31:0] rdata;
    `uvm_info(get_type_name(), "interrupt handler seq: inside body", UVM_HIGH);

    /* clear int */
    grab();

    addr = 32'h0004_4014;
    ahb_read(addr, rdata);
    `uvm_info(get_type_name(), $sformatf("interrupt status register: 32'h%h", rdata), UVM_LOW);

    if (rdata[0]) begin
        `uvm_info(get_type_name(), "IRQ[0] detected", UVM_LOW);
        wdata = rdata;
        wdata[0] = 1;
        ahb_write(addr, wdata);
    end

    if (rdata[1]) begin
        `uvm_info(get_type_name(), "IRQ[1] detected", UVM_LOW);
        wdata = rdata;
        wdata[1] = 1;
        ahb_write(addr, wdata);
    end

    if (rdata[2]) begin
        `uvm_info(get_type_name(), "IRQ[2] detected", UVM_LOW);
        wdata = rdata;
        wdata[2] = 1;
        ahb_write(addr, wdata);
    end

    if (rdata[3]) begin
        `uvm_info(get_type_name(), "IRQ[3] detected", UVM_LOW);
        wdata = rdata;
        wdata[3] = 1;
        ahb_write(addr, wdata);
    end
    ungrab();
endtask

`endif /* _AHB_MST_INT_SEQ_SV_ */
//--------------------------------------------------------------------------
