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
// Brief: The UVM scoreboard is a component that checks the functionality of
//        the DUT. It receives transactions from the monitor using the
//        analysis export for checking purposes.
// Change Log:
//--------------------------------------------------------------------------
`ifndef _AHB_LITE_SCOREBOARD_SV_
`define _AHB_LITE_SCOREBOARD_SV_

//--------------------------------------------------------------------------
// Include File
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Class
//--------------------------------------------------------------------------
class ahb_lite_scoreboard extends uvm_scoreboard;

//--------------------------------------------------------------------------
// Design: declare and register
//--------------------------------------------------------------------------
uvm_analysis_imp #(ahb_mst_tran, ahb_lite_scoreboard) item_collect_export;
ahb_mst_tran mst_tran_q[$];
`uvm_component_utils(ahb_lite_scoreboard)

//--------------------------------------------------------------------------
// Design: declare method
//--------------------------------------------------------------------------
extern function new(string name = "ahb_lite_scoreboard", uvm_component parent = null);
extern function void build_phase(uvm_phase phase);
extern function void write(ahb_mst_tran req);
extern task run_phase(uvm_phase phase);

endclass: ahb_lite_scoreboard
//--------------------------------------------------------------------------
// Design: new
//--------------------------------------------------------------------------
function ahb_lite_scoreboard::new(string name = "ahb_lite_scoreboard", uvm_component parent = null);
    super.new(name, parent);
    item_collect_export = new("item_collect_export", this);
endfunction

//--------------------------------------------------------------------------
// Design: build phase: create and configure of testbench structure
//--------------------------------------------------------------------------
function void ahb_lite_scoreboard::build_phase(uvm_phase phase);
    super.build_phase(phase);
endfunction

//--------------------------------------------------------------------------
// Design: write: receives all transactions boardcasted
//--------------------------------------------------------------------------
function void ahb_lite_scoreboard::write(ahb_mst_tran req);
    /* Inserts the given item at the back of the queue */
    mst_tran_q.push_back(req);
endfunction

//--------------------------------------------------------------------------
// Design: run phase: stmulate the DUT
//--------------------------------------------------------------------------
task ahb_lite_scoreboard::run_phase(uvm_phase phase);
    ahb_mst_tran mst_sb_item;
    forever begin
        wait (mst_tran_q.size() > 0);
        mst_sb_item = mst_tran_q.pop_front();
        //`uvm_info(get_type_name(), mst_sb_item.sprintf(), UVM_LOW);
    end
endtask

`endif /* _AHB_LITE_SCOREBOARD_SV_ */
//--------------------------------------------------------------------------
