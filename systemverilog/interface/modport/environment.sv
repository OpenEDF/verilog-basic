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
// Brief: testbenchi systemverilog assertions
// Change Log:
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Include File
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Module
//--------------------------------------------------------------------------
class environment;
//--------------------------------------------------------------------------
// Ports
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Interface
//--------------------------------------------------------------------------
virtual intf vif;

//--------------------------------------------------------------------------
// Design: create class
//--------------------------------------------------------------------------
function new (virtual intf vif);
    this.vif = vif;
endfunction

//--------------------------------------------------------------------------
// Design: driver task and initial
//--------------------------------------------------------------------------
task driver();
begin
    do
        @(vif.dut_intf.dut_port_cb);
    while(!vif.dut_intf.rst_n);
    vif.dut_intf.dut_port_cb.a_in <= $random;
    vif.dut_intf.dut_port_cb.b_in <= $random;
    $display("test a_in = %0d, b_in = %0d", vif.a_in, vif.b_in);
    repeat(10) @(vif.dut_intf.dut_port_cb);
    $display("test c_ou = %0d, d_ou = %0d", vif.c_ou, vif.d_ou);
end
endtask

//--------------------------------------------------------------------------
// Design: reset task and initial
//--------------------------------------------------------------------------
task reset();
begin
    /* reset the module */
    vif.dut_intf.rst_n = 1'b0;
    #50
    vif.dut_intf.rst_n = 1'b1;
end
endtask

//--------------------------------------------------------------------------
// Design: done task
//--------------------------------------------------------------------------
task done();
begin
    /* reset and finish */
    vif.dut_intf.rst_n = 1'b0;
    #50;
end
endtask

//--------------------------------------------------------------------------
// Design: run task
//--------------------------------------------------------------------------
task run();
begin
    reset();
    /* driver module */
    repeat (10) begin
        driver();
    end
    done();
end
endtask

endclass
//--------------------------------------------------------------------------
