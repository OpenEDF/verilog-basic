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
`ifndef _AHB_MST_INIT_SEQ_SV_
`define _AHB_MST_INIT_SEQ_SV_

//--------------------------------------------------------------------------
// Include File
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Class
//--------------------------------------------------------------------------
class ahb_mst_init_seq extends ahb_base_seq;

//--------------------------------------------------------------------------
// Design: declear and register
//--------------------------------------------------------------------------
`uvm_object_utils(ahb_mst_init_seq);

extern function new(string name = "ahb_mst_init_seq");
extern task body();
endclass: ahb_mst_init_seq

//--------------------------------------------------------------------------
// Design: new
//--------------------------------------------------------------------------
function ahb_mst_init_seq::new(string name = "ahb_mst_init_seq");
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
task ahb_mst_init_seq::body();
    logic [31:0] rdata;
    logic [31:0] wdata;
    logic [31:0] addr;
    `uvm_info(get_type_name(), "base init seq: inside body", UVM_HIGH);

    /* --------------- AHB PERIPHERIAL READ & WRITE TEST ------------------- */
    wdata  = 32'h1234abcd;
    addr   = 32'h0004_4004;
    ahb_write(addr, wdata);
    ahb_read(addr, rdata);

    addr   = 32'h0004_4008;
    wdata = wdata + 4;
    ahb_write(addr, wdata);
    ahb_read(addr, rdata);

    addr   = 32'h0004_400C;
    wdata = wdata + 4;
    ahb_write(addr, wdata);
    ahb_read(addr, rdata);

    addr  = 32'h0004_4014;
    wdata = 32'h0000_01F0;
    ahb_write(addr, wdata);

    addr  = 32'h0004_4010;
    wdata = 32'hFFFF_0000;
    repeat(50) begin
        wdata = wdata + 1;
        ahb_write(addr, wdata);
    end

    /* enable response handler */
endtask

`endif /* _AHB_MST_INIT_SEQ_SV_ */
//--------------------------------------------------------------------------
