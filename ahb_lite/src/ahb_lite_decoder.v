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
// Brief: ahb lite decoder
// Change Log:
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Include File
//--------------------------------------------------------------------------
`include "ahb_lite_config.v"

//--------------------------------------------------------------------------
// Module
//--------------------------------------------------------------------------
module ahb_lite_decoder
//--------------------------------------------------------------------------
// Ports
//--------------------------------------------------------------------------
(
    // global inputs
    input wire [31:0]  HADDR,

    // outputs to slave
    output wire        HSEL_ROM,
    output wire        HSEL_DEF_SLAVE,
    output wire        HSEL_NOMAP,

    // outputs to multiplexor
    output reg [3:0]   HSEL_MUX
);

//--------------------------------------------------------------------------
// Design: module internal control signal
//--------------------------------------------------------------------------
reg [15:0] slave_set_coding;
assign HSEL_ROM           = slave_set_coding[0];   // 0x0050_0000 --> 0x0050FFFF: 64K ROM
assign HSEL_DEF_SLAVE     = slave_set_coding[14];  // 0x005E_0000 --> 0x005EFFFF: 64K default memory
assign HSEL_NOMAP         = slave_set_coding[15];
wire [15:0] slave_mem_map;
assign slave_mem_map = HADDR[31:16];

//--------------------------------------------------------------------------
// Design: output the slave select signal
//--------------------------------------------------------------------------
always @(*) begin
    slave_set_coding <= 16'h0000;
    HSEL_MUX         <= 4'h0;
    case (slave_mem_map)
        `MEM_MAP_ROM: begin
            slave_set_coding <= `MEM_MAP_HSEL_ROM;
            HSEL_MUX         <= `MUX_SEL_ROM;
        end
        `MEM_MAP_DEF_SLAVE: begin
            slave_set_coding <= `MEM_MAP_HSEL_DEF_SLAVE;
            HSEL_MUX         <= `MUX_SEL_DEF_SLAVE;
        end
        default: begin   //TODO: assert the exception
            slave_set_coding <= `MEM_MAP_HSEL_NO_MAP;
            HSEL_MUX         <= `MUX_SEL_NOMAP;
        end
    endcase
end

endmodule
//--------------------------------------------------------------------------
