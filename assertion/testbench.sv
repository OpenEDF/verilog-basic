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
        top_a = $random;
        top_b = $random;
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
// assert: a simple sequence
//--------------------------------------------------------------------------
sequence s1;
    @(posedge clk) top_c;
endsequence

property p1;
    s1;
endproperty;
a1: assert property(p1) begin
        $info("assertion a1: test sucess");
    end else begin
        $error("assertion a1: test error");
    end

//--------------------------------------------------------------------------
// assert: assertion delay
//--------------------------------------------------------------------------
property p2;
    @(posedge clk) top_c |=> top_d;
endproperty;
a2: assert property(p2);

//--------------------------------------------------------------------------
// assert: assertion delay
//--------------------------------------------------------------------------
property p3;
    @(posedge clk) top_c ##1 top_d;
endproperty;
a3: assert property(p3);

//--------------------------------------------------------------------------
// assert: assertion timing window
//--------------------------------------------------------------------------
property p4;
    @(posedge clk) top_c |-> ##[0:$] top_d;
endproperty;
a4: assert property(p4);

//--------------------------------------------------------------------------
// assert: assertion disable iff
//--------------------------------------------------------------------------
property p5;
   @(posedge clk) disable iff (!rst_n) top_c;
endproperty;
a5: assert property(p5);

//--------------------------------------------------------------------------
// assert: assertion rose
//--------------------------------------------------------------------------
property p6;
   @(posedge clk) $rose(top_a) |-> top_c;
endproperty;
a6: assert property(p6);

//--------------------------------------------------------------------------
// assert: assertion fell
//--------------------------------------------------------------------------
property p7;
   @(posedge clk) $fell(top_a) |-> top_c;
endproperty;
a7: assert property(p7);

//--------------------------------------------------------------------------
// assert: assertion stable
//--------------------------------------------------------------------------
property p8;
   @(posedge clk) $stable(top_a);
endproperty;
a8: assert property(p8);

//--------------------------------------------------------------------------
// assert: assertion past
//--------------------------------------------------------------------------
property p9;
   @(posedge clk) top_a |-> ($past(top_c, 2) == 1'b1);
endproperty;
a9: assert property(p9);

//--------------------------------------------------------------------------
// assert: assertion change
//--------------------------------------------------------------------------
property p10;
   @(posedge clk) $changed(top_a);
endproperty;
a10: assert property(p10);

//--------------------------------------------------------------------------
// assert: assertion sampled
//--------------------------------------------------------------------------
property p11;
   @(posedge clk) $sampled(top_e);
endproperty;
a11: assert property(p11);

//--------------------------------------------------------------------------
// assert: assertion select
//--------------------------------------------------------------------------
property p12;
   @(posedge clk) top_c ? top_a : top_b;
endproperty;
a12: assert property(p12);

//--------------------------------------------------------------------------
// assert: assertion delay
//--------------------------------------------------------------------------
property p13;
   @(posedge clk) top_a |=> top_c ##1 top_d ##1 !top_e;
endproperty;
a13: assert property(p13);

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
/*
//--------------------------------------------------------------------------
// assert: assertion bind
//--------------------------------------------------------------------------
module assert_check
(
    input logic ck_clk,
    input logic ck_a,
    input logic ck_b,

    output logic ck_c
);

property p14;
   @(posedge ck_clk) ck_c |-> (ck_a & ck_b);
endproperty;
a14: assert property(p14);

endmodule

bind asserations assert_check assert_ck_or (
    .ck_clk  (clk),
    .ck_a    (top_a),
    .ck_b    (top_b),
    .ck_c    (top_c),
);
*/
//--------------------------------------------------------------------------
