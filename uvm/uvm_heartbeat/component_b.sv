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
class component_b extends uvm_component;

//--------------------------------------------------------------------------
// Design: register factory
//--------------------------------------------------------------------------
`uvm_component_utils(component_b)

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
    `uvm_info(get_type_name(), $sformatf("[ comp-B ] objection raised"), UVM_LOW)
    for(int index = 0; index < 10; index++) begin
        `uvm_info(get_type_name(), $sformatf("[ comp-B ] idx-%0d raising objection raised", index), UVM_LOW)
        obje.raise_objection(this); //objection is declared in the top file.
        #30;
    end

    phase.drop_objection(this);
endtask: run_phase

endclass : component_b
//--------------------------------------------------------------------------
