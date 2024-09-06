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
`uvm_component_utils(ahb_mst_drv)
virtual ahb_mst_intf ahb_vif;
ahb_mst_tran req;
ahb_mst_tran rsp;
ahb_lite_system_config sys_cfg;
semaphore pipeline_lock;
uvm_event pipeline_ev;

//--------------------------------------------------------------------------
// Design: extern method
//--------------------------------------------------------------------------
extern function new(string name = "ahb_mst_drv", uvm_component parent = null);
extern function void build_phase(uvm_phase phase);
extern function void connect_phase(uvm_phase phase);
extern task run_phase(uvm_phase phase);
extern task reset_phase(uvm_phase phase);
extern task do_pipeline_tran();
extern task wait_for_reset();

endclass: ahb_mst_drv

//--------------------------------------------------------------------------
// Design: new
//--------------------------------------------------------------------------
function ahb_mst_drv::new(string name = "ahb_mst_drv", uvm_component parent = null);
    super.new(name, parent);
    pipeline_lock = new(1);
    pipeline_ev   = new();
endfunction

//--------------------------------------------------------------------------
// Design: build phase: create and configure of testbench structure
//--------------------------------------------------------------------------
function void ahb_mst_drv::build_phase(uvm_phase phase);
    super.build_phase(phase);

    if (!uvm_config_db#(ahb_lite_system_config)::get(this, "", "ahb_lite_system_config", sys_cfg)) begin
        `uvm_fatal("FATAL MSG", "config object is not set properly");
    end
endfunction

//--------------------------------------------------------------------------
// Design: connect phase
//--------------------------------------------------------------------------
function void ahb_mst_drv::connect_phase(uvm_phase phase);
    ahb_vif = sys_cfg.ahb_lite_vif;
endfunction

//--------------------------------------------------------------------------
// Design: run phase: stmulate the DUT
//--------------------------------------------------------------------------
task ahb_mst_drv::run_phase(uvm_phase phase);
    sys_cfg.wait_for_reset();
    @(ahb_vif.mst_drv_cb);
    fork
        do_pipeline_tran();
        begin
            pipeline_ev.wait_trigger;
            do_pipeline_tran();
        end
    join

    `uvm_info(get_type_name(), "completed transaction...",UVM_LOW);
endtask

//--------------------------------------------------------------------------
// Design: run phase: driver the DTU
//--------------------------------------------------------------------------
task ahb_mst_drv::do_pipeline_tran();
    forever begin
		ahb_mst_tran item_req;
        /* wait reset is high */
        while(!ahb_vif.HRESETn) begin
            @(ahb_vif.mst_drv_cb);
        end

		/* Completes the sequencer-driver handshake */
		pipeline_lock.get();
        seq_item_port.get(item_req);
        `uvm_info(get_type_name(), {"\n", req.sprint()}, UVM_HIGH);

		accept_tr(item_req, $time);
		/* request bus, wait for grant, etc. */
		begin_tr(item_req, "pipeline_tran");

        if (item_req.HTRANS == SEQ) begin
            if (pipeline_ev.is_off) begin
                pipeline_ev.trigger;
            end
        end

        ahb_vif.mst_drv_cb.HADDR  <= item_req.HADDR;
        ahb_vif.mst_drv_cb.HWRITE <= item_req.HWRITE;
        ahb_vif.mst_drv_cb.HTRANS <= item_req.HTRANS;
        ahb_vif.mst_drv_cb.HSIZE  <= item_req.HSIZE;
        ahb_vif.mst_drv_cb.HBURST <= item_req.HBURST; /* TODO: process brust data */
        ahb_vif.mst_drv_cb.HPORT  <= item_req.HPORT;
        ahb_vif.mst_drv_cb.HMASTLOCK <= item_req.HMASTLOCK;

		/* execute address phase */
        do
            @(ahb_vif.mst_drv_cb);
        while(!ahb_vif.mst_drv_cb.HREADY);
        `uvm_info(get_type_name(), "address phase ready...", UVM_LOW);

		/* allows next transaction to begin address phase */
		pipeline_lock.put();

		/* execute data phase */
		if (item_req.HWRITE == READ) begin /* read data */
			@(ahb_vif.mst_drv_cb);
            while(!ahb_vif.mst_drv_cb.HREADY) begin
			    @(ahb_vif.mst_drv_cb);
			end
            item_req.HRDATA <= ahb_vif.mst_drv_cb.HRDATA;
		end else begin  /* write data */
            ahb_vif.mst_drv_cb.HWDATA <= item_req.HWDATA;
			@(ahb_vif.mst_drv_cb);
            while(!ahb_vif.mst_drv_cb.HREADY) begin
			    @(ahb_vif.mst_drv_cb);
			end
		end

        item_req.HRESP  <= ahb_vif.mst_drv_cb.HRESP;
        item_req.HREADY <= ahb_vif.mst_drv_cb.HREADY;
        `uvm_info(get_type_name(), "data phase ready...", UVM_LOW);

		/* return the request as response */
        seq_item_port.put(item_req);
		end_tr(item_req);
    end
endtask: do_pipeline_tran

//--------------------------------------------------------------------------
// Design: reset phase task, reset is actiover LOW
//--------------------------------------------------------------------------
task ahb_mst_drv::reset_phase(uvm_phase phase);
    phase.raise_objection(this);
    ahb_vif.HRESETn = 0;
    #23;
    ahb_vif.mst_drv_cb.HADDR  <= 0;
    ahb_vif.mst_drv_cb.HWRITE <= 0;
    ahb_vif.mst_drv_cb.HTRANS <= 0;
    ahb_vif.mst_drv_cb.HSIZE  <= 0;
    ahb_vif.mst_drv_cb.HBURST <= 0;
    ahb_vif.mst_drv_cb.HPORT  <= 0;
    ahb_vif.mst_drv_cb.HMASTLOCK <= 0;
    ahb_vif.mst_drv_cb.HWDATA <= 0;
    ahb_vif.HRESETn = 1;
    phase.drop_objection(this);
endtask

//--------------------------------------------------------------------------
// Design: wait controller reset
//--------------------------------------------------------------------------
task ahb_mst_drv::wait_for_reset();
    `uvm_info(get_type_name(), "wait controller reset...", UVM_LOW);
    @(posedge ahb_vif.HRESETn);
endtask
`endif /* _AHB_MST_DRV_ */
//--------------------------------------------------------------------------
