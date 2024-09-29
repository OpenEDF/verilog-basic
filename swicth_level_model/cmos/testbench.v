// # 1. Verilog File Header:
//--------------------------------------------------------------------------
//                         RISC-V Core
//                            V1.0.1
//                         openedf.com
//                     Copyright 2020-2021
//
//                     makermuyi@gmail.com
//
//                       License: BSD
//--------------------------------------------------------------------------
//
// Copyright (c) 2020-2021, openedf.com
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions
// are met:
//   - Redistributions of source code must retain the above copyright
//     notice, this list of conditions and the following disclaimer.
//   - Redistributions in binary form must reproduce the above copyright
//     notice, this list of conditions and the following disclaimer
//     in the documentation and/or other materials provided with the
//     distribution.
//   - Neither the name of the author nor the names of its contributors
//     may be used to endorse or promote products derived from this
//     software without specific prior written permission.
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
// Note:
// Bref:
// Inputs:
// Outputs:
// Change Log:
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Include File
//--------------------------------------------------------------------------
module switch_modeling (
    input  wire  d_in,
    input  wire  n_ctrl,
    input  wire  p_ctrl,
    output wire  out
);

    cmos c1(out, d_in, n_ctrl, p_ctrl);

endmodule

//--------------------------------------------------------------------------
// Module
//--------------------------------------------------------------------------
module testbench;
//--------------------------------------------------------------------------
// Params
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Ports
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Design: model instance
//--------------------------------------------------------------------------
reg  d_in, p_ctrl, n_ctrl;
wire out;

switch_modeling u0 (
    /*autoinst*/
        .d_in                   (d_in                           ), //input
        .n_ctrl                 (n_ctrl                         ), //input
        .p_ctrl                 (p_ctrl                         ), //input
        .out                    (out                            )  //output
    );

//--------------------------------------------------------------------------
// Design: nmos and pmos test
//--------------------------------------------------------------------------
initial begin: switch_model
    $timeformat(-9, 0, "ns");
    $monitor("[%0t]: p_ctrl: = %b, n_ctrl = %b, d_in = %b, out = %b",
             $time, p_ctrl, n_ctrl, d_in, out);

    #5;
    d_in   <= 1'b0;
    p_ctrl <= 1'b0;
    n_ctrl <= 1'b0;
    repeat(50) begin
        #5;
        p_ctrl <= $random; 
        n_ctrl <= $random;
        d_in   <= $random;
    end

    #20;
    $finish();
end

//--------------------------------------------------------------------------
// Design: generate fsdb
//--------------------------------------------------------------------------
initial begin
    $fsdbDumpfile("testbench.fsdb");
    $fsdbDumpvars(0, testbench);
end
endmodule
//--------------------------------------------------------------------------
