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
`ifndef _AHB_MST_AGT_SV_
`define _AHB_MST_AGT_SV_

//--------------------------------------------------------------------------
// Include File
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Class
//--------------------------------------------------------------------------
class ahb_mst_agt extends uvm_agent;

//--------------------------------------------------------------------------
// Design: declare and register
//--------------------------------------------------------------------------
`uvm_component_utils(ahb_mst_agt)
ahb_mst_drv    mst_drv;
ahb_mst_seqr   mst_seqr;
ahb_mst_mon    mst_mon;

extern function new(string name = "ahb_mst_agt", uvm_component parent = null);
extern function void build_phase(uvm_phase phase);
extern function void connect_phase(uvm_phase phase);

endclass: ahb_mst_agt

//--------------------------------------------------------------------------
// Design: new
//--------------------------------------------------------------------------
function ahb_mst_agt::new(string name = "ahb_mst_agt", uvm_component parent = null);
    super.new(name, parent);
endfunction

//--------------------------------------------------------------------------
// Design: build phase: create and configure of testbench structure
//--------------------------------------------------------------------------
function void ahb_mst_agt::build_phase(uvm_phase phase);
    super.build_phase(phase);
    /* UVM_ACTIVE and UVM PASSIVE */
    if (get_is_active == UVM_ACTIVE) begin
        mst_drv  = ahb_mst_drv::type_id::create("mst_drv", this);
        mst_seqr = ahb_mst_seqr::type_id::create("mst_seqr", this);
    end
    mst_mon = ahb_mst_mon::type_id::create("mst_mon", this);
endfunction

//--------------------------------------------------------------------------
// Design: connect phase: establish cross-componement connections
//--------------------------------------------------------------------------
function void ahb_mst_agt::connect_phase(uvm_phase phase);
    /* UVM_ACTIVE and UVM PASSIVE */
    if (get_is_active == UVM_ACTIVE) begin
        mst_drv.seq_item_port.connect(mst_seqr.seq_item_export);
        mst_drv.rsp_port.connect(mst_seqr.rsp_export);
    end
endfunction

`endif /* _AHB_MST_AGT_SV_ */
//--------------------------------------------------------------------------
