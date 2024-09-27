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
// Brief: uvm sequencer is a mediator who establishes a connection between
//        sequence and driver.
// Change Log:
//--------------------------------------------------------------------------
`ifndef _AHB_MST_SEQR_SV_
`define _AHB_MST_SEQR_SV_

//--------------------------------------------------------------------------
// Include File
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Class
//--------------------------------------------------------------------------
class ahb_mst_seqr extends uvm_sequencer#(ahb_mst_tran);

//--------------------------------------------------------------------------
// Design: declare and register
//--------------------------------------------------------------------------
ahb_lite_system_config sys_cfg;
`uvm_component_utils(ahb_mst_seqr)
extern function new(string name = "ahb_mst_seqr", uvm_component parent = null);
extern virtual function void build_phase(uvm_phase phase);
extern virtual function void get_cfg(output ahb_lite_system_config cfg);

endclass:ahb_mst_seqr
//--------------------------------------------------------------------------
// Design: new
//--------------------------------------------------------------------------
function ahb_mst_seqr::new(string name = "ahb_mst_seqr", uvm_component parent = null);
    super.new(name, parent);
endfunction

//--------------------------------------------------------------------------
// Design: build phase: create and configure of testbench structure
//--------------------------------------------------------------------------
function void ahb_mst_seqr::build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info(get_type_name(), "build phase Entered ...", UVM_HIGH);

    if (!uvm_config_db#(ahb_lite_system_config)::get(this, "", "ahb_lite_system_config", sys_cfg)) begin
        `uvm_fatal("FATAL MSG", "config object is not set properly");
    end

    `uvm_info(get_type_name(), "build phase Exited ...", UVM_HIGH);
endfunction

//--------------------------------------------------------------------------
// Design: get the system config
//--------------------------------------------------------------------------
function void ahb_mst_seqr::get_cfg(output ahb_lite_system_config cfg);
    if (sys_cfg != null) begin
        cfg = sys_cfg;
    end
endfunction
`endif /* _AHB_MST_SEQR_SV_ */
//--------------------------------------------------------------------------
