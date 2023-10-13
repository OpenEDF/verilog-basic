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
// Brief: a practical guide for systemverilog asserations example and learning
// Change Log:
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Include File
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Module
//--------------------------------------------------------------------------
module asserations
//--------------------------------------------------------------------------
// Ports
//--------------------------------------------------------------------------
(
    // inputs
    input wire         clk,
    input wire         rst_n,
    input wire         a_in,
    input wire         b_in,

    // outputs
    output reg        c_ou,
    output reg        d_ou,
    output reg        e_ou
);

//--------------------------------------------------------------------------
// Design: assertion basic test
//--------------------------------------------------------------------------
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        c_ou <= 1'b0;
    end else begin
        c_ou <= a_in | b_in;
    end
end

//--------------------------------------------------------------------------
// Design: assertion basic test
//--------------------------------------------------------------------------
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        d_ou <= 1'b0;
    end else begin
        d_ou <= c_ou;
    end
end

//--------------------------------------------------------------------------
// Design: assertion basic test
//--------------------------------------------------------------------------
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        e_ou <= 1'b0;
    end else begin
        e_ou <= ~c_ou;
    end
end

endmodule
//--------------------------------------------------------------------------
