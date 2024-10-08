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
`ifndef _BASE_VSEQ_SV_
`define _BASE_VSEQ_SV_

//--------------------------------------------------------------------------
// Include File
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Class
//--------------------------------------------------------------------------
class base_vseq extends uvm_sequence;

//--------------------------------------------------------------------------
// Design: declear and register
//--------------------------------------------------------------------------
`uvm_object_utils(base_vseq)

`ifdef SQR_MANUAL_POINTER
    virtual_sequencer v_sqr;
`else
    `uvm_declare_p_sequencer(virtual_sequencer)
`endif

master_sequencer mst_sqr;
slave_sequencer  slv_sqr;
extern function new(string name = "base_vseq");
extern virtual task body();

endclass: base_vseq

//--------------------------------------------------------------------------
// Design: new
//--------------------------------------------------------------------------
function base_vseq::new(string name = "base_vseq");
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
task base_vseq::body();
    `uvm_info(get_type_name(), "body Entered", UVM_HIGH);

`ifdef SQR_MANUAL_POINTER
    if (!$cast(v_sqr, m_sequencer)) begin
        `uvm_fatal(get_full_name(), "virtual seqr pointer cast failed")
    end
    mst_sqr = v_sqr.master_seqr;
    slv_sqr = v_sqr.slave_seqr;
`else
    mst_sqr = p_sequencer.master_seqr;
    slv_sqr = p_sequencer.slave_seqr;
`endif

    `uvm_info(get_type_name(), "body Entered", UVM_HIGH);
endtask

`endif /* _BASE_VSEQ_SV_ */
//--------------------------------------------------------------------------
