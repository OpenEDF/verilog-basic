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
    input  wire ia,
    input  wire ib,
    input  wire ib_ctrl,
    input  wire ic,
    input  wire ic_ctrl,
    output wire oa,
    output wire ob,
    output wire oc
);

    tran a(ia, oa);
    tranif0 b(ib, ob, ib_ctrl);
    tranif1 c(ic, oc, ic_ctrl);

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
reg ia, ib, ic, ib_ctrl, ic_ctrl;
wire oa, ob, oc;

switch_modeling u0 (
    /*autoinst*/
        .ia                     (ia                             ), //input
        .ib                     (ib                             ), //input
        .ib_ctrl                (ib_ctrl                        ), //input
        .ic                     (ic                             ), //input
        .ic_ctrl                (ic_ctrl                        ), //input
        .oa                     (oa                             ), //output
        .ob                     (ob                             ), //output
        .oc                     (oc                             )  //output
    );

//--------------------------------------------------------------------------
// Design: nmos and pmos test
//--------------------------------------------------------------------------
initial begin: switch_model
    $timeformat(-9, 0, "ns");
    $monitor("[%0t]: ia = %b, oa = %b", $time, ia, oa);
    $monitor("[%0t]: ib_ctrl = %b, ib = %b, oa = %b", $time, ib_ctrl, ib, ob);
    $monitor("[%0t]: ic_ctrl = %b, ic = %b, oc = %b", $time, ic_ctrl, ic, oc);

    #5;
    {ia, ib, ic, ib_ctrl, ic_ctrl} <= 0;

    repeat(50) begin
        ia <= $random;
        ib <= $random;
        ic <= $random;
        ib_ctrl <= $random;
        ic_ctrl <= $random;
        #5;
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
