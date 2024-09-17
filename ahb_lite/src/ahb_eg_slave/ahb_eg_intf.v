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
// Brief: AHB-lite example slave interface module. Transfer AHB-Lite BUS
//        protocol to simple register read write protocol
// Change Log:
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Include File
//--------------------------------------------------------------------------
`include "ahb_lite_config.v"

//--------------------------------------------------------------------------
// Module
//--------------------------------------------------------------------------
module ahb_eg_intf
//--------------------------------------------------------------------------
// Parameters
//--------------------------------------------------------------------------
#(
    parameter ADDR_WIDTH = 32,
              DATA_WIDTH = 32
)
//--------------------------------------------------------------------------
// Ports
//--------------------------------------------------------------------------
(
    // global inputs
    input wire                    hclk,
    input wire                    hresetn,

    input wire                    hsel,
    input wire [ADDR_WIDTH-1:0]   haddr,
    input wire                    hwrite,
    input wire [2:0]              hsize,
    input wire [2:0]              hburst,
    input wire [3:0]              hprot,
    input wire [1:0]              htrans,
    input wire                    hmastlock,
    input wire                    hready,
    input wire [DATA_WIDTH-1:0]   hwdata,

    // outputs
    output wire [DATA_WIDTH-1:0]  hrdata,
    output wire                   hreadyout,
    output wire                   hresp,

    // Register interface
    output wire [ADDR_WIDTH-1:0]  addr,
    output wire                   read_en,
    output wire                   write_en,
    output wire [3:0]             byte_strobe,
    output wire [DATA_WIDTH-1:0]  wdata,
    input  wire [DATA_WIDTH-1:0]  rdata
);

//--------------------------------------------------------------------------
// Design: internal wires declarations
//--------------------------------------------------------------------------
wire trans_req= hready & hsel & htrans[1]; // only SEQ and NONSEQ transfer
wire ahb_read_req  = trans_req & (~hwrite);
wire ahb_write_req = trans_req & hwrite;
wire update_read_req;                      // To update the read enable register
wire update_write_req;                     // To update the write enable register

reg  [ADDR_WIDTH-1:0] addr_reg;     // address signal, registered
reg                   read_en_reg;  // read enable signal, registered
reg                   write_en_reg; // write enable signal, registered

reg [3:0] byte_strobe_reg; // registered output for byte strobe
reg [3:0] byte_strobe_nxt; // next state for byte_strobe_reg

//--------------------------------------------------------------------------
// Design: address phase sampling address signal
//--------------------------------------------------------------------------
always @(posedge hclk or negedge hresetn) begin
    if (~hresetn) begin
        addr_reg <= {ADDR_WIDTH{1'b0}};
    end else begin
        addr_reg <= haddr;
    end
end

//--------------------------------------------------------------------------
// Design: address phase sampling read control signal
//--------------------------------------------------------------------------
always @(posedge hclk or negedge hresetn) begin
    if (~hresetn) begin
        read_en_reg <= 1'b0;
    end else begin
        read_en_reg <= ahb_read_req;
    end
end

//--------------------------------------------------------------------------
// Design: address phase sampling write control signal
//--------------------------------------------------------------------------
always @(posedge hclk or negedge hresetn) begin
    if (~hresetn) begin
        write_en_reg <= 1'b0;
    end else begin
        write_en_reg <= ahb_write_req;
    end
end

//--------------------------------------------------------------------------
// Design: byte strobe signal
//--------------------------------------------------------------------------
always @(hsize or haddr) begin
    if (hsize == 3'b000) begin         // byte
        case(haddr[1:0])
            2'b00:   byte_strobe_nxt = 4'b0001;
            2'b01:   byte_strobe_nxt = 4'b0010;
            2'b10:   byte_strobe_nxt = 4'b0100;
            2'b11:   byte_strobe_nxt = 4'b1000;
            default: byte_strobe_nxt = 4'bxxxx;
        endcase
    end else if (hsize == 3'b001) begin //half word
        if(haddr[1]==1'b1) begin
            byte_strobe_nxt = 4'b1100;
        end else begin
            byte_strobe_nxt = 4'b0011;
        end
    end else begin                      // default 32 bits, word
        byte_strobe_nxt     = 4'b1111;
    end
end

//--------------------------------------------------------------------------
// Design: address phase sampiling byte store signal
//--------------------------------------------------------------------------
always @(posedge hclk or negedge hresetn) begin
    if (~hresetn) begin
        byte_strobe_reg <= 4'b0000;
    end else if (ahb_read_req | ahb_write_req) begin
        byte_strobe_reg <= byte_strobe_nxt;
    end else begin
        byte_strobe_reg <= 4'b0000;
    end
end

//--------------------------------------------------------------------------
// Design: data phase output data and address
//--------------------------------------------------------------------------
assign addr        = addr_reg;
assign read_en     = read_en_reg;
assign write_en    = write_en_reg;
assign byte_strobe = byte_strobe_reg;
assign wdata       = hwdata;

assign hrdata      = rdata;
assign hreadyout   = `READY;
assign hresp       = `OKAY;

endmodule
//--------------------------------------------------------------------------
