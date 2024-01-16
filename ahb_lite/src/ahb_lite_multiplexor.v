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
    input wire  [31:0] rom_rdata_mux,
    input wire  [31:0] defslave_rdata_mux,
    input wire  [31:0] nomap_rdata_mux,

    // slave inputs hreadyout
    input wire         rom_hredayout_mux,
    input wire         defslave_hreadyout_mux,
    input wire         nomap_hreadyout_mux,

    // slave inputs hresp
    input wire         rom_hresp_mux,
    input wire         defslave_hresp_mux,
    input wire         nomap_hresp_mux,

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
        addr_phase_hsel_mux <= `MUX_SEL_DEF_SLAVE;
    end else begin
        addr_phase_hsel_mux <= HSEL_MUX;
    end
end

//--------------------------------------------------------------------------
// Design: read the slave data and response signal to master
//--------------------------------------------------------------------------
always @(*) begin
    case(addr_phase_hsel_mux)
        `MUX_SEL_ROM: begin
            HREADY <= rom_hredayout_mux;
            HRESP  <= rom_hresp_mux;
            HRDATA <= rom_rdata_mux;
         end
        `MUX_SEL_DEF_SLAVE: begin
            HREADY <= defslave_hreadyout_mux;
            HRESP  <= defslave_hresp_mux;
            HRDATA <= defslave_rdata_mux;
         end
        default: begin
            HREADY <= nomap_hreadyout_mux;
            HRESP  <= nomap_hresp_mux;
            HRDATA <= nomap_rdata_mux;
        end
     endcase
end

endmodule
//--------------------------------------------------------------------------
