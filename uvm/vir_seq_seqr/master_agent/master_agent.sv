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
`ifndef _MASTER_AGENT_SV_
`define _MASTER_AGENT_SV_

//--------------------------------------------------------------------------
// Include File
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Class
//--------------------------------------------------------------------------
class master_agent extends uvm_agent;

//--------------------------------------------------------------------------
// Design: declare and register
//--------------------------------------------------------------------------
`uvm_component_utils(master_agent)
master_driver      mst_drv;
master_sequencer   mst_seqr;

extern function new(string name = "master_agent", uvm_component parent = null);
extern virtual function void build_phase(uvm_phase phase);
extern virtual function void connect_phase(uvm_phase phase);

endclass: master_agent

//--------------------------------------------------------------------------
// Design: new
//--------------------------------------------------------------------------
function master_agent::new(string name = "master_agent", uvm_component parent = null);
    super.new(name, parent);
endfunction

//--------------------------------------------------------------------------
// Design: build phase: create and configure of testbench structure
//--------------------------------------------------------------------------
function void master_agent::build_phase(uvm_phase phase);
    super.build_phase(phase);

    /* UVM_ACTIVE and UVM PASSIVE */
    mst_drv  = master_driver::type_id::create("mst_drv", this);
    mst_seqr = master_sequencer::type_id::create("mst_seqr", this);
endfunction

//--------------------------------------------------------------------------
// Design: connect phase: establish cross-componement connections
//--------------------------------------------------------------------------
function void master_agent::connect_phase(uvm_phase phase);
    /* UVM_ACTIVE and UVM PASSIVE */
    mst_drv.seq_item_port.connect(mst_seqr.seq_item_export);
    mst_drv.rsp_port.connect(mst_seqr.rsp_export);
endfunction

`endif /* _MASTER_AGENT_SV_ */
//--------------------------------------------------------------------------
