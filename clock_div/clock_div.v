//--------------------------------------------------------------------------
//                         RISC-V Core
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
// Brief: clock dividers
// Change Log:
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Include File
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Module
//--------------------------------------------------------------------------
module clock_div #(
    parameter DIVISION = 2
)
//--------------------------------------------------------------------------
// Ports
//--------------------------------------------------------------------------
(
    // inputs
    input wire         sys_clk,
    input wire         rst_n,

    // outputs
    output wire        hclk,
    output wire        pclk,
    output wire        pclk_en

);

//--------------------------------------------------------------------------
// Design: module internel signal
//--------------------------------------------------------------------------
reg [0:7] count;
reg       pclk_r;
reg       pclk_en_r;

//--------------------------------------------------------------------------
// Design: hclk == sys_clk
//--------------------------------------------------------------------------
assign hclk = sys_clk;

//--------------------------------------------------------------------------
// Design: system clock counter
//--------------------------------------------------------------------------
always @(posedge sys_clk or negedge rst_n) begin
    if (!rst_n) begin
        count <= {8{1'b0}};
    end else begin
        if (count == (DIVISION + 1)) begin
            count <= {8{1'b0}};
        end else begin
            count <= count + 8'b1;
        end
    end
end

//--------------------------------------------------------------------------
// Design: pclk generate
//--------------------------------------------------------------------------
always @(posedge sys_clk or negedge rst_n) begin
    if (!rst_n) begin
        pclk_r <= 1'b0;
    end else begin
        if (count < ((DIVISION / 2) + 1)) begin
            pclk_r <= 1'b1;
        end else begin
            pclk_r <= 1'b0;
        end
    end
end

//--------------------------------------------------------------------------
// Design: pclk enable directive
//--------------------------------------------------------------------------
always @(posedge sys_clk or negedge rst_n) begin
    if (!rst_n) begin
        pclk_en_r <= 1'b0;
    end else begin
        if (count == 8'b0) begin
            pclk_en_r <= 1'b1;
        end else begin
            pclk_en_r <= 1'b0;
        end
    end
end

//--------------------------------------------------------------------------
// Design: assignment the output signal
//--------------------------------------------------------------------------
assign pclk_en = pclk_en_r;
assign pclk    = pclk_r;

endmodule
//--------------------------------------------------------------------------
