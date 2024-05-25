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
// Brief: connecting tlm port and imp port
// Change Log:
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Include File
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Class
//--------------------------------------------------------------------------
class component_a extends uvm_component;

//--------------------------------------------------------------------------
// Design: declaring non-blocking port
//--------------------------------------------------------------------------
transaction trans;
uvm_blocking_get_imp #(transaction, component_a) trans_out;
`uvm_component_utils(component_a)

//--------------------------------------------------------------------------
// Design: component_a new method
//--------------------------------------------------------------------------
function new(string name, uvm_component parent);
    super.new(name, parent);
    trans_out = new("trans_out", this);
endfunction: new

//--------------------------------------------------------------------------
// Design: get imp
//--------------------------------------------------------------------------
virtual task get(output transaction trans);
    `uvm_info(get_type_name(), $sformatf("recived transaction imp port get request"), UVM_LOW)
    trans = transaction::type_id::create("trans", this);
    void'(trans.randomize());
    `uvm_info(get_type_name(), $sformatf("tranaction randomized"), UVM_LOW)
    `uvm_info(get_type_name(), $sformatf("printing trans, \n %s", trans.sprint()), UVM_LOW)
    `uvm_info(get_type_name(), $sformatf("sendting trans packet"), UVM_LOW)
endtask: get 

endclass: component_a
//--------------------------------------------------------------------------
