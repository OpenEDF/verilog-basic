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
`ifndef _AHB_LITE_COVERAGE_SV_
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
// uvm_analysis_imp #(ahb_mst_tran, ahb_lite_coverage) item_cov_export;
// analysis_export This export provides access to the write method, which
// derived subscribers must implement.
ahb_lite_system_config sys_cfg;
`uvm_component_utils(ahb_lite_coverage)

//--------------------------------------------------------------------------
// Design: coverage
//--------------------------------------------------------------------------
covergroup test_coverage with function sample(ahb_mst_tran cov);
    option.comment = "uvm test coverage";
    opr_addr: coverpoint cov.HADDR {
        bins opr_rom0[] = {[32'h4_0000:32'h4_0FFF]};
        bins opr_ram1 = {[32'h4_1000:32'h4_1FFF]};
        bins opr_ram2 = {[32'h4_2000:32'h4_23FF]};
        bins opr_ram3 = {[32'h4_3000:32'h4_33FF]};
    }

    opr_type: coverpoint cov.HWRITE {
        bins wr[]  = {1, 0};
    }
endgroup: test_coverage

//--------------------------------------------------------------------------
// Design: declare method 
//--------------------------------------------------------------------------
extern function new(string name = "ahb_lite_coverage", uvm_component parent = null);
extern function void build_phase(uvm_phase phase);
extern function void write(ahb_mst_tran t);
extern function void report_phase(uvm_phase phase);

endclass: ahb_lite_coverage 

//--------------------------------------------------------------------------
// Design: new
//--------------------------------------------------------------------------
function ahb_lite_coverage::new(string name = "ahb_lite_coverage", uvm_component parent = null);
    super.new(name, parent);
    //item_cov_export = new("item_cov_export", this);
    test_coverage = new();
endfunction

//--------------------------------------------------------------------------
// Design: build phase: create and configure of testbench structure
//--------------------------------------------------------------------------
function void ahb_lite_coverage::build_phase(uvm_phase phase);
    super.build_phase(phase);
    if (!uvm_config_db#(ahb_lite_system_config)::get(this, "", "ahb_lite_system_config", sys_cfg)) begin
        `uvm_fatal("FATAL MSG", "config object is not set properly");
    end
endfunction

//--------------------------------------------------------------------------
// Design: write: receives all transactions boardcasted
//--------------------------------------------------------------------------
function void ahb_lite_coverage::write(ahb_mst_tran t);
    //mst_tran_cov = t; /* assign */
    if (sys_cfg.has_functional_coverage) begin
        test_coverage.sample(t);
    end
endfunction

//--------------------------------------------------------------------------
// Design: report phase: Report results of the test.
//--------------------------------------------------------------------------
function void ahb_lite_coverage::report_phase(uvm_phase phase);
    `uvm_info(get_type_name(), $sformatf("coverage is %0.2f%%", test_coverage.get_coverage()), UVM_LOW);
endfunction

`endif /* _AHB_LITE_COVERAGE_SV_ */
//--------------------------------------------------------------------------
