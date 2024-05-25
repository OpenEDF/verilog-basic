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
`include "component_a_a.sv"

//--------------------------------------------------------------------------
// Class
//--------------------------------------------------------------------------
class component_a extends uvm_component;

//--------------------------------------------------------------------------
// Design: declaring non-blocking port
//--------------------------------------------------------------------------
component_a_a sub_comp_a_a;
uvm_blocking_put_port #(transaction) trans_out;
`uvm_component_utils(component_a)

//--------------------------------------------------------------------------
// Design: component_a new method
//--------------------------------------------------------------------------
function new(string name, uvm_component parent);
    super.new(name, parent);
    trans_out = new("trans_out", this);
endfunction : new

//--------------------------------------------------------------------------
// Design: build phase
//--------------------------------------------------------------------------
function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    sub_comp_a_a = component_a_a::type_id::create("sub_comp_a_a", this);
endfunction : build_phase

//--------------------------------------------------------------------------
// Design: connect phase
//--------------------------------------------------------------------------
function void connect_phase(uvm_phase phase);
    sub_comp_a_a.trans_out.connect(trans_out);
endfunction : connect_phase

endclass : component_a
//--------------------------------------------------------------------------
