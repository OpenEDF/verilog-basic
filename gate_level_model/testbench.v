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
module gate_modeling (
    input  wire andi1,
    input  wire andi2,
    input  wire ori1,
    input  wire ori2,
    input  wire xori1,
    input  wire xori2,
    input  wire xori3,
    input  wire nandi1,
    input  wire nandi2,
    input  wire nori1,
    input  wire nori2,
    input  wire xnori1,
    input  wire xnori2,
    input  wire xnori3,
    input  wire bufi,
    input  wire noti,
    input  wire bufif1i,
    input  wire notif1i,
    input  wire bufif1_ctrl,
    input  wire notif1_ctrl,
    input  wire bufif0i,
    input  wire notif0i,
    input  wire bufif0_ctrl,
    input  wire notif0_ctrl,
    output wire oro,
    output wire xoro,
    output wire nando,
    output wire noro,
    output wire xnoro,
    output wire bufo,
    output wire noto,
    output wire bufif1o,
    output wire notif1o,
    output wire bufif0o,
    output wire notif0o,
    output wire ando
);

    /* and */
    and test_and(ando, andi1, andi2);

    /* or */
    or  test_or(oro, ori1, ori2);

    /* xor */
    xor test_xor(xoro, xori1, xori2, xori3);

    /* nand */
    nand test_nand(nando, nandi1, nandi2);

    /* nor */
    nor  test_nor(noro, nori1, nori2);

    /* xnor */
    xnor  test_xnor(xnoro, xnori1, xnori2, xnori3);

    /* buf */
    buf test_buf(bufo, bufi);

    /* not */
    not test_not(noto, noti);

    /* bifif1 */
    bufif1 test_bufif1(bufif1o, bufif1i, bufif1_ctrl);

    /* notif1 */
    notif1 test_notif1(notif1o, notif1i, notif1_ctrl);

    /* bifif0 */
    bufif0 test_bufif0(bufif0o, bufif0i, bufif0_ctrl);

    /* notif0 */
    notif0 test_notif0(notif0o, notif0i, notif0_ctrl);

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
reg andi1, andi2;
reg ori1, ori2;
reg xori1, xori2;
reg xori3;
reg nandi1, nandi2;
reg nori1, nori2;
reg xnori1, xnori2, xnori3;
reg bufi;
reg noti;
reg bufif1i;
reg notif1i;
reg bufif1_ctrl;
reg notif1_ctrl;
reg bufif0i;
reg notif0i;
reg bufif0_ctrl;
reg notif0_ctrl;

wire oro, xoro, nando, noro, xnoro, bufo, noto, bufif1o, notif1o, bufif0o, notif0o, ando;

gate_modeling u0 (
    /*autoinst*/
        .andi1                  (andi1                          ), //input
        .andi2                  (andi2                          ), //input
        .ori1                   (ori1                           ), //input
        .ori2                   (ori2                           ), //input
        .xori1                  (xori1                          ), //input
        .xori2                  (xori2                          ), //input
        .xori3                  (xori3                          ), //input
        .nandi1                 (nandi1                         ), //input
        .nandi2                 (nandi2                         ), //input
        .nori1                  (nori1                          ), //input
        .nori2                  (nori2                          ), //input
        .xnori1                 (xnori1                         ), //input
        .xnori2                 (xnori2                         ), //input
        .xnori3                 (xnori3                         ), //input
        .bufi                   (bufi                           ), //input
        .noti                   (noti                           ), //input
        .bufif1i                (bufif1i                        ), //input
        .notif1i                (notif1i                        ), //input
        .bufif1_ctrl            (bufif1_ctrl                    ), //input
        .notif1_ctrl            (notif1_ctrl                    ), //input
        .bufif0i                (bufif0i                        ), //input
        .notif0i                (notif0i                        ), //input
        .bufif0_ctrl            (bufif0_ctrl                    ), //input
        .notif0_ctrl            (notif0_ctrl                    ), //input
        .oro                    (oro                            ), //output
        .xoro                   (xoro                           ), //output
        .nando                  (nando                          ), //output
        .noro                   (noro                           ), //output
        .xnoro                  (xnoro                          ), //output
        .bufo                   (bufo                           ), //output
        .noto                   (noto                           ), //output
        .bufif1o                (bufif1o                        ), //output
        .notif1o                (notif1o                        ), //output
        .bufif0o                (bufif0o                        ), //output
        .notif0o                (notif0o                        ), //output
        .ando                   (ando                           )  //output
    );

//--------------------------------------------------------------------------
// Design: nmos and pmos test
//--------------------------------------------------------------------------
initial begin: switch_model
    $timeformat(-9, 0, "ns");

    #5;
    {andi1, andi2} <= 0;

    repeat(50) begin
        andi1         <= $random;
        andi2         <= $random;
        ori1          <= $random;
        ori2          <= $random;
        xori1         <= $random;
        xori2         <= $random;
        xori3         <= $random;
        nandi1        <= $random;
        nandi2        <= $random;
        nori1         <= $random;
        nori2         <= $random;
        xnori1        <= $random;
        xnori2        <= $random;
        xnori3        <= $random;
        bufi          <= $random;
        noti          <= $random;
        bufif1i       <= $random;
        notif1i       <= $random;
        bufif1_ctrl   <= $random;
        notif1_ctrl   <= $random;
        bufif0i       <= $random;
        notif0i       <= $random;
        bufif0_ctrl   <= $random;
        notif0_ctrl   <= $random;
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
