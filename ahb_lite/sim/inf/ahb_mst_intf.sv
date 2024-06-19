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
// Brief: interface connection DUT and driver between
// Change Log:
//--------------------------------------------------------------------------
`ifndef _AHB_MST_INTF_
`define _AHB_MST_INTF_

//--------------------------------------------------------------------------
// Include File
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Interface
//--------------------------------------------------------------------------
interface ahb_mst_intf (
//--------------------------------------------------------------------------
// Port
//--------------------------------------------------------------------------
    input logic HCLK
);

//--------------------------------------------------------------------------
// Design: setup and hold time
//--------------------------------------------------------------------------
parameter setup_time = 3;
parameter hold_time  = 2;

//--------------------------------------------------------------------------
// Design: bus
//--------------------------------------------------------------------------
logic         HRESETn;
logic  [31:0] HADDR;
logic         HWRITE;
logic  [2:0 ] HSIZE;
logic  [31:0] HWDATA;
logic  [1:0 ] HTRANS;
logic  [2:0 ] HBURST;
logic  [3:0 ] HPORT;
logic         HMASTLOCK;
logic         HREADY;
logic         HRESP;
logic  [31:0] HRDATA;

//--------------------------------------------------------------------------
// Design: master clocking block 
//--------------------------------------------------------------------------
clocking mst_drv_cb @(posedge HCLK);
    default input #setup_time output #hold_time;
    input  HRESP;
    inout  HREADY;
    input  HRDATA;
    output HADDR;
    output HWDATA;
    output HWRITE;
    output HTRANS;
    output HSIZE;
    output HPORT;
    output HBURST;
    output HMASTLOCK;
endclocking 

//--------------------------------------------------------------------------
// Design: master monitor clocking block 
//--------------------------------------------------------------------------
clocking mst_mon_cb @(posedge HCLK);
    default input #setup_time output #hold_time;
    input  HADDR;
    input  HWDATA;
    input  HWRITE;
    input  HTRANS;
    input  HSIZE;
    input  HPORT;
    input  HBURST;
    input  HMASTLOCK;
    input  HRESP;
    inout  HREADY;
    input  HRDATA;
endclocking

//--------------------------------------------------------------------------
// Design: master modport 
//--------------------------------------------------------------------------
modport master_drv (clocking mst_drv_cb, input HRESETn);

//--------------------------------------------------------------------------
// Design: master monitor modport 
//--------------------------------------------------------------------------
modport master_mon (clocking mst_mon_cb, input HRESETn);

//--------------------------------------------------------------------------
// Design: assertion
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Design: coverage
//--------------------------------------------------------------------------

endinterface

`endif /* _AHB_MST_INTF_ */
//--------------------------------------------------------------------------
