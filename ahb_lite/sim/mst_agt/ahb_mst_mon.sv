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
// Brief: A UVM monitor is a passive component used to capture DUT signals
//        using a virtual interface and translate them into a sequence item
//        format.
// Change Log:
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Include File
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Class
//--------------------------------------------------------------------------
class monitor extends uvm_monitor;

//--------------------------------------------------------------------------
// Design: declare and register
//--------------------------------------------------------------------------
virtual add_if vif;
uvm_analysis_port #(seq_item) item_collect_port;
seq_item mon_item;
uvm_event intr_e;
`uvm_component_utils(monitor)

//--------------------------------------------------------------------------
// Design: new
//--------------------------------------------------------------------------
function new(string name = "monitor", uvm_component parent = null);
    super.new(name, parent);
    item_collect_port = new("item_collect_port", this);
    mon_item = new();
    intr_e = uvm_event_pool::get_global("INT");
endfunction

//--------------------------------------------------------------------------
// Design: build phase: create and configure of testbench structure
//--------------------------------------------------------------------------
function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (!uvm_config_db#(virtual add_if) :: get(this, "", "vif", vif))
        `uvm_fatal(get_type_name(), "vif not set the top level!")
endfunction

//--------------------------------------------------------------------------
// Design: run phase: stmulate the DUT
//--------------------------------------------------------------------------
task run_phase(uvm_phase phase);
    forever begin
        wait(vif.rst_n);
        @(posedge vif.clk);
        mon_item.ina = vif.ina;
        mon_item.inb = vif.inb;
        `uvm_info(get_type_name, $sformatf("ina = %0d, inb = %0d", mon_item.ina, mon_item.inb), UVM_LOW);
        @(posedge vif.clk)
        mon_item.out = vif.out;
        `uvm_info(get_type_name, $sformatf("out = %0d", mon_item.out), UVM_LOW);

        /* trigger interrupt */
        if (mon_item.out > 100) begin
            `uvm_info(get_type_name, "trigger interrupt", UVM_LOW);
            intr_e.trigger();
        end

        /* TODO: signal from DUT module */

        /* send specified value to all connected interface */
        item_collect_port.write(mon_item);
    end
endtask

endclass: monitor
//--------------------------------------------------------------------------
