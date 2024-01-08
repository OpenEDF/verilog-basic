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
    output reg         HREDAYOUT,
    output reg         HRESP
);

//--------------------------------------------------------------------------
// Design: address phase sampling register
//--------------------------------------------------------------------------
reg [31:0] addr_phase_addr;
reg        addr_phase_hsel;
reg [1:0]  addr_phase_htrans;
reg        addr_phase_hwrite;

reg [31:0] def_test_reg0;
reg [31:0] def_test_reg1;
reg [31:0] def_test_reg2;
reg [31:0] def_test_reg3;

parameter REG0_OFFSET = 16'h0000;
parameter REG1_OFFSET = 16'h0004;
parameter REG2_OFFSET = 16'h0008;
parameter REG3_OFFSET = 16'h000C;
//--------------------------------------------------------------------------
// Design: address phase samplig
//--------------------------------------------------------------------------
always @(posedge HCLK or negedge HRESETn) begin
    if (!HRESETn) begin
        addr_phase_addr    <= 32'h005E_0000;
        addr_phase_hsel    <= 1'b0;
        addr_phase_htrans  <= 2'b00;
        addr_phase_hwrite  <= 1'b0;
    end
    else begin
        addr_phase_addr    <= HADDR;
        addr_phase_hsel    <= HSEL;
        addr_phase_htrans  <= HTRANS;
        addr_phase_hwrite  <= HWRITE;
    end
end

//--------------------------------------------------------------------------
// Design: write and read register operation
//--------------------------------------------------------------------------
always @(posedge HCLK or negedge HRESETn) begin
    if (!HRESETn) begin
        def_test_reg0 <= 32'h0000_0000;
        def_test_reg1 <= 32'h0000_0000;
        def_test_reg2 <= 32'h0000_0000;
        def_test_reg3 <= 32'h0000_0000;
        HRDATA        <= 32'h0000_0000;
        HREDAYOUT     <= 1'b0;       // READY
        HRESP         <= 1'b1;       // OKAY
    end
    else begin
        if (addr_phase_hsel) begin
            if (addr_phase_hwrite) begin
                HREDAYOUT <= 1'b1;       // READY
                HRESP     <= 1'b0;       // OKAY
                case(addr_phase_addr[15:0])
                    REG0_OFFSET: begin
                        def_test_reg0 <= HWDATA;
                    end
                    REG1_OFFSET: begin
                        def_test_reg1 <= HWDATA;
                    end
                    REG2_OFFSET: begin
                        def_test_reg2 <= HWDATA;
                    end
                    REG3_OFFSET: begin
                        def_test_reg3 <= HWDATA;
                    end
                    default: begin
                        HREDAYOUT <= 1'b0;       // READY
                        HRESP     <= 1'b1;       // OKAY
                    end
                endcase
            end
            else begin
                HREDAYOUT <= 1'b1;       // READY
                HRESP     <= 1'b0;       // OKAY
                case(addr_phase_addr[15:0])
                    REG0_OFFSET: begin
                        HRDATA <= def_test_reg0;
                    end
                    REG1_OFFSET: begin
                        HRDATA <= def_test_reg1;
                    end
                    REG2_OFFSET: begin
                        HRDATA <= def_test_reg2;
                    end
                    REG3_OFFSET: begin
                        HRDATA <= def_test_reg3;
                    end
                    default: begin
                        HRDATA <= 32'hFFFF_FFFF;
                        HREDAYOUT <= 1'b0;       // READY
                        HRESP     <= 1'b1;       // OKAY
                    end
                endcase
            end
        end
        else begin
            HREDAYOUT <= 1'b0;       // READY
            HRESP     <= 1'b1;       // OKAY
            HRDATA <= 32'h0000_0000;
        end
    end
end

endmodule
//----------    ----------------------------------------------------------------
