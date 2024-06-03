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
    input wire         master_start,
    input wire         master_wr,
    input wire [9:0]   master_burst_len,

    // AHB multiplexor inputs
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
    output reg         master_hreadyn_wait,
    output reg         master_hresp_error,
    output reg [31:0]  master_error_remain_addr,
    output reg [31:0]  master_out_data
);

//--------------------------------------------------------------------------
// Design: module internal signals
//--------------------------------------------------------------------------
reg [31:0] addr_phase_hdata;
reg [4:0]  next_state, cur_state;
reg        m_in_seq;
reg [9:0]  burst_len_realtime;
reg [31:0] error_remain_addr;
wire       burst_continue;
wire       burst_enable;

//--------------------------------------------------------------------------
// Design: master fsm
//--------------------------------------------------------------------------
parameter M_IDLE   = 5'b00001;
parameter M_NONSEQ = 5'b00010;
parameter M_SEQ    = 5'b00100;
parameter M_BUSY   = 5'b01000;
parameter M_ERROR  = 5'b10000;

//--------------------------------------------------------------------------
// Design: fsm update the current state 
//--------------------------------------------------------------------------
always @(posedge HCLK or negedge HRESETn) begin
    if (!HRESETn) begin
        cur_state <= M_IDLE;
    end else begin
        cur_state <= next_state;
    end
end

//--------------------------------------------------------------------------
// Design: fsm update the next state 
//--------------------------------------------------------------------------
always @(*) begin
    case (cur_state)
        M_IDLE:
            if (master_start) begin
                next_state <= M_NONSEQ;
            end else begin
                next_state <= M_IDLE;
            end
        M_NONSEQ:
            if (!HREADY) begin
                next_state <= M_BUSY;
            end else if (HRESP) begin
                next_state <= M_ERROR;
            end else if (burst_enable) begin
                next_state <= M_SEQ;
            end else if (!master_start) begin
                next_state <= M_IDLE;
            end else begin
                next_state <= M_NONSEQ;
            end
        M_BUSY:
            if (HRESP) begin
                next_state <= M_ERROR;
            end else if (HREADY) begin
                next_state <= M_IDLE;
            end else if (HREADY & m_in_seq) begin
                next_state <= M_SEQ;
            end else begin
                next_state <= M_BUSY;
            end
        M_ERROR:
            next_state <= M_IDLE;
        M_SEQ:
            if (!burst_continue) begin
                next_state <= M_IDLE;
            end else if (!HREADY) begin
                next_state <= M_BUSY;
            end else if (HRESP) begin
                next_state <= M_ERROR;
            end else begin
                next_state <= M_SEQ;
            end
       default:
           next_state <= M_IDLE;
    endcase
end

//--------------------------------------------------------------------------
// Design: address phase, master output the address, _data and control
//         signal
//--------------------------------------------------------------------------
always @(posedge HCLK or negedge HRESETn) begin
    if (!HRESETn) begin
        HADDR       <= `DEF_ACCRESS_SLAVE_ADDR;
        HWRITE      <= `MASTER_READ;
        HSIZE       <= `SIZE_WORD;
        HBURST      <= `BURST_SINGLE;
        HPROT       <= 3'b000;
        HTRANS      <= `TRANS_IDLE;
        HMASTERLOCK <= 1'b0;
        addr_phase_hdata <= 32'h0000_0000;
        m_in_seq         <= 1'b0;
        burst_len_realtime <= 10'd0;
        error_remain_addr  <= 32'h0000_0000;
    end else begin
        case (cur_state)
            M_IDLE: begin
                HADDR       <= `DEF_ACCRESS_SLAVE_ADDR;
                HWRITE      <= `MASTER_READ;
                HSIZE       <= `SIZE_WORD;
                HBURST      <= `BURST_SINGLE;
                HPROT       <= 3'b000;
                HTRANS      <= `TRANS_IDLE;
                HMASTERLOCK <= 1'b0;
                addr_phase_hdata <= 32'h0000_0000;
                m_in_seq    <= 1'b0;
                burst_len_realtime <= 10'd0;
                error_remain_addr  <= 32'h0000_0000;
            end
            M_NONSEQ: begin
                HADDR       <= master_in_addr;
                HWRITE      <= master_wr;
                HSIZE       <= `SIZE_WORD;
                HBURST      <= `BURST_SINGLE;
                HTRANS      <= `TRANS_NONSEQ;
                addr_phase_hdata   <= master_in_wdata;
                burst_len_realtime <= master_burst_len;
            end
            M_BUSY: begin
                HADDR       <= HADDR;
                HWRITE      <= HWRITE;
                HSIZE       <= HSIZE;
                HBURST      <= HBURST;
                HTRANS      <= HTRANS;
                addr_phase_hdata   <= addr_phase_hdata;
                burst_len_realtime <= master_burst_len;
            end
            M_ERROR: begin
               if (m_in_seq) begin
                   error_remain_addr <= HADDR + (master_burst_len - burst_len_realtime);
               end
            end
            M_SEQ: begin
                HADDR       <= HADDR;
                HWRITE      <= HWRITE;
                HSIZE       <= HSIZE;
                HBURST      <= HBURST;
                HTRANS      <= HTRANS;
                addr_phase_hdata <= addr_phase_hdata;
                m_in_seq    <= 1'b1;
                if (HREADY) begin
                    burst_len_realtime <= burst_len_realtime - 10'd1;
                end
            end
            default: begin
                HADDR       <= `DEF_ACCRESS_SLAVE_ADDR;
                HWRITE      <= `MASTER_READ;
                HSIZE       <= `SIZE_WORD;
                HBURST      <= `BURST_SINGLE;
                HPROT       <= 3'b000;
                HTRANS      <= `TRANS_IDLE;
                HMASTERLOCK <= 1'b0;
                addr_phase_hdata <= 32'h0000_0000;
                m_in_seq    <= 1'b0;
                burst_len_realtime  <= 10'd0;
                error_remain_addr  <= 32'h0000_0000;
            end
        endcase
    end
end

//--------------------------------------------------------------------------
// Design: data phase, output the data from master address phase
//--------------------------------------------------------------------------
always @(posedge HCLK or negedge HRESETn) begin
    if (!HRESETn) begin
        HWDATA <= 32'h0000_0000;
    end else if (master_start) begin
        HWDATA <= addr_phase_hdata;
    end else begin
        HWDATA <= 32'h0000_0000;
    end
end

//--------------------------------------------------------------------------
// Design: burst enable control logic
//--------------------------------------------------------------------------
assign burst_enable = master_burst_len[0] & 
                      master_burst_len[1] &
                      master_burst_len[2] &
                      master_burst_len[3] &
                      master_burst_len[4] &
                      master_burst_len[5] &
                      master_burst_len[6] &
                      master_burst_len[7] &
                      master_burst_len[8] &
                      master_burst_len[9];

//--------------------------------------------------------------------------
// Design: burst continue control logic
//--------------------------------------------------------------------------
assign burst_continue = burst_len_realtime[0] & 
                        burst_len_realtime[1] &
                        burst_len_realtime[2] &
                        burst_len_realtime[3] &
                        burst_len_realtime[4] &
                        burst_len_realtime[5] &
                        burst_len_realtime[6] &
                        burst_len_realtime[7] &
                        burst_len_realtime[8] &
                        burst_len_realtime[9];

//--------------------------------------------------------------------------
// Design: read the data
//--------------------------------------------------------------------------
always @(*) begin
    if (cur_state == M_IDLE) begin
        master_error_remain_addr <= 32'h0000_0000;
        master_hreadyn_wait <= `WAIT_READYOUT; 
        master_hresp_error  <= `RESP_ERROR;
        master_out_data     <= 32'h0000_0000;
    end else begin
        master_error_remain_addr <= error_remain_addr;
        master_hreadyn_wait <= HREADY; 
        master_hresp_error  <= HRESP;
        master_out_data     <= HRDATA;
    end
end

endmodule
//--------------------------------------------------------------------------
