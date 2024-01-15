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
// Brief: ahb lite master
// Change Log:
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Include File
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Module
//--------------------------------------------------------------------------
module ahb_lite_master
//--------------------------------------------------------------------------
// Ports
//--------------------------------------------------------------------------
(
    // global inputs
    input wire         HCLK,
    input wire         HRESETn,

    // AHB master inputs
    input wire [31:0]  master_haddr,
    input wire         master_hwrite,
    input wire [2:0]   master_hsize,
    input wire [2:0]   master_hburst,
    input wire [3:0]   master_hport,
    input wire [1:0]   master_htrans,
    input wire         master_hmasterlock,
    input wire [31:0]  master_hwdata,
    input wire         HREADY,
    input wire         HRESP,
    input wire [31:0]  HRDATA,

    // AHB master outputs
    output reg [31:0]  HADDR,
    output reg         HWRITE,
    output reg [2:0]   HSIZE,
    output reg [2:0]   HBURST,
    output reg [3:0]   HPROT,
    output reg [1:0]   HTRANS,
    output reg         HMASTERLOCK,
    output reg [31:0]  HWDATA,

    //custom master outputs
    output wire         master_hready_wait,
    output wire         master_hresp_error,
    output wire [31:0]  master_out_data
);

//--------------------------------------------------------------------------
// Design: module internal signals
//--------------------------------------------------------------------------
reg [31:0] addr_phase_hdata;

//--------------------------------------------------------------------------
// Design: address phase, master output the address, _data and control
//         signal
//--------------------------------------------------------------------------
always @(posedge HCLK or negedge HRESETn) begin
    if (!HRESETn) begin
        HADDR            <= `DEF_ACCRESS_SLAVE_ADDR;
        HWRITE           <= `MASTER_READ;
        HSIZE            <= `SIZE_WORD;
        HBURST           <= `BURST_SINGLE;
        HPROT            <= 3'b000;
        HTRANS           <= `TRANS_IDLE;
        HMASTERLOCK      <= 1'b0;
        addr_phase_hdata <= 32'h0000_0000;
    end else begin
        HADDR            <= master_haddr;
        HWRITE           <= master_hwrite;
        HSIZE            <= master_hsize;
        HBURST           <= master_hburst;
        HPROT            <= master_hport;
        HTRANS           <= master_htrans;
        HMASTERLOCK      <= master_hmasterlock;
        addr_phase_hdata <= master_hwdata;
    end
end

//--------------------------------------------------------------------------
// Design: data phase, output the data from master address phase
//--------------------------------------------------------------------------
always @(posedge HCLK or negedge HRESETn) begin
    if (!HRESETn) begin
        HWDATA <= 32'h0000_0000;
    end else begin
        HWDATA <= addr_phase_hdata;
    end
end

//--------------------------------------------------------------------------
// Design: read response data and control singal
//--------------------------------------------------------------------------
assign master_hready_wait = HREADY;
assign master_hresp_error = HRESP;
assign master_out_data    = HRDATA;

endmodule
//--------------------------------------------------------------------------
