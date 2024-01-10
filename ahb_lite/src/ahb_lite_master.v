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
    input wire [31:0]  master_in_wdata,
    input wire [31:0]  master_in_addr,
    input wire         master_en,
    input wire         master_wr,
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
    output wire         master_hreadyn_wait,
    output wire [31:0]  master_out_data
);

//--------------------------------------------------------------------------
// Design: module internal signals
//--------------------------------------------------------------------------
reg [31:0] master_addr_phase_hdata;

//--------------------------------------------------------------------------
// Design: address phase, master output the address, _data and control
//         signal
//--------------------------------------------------------------------------
always @(posedge HCLK or negedge HRESETn) begin
    if (!HRESETn) begin
        HADDR       <= `DEF_ACCRESS_SLAVE_ADDR;
        HWRITE      <= 1'b0;
        HSIZE       <= 3'b010;
        HBURST      <= 3'b000;
        HPROT       <= 3'b000;
        HTRANS      <= 2'b00;
        HMASTERLOCK <= 1'b0;
        master_addr_phase_hdata <= 32'h0000_0000;
    end else begin
        if (master_en) begin
            HADDR       <= master_in_addr;
            HWRITE      <= master_wr;
            HSIZE       <= 3'b010;          // word
            master_addr_phase_hdata <= master_in_wdata;
        end else begin
            HADDR       <= `DEF_ACCRESS_SLAVE_ADDR;
            HWRITE      <= 1'b0;
            HSIZE       <= 3'b010;
            HBURST      <= 3'b000;
            HPROT       <= 3'b000;
            HTRANS      <= 2'b00;
            HMASTERLOCK <= 1'b0;
            master_addr_phase_hdata <= 32'h0000_0000;
        end
    end
end

//--------------------------------------------------------------------------
// Design: data phase, output the data from master address phase
//--------------------------------------------------------------------------
always @(posedge HCLK or negedge HRESETn) begin
    if (!HRESETn) begin
        HWDATA <= 32'h0000_0000;
    end else if (master_en)begin
        HWDATA <= master_addr_phase_hdata;
    end else begin
        HWDATA <= 32'h0000_0000;
    end
end

//--------------------------------------------------------------------------
// Design: read response data and control singal
//--------------------------------------------------------------------------
assign master_hreadyn_wait = HREADY & !HRESP;
assign master_out_data     = HRDATA;

endmodule
//--------------------------------------------------------------------------
