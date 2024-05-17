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
// Brief: ahb lite multiplexor
// Change Log:
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Include File
//--------------------------------------------------------------------------
`include "ahb_lite_config.v"

//--------------------------------------------------------------------------
// Module
//--------------------------------------------------------------------------
module ahb_lite_multiplexor
//--------------------------------------------------------------------------
// Ports
//--------------------------------------------------------------------------
(
    // global inputs
    input wire         HCLK,
    input wire         HRESETn,

    // decoder input
    input wire  [3:0]  HSEL_MUX,

    // slave inputs data
    input wire  [31:0] slave_s0_data,
    input wire  [31:0] slave_s1_data,
    input wire  [31:0] slave_s2_data,
    input wire  [31:0] slave_s3_data,
    input wire  [31:0] slave_def_data,

    // slave inputs hreadyout
    input wire         slave_s0_hreadyout,
    input wire         slave_s1_hreadyout,
    input wire         slave_s2_hreadyout,
    input wire         slave_s3_hreadyout,
    input wire         slave_def_hreadyout,

    // slave inputs hresp
    input wire         slave_s0_hresp,
    input wire         slave_s1_hresp,
    input wire         slave_s2_hresp,
    input wire         slave_s3_hresp,
    input wire         slave_def_hresp,

    // outputs to master
    output reg         HREADY,
    output reg         HRESP,
    output reg  [31:0] HRDATA
);

//--------------------------------------------------------------------------
// Design: module internal control signal
//--------------------------------------------------------------------------
reg [3:0] addr_phase_hsel_mux;

//--------------------------------------------------------------------------
// Design: store the address phase signal
//--------------------------------------------------------------------------
always @(posedge HCLK or negedge HRESETn) begin
    if (!HRESETn) begin
        addr_phase_hsel_mux <= `MUX_SEL_NOMAP;
    end else begin
        addr_phase_hsel_mux <= HSEL_MUX;
    end
end

//--------------------------------------------------------------------------
// Design: read the slave data and response signal to master
//--------------------------------------------------------------------------
always @(addr_phase_hsel_mux or
         slave_s0_data or slave_s0_hreadyout or slave_s0_hresp or
         slave_s1_data or slave_s1_hreadyout or slave_s1_hresp or
         slave_s2_data or slave_s2_hreadyout or slave_s2_hresp or
         slave_s3_data or slave_s3_hreadyout or slave_s3_hresp or
         slave_def_data or slave_def_hreadyout or slave_def_hresp) begin
    case(addr_phase_hsel_mux)
        `MUX_SEL_S0: begin
            HREADY <= slave_s0_hreadyout;
            HRESP  <= slave_s0_hresp ;
            HRDATA <= slave_s0_data ;
         end
        `MUX_SEL_S1: begin
            HREADY <= slave_s1_hreadyout;
            HRESP  <= slave_s1_hresp ;
            HRDATA <= slave_s1_data ;
         end
        `MUX_SEL_S2: begin
            HREADY <= slave_s2_hreadyout;
            HRESP  <= slave_s2_hresp ;
            HRDATA <= slave_s2_data ;
         end
        `MUX_SEL_S3: begin
            HREADY <= slave_s3_hreadyout;
            HRESP  <= slave_s3_hresp ;
            HRDATA <= slave_s3_data ;
         end
        default: begin
            HREADY <= slave_def_hreadyout;
            HRESP  <= slave_def_hresp ;
            HRDATA <= slave_def_data ;
        end
     endcase
end

endmodule
//--------------------------------------------------------------------------
