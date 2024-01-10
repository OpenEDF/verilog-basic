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
    output reg [31:0]  HRDATA,
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
reg [31:0] data_phase_addr;
reg [31:0] burst_incr_addr;
reg        burst_cnt_clr;
reg [9:0]  burst_cnt;

reg [31:0] def_test_reg0;
reg [31:0] def_test_reg1;
reg [31:0] def_test_reg2;
reg [31:0] def_test_reg3;

parameter REG0_OFFSET = 16'h0000;
parameter REG1_OFFSET = 16'h0004;
parameter REG2_OFFSET = 16'h0008;
parameter REG3_OFFSET = 16'h000C;

wire [15:0] mem_map_addr_offset;
wire        data_phase_read;
wire        data_phase_wire;
wire        data_phase_rd_wr_comm;
wire        master_burst_tran;
assign mem_map_addr_offset = data_phase_addr[15:0];
assign data_phase_rd_wr_comm = addr_phase_hsel & addr_phase_hsize[1] & addr_phase_hready;
assign data_phase_read  = data_phase_rd_wr_comm & !addr_phase_hwrite;
assign data_phase_write = data_phase_rd_wr_comm & addr_phase_hwrite;
assign master_burst_tran = addr_phase_hburst[0] | addr_phase_hburst[1] | addr_phase_hburst[2];

reg         data_phase_rd_hreadyout;
reg         data_phase_rd_hresp;
reg         data_phase_wr_hreadyout;
reg         data_phase_wr_hresp;
reg         data_phase_hreadyout;
reg         data_phase_hresp;

//--------------------------------------------------------------------------
// Design: address phase samplig
//--------------------------------------------------------------------------
always @(posedge HCLK or negedge HRESETn) begin
    if (!HRESETn) begin
        addr_phase_addr      <= 32'h005E_0000;
        addr_phase_hsel      <= `SLAVE_FRE;
        addr_phase_htrans    <= `TRANS_IDLE;
        addr_phase_hwrite    <= `MASTER_READ;
        addr_phase_hsize     <= `SIZE_WORD;
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
// Design: write register operation
//--------------------------------------------------------------------------
always @(posedge HCLK or negedge HRESETn) begin
    if (!HRESETn) begin
        def_test_reg0 <= 32'h0000_0000;
        def_test_reg1 <= 32'h0000_0000;
        def_test_reg2 <= 32'h0000_0000;
        def_test_reg3 <= 32'h0000_0000;
        data_phase_wr_hreadyout <= `WAIT_READYOUT;
        data_phase_wr_hresp  <= `RESP_ERROR;
    end
    else begin
        if (data_phase_write) begin
            case(mem_map_addr_offset)
                REG0_OFFSET: begin
                    def_test_reg0 <= HWDATA;
                    data_phase_wr_hreadyout <= `READYOUT;
                    data_phase_wr_hresp  <= `RESP_OKAY;
                end
                REG1_OFFSET: begin
                    def_test_reg1 <= HWDATA;
                    data_phase_wr_hreadyout <= `READYOUT;
                    data_phase_wr_hresp  <= `RESP_OKAY;
                end
                REG2_OFFSET: begin
                    def_test_reg2 <= HWDATA;
                    data_phase_wr_hreadyout <= `READYOUT;
                    data_phase_wr_hresp  <= `RESP_OKAY;
                end
                REG3_OFFSET: begin
                    def_test_reg3 <= HWDATA;
                    data_phase_wr_hreadyout <= `READYOUT;
                    data_phase_wr_hresp  <= `RESP_OKAY;
                end
                default: begin
                    data_phase_wr_hreadyout <= `READYOUT;
                    data_phase_wr_hresp  <= `RESP_OKAY;
                    /* illege address access  */
                end
           endcase
        end
        else begin
            data_phase_wr_hreadyout <= 1'b1;
            data_phase_wr_hresp  <= 1'b1;
        end
    end
end

//--------------------------------------------------------------------------
// Design: read register operation
//--------------------------------------------------------------------------
always @(posedge HCLK or negedge HRESETn) begin
    if (!HRESETn) begin
        HRDATA        <= 32'h0000_0000;
        data_phase_rd_hreadyout <= `WAIT_READYOUT;
        data_phase_rd_hresp  <= `RESP_ERROR;
    end
    else begin
        if (data_phase_read) begin
            case(mem_map_addr_offset)
                REG0_OFFSET: begin
                    HRDATA <= def_test_reg0;
                    data_phase_rd_hreadyout <= `READYOUT;
                    data_phase_rd_hresp  <= `RESP_OKAY;
                end
                REG1_OFFSET: begin
                    HRDATA <= def_test_reg1;
                    data_phase_rd_hreadyout <= `READYOUT;
                    data_phase_rd_hresp  <= `RESP_OKAY;
                end
                REG2_OFFSET: begin
                    HRDATA <= def_test_reg2;
                    data_phase_rd_hreadyout <= `READYOUT;
                    data_phase_rd_hresp  <= `RESP_OKAY;
                end
                REG3_OFFSET: begin
                    HRDATA <= def_test_reg3;
                    data_phase_rd_hreadyout <= `READYOUT;
                    data_phase_rd_hresp  <= `RESP_OKAY;
                end
                default: begin
                    HRDATA <= 32'hFFFF_FFFF;
                    data_phase_rd_hreadyout <= `READYOUT;
                    data_phase_rd_hresp  <= `RESP_OKAY;
                end
            endcase
        end
        else begin
            data_phase_rd_hreadyout <= `READYOUT;
            data_phase_rd_hresp  <= `RESP_ERROR;
        end
    end
end

//--------------------------------------------------------------------------
// Design: output the read and write hready and hresp
//--------------------------------------------------------------------------
always @(data_phase_rd_hresp or
         data_phase_rd_hreadyout or
         data_phase_wr_hresp  or
         data_phase_wr_hreadyout) begin
    if (data_phase_write) begin
        data_phase_hreadyout <= data_phase_wr_hreadyout;
        data_phase_hresp  <= data_phase_wr_hresp;
    end
    else if (data_phase_read) begin
        data_phase_hreadyout <= data_phase_rd_hreadyout;
        data_phase_hresp  <= data_phase_rd_hresp;
    end
    else begin
        data_phase_hreadyout <= `READYOUT;
        data_phase_hresp  <= `RESP_ERROR;
    end
end

//--------------------------------------------------------------------------
// Design: assign hready and hresp
//--------------------------------------------------------------------------
assign HREADYOUT = data_phase_hreadyout;
assign HRESP     = data_phase_hresp;

//--------------------------------------------------------------------------
// Design: burst address update
// TODO: WRAP
// TODO: plus HIZE[xx]
//--------------------------------------------------------------------------
always @(posedge HCLK or negedge HRESETn) begin
    if (!HRESETn) begin
        burst_incr_addr <= 32'h0000_0000;
        burst_cnt_clr   <= 1'b0;
    end else begin
        case (addr_phase_hburst)
            `BURST_SINGLE:
                burst_incr_addr <= HADDR;
            `BURST_INCR: begin
                burst_incr_addr <= burst_incr_addr + 32'h4;
                burst_cnt_clr   <= 1'b1;
            end
            `BURST_INCR4:
                if (burst_cnt == 10'd4) begin
                    burst_cnt_clr <= 1'b1;
                end else begin
                    burst_cnt_clr   <= 1'b0;
                    burst_incr_addr <= burst_incr_addr + 32'h4;
                end
            `BURST_INCR8:
                if (burst_cnt <= 10'd8) begin
                    burst_cnt_clr <= 1'b1;
                end else begin
                    burst_cnt_clr   <= 1'b0;
                    burst_incr_addr <= burst_incr_addr + 32'h4;
                end
            `BURST_INCR16:
                if (burst_cnt == 10'd16) begin
                    burst_cnt_clr <= 1'b1;
                end else begin
                    burst_cnt_clr   <= 1'b1;
                    burst_incr_addr <= burst_incr_addr + 32'h4;
                end
            default: begin
                burst_cnt_clr   <= 1'b0;
                burst_incr_addr <= burst_incr_addr;
            end
        endcase
    end
end

//--------------------------------------------------------------------------
// Design: select uses brust address or bus address
//--------------------------------------------------------------------------
always @(*) begin
    if (master_burst_tran) begin
        data_phase_addr = burst_incr_addr;
    end else begin
        data_phase_addr = addr_phase_addr;
    end
end

//--------------------------------------------------------------------------
// Design: ahb brust counter
//--------------------------------------------------------------------------
always @(posedge HCLK or negedge HRESETn) begin
    if (!HRESETn) begin
        burst_cnt <= 10'd0;
    end else begin
        if (master_burst_tran) begin
            burst_cnt <= burst_cnt + 1'd1;
        end else if (burst_cnt_clr) begin
            burst_cnt <= 10'd0;
        end else begin
            burst_cnt <= burst_cnt;
        end
    end
end

endmodule
//--------------------------------------------------------------------------
