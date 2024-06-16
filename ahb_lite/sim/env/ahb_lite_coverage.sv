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
// Brief: The UVM subscriber provides an analysis export for receiving
//        transactions form a connected analysis export.
// Change Log:
//--------------------------------------------------------------------------
`idndef _AHB_LITE_COVERAGE_SV_
`define _AHB_LITE_COVERAGE_SV_

//--------------------------------------------------------------------------
// Include File
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Class
//--------------------------------------------------------------------------
class ahb_lite_coverage extends uvm_subscriber#(ahb_mst_tran);

//--------------------------------------------------------------------------
// Design: declare and register
//--------------------------------------------------------------------------
uvm_analysis_imp #(seq_item, coverage) item_cov_export;
ahb_mst_tran     mst_tran_cov;
`uvm_component_utils(ahb_lite_coverage)

//--------------------------------------------------------------------------
// Design: declare method 
//--------------------------------------------------------------------------
extern function new(string name = "ahb_lite_coverage", uvm_component parent = null);
extern function void build_phase(uvm_phase phase);
extern function void write(seq_item t);
extern function void report_phase(uvm_phase phase);

endclass: ahb_lite_coverage 
//--------------------------------------------------------------------------
// Design: coverage
//--------------------------------------------------------------------------
covergroup test_coverage;
    option.comment = "uvm test coverage";
endgroup: test_coverage

//--------------------------------------------------------------------------
// Design: new
//--------------------------------------------------------------------------
function ahb_lite_coverage::new(string name = "coverage", uvm_component parent = null);
    super.new(name, parent);
    item_cov_export = new("item_cov_export", this);
    test_coverage = new();
endfunction

//--------------------------------------------------------------------------
// Design: build phase: create and configure of testbench structure
//--------------------------------------------------------------------------
function void ahb_lite_coverage::build_phase(uvm_phase phase);
    super.build_phase(phase);
endfunction

//--------------------------------------------------------------------------
// Design: write: receives all transactions boardcasted
//--------------------------------------------------------------------------
function void ahb_lite_coverage::write(ahb_mst_tran tran);
    mst_tran_cov = tran; /* assign */
    test_coverage.sample();
endfunction

//--------------------------------------------------------------------------
// Design: report phase: Report results of the test.
//--------------------------------------------------------------------------
function void report_phase(uvm_phase phase);
    `uvm_info(get_full_name(), $sformatf("coverage is %0.2f%%", test_coverage.get_coverage()), UVM_LOW);
endfunction

`ednif /* _AHB_LITE_COVERAGE_SV_ */
//--------------------------------------------------------------------------
