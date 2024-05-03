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

//--------------------------------------------------------------------------
// Include File
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Class
//--------------------------------------------------------------------------
class scoreboard extends uvm_scoreboard;

//--------------------------------------------------------------------------
// Design: declare and register
//--------------------------------------------------------------------------
uvm_analysis_imp #(seq_item, scoreboard) item_collect_export;
seq_item item_q[$];
`uvm_component_utils(scoreboard)

//--------------------------------------------------------------------------
// Design: new
//--------------------------------------------------------------------------
function new(string name = "scoreboard", uvm_component parent = null);
    super.new(name, parent);
    item_collect_export = new("item_collect_export", this);
endfunction

//--------------------------------------------------------------------------
// Design: build phase: create and configure of testbench structure
//--------------------------------------------------------------------------
function void build_phase(uvm_phase phase);
    super.build_phase(phase);
endfunction

//--------------------------------------------------------------------------
// Design: write: receives all transactions boardcasted
//--------------------------------------------------------------------------
function void write(seq_item req);
    /* Inserts the given item at the back of the queue */
    item_q.push_back(req);
endfunction

//--------------------------------------------------------------------------
// Design: run phase: stmulate the DUT
//--------------------------------------------------------------------------
task run_phase(uvm_phase phase);
    seq_item sb_item;
    forever begin
        wait (item_q.size() > 0);
        sb_item = item_q.pop_front();
        if (sb_item.ina + sb_item.inb == sb_item.out) begin
            `uvm_info(get_type_name, $sformatf("matched: ina = %0d, inb = %0d out = %0d", sb_item.ina, sb_item.inb, sb_item.out), UVM_LOW);
        end else begin
            `uvm_error(get_type_name, $sformatf("not matched: ina = %0d, inb = %0d out = %0d", sb_item.ina, sb_item.inb, sb_item.out));
        end
    end
endtask

//--------------------------------------------------------------------------
// Design: Report results of the test.
//--------------------------------------------------------------------------
virtual function void report_phase(uvm_phase phase);
    `uvm_info(get_type_name, "IN report_phase...", UVM_LOW);
endfunction

//--------------------------------------------------------------------------
// Design: Tie up loose ends.
//--------------------------------------------------------------------------
virtual function void final_phase(uvm_phase phase);
    `uvm_info(get_type_name, "IN final_phase...", UVM_LOW);
endfunction

endclass: scoreboard
//--------------------------------------------------------------------------
