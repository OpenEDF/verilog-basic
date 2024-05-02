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

//--------------------------------------------------------------------------
// Include File
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Class
//--------------------------------------------------------------------------
class coverage extends uvm_subscriber#(seq_item);

//--------------------------------------------------------------------------
// Design: declare and register
//--------------------------------------------------------------------------
uvm_analysis_imp #(seq_item, coverage) item_cov_export;
seq_item seq_cov;
`uvm_component_utils(coverage)

//--------------------------------------------------------------------------
// Design: coverage
//--------------------------------------------------------------------------
covergroup test_coverage;
    option.comment = "uvm test coverage";
    val_ina: coverpoint(seq_cov.ina)
    {
        bins low_a  = {[0:20]};
        bins high_a = {[90:99]};
    }

    val_inb: coverpoint(seq_cov.inb)
    {
        bins low_b  = {[0:20]};
        bins high_b = {[90:99]};
    }

    combi: cross val_ina, val_inb;
endgroup: test_coverage

//--------------------------------------------------------------------------
// Design: new
//--------------------------------------------------------------------------
function new(string name = "coverage", uvm_component parent = null);
    super.new(name, parent);
    item_cov_export = new("item_cov_export", this);
    test_coverage = new();
endfunction

//--------------------------------------------------------------------------
// Design: build phase: create and configure of testbench structure
//--------------------------------------------------------------------------
function void build_phase(uvm_phase phase);
    super.build_phase(phase);
endfunction

//--------------------------------------------------------------------------
// Design: write: receives all transactions boardcasted
//--------------------------------------------------------------------------
function void write(seq_item t);
    seq_cov = t; /* assign */
    test_coverage.sample();
endfunction

//--------------------------------------------------------------------------
// Design: report phase: Report results of the test.
//--------------------------------------------------------------------------
function void report_phase(uvm_phase phase);
    `uvm_info(get_full_name(), $sformatf("coverage is %0.2f%%", test_coverage.get_coverage()), UVM_LOW);
endfunction

endclass: coverage 
//--------------------------------------------------------------------------
