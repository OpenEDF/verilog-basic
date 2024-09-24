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
// Brief: A UVM monitor is a passive component used to capture DUT signals
//        using a virtual interface and translate them into a sequence item
//        format.
// Change Log:
//--------------------------------------------------------------------------
`ifndef _AHB_MST_MON_
`define _AHB_MST_MON_

//--------------------------------------------------------------------------
// Include File
//--------------------------------------------------------------------------
`include "ahb_type.svh"

//--------------------------------------------------------------------------
// Class
//--------------------------------------------------------------------------
class ahb_mst_mon extends uvm_monitor;

//--------------------------------------------------------------------------
// Design: declare and register
//--------------------------------------------------------------------------
`uvm_component_utils(ahb_mst_mon)
virtual ahb_mst_intf ahb_vif;
ahb_mst_tran mon_tran;
uvm_analysis_port #(ahb_mst_tran) item_collect_port;
ahb_lite_system_config sys_cfg;

extern function new(string name = "ahb_mst_mon", uvm_component parent = null);
extern function void build_phase(uvm_phase phase);
extern function void connect_phase(uvm_phase phase);
extern task run_phase(uvm_phase phase);
extern task do_monitor();
extern task wait_for_reset();

endclass: ahb_mst_mon
//--------------------------------------------------------------------------
// Design: new
//--------------------------------------------------------------------------
function ahb_mst_mon::new(string name = "ahb_mst_mon", uvm_component parent = null);
    super.new(name, parent);
    item_collect_port = new("item_collect_port", this);
endfunction

//--------------------------------------------------------------------------
// Design: build phase: create and configure of testbench structure
//--------------------------------------------------------------------------
function void ahb_mst_mon::build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (!uvm_config_db#(ahb_lite_system_config)::get(this, "", "ahb_lite_system_config", sys_cfg)) begin
        `uvm_fatal("FATAL MSG", "config object is not set properly");
    end
endfunction

//--------------------------------------------------------------------------
// Design: connect phase
//--------------------------------------------------------------------------
function void ahb_mst_mon::connect_phase(uvm_phase phase);
    ahb_vif = sys_cfg.ahb_lite_vif;
endfunction

//--------------------------------------------------------------------------
// Design: run phase: stmulate the DUT
//--------------------------------------------------------------------------
task ahb_mst_mon::run_phase(uvm_phase phase);
    mon_tran = ahb_mst_tran::type_id::create("pon_tran");

    wait_for_reset();
    @(ahb_vif.mst_drv_cb);
    /* run monitor */
    do_monitor();

endtask

//--------------------------------------------------------------------------
// Design: monitor the dtu signal
//--------------------------------------------------------------------------
task ahb_mst_mon::do_monitor();
    forever begin
        `uvm_info(get_type_name(), "starting monitor transaction...", UVM_HIGH);

        /* wait reset is high */
        while(!ahb_vif.HRESETn) begin
            @(ahb_vif.mst_drv_cb);
        end

        /* monitor output signal */
        @(ahb_vif.mst_mon_cb);
        mon_tran.HADDR = ahb_vif.mst_mon_cb.HADDR;
        if (!$cast(mon_tran.HWRITE, ahb_vif.mst_mon_cb.HWRITE))
            `uvm_fatal(get_type_name(), "mon tran WRITE get failed")

        if (!$cast(mon_tran.HREADY, ahb_vif.mst_mon_cb.HREADY))
            `uvm_fatal(get_type_name(), "mon tran HREADY get failed")

        if (!$cast(mon_tran.HRESP, ahb_vif.mst_mon_cb.HRESP))
            `uvm_fatal(get_type_name(), "mon tran HRESP get failed")

        /* trigger irq */
        if (ahb_vif.mst_mon_cb.eg_int) begin
            `uvm_info(get_type_name(), "ahb monitor trigger the irq event", UVM_HIGH);
            sys_cfg.trigger_irq();
        end

        /* send specified value to all connected interface */
        `uvm_info(get_type_name(), "completed monitor transaction...", UVM_HIGH);

        /* send data to analysis port */
        if (sys_cfg.has_scoreboard) begin
            item_collect_port.write(mon_tran);
        end
    end

endtask

//--------------------------------------------------------------------------
// Design: wait controller reset
//--------------------------------------------------------------------------
task ahb_mst_mon::wait_for_reset();
    `uvm_info(get_type_name(), "wait controller reset...", UVM_HIGH);
    @(posedge ahb_vif.HRESETn);
endtask

`endif /* _AHB_MST_MON_ */
//--------------------------------------------------------------------------
