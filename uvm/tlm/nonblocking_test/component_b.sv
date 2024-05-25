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
class component_b extends uvm_component;

//--------------------------------------------------------------------------
// Design: declaring non-blocking iput imp port
//--------------------------------------------------------------------------
transaction trans;
uvm_nonblocking_put_imp #(transaction, component_b) trans_in;
`uvm_component_utils(component_b)

//--------------------------------------------------------------------------
// Design: component_b new method
//--------------------------------------------------------------------------
function new(string name, uvm_component parent);
    super.new(name, parent);
    trans_in = new("trans_in", this);
endfunction: new

//--------------------------------------------------------------------------
// Design: imp the try put method
//--------------------------------------------------------------------------
virtual function bit try_put(transaction trans);
    `uvm_info(get_type_name(), $sformatf("Inside try_put method"), UVM_LOW)
    `uvm_info(get_type_name(), $sformatf("Recived trans on non-blocking imp port"), UVM_LOW)
    `uvm_info(get_type_name(), $sformatf("printing the trans, \n %s", trans.sprint()), UVM_LOW)
endfunction: try_put

//--------------------------------------------------------------------------
// Design: imp thei can put method
//--------------------------------------------------------------------------
virtual function bit can_put();
    `uvm_info(get_type_name(), $sformatf("Inside can_put method"), UVM_LOW)
    `uvm_info(get_type_name(), $sformatf("Send can_put status as 1"), UVM_LOW)
    return 1;
endfunction

endclass: component_b
//--------------------------------------------------------------------------
