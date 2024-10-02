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
`ifndef _VV_TEST_PKG_SV_ 
`define _VV_TEST_PKG_SV_ 
//--------------------------------------------------------------------------
// Package
//--------------------------------------------------------------------------
package vv_test_pkg;
import uvm_pkg::*;

//--------------------------------------------------------------------------
// Include File
//--------------------------------------------------------------------------
/* master_agent */
`include "master_agent/master_seq_item.sv"
`include "master_agent/master_driver.sv"
`include "master_agent/master_sequencer.sv"
`include "master_agent/master_agent.sv"
/* slave_agent */
`include "slave_agent/slave_seq_item.sv"
`include "slave_agent/slave_driver.sv"
`include "slave_agent/slave_sequencer.sv"
`include "slave_agent/slave_agent.sv"
/* sequences */
`include "system_env/virtual_sequencer.sv"
`include "sequences/base_vseq.sv"
`include "sequences/master_seq.sv"
`include "sequences/slave_seq.sv"
`include "sequences/system_seq.sv"
/* system_env */
`include "system_env/system_env.sv"
/* tests */
`include "tests/base_test.sv"
`include "tests/vv_test.sv"

endpackage: vv_test_pkg 

`endif  /* _VV_TEST_PKG_SV_ */
//--------------------------------------------------------------------------
