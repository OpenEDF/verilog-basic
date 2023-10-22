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
`uvm_analysis_imp_decl(_port_ca)
`uvm_analysis_imp_decl(_port_cb)

//--------------------------------------------------------------------------
// Class
//--------------------------------------------------------------------------
class component_c extends uvm_component;

//--------------------------------------------------------------------------
// Design: declaring non-blocking iput imp port
//--------------------------------------------------------------------------
transaction trans;
uvm_analysis_imp_port_ca #(transaction, component_c) analysis_imp_a;
uvm_analysis_imp_port_cb #(transaction, component_c) analysis_imp_b;
`uvm_component_utils(component_c)

//--------------------------------------------------------------------------
// Design: component_b new method
//--------------------------------------------------------------------------
function new(string name, uvm_component parent);
    super.new(name, parent);
    analysis_imp_a = new("analysis_imp_a", this);
    analysis_imp_b = new("analysis_imp_b", this);
endfunction: new

//--------------------------------------------------------------------------
// Design: write port a 
//--------------------------------------------------------------------------
virtual function void write_port_ca(transaction trans);
    `uvm_info(get_type_name(), $sformatf("inside wirte port a"), UVM_LOW)
    `uvm_info(get_type_name(), $sformatf("recived trans on analysis imp port port"), UVM_LOW)
    `uvm_info(get_type_name(), $sformatf("printing the trans, \n %s", trans.sprint()), UVM_LOW)
endfunction: write_port_ca

//--------------------------------------------------------------------------
// Design: write port b 
//--------------------------------------------------------------------------
virtual function void write_port_cb(transaction trans);
    `uvm_info(get_type_name(), $sformatf("inside wirte port b"), UVM_LOW)
    `uvm_info(get_type_name(), $sformatf("recived trans on analysis imp port port"), UVM_LOW)
    `uvm_info(get_type_name(), $sformatf("printing the trans, \n %s", trans.sprint()), UVM_LOW)
endfunction: write_port_cb

endclass: component_c
//--------------------------------------------------------------------------
