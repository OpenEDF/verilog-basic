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
`ifndef BASE_TEST_PKG
`define BASE_TEST_PKG
//--------------------------------------------------------------------------
// Package
//--------------------------------------------------------------------------
package base_test_pkg;
import uvm_pkg::*;

//--------------------------------------------------------------------------
// Include File
//--------------------------------------------------------------------------
`include "package/seq_item.sv"
`include "ralf/ral_dma_uvm.sv"
`include "package/sequence.sv"
`include "package/write_sequence.sv"
`include "package/read_sequence.sv"
`include "package/sequencer.sv"
`include "package/driver.sv"
`include "package/monitor.sv"
`include "package/scoreboard.sv"
`include "package/agent.sv"
`include "package/adapter.sv"
`include "package/env.sv"
`include "package/base_test.sv"

endpackage: base_test_pkg

`endif  /* BASE_TEST_PKG */
//--------------------------------------------------------------------------
