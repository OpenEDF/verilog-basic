//--------------------------------------------------------------------------
//                             AMBA
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
// Brief: ahb lite default slave
// Change Log:
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Include File
//--------------------------------------------------------------------------
`include "ahb_lite_config.v"

//--------------------------------------------------------------------------
// Module
//--------------------------------------------------------------------------
module ahb_lite_def_slave
//--------------------------------------------------------------------------
// Ports
//--------------------------------------------------------------------------
(
    // global inputs
    input wire         HCLK,
    input wire         HRESETn,

    input wire         HSEL,
    input wire [31:0]  HADDR,
    input wire         HWRITE,
    input wire [2:0]   HSIZE,
    input wire [2:0]   HBURST,
    input wire [3:0]   HPROT,
    input wire [1:0]   HTRANS,
    input wire         HMASTLOCK,
    input wire         HREADY,
    input wire [31:0]  HWDATA,

    // outputs
    output wire [31:0] HRDATA,
    output wire        HREADYOUT,
    output wire        HRESP
);

localparam SUCCESS_CPL  = 3'b001;
localparam ERROR_FIRST  = 3'b010;
localparam ERROR_SECOND = 3'b100;

//--------------------------------------------------------------------------
// Design: internal siginal
//--------------------------------------------------------------------------
reg [2:0] cur_state;
reg [2:0] next_state;
wire      invalid;
reg       ihreadyout;
reg       ihresp;

//--------------------------------------------------------------------------
// Design: set high during the address phase if an invalid transder, and it
//         used to control the generation of the response outputs.
//--------------------------------------------------------------------------
assign invalid = ((HREADY == 1'b1 && HSEL == 1'b1 &&
                 (HTRANS == `TRN_NONSEQ || HTRANS == `TRN_SEQ)) ? 1'b1 :
                 1'b0);

//--------------------------------------------------------------------------
// Design: FSM for update
//--------------------------------------------------------------------------
always @(posedge HCLK or negedge HRESETn) begin
    if (!HRESETn) begin
        cur_state <= SUCCESS_CPL;
    end else begin
        cur_state <= next_state;
    end
end

//--------------------------------------------------------------------------
// Design: A two-cycle response is required for an error condition with HREADY
//         being asserted in the second cycle.
//--------------------------------------------------------------------------
always @(invalid or cur_state) begin
    case(cur_state)
        SUCCESS_CPL: begin
            if (invalid)
                next_state <= ERROR_FIRST;
        end
        ERROR_FIRST: begin
            if (invalid)
                next_state <= ERROR_SECOND;
        end
        ERROR_SECOND: begin
            if (!invalid)
                next_state <= SUCCESS_CPL;
        end
        default:
            next_state <= SUCCESS_CPL;
    endcase
end

//--------------------------------------------------------------------------
// Design: for the two cycle error response, hready is set low during the
//         first cycle and high during the second cycle.
//         okay response is generated for idle, two cycle error response is
//         generated if a non-sequential or sequential transder is attempted.
//--------------------------------------------------------------------------
always @(posedge HCLK or negedge HRESETn) begin
    if (!HRESETn) begin
        ihreadyout <= `READY;
        ihresp     <= `OKAY;
    end else begin
        case(cur_state)
            SUCCESS_CPL: begin
                ihreadyout <= `READY;
                ihresp     <= `OKAY;
            end
            ERROR_FIRST: begin /* first cycle  */
                ihreadyout <= `WAIT;
                ihresp     <= `ERROR;
            end
            ERROR_SECOND: begin /* second cycle */
                ihreadyout <= `READY;
                ihresp     <= `ERROR;
            end
            default: begin
                ihreadyout <= `READY;
                ihresp     <= `OKAY;
            end
        endcase
end
//--------------------------------------------------------------------------
// Design: output the hreadyout and hresp
//--------------------------------------------------------------------------
assign HRDATA    = `ALL_32BIT_ZERO;
assign HREADYOUT = ihreadyout;
assign HRESP     = ihresp;

endmodule
//--------------------------------------------------------------------------
