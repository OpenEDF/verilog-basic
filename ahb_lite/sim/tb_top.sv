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
// Brief: The testbench top is a static container that has an instantiation of
//        DUT and interfaces.
// Change Log:
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Include File
//--------------------------------------------------------------------------
`include "uvm_macros.svh"
import uvm_pkg::*;
import ahb_lite_pkg::*;

//--------------------------------------------------------------------------
// Module
//--------------------------------------------------------------------------
module tb_top;
bit systemclock;
parameter SYSTEM_CLK_CYCLE = 10;

//--------------------------------------------------------------------------
// Design: initial clk
//--------------------------------------------------------------------------
initial begin
    #(SYSTEM_CLK_CYCLE / 2);
    systemclock = 0;
    forever begin
        #(SYSTEM_CLK_CYCLE / 2)
        systemclock = ~systemclock;
    end
end

//--------------------------------------------------------------------------
// Design: instance module interface
//--------------------------------------------------------------------------
ahb_mst_intf ahb_vif (systemclock);

//--------------------------------------------------------------------------
// Design: instance top module
//--------------------------------------------------------------------------
ahb_lite_top ahb_lite_top_u0
(
    // global inputs
    .HCLK            (systemclock             ), // input
    .HRESETn         (ahb_vif.HRESETn         ), // input

    // AHB master inputs
    .m0_haddr        (ahb_vif.HADDR           ), // input
    .m0_hwrite       (ahb_vif.HWRITE          ), // input
    .m0_hsize        (ahb_vif.HSIZE           ), // input
    .m0_hburst       (ahb_vif.HBURST          ), // input
    .m0_hport        (ahb_vif.HPORT           ), // input
    .m0_htrans       (ahb_vif.HTRANS          ), // input
    .m0_hmastlock    (ahb_vif.HMASTLOCK       ), // input
    .m0_hwdata       (ahb_vif.HWDATA          ), // input

    //custom master outputs
    .m0_hready       (ahb_vif.HREADY          ), // output
    .m0_hresp        (ahb_vif.HRESP           ), // output
    .m0_rdata        (ahb_vif.HRDATA          ), // output
    .eg_int          (ahb_vif.eg_int          )  //output
);

//--------------------------------------------------------------------------
// Design: set interface in config db
//--------------------------------------------------------------------------
initial begin
    uvm_config_db#(virtual ahb_mst_intf)::set(uvm_root::get(), "*", "ahb_vif", ahb_vif);
    $fsdbDumpfile("tb_top.fsdb");
    $fsdbDumpvars(0, tb_top);
    /* memory dump */
    $fsdbDumpMDA();

    /* assert dump */
    $fsdbDumpSVA();
end

//--------------------------------------------------------------------------
// Design: uvm run test
//--------------------------------------------------------------------------
initial begin
    run_test();
end

endmodule
//--------------------------------------------------------------------------
