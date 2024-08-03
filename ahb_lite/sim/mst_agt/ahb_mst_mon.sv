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
virtual ahb_mst_intf ahb_vif;
uvm_analysis_port #(ahb_mst_tran) item_collect_port;
ahb_mst_tran mon_tran;
`uvm_component_utils(ahb_mst_mon)

extern function new(string name = "ahb_mst_mon", uvm_component parent = null);
extern function void build_phase(uvm_phase phase);
extern task run_phase(uvm_phase phase);
extern task do_monitor();

endclass: ahb_mst_mon
//--------------------------------------------------------------------------
// Design: new
//--------------------------------------------------------------------------
function ahb_mst_mon::new(string name = "ahb_mst_mon", uvm_component parent = null);
    super.new(name, parent);
    item_collect_port = new("item_collect_port", this);
    mon_tran = new();
endfunction

//--------------------------------------------------------------------------
// Design: build phase: create and configure of testbench structure
//--------------------------------------------------------------------------
function void ahb_mst_mon::build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (!uvm_config_db#(virtual ahb_mst_intf) :: get(this, "", "ahb_vif", ahb_vif))
        `uvm_fatal(get_type_name(), "vif not set the top level!")
endfunction

//--------------------------------------------------------------------------
// Design: run phase: stmulate the DUT
//--------------------------------------------------------------------------
task ahb_mst_mon::run_phase(uvm_phase phase);
    super.run_phase(phase);
    /* run monitor */
    fork
        do_monitor();
    join
endtask

//--------------------------------------------------------------------------
// Design: monitor the dtu signal
//--------------------------------------------------------------------------
task ahb_mst_mon::do_monitor();
    forever begin
        `uvm_info(get_type_name(), "starting monitor transaction...", UVM_LOW);
        //mon_tran = ahb_mst_tran::type_id::create("pon_tran");
        /* wait reset is high */
        do
            @(ahb_vif.master_mon.mst_mon_cb);
        while(!ahb_vif.master_mon.HRESETn);

        /* monitor signal from DUT module */
        /* monitor address phase */
        do
            @(ahb_vif.master_mon.mst_mon_cb);
        while(!ahb_vif.master_mon.mst_mon_cb.HREADY);
        mon_tran.HADDR     <= ahb_vif.master_mon.mst_mon_cb.HADDR;
        $cast(mon_tran.HBURST, ahb_vif.master_mon.mst_mon_cb.HBURST);
        mon_tran.HMASTLOCK <= ahb_vif.master_mon.mst_mon_cb.HMASTLOCK;
        mon_tran.HPORT     <= ahb_vif.master_mon.mst_mon_cb.HPORT;
        $cast(mon_tran.HSIZE, ahb_vif.master_mon.mst_mon_cb.HSIZE);
        $cast(mon_tran.HTRANS, ahb_vif.master_mon.mst_mon_cb.HTRANS);
        $cast(mon_tran.HWRITE,ahb_vif.master_mon.mst_mon_cb.HREADY);

        /* monitor data phase */
        do
            @(ahb_vif.master_mon.mst_mon_cb);
        while(!ahb_vif.master_mon.mst_mon_cb.HREADY);
        if (ahb_vif.master_mon.mst_mon_cb.HWRITE) begin
            mon_tran.HWDATA    <= ahb_vif.master_mon.mst_mon_cb.HWDATA;
            mon_tran.HRDATA    <= 0;
        end else begin
            mon_tran.HWDATA    <= 0;
            mon_tran.HRDATA    <= ahb_vif.master_mon.mst_mon_cb.HRDATA;
        end
        $cast(mon_tran.HREADY, ahb_vif.master_mon.mst_mon_cb.HREADY);
        $cast(mon_tran.HRESP, ahb_vif.master_mon.mst_mon_cb.HRESP);

        /* send specified value to all connected interface */
        `uvm_info(get_type_name(), "completed monitor transaction...", UVM_LOW);
        `uvm_info(get_type_name(), {"\n", mon_tran.sprint()}, UVM_HIGH);

        /* send data to analysis port */
        item_collect_port.write(mon_tran);
    end

endtask

`endif /* _AHB_MST_MON_ */
//--------------------------------------------------------------------------