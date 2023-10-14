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
module testbench();
//--------------------------------------------------------------------------
// Ports
//--------------------------------------------------------------------------
bit clk;
bit rst_n;

//--------------------------------------------------------------------------
// Interface
//--------------------------------------------------------------------------
test_intf intf(clk, rst_n);
fun_cover test_cover = new(intf.cover_intf);

//--------------------------------------------------------------------------
// Design: instance function coverage module
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Design: create the clock
//--------------------------------------------------------------------------
initial begin
    clk = 1'b0;
    forever #5 clk = ~clk;
end

//--------------------------------------------------------------------------
// Design: driver task and initial
//--------------------------------------------------------------------------
task driver();
begin
    rst_n = 1'b0;
    #10
    rst_n = 1'b1;

    repeat(200) begin
        @(posedge clk)
        intf.a_in =$random;
        intf.b_in =$random;
    end
    #20
    $display("Coverage = %0.2f %%", test_cover.cov1.get_coverage());
    $finish();
end
endtask

// start driver
initial begin
    driver();
end

//--------------------------------------------------------------------------
// Design: dump .fsdb file
//--------------------------------------------------------------------------
initial begin
    $fsdbDumpfile("testbench.fsdb");
    $fsdbDumpvars(0, testbench);
end

//--------------------------------------------------------------------------
// Design: instance design module
//--------------------------------------------------------------------------
cover_dut cover_dut_u (
    // inputs
    .clk         (clk),
    .rst_n       (rst_n),
    .a_in        (intf.a_in),
    .b_in        (intf.b_in),

    // outputs
    .c_ou        (intf.c_ou),
    .d_ou        (intf.d_ou)
);

endmodule
//--------------------------------------------------------------------------
