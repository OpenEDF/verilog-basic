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

//--------------------------------------------------------------------------
// Include File
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Class
//--------------------------------------------------------------------------
class test_basic_env extends uvm_env;

`uvm_component_utils(test_basic_env)

//--------------------------------------------------------------------------
// Design: instance
//--------------------------------------------------------------------------
cust_seq_item_config item_cfg;
seq_item_config      cfg;
int                  test_array[2];

//--------------------------------------------------------------------------
// Design: class constructor
//--------------------------------------------------------------------------
function new(string name = "test_basic_env", uvm_component parent = null);
    super.new(name, parent);
endfunction

//--------------------------------------------------------------------------
// Design: build phase
//--------------------------------------------------------------------------
virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("build phase", "base test BUILD-FLOW: Starting...", UVM_LOW);
    if (!uvm_config_db#(cust_seq_item_config)::get(this, "", "item_cfg", item_cfg)) begin
        `uvm_fatal("build phase", "no cust_seq_item_config create!");
    end else begin
        `uvm_info("build phase", $sformatf("=========== system item cfg configuration ===========\n%0s", item_cfg.sprint()), UVM_LOW);
    end

    if (!uvm_config_db#(seq_item_config)::get(this, "", "cfg", cfg)) begin
        `uvm_fatal("build phase", "no seq_item_config create!");
    end else begin
        `uvm_info("build phase", $sformatf("=========== system cfg configuration ===========\n%0s", cfg.sprint()), UVM_LOW);
    end

    test_array[0] = cfg.data1;
    test_array[1] = cfg.data2;
    `uvm_info("build phase", $sformatf("array[0]: 0x%h", test_array[0]), UVM_LOW);
    `uvm_info("build phase", $sformatf("array[1]: 0x%h", test_array[1]), UVM_LOW);
    `uvm_info("build phase", "base test BUILD-FLOW: Finishing...", UVM_LOW);
endfunction

endclass: test_basic_env
