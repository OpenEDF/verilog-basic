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
// Brief: The testbench top is a static container that has an instantiation of
//        DUT and interfaces.
// Change Log:
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Include File
//--------------------------------------------------------------------------
`include "uvm_macros.svh"
import uvm_pkg::*;
import base_test_pkg::*;

//--------------------------------------------------------------------------
// Module
//--------------------------------------------------------------------------
module tb_top;
bit clk;
bit rst_n;

//--------------------------------------------------------------------------
// Design: initial clk
//--------------------------------------------------------------------------
initial begin
    clk = 1;
    forever #5 clk = ~clk;
end

//--------------------------------------------------------------------------
// Design: instance
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Design: set interface in config db
//--------------------------------------------------------------------------
initial begin
    uvm_config_db#(virtual add_if)::set(uvm_root::get(), "*", "vif", vif);
    $fsdbDumpfile("uvm_test.fsdb");
    $fsdbDumpvars(0, tb_top);
    /* memory dump */
end

//--------------------------------------------------------------------------
// Design: run test
//--------------------------------------------------------------------------
initial begin
    run_test("base_test");
end

endmodule
//--------------------------------------------------------------------------
