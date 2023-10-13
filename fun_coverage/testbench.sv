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
reg top_a;
reg top_b;
wire top_c;
wire top_d;
wire top_e;
reg clk;
reg rst_n;

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

    repeat(10) begin
        @(posedge clk)
    end
    #20
    $finish();
end
endtask

initial begin
    driver();
end

//--------------------------------------------------------------------------
// Design: dump .fsdb file
//--------------------------------------------------------------------------
initial begin
    $fsdbDumpfile("testbench.fsdb");
    $fsdbDumpvars(0, testbench);
    $fsdbDumpSVA(0, testbench);
end

//--------------------------------------------------------------------------
// Design: instance design module
//--------------------------------------------------------------------------
asserations asserations_u (
    // inputs
    .clk         (clk),
    .rst_n       (rst_n),
    .a_in        (top_a),
    .b_in        (top_b),

    // outputs
    .c_ou        (top_c),
    .d_ou        (top_d),
    .e_ou        (top_e)
);

endmodule
//--------------------------------------------------------------------------
