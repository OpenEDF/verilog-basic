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
// Brief: environment
// Change Log:
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Include File
//--------------------------------------------------------------------------
`include "component_a.sv"
`include "component_b.sv"

//--------------------------------------------------------------------------
// Module
//--------------------------------------------------------------------------
class environments extends uvm_env;

//--------------------------------------------------------------------------
// Design: register factory
//--------------------------------------------------------------------------
component_a comp_a;
component_a comp_b;
uvm_heartbeat heart_beat;
uvm_event hb_event;
`uvm_component_utils(environments)

//--------------------------------------------------------------------------
// Design: constructor
//--------------------------------------------------------------------------
function new(string name, uvm_component parent);
    super.new(name, parent);
endfunction: new

//--------------------------------------------------------------------------
// Design: build phase
//--------------------------------------------------------------------------
function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    comp_a = component_a::type_id::create("comp_a", this);
    comp_b = component_a::type_id::create("comp_b", this);
    heart_beat = new("heart_beat", this, obje);
    hb_event = new("hb_event");
endfunction : build_phase

//--------------------------------------------------------------------------
// Design: connect phase
//--------------------------------------------------------------------------
function void connect_phase(uvm_phase phase);
    uvm_component hb[$];
    heart_beat.set_mode(UVM_ALL_ACTIVE);
    //heart_beat.set_mode(UVM_ANY_ACTIVE);
    //heart_beat.set_mode(UVM_ONE_ACTIVE);
    heart_beat.set_heartbeat(hb_event, hb);
    heart_beat.add(comp_a);
    heart_beat.add(comp_b);
endfunction: connect_phase

//--------------------------------------------------------------------------
// Design: run phase
//--------------------------------------------------------------------------
virtual task run_phase(uvm_phase phase);
    heart_beat.start(hb_event);
    repeat(10) begin
        #60;
        `uvm_info(get_type_name(), $sformatf("[ env ] triggering hb_evnet"), UVM_LOW)
        hb_event.trigger();
    end
endtask: run_phase

endclass : environments
//--------------------------------------------------------------------------
