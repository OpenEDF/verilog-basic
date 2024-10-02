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
// Brief:An agent is a container that holds and connects the driver, monitor,
//       and sequencer instances.
// Change Log:
//--------------------------------------------------------------------------
`ifndef _SLAVE_AGENT_SV_
`define _SLAVE_AGENT_SV_

//--------------------------------------------------------------------------
// Include File
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Class
//--------------------------------------------------------------------------
class slave_agent extends uvm_agent;

//--------------------------------------------------------------------------
// Design: declare and register
//--------------------------------------------------------------------------
slave_driver      slv_drv;
slave_sequencer   slv_seqr;
`uvm_component_utils(slave_agent)

extern function new(string name = "slave_agent", uvm_component parent = null);
extern virtual function void build_phase(uvm_phase phase);
extern virtual function void connect_phase(uvm_phase phase);

endclass: slave_agent

//--------------------------------------------------------------------------
// Design: new
//--------------------------------------------------------------------------
function slave_agent::new(string name = "slave_agent", uvm_component parent = null);
    super.new(name, parent);
endfunction

//--------------------------------------------------------------------------
// Design: build phase: create and configure of testbench structure
//--------------------------------------------------------------------------
function void slave_agent::build_phase(uvm_phase phase);
    super.build_phase(phase);

    /* UVM_ACTIVE and UVM PASSIVE */
    slv_drv  = slave_driver::type_id::create("slv_drv", this);
    slv_seqr = slave_sequencer::type_id::create("slv_seqr", this);
endfunction

//--------------------------------------------------------------------------
// Design: connect phase: establish cross-componement connections
//--------------------------------------------------------------------------
function void slave_agent::connect_phase(uvm_phase phase);
    /* UVM_ACTIVE and UVM PASSIVE */
    slv_drv.seq_item_port.connect(slv_seqr.seq_item_export);
    slv_drv.rsp_port.connect(slv_seqr.rsp_export);
endfunction

`endif /* _SLAVE_AGENT_SV_ */
//--------------------------------------------------------------------------
