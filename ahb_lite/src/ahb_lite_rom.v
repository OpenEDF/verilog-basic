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
// Brief: ahb lite ram, only support read
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
    parameter ROM_WIDTH    = 32,
    parameter ROM_DEPTH    = 4096,
    parameter ROM_FILENAME = ""       // mem init filename
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
// Design: internal logic, address phase sampling register
//--------------------------------------------------------------------------
reg [31:0] a_phase_addr;
reg        a_phase_hsel;
reg [1:0]  a_phase_htrans;
reg        a_phase_hwrite;
reg [2:0]  a_phase_hsize;
reg [2:0]  a_phase_hburst;
reg [3:0]  a_phase_hport;
reg        a_phase_hmastlock;
reg        a_phase_hready;

//--------------------------------------------------------------------------
// Design: internal logic, data phase output data
//--------------------------------------------------------------------------
reg        d_phase_hreadyout;
reg        d_phase_hresp;
reg [31:0] d_phase_hdata;

//--------------------------------------------------------------------------
// Design: rom model, TODO: use vivado rom ip for fpga test
//--------------------------------------------------------------------------
`ifdef SYN_FOR_FPGA
    $display("[TODO]: !!! ADD FPGA ROM IP !!!");
`else
    reg [ROM_WIDTH-1:0] mem_model[0:ROM_DEPTH-1];
    /* external init */
`endif

// synopsys translate_off
//--------------------------------------------------------------------------
// Design: initialise memory
//--------------------------------------------------------------------------
`ifndef SYN_FOR_FPGA
integer index;
initial begin
    for (index = 0; index <= ROM_DEPTH - 1; index = index + 1)
        mem_model[index] = 32'h0000_0000;

    if (ROM_FILENAME != "") begin
        $readmemh(ROM_FILENAME, mem_model);
    end
end
`endif

// synopsys translate_on

//--------------------------------------------------------------------------
// Design: read and write control logic
//--------------------------------------------------------------------------
wire        ahb_access      = a_phase_htrans[1] & a_phase_hsel & a_phase_hready;
wire        ahb_read        = ahb_access & (~a_phase_hwrite);
wire [29:0] word_valid_addr = a_phase_addr[31:2];

// ----------------------------------------------------------
// Byte lane decoder and next state logic
// ----------------------------------------------------------
wire tx_byte    = (~a_phase_htrans[1]) & (~a_phase_htrans[0]);
wire tx_half    = (~a_phase_htrans[1]) &   a_phase_htrans[0];
wire tx_word    =   a_phase_htrans[1];

wire byte_at_00 = tx_byte & (~a_phase_addr[1]) & (~a_phase_addr[0]);
wire byte_at_01 = tx_byte & (~a_phase_addr[1]) &   a_phase_addr[0];
wire byte_at_10 = tx_byte &   a_phase_addr[1]  & (~a_phase_addr[0]);
wire byte_at_11 = tx_byte &   a_phase_addr[1]  &   a_phase_addr[0];

wire half_at_00 = tx_half & (~a_phase_addr[1]);
wire half_at_10 = tx_half &   a_phase_addr[1];

wire word_at_00 = tx_word;

wire byte_sel_0 = word_at_00 | half_at_00 | byte_at_00;
wire byte_sel_1 = word_at_00 | half_at_00 | byte_at_01;
wire byte_sel_2 = word_at_00 | half_at_10 | byte_at_10;
wire byte_sel_3 = word_at_00 | half_at_10 | byte_at_11;

wire [3:0] mem_width_re = { byte_sel_3 & ahb_read,
                            byte_sel_2 & ahb_read,
                            byte_sel_1 & ahb_read,
                            byte_sel_0 & ahb_read };

//--------------------------------------------------------------------------
// Design: address phase samplig
//--------------------------------------------------------------------------
always @(posedge HCLK or negedge HRESETn) begin
    if (!HRESETn) begin
        a_phase_addr      <= 32'h0000_0000;
        a_phase_hsel      <= `S_FRE;
        a_phase_htrans    <= `TRN_IDLE;
        a_phase_hwrite    <= `M_READ;
        a_phase_hsize     <= `SIZE_BYTE;
        a_phase_hburst    <= `BURST_SINGLE;
        a_phase_hport     <= 4'b0000;
        a_phase_hmastlock <= 1'b0;
        a_phase_hready    <= `READY;
    end else begin
        a_phase_addr      <= HADDR;
        a_phase_hsel      <= HSEL;
        a_phase_htrans    <= HTRANS;
        a_phase_hwrite    <= HWRITE;
        a_phase_hsize     <= HSIZE;
        a_phase_hburst    <= HBURST;
        a_phase_hport     <= HPROT;
        a_phase_hmastlock <= HMASTLOCK;
        a_phase_hready    <= HREADY;
    end
end

//--------------------------------------------------------------------------
// Design: read memory operation
//--------------------------------------------------------------------------
assign HRDATA = { mem_width_re[3] ? 8'h00 : mem_model[a_phase_addr][31:24],
                  mem_width_re[2] ? 8'h00 : mem_model[a_phase_addr][23:16],
                  mem_width_re[1] ? 8'h00 : mem_model[a_phase_addr][15:8],
                  mem_width_re[0] ? 8'h00 : mem_model[a_phase_addr][7:0] };

//--------------------------------------------------------------------------
// Design: assign hready and hresp
//--------------------------------------------------------------------------
assign HREADYOUT = `READY;
assign HRESP     = `OKAY;

endmodule
//--------------------------------------------------------------------------
