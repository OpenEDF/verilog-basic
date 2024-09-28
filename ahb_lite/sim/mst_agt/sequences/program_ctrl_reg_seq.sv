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
`ifndef _PROGRAM_CTRL_REG_SEQ_SV_
`define _PROGRAM_CTRL_REG_SEQ_SV_ 

//--------------------------------------------------------------------------
// Include File
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Class
//--------------------------------------------------------------------------
class program_ctrl_reg_seq extends ahb_base_seq;

//--------------------------------------------------------------------------
// Design: declear and register
//--------------------------------------------------------------------------
`uvm_object_utils(program_ctrl_reg_seq);

extern function new(string name = "program_ctrl_reg_seq");
extern task body();
endclass: program_ctrl_reg_seq

//--------------------------------------------------------------------------
// Design: new
//--------------------------------------------------------------------------
function program_ctrl_reg_seq::new(string name = "program_ctrl_reg_seq");
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
task program_ctrl_reg_seq::body();
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

`endif /* _PROGRAM_CTRL_REG_SEQ_SV_ */
//--------------------------------------------------------------------------
