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
`include "event_callback.sv"
`include "component_a.sv"
`include "component_b.sv"

//--------------------------------------------------------------------------
// Module
//--------------------------------------------------------------------------
class basic_test extends uvm_test;

//--------------------------------------------------------------------------
// Design: register factory
//--------------------------------------------------------------------------
`uvm_component_utils(basic_test)
component_a comp_a;
component_b comp_b;

//--------------------------------------------------------------------------
// Design: constructor
//--------------------------------------------------------------------------
function new(string name = "basic_test", uvm_component parent = null);
    super.new(name, parent);
endfunction: new

//--------------------------------------------------------------------------
// Design: build phase
//--------------------------------------------------------------------------
virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    comp_a = component_a::type_id::create("comp_a", this);
    comp_b = component_b::type_id::create("comp_b", this);
endfunction: build_phase

//--------------------------------------------------------------------------
// Design: end_of_elobaration phase
//--------------------------------------------------------------------------
virtual function void end_of_elaboration();
    print();
endfunction

endclass : basic_test
//--------------------------------------------------------------------------
