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
// Brief: this algorithm uses subtraction and shift operation to calculate
//        the quotient and remainder.
/*
*       110
*    --------------
*    111000 [56]
*    /
*    1001 [9]
*    --------------
*    111000
*   -1001
*    --------------
*    010100
*     1001
*    --------------
*     00010
*    remainder = 110
*    quotient  = 10
*--------------------------------
*    111000 [56]
*    /
*    1001
*    --------------
*       111000 > 1001   <---
*        if 0, 0           |
*        else              |
*          quotient  = +1
*          remainder = 111000 - 1001
*
*    --------------
*    1. 111000 > 1001 : 1
*       remainder = 111000 - 1001 = 101111
*       quotient  = 1
*
*    2. 10111 > 1001 : 1
*       remainder = 101111 - 1001 = 100110
*       quotient  = 2
*
*    3. 100110 > 1001 : 1
*       remainder = 100110 - 1001 = 11101
*       quotient  = 3
*
*    ...
*
*    6. 1011 > 1001 : 1
*       remainder = 1011 - 1001 = 0010
*       quotient  = 6
*
*    7. 0010 > 1001 : 0
*       remainder = 0010
*       quotient  = 6
*/
// Change Log:
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Include File
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Module
//--------------------------------------------------------------------------
module sequ_div
//--------------------------------------------------------------------------
// Ports
//--------------------------------------------------------------------------
(
    // inputs
    input wire        clk,
    input wire        rst_n,
    input wire [31:0] divider,
    input wire [31:0] dividend,
    input wire        start,

    // outputs
    output reg [31:0] quotient,
    output reg [31:0] remainder,
    output reg        ready,
    output reg        illegal_divider_zero 
);

//--------------------------------------------------------------------------
// Design: FSM state one hot localparameter
//--------------------------------------------------------------------------
localparam DIV_IDLE                 = 9'b000000001,
           DIV_START                = 9'b000000010,
           DIV_DIVIDER_ZERO         = 9'b000000100,
           DIV_DIVIDEND_ZERO        = 9'b000001000,
           DIV_DIVIDER_ONE          = 9'b000010000,
           DIV_DIVIDER_EQU_DIVIDEND = 9'b000100000,
           DIV_DIVIDEND_ST_DIVIDER  = 9'b001000000,
           DIV_DIVIDEND_BT_DIVIDER  = 9'b010000000,
           DIV_OUTPUT               = 9'b100000000;

//--------------------------------------------------------------------------
// Design: divider opeartion temp signal
//--------------------------------------------------------------------------
reg [32:0] sub_diff;
reg [63:0] remainder_quotient;
reg [4:0]  shift_count;
reg        illegal;
reg [8:0]  cur_state;
reg [8:0]  next_state;

//--------------------------------------------------------------------------
// Design: divider opeartion using sequential circuits FSM
//--------------------------------------------------------------------------
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        cur_state   <= DIV_IDLE;
    end else begin
        cur_state   <= next_state;
    end
end

//--------------------------------------------------------------------------
// Design: divider FSM
//--------------------------------------------------------------------------
always @(*) begin
    case (cur_state)
        DIV_IDLE: begin
            /* update state */
            if (start) begin
                next_state <= DIV_START;
            end else begin
                next_state <= DIV_IDLE;
            end
        end
        DIV_START: begin
            /* update state */
            next_state <= DIV_DIVIDER_ZERO;
        end
        DIV_DIVIDER_ZERO: begin
            if (divider == 32'h0000_0000) begin
                /* update state */
                next_state <= DIV_OUTPUT;
            end else begin
                next_state <= DIV_DIVIDEND_ZERO;
            end
        end
        DIV_DIVIDEND_ZERO: begin
            if (dividend == 32'h0000_0000) begin
                /* update state */
                next_state <= DIV_OUTPUT;
            end else begin
                next_state <= DIV_DIVIDER_ONE;
            end
        end
        DIV_DIVIDER_ONE: begin
            if (divider == 32'h0000_0001) begin
                /* update state */
                next_state <= DIV_OUTPUT;
            end else begin
                next_state <= DIV_DIVIDER_EQU_DIVIDEND;
            end
        end
        DIV_DIVIDER_EQU_DIVIDEND: begin
            if (divider == dividend) begin
                /* update state */
                next_state <= DIV_OUTPUT;
            end else begin
                next_state <= DIV_DIVIDEND_ST_DIVIDER;
            end
        end
        DIV_DIVIDEND_ST_DIVIDER: begin
            if (divider > dividend) begin
                /* update state */
                next_state <= DIV_OUTPUT;
            end else begin
                next_state <= DIV_DIVIDEND_BT_DIVIDER; 
            end
        end
        DIV_DIVIDEND_BT_DIVIDER: begin
            if (shift_count == 5'b00000) begin
                /* update state */
                next_state  <= DIV_OUTPUT;
            end else begin
                next_state  <= DIV_DIVIDEND_BT_DIVIDER;
            end
        end
        DIV_OUTPUT: begin
            /* update state */
            next_state <= DIV_IDLE;
        end
        default: begin 
            /* update state */
            next_state <= DIV_IDLE;
        end
    endcase
end

//--------------------------------------------------------------------------
// Design: divider FSM output
//--------------------------------------------------------------------------
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        quotient             <= 32'h0000_0000;
        remainder            <= 32'h0000_0000;
        ready                <= 1'b0;
        illegal_divider_zero <= 1'b0;
        shift_count          <= 5'b00000;
        remainder_quotient   <= 64'h0000_0000_0000_0000;
        sub_diff             =  33'h0000_0000;
        illegal              <= 1'b0;
    end else begin
        case(cur_state)
            DIV_START: begin
                remainder_quotient <= {32'h0000_0000, dividend};
                illegal            <= 1'b0;
                shift_count        <= 5'b11111;
            end
            DIV_DIVIDER_ZERO: begin
                if (divider == 32'h0000_0000) begin
                    remainder_quotient <= {32'h0000_0000, 32'h0000_0000};
                    illegal            <= 1'b1;
                end
            end
            DIV_DIVIDEND_ZERO: begin
                if (dividend == 32'h0000_0000) begin
                    remainder_quotient <= {32'h0000_0000, 32'h0000_0000};
                end
            end
            DIV_DIVIDER_ONE: begin
                if (divider == 32'h0000_0001) begin
                    remainder_quotient <= {32'h0000_0000, dividend};
                end
            end
            DIV_DIVIDER_EQU_DIVIDEND: begin
                if (divider == dividend) begin
                    remainder_quotient <= {32'h0000_0000, 32'h0000_0001};
                end
            end
            DIV_DIVIDEND_ST_DIVIDER: begin
                if (divider > dividend) begin
                    remainder_quotient <= {dividend, 32'h0000_0000};
                end
            end
            DIV_DIVIDEND_BT_DIVIDER: begin
                /* sub */
                sub_diff = remainder_quotient[63:31] - {1'b0, divider};
                /* check the most siginficant bit of diff */
                if (sub_diff[32]) begin
                    /* shift remainder_quotient */
                    remainder_quotient <= {remainder_quotient[62:0],  1'b0};
                end else begin 
                    /* restoring */
                    remainder_quotient <= {sub_diff[31:0], remainder_quotient[30:0], 1'b1};
                end
                shift_count <= shift_count - 1;
            end
            DIV_OUTPUT: begin
                quotient             <= remainder_quotient[31:0];
                remainder            <= remainder_quotient[63:32];
                illegal_divider_zero <= illegal;
                ready                <= 1'b1;
            end
            default: begin
                quotient             <= 32'h0000_0000; 
                remainder            <= 32'h0000_0000;
                illegal_divider_zero <= 1'b0;
                ready                <= 1'b0;
            end
        endcase
    end 
end

endmodule
//--------------------------------------------------------------------------
