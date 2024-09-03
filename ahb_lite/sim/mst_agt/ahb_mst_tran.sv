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
// Brief: uvm sequence item example
// Change Log:
//--------------------------------------------------------------------------
`ifndef _AHB_MST_TRAN_SV_
`define _AHB_MST_TRAN_SV_

//--------------------------------------------------------------------------
// Include File
//--------------------------------------------------------------------------
`include "ahb_type.svh"

//--------------------------------------------------------------------------
// Class
//--------------------------------------------------------------------------
class ahb_mst_tran extends uvm_sequence_item;

//--------------------------------------------------------------------------
// Design: control signal
//--------------------------------------------------------------------------
bit               HRESETn;
randc bit [31:0]  HADDR;
rand     hwrite_e HWRITE;
rand     hsize_e  HSIZE;
rand bit [31:0]   HWDATA;
rand     hburst_e HBURST;
rand     htrans_e HTRANS;
rand bit          HMASTLOCK;
rand bit [3:0]    HPORT;
         hready_e HREADY;   /* no rand */
         hresp_e  HRESP;
    bit  [31:0]   HRDATA;

//--------------------------------------------------------------------------
// Design: utility and field macros
//--------------------------------------------------------------------------
`uvm_object_utils_begin(ahb_mst_tran)
    `uvm_field_int(HRESETn, UVM_ALL_ON)
    `uvm_field_int(HADDR, UVM_ALL_ON)
    `uvm_field_enum(hburst_e,HBURST, UVM_ALL_ON)
    `uvm_field_int(HMASTLOCK, UVM_ALL_ON)
    `uvm_field_int(HPORT, UVM_ALL_ON)
    `uvm_field_enum(hsize_e, HSIZE, UVM_ALL_ON)
    `uvm_field_enum(htrans_e, HTRANS, UVM_ALL_ON)
    `uvm_field_int(HWDATA, UVM_ALL_ON)
    `uvm_field_enum(hwrite_e, HWRITE, UVM_ALL_ON)
    `uvm_field_int(HRDATA, UVM_ALL_ON)
    `uvm_field_enum(hready_e,  HREADY, UVM_ALL_ON)
    `uvm_field_enum(hresp_e, HRESP, UVM_ALL_ON)
`uvm_object_utils_end

//--------------------------------------------------------------------------
// Design: randomization and constraint addr
//--------------------------------------------------------------------------
constraint ahb_lite_addr {
    HADDR >= 32'h0004_1000;
    HADDR <= 32'h0004_13FC;
    HADDR[1:0] == 0;
}

//--------------------------------------------------------------------------
// Design: constraint size
//--------------------------------------------------------------------------
constraint ahb_lite_size_word {
    HSIZE == WORD;
}

//--------------------------------------------------------------------------
// Design: constraint burst
//--------------------------------------------------------------------------
constraint ahb_lite_burst {
    HBURST inside { SINGLE };
}

//--------------------------------------------------------------------------
// Design: constraint port
//--------------------------------------------------------------------------
constraint ahb_lite_port {
    HPORT == 0;
}

//--------------------------------------------------------------------------
// Design: constraint hmastlock
//--------------------------------------------------------------------------
constraint ahb_lite_hmastlock {
    HMASTLOCK == 0;
}

//--------------------------------------------------------------------------
// Design: declaer method
//--------------------------------------------------------------------------
extern function new(string name = "ahb_mst_tran");
endclass: ahb_mst_tran

//--------------------------------------------------------------------------
// Design: new
//--------------------------------------------------------------------------
function ahb_mst_tran::new(string name = "ahb_mst_tran");
    super.new(name);
endfunction

`endif  /* _AHB_MST_TRAN_SV_ */
//--------------------------------------------z-----------------------------
