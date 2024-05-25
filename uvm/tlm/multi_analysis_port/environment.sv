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
`include "transaction.sv"
`include "component_a.sv"
`include "component_b.sv"

//--------------------------------------------------------------------------
// Class
//--------------------------------------------------------------------------
class environment extends uvm_env;

//--------------------------------------------------------------------------
// Design: components instantion
//--------------------------------------------------------------------------
component_a comp_a;
component_b comp_b;
`uvm_component_utils(environment)

//--------------------------------------------------------------------------
// Design: constrctor
//--------------------------------------------------------------------------
function new(string name, uvm_component parent);
    super.new(name, parent);
endfunction: new

//--------------------------------------------------------------------------
// Design: create the components
//--------------------------------------------------------------------------
function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    comp_a = component_a::type_id::create("comp_a", this);
    comp_b = component_b::type_id::create("comp_b", this);
endfunction: build_phase

//--------------------------------------------------------------------------
// Design: connect phase
//--------------------------------------------------------------------------
function void connect_phase(uvm_phase phase);
    comp_a.analysis_port.connect(comp_b.analysis_imp_a);
    comp_a.analysis_port.connect(comp_b.analysis_imp_b);
endfunction: connect_phase

endclass: environment
