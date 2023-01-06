//--------------------------------------------------------------------------
//                         RISC-V Core
//                            V1.0.1
//                         openedf.com
//                     Copyright 2020-2021
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
// Designer: Macro
// Brief: RAM Memory
// Change Log:
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Include File
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Module
//--------------------------------------------------------------------------
module mem_ram
//--------------------------------------------------------------------------
// Params
//--------------------------------------------------------------------------
#(
    parameter MEMWIDTH = 12
)
//--------------------------------------------------------------------------
// Ports
//--------------------------------------------------------------------------
(
    // Inputs
    input wire clk,
    input wire [31:0] addr_in,
    input wire [31:0] data_in,
    input wire cs,
    input wire we,

    // Outputs
    output wire [31:0] data_o
);

reg [31:0] rdata;
reg [31:0] mem[0:(2**(MEMWIDTH-2)-1)];

// write mem
always @(posedge clk) begin : mem_write
    if (cs & we) begin
        mem[addr_in] <= data_in;
    end
end

// read mem
always @(posedge clk) begin : mem_read
    if (cs & !we) begin
        rdata <= mem[addr_in[MEMWIDTH:2]];
    end
end

assign data_o = rdata;

endmodule
//--------------------------------------------------------------------------
