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
module ahb_lite_nonmap
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

//--------------------------------------------------------------------------
// Design: address phase sampling register
//--------------------------------------------------------------------------
reg [31:0] addr_phase_addr;
reg        addr_phase_hsel;
reg [1:0]  addr_phase_htrans;
reg        addr_phase_hwrite;
reg [2:0]  addr_phase_hsize;
reg [2:0]  addr_phase_hburst;
reg [3:0]  addr_phase_hport;
reg        addr_phase_hmastlock;
reg        addr_phase_hready;

reg [31:0] bus_monitor_addr;
reg [31:0] bus_monitor_data;

wire        data_phase_wire;
wire        data_phase_rd_wr_comm;
assign data_phase_rd_wr_comm = addr_phase_hsel & addr_phase_hsize[1] & addr_phase_hready;
assign data_phase_write = data_phase_rd_wr_comm & addr_phase_hwrite;

reg         data_phase_hreadyout;
reg         data_phase_hresp;
reg [31:0]  data_phase_hdata;

//--------------------------------------------------------------------------
// Design: address phase samplig
//--------------------------------------------------------------------------
always @(posedge HCLK or negedge HRESETn) begin
    if (!HRESETn) begin
        addr_phase_addr      <= 32'h0000_0000;
        addr_phase_hsel      <= `SLAVE_FRE;
        addr_phase_htrans    <= `TRANS_IDLE;
        addr_phase_hwrite    <= `MASTER_READ;
        addr_phase_hsize     <= `SIZE_BYTE;
        addr_phase_hburst    <= `BURST_SINGLE;
        addr_phase_hport     <= 4'b0000;
        addr_phase_hmastlock <= 1'b0;
        addr_phase_hready    <= `READYOUT;
    end else begin
        addr_phase_addr      <= HADDR;
        addr_phase_hsel      <= HSEL;
        addr_phase_htrans    <= HTRANS;
        addr_phase_hwrite    <= HWRITE;
        addr_phase_hsize     <= HSIZE;
        addr_phase_hburst    <= HBURST;
        addr_phase_hport     <= HPROT;
        addr_phase_hmastlock <= HMASTLOCK;
        addr_phase_hready    <= HREADY;
    end
end

//--------------------------------------------------------------------------
// Design: read and write register operation
//--------------------------------------------------------------------------
always @(posedge HCLK or negedge HRESETn) begin
    if (!HRESETn) begin
        bus_monitor_addr     <= 32'h0000_0001; /* default value */
        bus_monitor_data     <= 32'h0000_0002;
        data_phase_hreadyout <= `WAIT_READYOUT;
        data_phase_hresp     <= `RESP_ERROR;
        data_phase_hdata     <= 32'h0000_0000;
    end else begin
        bus_monitor_data     <= HWDATA;
        bus_monitor_addr     <= addr_phase_addr;
        data_phase_hreadyout <= `READYOUT;
        data_phase_hresp     <= `RESP_OKAY;
        data_phase_hdata     <= 32'h0000_0000;
    end
end

//--------------------------------------------------------------------------
// Design: assign hready and hresp
//--------------------------------------------------------------------------
assign HREADYOUT = (addr_phase_htrans == `TRANS_IDLE) ? `READYOUT : data_phase_hreadyout;
assign HRESP     = (addr_phase_htrans == `TRANS_IDLE) ? `RESP_OKAY : data_phase_hresp;
assign HRDATA    = (addr_phase_htrans == `TRANS_IDLE) ? 32'h0000_0000 : data_phase_hdata;

endmodule
//--------------------------------------------------------------------------
