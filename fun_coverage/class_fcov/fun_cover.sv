//--------------------------------------------------------------------------
//                         RISC-V Core
//                            V1.0.0
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
// Brief: a practical guide for systemverilog asserations example and learning
// Change Log:
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Include File
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Module
//--------------------------------------------------------------------------
class fun_cover;
//--------------------------------------------------------------------------
// Port
//--------------------------------------------------------------------------
virtual test_intf.cover_intf vif;

//--------------------------------------------------------------------------
// class for new
//--------------------------------------------------------------------------
function new(virtual test_intf.cover_intf vif);
    this.vif = vif;
    cov1 = new();
    cov2 = new();
    cov3 = new();
    cov4 = new();
    cov5 = new();
    cov6 = new();
    cov7 = new();
    cov8 = new();
    cov9 = new(3, 15, vif.d_ou);
    cov10 = new();
endfunction

//--------------------------------------------------------------------------
// functional coverage: basic test
//--------------------------------------------------------------------------
covergroup cov1 @(posedge vif.clk);
    op_c: coverpoint vif.c_ou iff(vif.rst_n);
    op_d: coverpoint vif.d_ou {
        option.auto_bin_max = 16;
    }
endgroup: cov1

//--------------------------------------------------------------------------
// functional coverage: no sample clocking event
//--------------------------------------------------------------------------
covergroup cov2;
    op_c: coverpoint vif.c_ou;
    op_d: coverpoint vif.d_ou;
endgroup: cov2

//--------------------------------------------------------------------------
// functional coverage: signal or reg in module inetrnal
//--------------------------------------------------------------------------
covergroup cov3 @(posedge vif.clk);
    op_c: coverpoint testbench.cover_dut_u.test_module_inter_signal[15:0] {
        bins full_low = {16'hFFFF};
    }
endgroup: cov3

//--------------------------------------------------------------------------
// functional coverage: implicit bins
//--------------------------------------------------------------------------
covergroup cov4 @(posedge vif.clk);
    ts_bins_c: coverpoint vif.c_ou {
        bins feature1 = {1, 5, 10};
        bins feature2[] = {2, 12, 22};
        bins feature3 = {[10:15], 31};
        bins feature4[2] = {[0:10]};
        bins feature5 = {[20:$]};
        bins feature6 = {19};
    }
endgroup: cov4

//--------------------------------------------------------------------------
// functional coverage: transition bins
//--------------------------------------------------------------------------
covergroup cov5 @(posedge vif.clk);
    ts_bins_d: coverpoint vif.d_ou {
        bins feat1 = (3 => 5);              // single value transitions
        bins feat2 = (20 => 21 => 1 => 0);  // sequence of transitions
        bins feat3[] = (3,16 => 22, 31);    // sequence of transitions
        bins feat4[] = (16[*2:4]);          // range of transitions
        bins feat5   = (1[*3]);             // range of transitions
        bins feat6 = (3=>6[->3]=>31);       // range of transitions
        bins feat7 = (3=>15[=3]=>31);       // range of transitions
    }
endgroup: cov5

//--------------------------------------------------------------------------
// functional coverage: ignore bins and illegal_bins
//--------------------------------------------------------------------------
covergroup cov6 @(posedge vif.clk);
    ts_bins_d: coverpoint vif.d_ou {
        ignore_bins feat1 = (3 => 5);
        ignore_bins feat2 = {10, 15, 31};
        //illegal_bins feat3 = {8, 17};
        illegal_bins feat4 = (1 => 2 => 3 => 4 => 22);
    }
endgroup: cov6

//--------------------------------------------------------------------------
// functional coverage: cross
//--------------------------------------------------------------------------
covergroup cov7 @(posedge vif.clk);
    ts_bins1: coverpoint vif.d_ou {
        bins feat1 = {1, 30, 10};
        bins feat2 = (3 => 5);
    }
    ts_bins2: coverpoint vif.c_ou {
        bins feat3 = {[20:$]};
        bins feat4 = {29, 17};
    }
    corss_test: cross ts_bins1, ts_bins2;

endgroup: cov7

//--------------------------------------------------------------------------
// functional coverage: expression
//--------------------------------------------------------------------------
covergroup cov8 @(posedge vif.clk);
    express: coverpoint testbench.cover_dut_u.en && vif.c_ou;
    en_c: coverpoint testbench.cover_dut_u.en {
        bins enable = {1};
    }
    ain_c: coverpoint vif.c_ou;
    cross_b: cross en_c, ain_c {
        option.at_least = 4;
        //option.cross_auto_bin_max = 4; TODO: no active
    }
endgroup: cov8

//--------------------------------------------------------------------------
// functional coverage: formal and actual arguments
//--------------------------------------------------------------------------
covergroup cov9(int low, int high, ref logic [4:0] address) @(posedge vif.clk);
    ts_bins_d: coverpoint address {
        bins feat1[] = {[low:high]};
        bins feat2   = {low, high, 31};
    }
endgroup: cov9

//--------------------------------------------------------------------------
// functional coverage:
//--------------------------------------------------------------------------
covergroup cov10 @(posedge vif.clk);
    in_bins1: coverpoint vif.b_in {
        bins feat1 = {1, 30, 10};
        bins feat2 = (3 => 5);
    }
endgroup: cov10

endclass
//--------------------------------------------------------------------------
