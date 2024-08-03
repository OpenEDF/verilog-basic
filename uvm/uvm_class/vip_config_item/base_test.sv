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
class base_test extends uvm_test;

//--------------------------------------------------------------------------
// Design: instance
//--------------------------------------------------------------------------
test_basic_env env;
cust_seq_item_config cfg;
`uvm_component_utils(base_test)

//--------------------------------------------------------------------------
// Design: class constructor
//--------------------------------------------------------------------------
function new(string name = "base_test", uvm_component parent = null);
    super.new(name, parent);
endfunction

//--------------------------------------------------------------------------
// Design: build phase
//--------------------------------------------------------------------------
virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info("build phase", "base test BUILD-FLOW: Starting...", UVM_LOW);
    cfg = cust_seq_item_config::type_id::create("cfg");

    cfg.data1 = 32'h11223344;
    cfg.data2 = 32'h55667788;
    cfg.data_sum(cfg.data1, 2);

    `uvm_info("build phase", $sformatf("=========== system configuration ===========\n%0s", cfg.sprint()), UVM_LOW);

    uvm_config_db#(cust_seq_item_config)::set(this, "env", "item_cfg", cfg);
    uvm_config_db#(seq_item_config)::set(this, "env", "cfg", cfg);
    env = test_basic_env::type_id::create("env", this);

    `uvm_info("build phase", "base test BUILD-FLOW: Finishing...", UVM_LOW);
endfunction

endclass: base_test
