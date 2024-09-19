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
// Brief: package
// Change Log:
//--------------------------------------------------------------------------
`ifndef _AHB_LITE_PKG_SVH_
`define _AHB_LITE_PKG_SVH_
//--------------------------------------------------------------------------
// Package
//--------------------------------------------------------------------------
package ahb_lite_pkg;
import uvm_pkg::*;

//--------------------------------------------------------------------------
// Include File
//--------------------------------------------------------------------------
`include "test/ahb_lite_system_config.sv"
`include "ahb_mst_tran.sv"
`include "ahb_mst_drv.sv"
`include "ahb_mst_mon.sv"
`include "ahb_mst_seqr.sv"
`include "ahb_mst_agt.sv"
`include "ahb_base_seq.sv"
`include "ahb_mst_base_seq.sv"
`include "ahb_mst_int_seq.sv"
`include "ahb_mst_init_seq.sv"
`include "env/ahb_lite_coverage.sv"
`include "env/ahb_lite_scoreboard.sv"
`include "env/ahb_lite_env.sv"
`include "test/ahb_lite_test.sv"

endpackage: ahb_lite_pkg 

`endif  /* _AHB_LITE_PKG_SVH_ */
//--------------------------------------------------------------------------
