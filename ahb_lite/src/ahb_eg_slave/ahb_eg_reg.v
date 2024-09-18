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
// Brief: ahb-lite example slave register module, provide register write and
//        read operation, data and address vaild at the same clock cycle.
// Change Log:
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Include File
//--------------------------------------------------------------------------
`include "ahb_lite_config.v"
`include "ahb_eg_defines.v"

//--------------------------------------------------------------------------
// Module
//--------------------------------------------------------------------------
module ahb_eg_reg
//--------------------------------------------------------------------------
// Parameters
//--------------------------------------------------------------------------
#(
    parameter ADDR_WIDTH = 32,
    parameter DATA_WIDTH = 32
)
//--------------------------------------------------------------------------
// Ports
//--------------------------------------------------------------------------
(
    // global inputs
    input wire                   hclk,
    input wire                   hresetn,

    // input signals
    input wire [ADDR_WIDTH-1:0]  addr,
    input wire                   read_en,
    input wire                   write_en,
    input wire [3:0]             byte_strobe,
    input wire [DATA_WIDTH-1:0]  wdata,

    // other module update and control the register by input signals
    // TODO: add

    // update and control other module by output signals
    // TODO: add

    // output the interrupt signals

    // output signals
    output wire                 eg_int,
    output reg [DATA_WIDTH-1:0] rdata
);

//--------------------------------------------------------------------------
// Design: module internal signal
//--------------------------------------------------------------------------
wire [`MEM_BLOCK_WIDTH-3:0] csr_offset = addr[`MEM_BLOCK_WIDTH-1:2];
wire [DATA_WIDTH-1:0] ver_rdata;
wire [DATA_WIDTH-1:0] test_1_rdata;
wire [DATA_WIDTH-1:0] test_2_rdata;
wire [DATA_WIDTH-1:0] test_3_rdata;
wire [DATA_WIDTH-1:0] glbl_int;
reg  [31:0]           count;

//--------------------------------------------------------------------------
// Design: module version control reg
//--------------------------------------------------------------------------
reg [7:0] eg_ver;
always @(posedge hclk or negedge hresetn) begin
    if (!hresetn) begin
        eg_ver <= {4'h1, 4'h0};
    end else begin
        if ((addr == `PER_VER) && write_en && byte_strobe[0]) begin
            eg_ver <= wdata[7:0];
        end
    end
end

assign ver_rdata = {{24{1'b0}}, eg_ver};

//--------------------------------------------------------------------------
// Design: module test register
//--------------------------------------------------------------------------
reg [7:0]  test1_1;
reg [7:0]  test1_2;
reg [15:0] test1_3;
always @(posedge hclk or negedge hresetn) begin
    if (!hresetn) begin
         {test1_3, test1_2, test1_1} <= {32{1'b0}};
    end else begin
        if ((csr_offset == `TEST_1) && write_en) begin
            if (byte_strobe[0])
                test1_1 <= wdata[7:0];
            if (byte_strobe[1])
                test1_2 <= wdata[15:8];
            if (byte_strobe[2] & byte_strobe[3])
                test1_3 <= wdata[31:16];
        end
    end
end

assign test_1_rdata = {test1_3, test1_2, test1_1};

//--------------------------------------------------------------------------
// Design: module test reg 2
//--------------------------------------------------------------------------
reg [31:0] test2;
always @(posedge hclk or negedge hresetn) begin
    if (!hresetn) begin
        test2 <= {32{1'b0}};
    end else begin
        if ((csr_offset == `TEST_2) && write_en) begin
            test2 <= wdata;
        end
    end
end

assign test_2_rdata = test2;

//--------------------------------------------------------------------------
// Design: module test reg 3
//--------------------------------------------------------------------------
reg [31:0] test3;
always @(posedge hclk or negedge hresetn) begin
    if (!hresetn) begin
        test3 <= {32{1'b0}};
    end else begin
        if ((csr_offset == `TEST_3) && write_en) begin
            test3 <= wdata;
        end
    end
end

assign test_3_rdata = test3;

//--------------------------------------------------------------------------
// Design: module interrupt clean and status
//--------------------------------------------------------------------------
reg [3:0] int_sts;
reg [3:0] int_mask;
always @(posedge hclk or negedge hresetn) begin
    if (!hresetn) begin
        {int_mask, int_sts} <= {8{1'b0}};
    end else begin
        if ((csr_offset == `EG_INT) && write_en) begin
            int_mask <= wdata[7:4];
            /* RW1C */
            if (wdata[0])
                int_sts[0] <= 1'b0;
            if (wdata[1])
                int_sts[1] <= 1'b0;
            if (wdata[2])
                int_sts[2] <= 1'b0;
            if (wdata[3])
                int_sts[3] <= 1'b0;
        end else begin
            if (count == 32'h0000_000F)
                int_sts[0] <= 1'b1;
            if (count == 32'h0000_00FF)
                int_sts[1] <= 1'b1;
            if (count == 32'h0000_0FFF)
                int_sts[2] <= 1'b1;
            if (count == 32'h0000_FFFF)
                int_sts[3] <= 1'b1;
        end
    end
end

assign glbl_int = {{24{1'b0}}, int_mask, int_sts};
assign eg_int = ( (int_sts[0] & int_mask[0])
                | (int_sts[1] & int_mask[1])
                | (int_sts[2] & int_mask[2])
                | (int_sts[3] & int_mask[3]));

//--------------------------------------------------------------------------
// Design: module read data
//--------------------------------------------------------------------------
always @(*) begin
    rdata = {DATA_WIDTH{1'b0}};
    if (read_en) begin
        case(csr_offset)
            `PER_VER: rdata = ver_rdata;
            `TEST_1:  rdata = test_1_rdata;
            `TEST_2:  rdata = test_2_rdata;
            `TEST_3:  rdata = test_3_rdata;
            `EG_INT:  rdata = glbl_int;
            default:  rdata = {DATA_WIDTH{1'bx}};
        endcase
    end
end

//--------------------------------------------------------------------------
// Design: interrupt test logic
//--------------------------------------------------------------------------
always @(posedge hclk or negedge hresetn) begin
    if (!hresetn) begin
        count <= {32{1'b0}};
    end else begin
        count = count + 1;
    end
end

endmodule
//--------------------------------------------------------------------------
