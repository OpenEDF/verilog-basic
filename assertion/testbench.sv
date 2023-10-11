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
// Design: initial
//--------------------------------------------------------------------------
initial begin
    rst_n = 1'b0;
    #10
    rst_n = 1'b1;

    repeat(100) begin
        @(posedge clk)
        top_a = $random;
        top_b = $random;
    end
    #20
    $finish();
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
// assert: a simple sequence
//--------------------------------------------------------------------------
sequence s1;
    @(posedge clk) top_c;
endsequence

property p1;
//disable iff (!rst_n) top_c;
    s1;
endproperty;

a1: assert property(p1);

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
    .c_ou        (top_c)
);

endmodule
//--------------------------------------------------------------------------
