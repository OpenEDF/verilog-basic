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
// Brief: iopad and hardmacro synthesis 
// Change Log:
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Include File
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Module
//--------------------------------------------------------------------------
module iopads
//--------------------------------------------------------------------------
// Ports
//--------------------------------------------------------------------------
(
    // inputs
    input wire        clk,
    input wire        rst_n,
    input wire        start,
    input wire        ready,
    input wire        illegal_divider_zero, 

    // outputs
    output wire        clkI,
    output wire        rst_nI,
    output wire        startI,
    output wire        readyO,
    output wire        illegal_divider_zeroO 
);

//--------------------------------------------------------------------------
// Design: instance IOPAD hardmacro from pdk
//--------------------------------------------------------------------------
PDDW04DGZ_H_G clk_pad (
    .I     (),
    .OEN   (1'b0),
    .REN   (1'b1),
    .PAD   (clk),
    .C     (clkI)
);

PDDW04DGZ_H_G rst_n_pad (
    .I     (),
    .OEN   (1'b0),
    .REN   (1'b1),
    .PAD   (rst_n),
    .C     (rst_nI)
);

PDDW04DGZ_H_G start_pad (
    .I     (),
    .OEN   (1'b0),
    .REN   (1'b1),
    .PAD   (start),
    .C     (startI)
);

PDDW04DGZ_H_G ready_pad (
    .I     (ready),
    .OEN   (1'b0),
    .REN   (1'b1),
    .PAD   (readyO),
    .C     ()
);

PDDW04DGZ_H_G illegal_divider_zero_pad (
    .I     (illegal_divider_zero),
    .OEN   (1'b0),
    .REN   (1'b1),
    .PAD   (illegal_divider_zeroO),
    .C     ()
);

endmodule
//--------------------------------------------------------------------------
