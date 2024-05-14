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
// Brief: ahb lite rom, only support read
// Change Log:
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Include File
//--------------------------------------------------------------------------
`include "ahb_lite_config.v"

//--------------------------------------------------------------------------
// Module
//--------------------------------------------------------------------------
module ahb_lite_rom
//--------------------------------------------------------------------------
// Parameters
//--------------------------------------------------------------------------
#(
    parameter ROM_WIDTH    = 8,
    parameter ROM_DEPTH    = 4096,
    parameter ROM_FILENAME = ""       // rom init filename
)
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

//--------------------------------------------------------------------------
// Design: data phase output data
//--------------------------------------------------------------------------
reg        data_phase_hreadyout;
reg        data_phase_hresp;
reg [31:0] data_phase_hdata;

//--------------------------------------------------------------------------
// Design: rom model, TODO: use vivado rom ip for fpga test
//--------------------------------------------------------------------------
`ifdef SYN_FOR_FPGA
    $display("[TODO]: !!! ADD FPGA ROM IP !!!");
`else
    reg [ROM_WIDTH-1:0] rom_model[0:ROM_SIZE-1];
    /* external init */
`endif

//--------------------------------------------------------------------------
// Design: initialise memory
//--------------------------------------------------------------------------
`ifndef SYN_FOR_FPGA
integer index;
initial begin
    for (index = 0; index <= ROM_DEPTH - 1; index = index + 1)
        rom_model[index] = 8'h00;

    if (ROM_FILENAME != "") begin
        $readmemh(ROM_FILENAME, rom_model);
end
`endif

//--------------------------------------------------------------------------
// Design: read phase control logic
//--------------------------------------------------------------------------
wire        data_phase_read;
wire        data_phase_rd_wr_comm;
wire        rd_word_vaild;
wire [15:0] addr_vaild_feild;
assign data_phase_rd_wr_comm = addr_phase_hsel & addr_phase_htrans[1] & addr_phase_hready;
assign data_phase_read       = data_phase_rd_wr_comm & (~addr_phase_hwrite);

/* only support word */
assign rd_word_vaild  = addr_phase_hsize[1] & (~addr_phase_addr[0]) & (~addr_phase_addr[1]);
assign addr_vaild_feild = addr_phase_addr[15:0];

//--------------------------------------------------------------------------
// Design: address phase samplig
//--------------------------------------------------------------------------
always @(posedge HCLK or negedge HRESETn) begin
    if (!HRESETn) begin
        addr_phase_addr      <= 32'h0000_0000;
        addr_phase_hsel      <= `SLAVE_FRE;
        addr_phase_htrans    <= `TRN_IDLE;
        addr_phase_hwrite    <= `READ;
        addr_phase_hsize     <= `BYTE;
        addr_phase_hburst    <= `BURST_SINGLE;
        addr_phase_hport     <= 4'b0000;
        addr_phase_hmastlock <= 1'b0;
        addr_phase_hready    <= `READY;
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
// Design: write rom operation
//--------------------------------------------------------------------------
always @(posedge HCLK or negedge HRESETn) begin
    if (!HRESETn) begin
        data_phase_hreadyout <= `WAIT;
        data_phase_hresp     <= `ERROR;
        data_phase_hdata     <= 32'h0000_0000;
    end else begin
        if (data_phase_read) begin
            data_phase_hdata[7:0]   <= rom_model[addr_vaild_feild];
            data_phase_hdata[15:8]  <= rom_model[addr_vaild_feild+1];
            data_phase_hdata[23:16] <= rom_model[addr_vaild_feild+2];
            data_phase_hdata[31:24] <= rom_model[addr_vaild_feild+3];
            data_phase_hreadyout    <= `READY;
            data_phase_hresp        <= `OKAY;
        end else begin
            data_phase_hdata[7:0]   <= 8'h00;
            data_phase_hdata[15:8]  <= 8'h00;
            data_phase_hdata[23:16] <= 8'h00;
            data_phase_hdata[31:24] <= 8'h00;
            data_phase_hreadyout    <= `WAIT;
            data_phase_hresp        <= `ERROR;
        end
    end
end

//--------------------------------------------------------------------------
// Design: assign hready and hresp
//--------------------------------------------------------------------------
assign HREADYOUT = (addr_phase_htrans == `TR_IDLE) ? `READY : data_phase_hreadyout;
assign HRESP     = (addr_phase_htrans == `TR_IDLE) ? `OKAY : data_phase_hresp;
assign HRDATA    = (addr_phase_htrans == `TR_IDLE) ? 32'h0000_0000 : data_phase_hdata;

endmodule
//--------------------------------------------------------------------------
