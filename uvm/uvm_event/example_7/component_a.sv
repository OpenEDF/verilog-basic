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
// Brief: uvm barries
// Change Log:
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Include File
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Module
//--------------------------------------------------------------------------
class component_a extends uvm_component;

//--------------------------------------------------------------------------
// Design: register factory
//--------------------------------------------------------------------------
`uvm_component_utils(component_a)
uvm_event ev;
transaction trans;

//--------------------------------------------------------------------------
// Design: constructor
//--------------------------------------------------------------------------
function new(string name, uvm_component parent);
    super.new(name, parent);
endfunction: new

//--------------------------------------------------------------------------
// Design: run phase
//--------------------------------------------------------------------------
virtual task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    #10;
    trans = transaction::type_id::create("trans", this);
    trans.randomize();
    `uvm_info(get_type_name(), $sformatf("randomized trans\n %s", trans.sprint()), UVM_LOW)

    ev = uvm_event_pool::get_global("ev_ab");
    `uvm_info(get_type_name(), $sformatf("before triggering the event"), UVM_LOW)
    #10;
    ev.trigger(trans);
    `uvm_info(get_type_name(), $sformatf("after triggering the event"), UVM_LOW)
    phase.drop_objection(this);
endtask: run_phase

endclass : component_a
//--------------------------------------------------------------------------
