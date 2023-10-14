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
//rand logic       clk_cov;
//
//// outputs
//rand logic [4:0] c_ou_cov;
//rand logic [4:0] d_ou_cov;
virtual test_intf.cover_intf vif;

//--------------------------------------------------------------------------
// class for new
//--------------------------------------------------------------------------
function new(virtual test_intf.cover_intf vif);
    this.vif = vif;
    cov1 = new();
endfunction

//--------------------------------------------------------------------------
// functional coverage test
//--------------------------------------------------------------------------
covergroup cov1 @(posedge vif.clk);
    op_c: coverpoint vif.c_ou;
    op_d: coverpoint vif.d_ou;
endgroup: cov1

//--------------------------------------------------------------------------
// function for new coverage
//--------------------------------------------------------------------------

endclass
//--------------------------------------------------------------------------
