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
    input  wire  ctrl,
    output wire  p_out,
    output wire  n_out
);

    pmos p1(p_out, d_in, ctrl);
    nmos n1(n_out, d_in, ctrl);

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
reg  d_in, ctrl;
wire p_out, n_out;

switch_modeling mos (
    /*autoinst*/
        .d_in                   (d_in                           ), //input
        .ctrl                   (ctrl                           ), //input
        .p_out                  (p_out                          ), //output
        .n_out                  (n_out                          )  //output
);

//--------------------------------------------------------------------------
// Design: nmos and pmos test
//--------------------------------------------------------------------------
initial begin: switch_model
    $timeformat(-9, 0, "ns");
    $monitor("[%0t]: ctrl: = %b, d_in = %b, p_out = %b, n_out = %b",
             $time, ctrl, d_in, p_out, n_out);

    #5;
    ctrl = 0;
    d_in = 0;
    repeat(50) begin
        #5;
        ctrl = $random;
        d_in = $random;
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
