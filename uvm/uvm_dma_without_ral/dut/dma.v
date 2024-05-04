//--------------------------------------------------------------------------
//                            UVM Lab
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
// Brief: dma test design
// Change Log:
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Include File
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Module
//--------------------------------------------------------------------------
module dma #(
    parameter ADDR_WIDTH = 32,
    parameter DATA_WIDTH = 32
) (
//--------------------------------------------------------------------------
// Port
//--------------------------------------------------------------------------
    input  wire                   clk,
    input  wire                   rst_n,
    input  wire [ADDR_WIDTH-1:0]  addr,
    input  wire [DATA_WIDTH-1:0]  wdata,
    input  wire                   wr_en,
    input  wire                   vaild,
    output wire [DATA_WIDTH-1:0]  rdata
);


//--------------------------------------------------------------------------
// Design: internal signal
//--------------------------------------------------------------------------
reg [DATA_WIDTH-1:0] t_data;
reg [DATA_WIDTH-1:0] intr;
reg [DATA_WIDTH-1:0] control;
reg [DATA_WIDTH-1:0] io_address;
reg [DATA_WIDTH-1:0] mem_address;
reg [DATA_WIDTH-1:0] inv_address;
assign rdata = t_data;

//--------------------------------------------------------------------------
// Design: read & write control block
//--------------------------------------------------------------------------
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        intr        <= 32'h0000_0000;
        control     <= 32'h0000_0000;
        io_address  <= 32'h0000_0000;
        mem_address <= 32'h0000_0000;
        inv_address <= 32'h0000_0000;
        t_data      <= 32'h0000_0000;
    end else begin
        if (wr_en & vaild) begin  // write operation
            case (addr)
                32'h0000_0400: intr        <= wdata;
                32'h0000_0404: control     <= wdata;
                32'h0000_0408: io_address  <= wdata;
                32'h0000_040c: mem_address <= wdata;
                default:       inv_address <= wdata;
            endcase
        end else if (!wr_en & vaild) begin // read operation
            case (addr)
                32'h0000_0400: t_data <= intr;
                32'h0000_0404: t_data <= control;
                32'h0000_0408: t_data <= io_address;
                32'h0000_040c: t_data <= mem_address;
                default:       t_data <= 32'h0000_0000;
            endcase
        end
    end
end

endmodule
//--------------------------------------------------------------------------
