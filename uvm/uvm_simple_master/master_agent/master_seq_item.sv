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
// Brief: uvm sequence item example
// Change Log:
//--------------------------------------------------------------------------
`ifndef _MASTER_SEQ_ITEM_SV_
`define _MASTER_SEQ_ITEM_SV_

//--------------------------------------------------------------------------
// Include File
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Class
//--------------------------------------------------------------------------
class master_seq_item extends uvm_sequence_item;

//--------------------------------------------------------------------------
// Design: control signal
//--------------------------------------------------------------------------
randc bit [31:0]  HADDR;
randc bit [31:0]  HWDATA;

//--------------------------------------------------------------------------
// Design: utility and field macros
//--------------------------------------------------------------------------
`uvm_object_utils_begin(master_seq_item)
    `uvm_field_int(HADDR, UVM_ALL_ON)
    `uvm_field_int(HWDATA, UVM_ALL_ON)
`uvm_object_utils_end

//--------------------------------------------------------------------------
// Design: declaer method
//--------------------------------------------------------------------------
extern function new(string name = "master_seq_item");
endclass: master_seq_item

//--------------------------------------------------------------------------
// Design: new
//--------------------------------------------------------------------------
function master_seq_item::new(string name = "master_seq_item");
    super.new(name);
endfunction

`endif  /* _MASTER_SEQ_ITEM_SV_ */
//--------------------------------------------z-----------------------------
