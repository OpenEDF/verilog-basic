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
// Brief:i multipiler is use shif-add algorithm and sequential circuits
/*
*     10111 [23]
*     x
*     10011 [19]
*     -----------------
*     10111
*    10111
*   00000
*  00000
* 10111
* ------------------
* 110110101 [437]
*
*     10111
*    10111
* 10111
* ------------------
* 110110101
*/
// Change Log:
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Include File
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Module
//--------------------------------------------------------------------------
module sequ_multi
//--------------------------------------------------------------------------
// Ports
//--------------------------------------------------------------------------
(
    // inputs
    input wire         clk,
    input wire         rst_n,
    input wire [31:0]  multiplier,
    input wire [31:0]  multiplicand,
    input wire         start,

    // outputs
    output reg [31:0]  product_l,
    output reg [31:0]  product_h,
    output reg         ready
);

//--------------------------------------------------------------------------
// Design:  FSM state one hot design
//--------------------------------------------------------------------------
localparam MULTI_IDLE          = 7'b0000001;
localparam MULTI_START         = 7'b0000010;
localparam MULTI_ER_CAND_ZERO  = 7'b0000100;
localparam MULTI_ER_ONE        = 7'b0001000;
localparam MULTI_CAND_ONE      = 7'b0010000;
localparam MULTI_CALCUL        = 7'b0100000;
localparam MULTI_OUTPUT        = 7'b1000000;

//--------------------------------------------------------------------------
// Design:temp register
//--------------------------------------------------------------------------
reg [63:0] partial_product;
reg [31:0] multiplier_copy;
reg [63:0] multiplicand_copy;
reg [5:0]  shift_count;
reg        lsb;
reg [6:0]  state;

//--------------------------------------------------------------------------
// Design: sequential multiplier shift version of multiplier and
//         multoplicand
//--------------------------------------------------------------------------
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        product_l         <= 32'h0000_0000;
        product_h         <= 32'h0000_0000;
        ready             <= 1'b0;
        partial_product   <= 64'h0000_0000_0000_0000;
        multiplier_copy   <= 32'h0000_0000;
        multiplicand_copy <= 64'h0000_0000;
        shift_count       <= 6'd0;
        lsb               = 1'b0;
        state             <= MULTI_IDLE;
    end else begin
        /* default output */
        product_l         <= 32'h0000_0000;
        product_h         <= 32'h0000_0000;
        ready             <= 1'b0;
        case (state)
            MULTI_IDLE: begin
                if (start) begin
                    state <= MULTI_START;
                end else begin
                    /* update state */
                    state <= MULTI_IDLE;
                end
            end
            MULTI_START: begin
                multiplicand_copy <= {32'h0000_0000, multiplicand};
                multiplier_copy   <= multiplier;
                shift_count       <= 6'd32;
                ready             <= 1'b0;
                partial_product   <= 64'h0000_0000_0000_0000;
                /* update state */
                state <= MULTI_ER_CAND_ZERO;
            end
            MULTI_ER_CAND_ZERO: begin
                if ((multiplier == 32'h0000_0000) || (multiplicand == 32'h0000_0000)) begin
                    partial_product   <= 64'h0000_0000_0000_0000;
                    /* update state */
                    state <= MULTI_OUTPUT;
                end else begin
                    /* update state */
                    state <= MULTI_ER_ONE;
                end
            end
            MULTI_ER_ONE: begin
                if (multiplier == 32'h0000_0001) begin
                    partial_product   <= {32'h0000_0000, multiplicand};
                    /* update state */
                    state <= MULTI_OUTPUT;
                end else begin
                    /* update state */
                    state <= MULTI_CAND_ONE;
                end
            end
            MULTI_CAND_ONE: begin
                if (multiplicand == 32'h0000_0001) begin
                    partial_product   <= {32'h0000_0000, multiplier};
                    /* update state */
                    state <= MULTI_OUTPUT;
                end else begin
                    /* update state */
                    state <= MULTI_CALCUL;
                end
            end
            MULTI_CALCUL: begin
                if (shift_count == 6'b000000) begin
                    /* update state */
                    state <= MULTI_OUTPUT;
                end else begin
                    lsb = multiplier_copy[0];
                    if (lsb == 1'b1) begin
                        partial_product <= partial_product + multiplicand_copy;
                    end
                    multiplier_copy   <= multiplier_copy >> 1;
                    multiplicand_copy <= multiplicand_copy << 1;
                    shift_count       <= shift_count - 1;
                    /* update state */
                    state <= MULTI_CALCUL;
                end
            end
            MULTI_OUTPUT: begin
                product_l <= partial_product[31:0];
                product_h <= partial_product[63:32];
                ready     <= 1'b1;
                /* update state */
                state <= MULTI_IDLE;
            end
            default: begin
                /* update state */
                state <= MULTI_IDLE;
            end
        endcase
    end
end

endmodule
//--------------------------------------------------------------------------
