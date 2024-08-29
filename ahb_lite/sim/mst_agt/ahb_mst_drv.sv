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
// Brief: The driver drives randomized transactions or sequence items to DUT
//        as a pin-level activity using an interface.
// Change Log:
//--------------------------------------------------------------------------
`ifndef _AHB_MST_DRV_
`define _AHB_MST_DRV_

//--------------------------------------------------------------------------
// Include File
//--------------------------------------------------------------------------
`include "ahb_type.svh"

//--------------------------------------------------------------------------
// Class
//--------------------------------------------------------------------------
class ahb_mst_drv extends uvm_driver#(ahb_mst_tran);

//--------------------------------------------------------------------------
// Design: declare and register
//--------------------------------------------------------------------------
virtual ahb_mst_intf ahb_vif;
ahb_mst_tran  req;
ahb_mst_tran  rsp;
`uvm_component_utils(ahb_mst_drv)

//--------------------------------------------------------------------------
// Design: extern method
//--------------------------------------------------------------------------
extern function new(string name = "ahb_mst_drv", uvm_component parent = null);
extern function void build_phase(uvm_phase phase);
extern task run_phase(uvm_phase phase);
extern task driver();

endclass: ahb_mst_drv

//--------------------------------------------------------------------------
// Design: new
//--------------------------------------------------------------------------
function ahb_mst_drv::new(string name = "ahb_mst_drv", uvm_component parent = null);
    super.new(name, parent);
endfunction

//--------------------------------------------------------------------------
// Design: build phase: create and configure of testbench structure
//--------------------------------------------------------------------------
function void ahb_mst_drv::build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (!uvm_config_db#(virtual ahb_mst_intf) :: get(this, "", "ahb_vif", ahb_vif))
        `uvm_fatal(get_type_name(), "vif not set the top level!");
endfunction

//--------------------------------------------------------------------------
// Design: run phase: stmulate the DUT
//--------------------------------------------------------------------------
task ahb_mst_drv::run_phase(uvm_phase phase);
    forever begin
        seq_item_port.get_next_item(req);
        `uvm_info(get_type_name(), {"\n", req.sprint()}, UVM_LOW);

        /* driver dtu */
        driver();

        seq_item_port.item_done(req); /* TODO: processor response and rsp */
        `uvm_info(get_type_name(), "after item_done call", UVM_LOW);

        `uvm_info(get_type_name(), "Completed transaction...",UVM_LOW);
    end
endtask

//--------------------------------------------------------------------------
// Design: run phase: driver the DTU
//--------------------------------------------------------------------------
task ahb_mst_drv::driver();
    /* wait reset is high */
    do
        @(ahb_vif.mst_drv_cb);
    while(!ahb_vif.HRESETn);
    /* address phase */
    ahb_vif.mst_drv_cb.HADDR  <= req.HADDR;
    ahb_vif.mst_drv_cb.HWRITE <= req.HWRITE;
    ahb_vif.mst_drv_cb.HTRANS <= req.HTRANS;
    ahb_vif.mst_drv_cb.HSIZE  <= req.HSIZE;
    ahb_vif.mst_drv_cb.HBURST <= req.HBURST; /* TODO: process brust data */
    ahb_vif.mst_drv_cb.HPORT  <= req.HPORT;
    ahb_vif.mst_drv_cb.HMASTLOCK <= req.HMASTLOCK;
    /* wait address phase ready */
    do
        @(ahb_vif.mst_drv_cb);
    while(!ahb_vif.mst_drv_cb.HREADY);
    `uvm_info(get_type_name(), "address phase ready...", UVM_LOW);

    case(req.HWRITE)
        /* read */
        READ: begin
            ahb_vif.mst_drv_cb.HWDATA <= 0;
            req.HRDATA = ahb_vif.mst_drv_cb.HRDATA;
        end
        /* write */
        WRITE: begin
            ahb_vif.mst_drv_cb.HWDATA <= req.HWDATA;
            req.HRDATA = 0;
        end
    endcase

    /* wait data phase ready */
    while(!ahb_vif.mst_drv_cb.HREADY) begin
        @(ahb_vif.mst_drv_cb);
    end
    `uvm_info(get_type_name(), "data phase ready...", UVM_LOW);

    /* response */
    req.HRESP  <= ahb_vif.mst_drv_cb.HRESP;
    req.HREADY <= ahb_vif.mst_drv_cb.HREADY;

endtask

`endif /* _AHB_MST_DRV_ */
//--------------------------------------------------------------------------
