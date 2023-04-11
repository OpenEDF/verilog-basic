//--------------------------------------------------------------------------
//                        Asyn FIFO Design
//                            V1.0.1
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
// Designer: Macro
// Brief: FIFO Memory
// Change Log:
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Include File
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Module
//--------------------------------------------------------------------------
module fifo_mem
//--------------------------------------------------------------------------
// Params
//--------------------------------------------------------------------------
#(
    parameter DATASIZE = 8,
    parameter ADDRSIZE = 4
)
//--------------------------------------------------------------------------
// Ports
//--------------------------------------------------------------------------
(
    // Inputs
    input                  wclk,
    input                  wclk_en,
    input                  wfull,
    input   [DATASIZE-1:0] wdata,
    input   [ADDRSIZE-1:0] waddr,
    input   [ADDRSIZE-1:0] raddr,

    // Outputs
    output  [DATASIZE-1:0] rdata
);

//RTL verilog memory model
localparam DEPTH = 1<<ADDRSIZE; //other operation: $clog2(ADDRSIZE)
reg [DATASIZE-1:0] mem [0:DEPTH-1];

// memory read
assign rdata = mem[raddr];

// memory write
always @(posedge wclk) begin
    if (wclk_en && !wfull) begin
        mem[waddr] <= wdata;
    end
end

endmodule
//--------------------------------------------------------------------------
