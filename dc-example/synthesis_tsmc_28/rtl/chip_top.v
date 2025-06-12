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
// Brief: chip top, core + iopads
//
// Change Log:
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Include File
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Module
//--------------------------------------------------------------------------
module chip_top
//--------------------------------------------------------------------------
// Ports
//--------------------------------------------------------------------------
(
    // inputs
    input wire        clkI,
    input wire        rst_nI,
    input wire [31:0] divider,
    input wire [31:0] dividend,
    input wire        startI,

    // outputs
    output reg [31:0] quotient,
    output reg [31:0] remainder,
    output reg        readyO,
    output reg        illegal_divider_zeroO
);

//--------------------------------------------------------------------------
// Design: instance the sequ design
//--------------------------------------------------------------------------
wire clk;
wire rst_n;
wire start;
wire ready;
wire illegal_divider_zero;

//--------------------------------------------------------------------------
// Design: instance the sequ design
//--------------------------------------------------------------------------
sequ_div SEQU_DIV(
    /*autoinst*/
        //--------------------------------------------------------------------------
        // Ports
        //--------------------------------------------------------------------------
        // inputs
        .clk                     (clk                           ), //input
        .rst_n                   (rst_n                         ), //input
        .divider                 (divider[31:0]                 ), //input
        .dividend                (dividend[31:0]                ), //input
        .start                   (start                         ), //input
        // outputs
        .quotient                (quotient[31:0]                ), //output
        .remainder               (remainder[31:0]               ), //output
        .ready                   (ready                         ), //output
        .illegal_divider_zero    (illegal_divider_zero          )  //output
    );

//--------------------------------------------------------------------------
// Design: io instance test 
//--------------------------------------------------------------------------
iopads IOPADS_INST(
    /*autoinst*/
        //--------------------------------------------------------------------------
        // Ports
        //--------------------------------------------------------------------------
        // inputs
        .clk                      (clk                          ), //input
        .rst_n                    (rst_n                        ), //input
        .start                    (start                        ), //input
        .ready                    (ready                        ), //input
        .illegal_divider_zero     (illegal_divider_zero         ), //input
        // outputs
        .clkI                     (clkI                         ), //output
        .rst_nI                   (rst_nI                       ), //output
        .startI                   (startI                       ), //output
        .readyO                   (readyO                       ), //output
        .illegal_divider_zeroO    (illegal_divider_zeroO        )  //output
    );
endmodule
//--------------------------------------------------------------------------
