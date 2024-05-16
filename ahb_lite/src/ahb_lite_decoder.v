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
    output wire        HSEL_S0,
    output wire        HSEL_S1,
    output wire        HSEL_S2,
    output wire        HSEL_S3,
    output wire        HSEL_DEF,

    // outputs to multiplexor
    output reg [3:0]   HSEL_MUX
);

//--------------------------------------------------------------------------
// Design: module internal control signal
//--------------------------------------------------------------------------
wire    [`MAX_SLAVE_NUM:0]  slave_sel_coding;

//--------------------------------------------------------------------------
// Design: output the slave select signal
//--------------------------------------------------------------------------
`define ASSIGN_HSEL_CODING(INDEX, ARG1, ARG2) \
    assign slave_sel_coding[INDEX] = ((HADDR >= ARG1) && (HADDR <= ARG2));

`ASSIGN_HSEL_CODING(0, `MEM_MAP_S0_BASE, `MEM_MAP_S0_END)
`ASSIGN_HSEL_CODING(1, `MEM_MAP_S1_BASE, `MEM_MAP_S1_END)
`ASSIGN_HSEL_CODING(2, `MEM_MAP_S2_BASE, `MEM_MAP_S2_END)
`ASSIGN_HSEL_CODING(3, `MEM_MAP_S3_BASE, `MEM_MAP_S3_END)

assign slave_sel_coding[`MAX_SLAVE_NUM] = ~(slave_sel_coding[0] ||
                                slave_sel_coding[1] ||
                                slave_sel_coding[2] ||
                                slave_sel_coding[3]);

//--------------------------------------------------------------------------
// Design: slave select signal, memory map to slave
//--------------------------------------------------------------------------
`define ASSIGN_PER_SEL(ARG) \
    assign HSEL_S``ARG = slave_sel_coding[``ARG];

`ASSIGN_PER_SEL(0);
`ASSIGN_PER_SEL(1);
`ASSIGN_PER_SEL(2);
`ASSIGN_PER_SEL(3);

assign HSEL_DEF           = slave_sel_coding[`MAX_SLAVE_NUM];

//--------------------------------------------------------------------------
// Design: output the salve response select signal
//--------------------------------------------------------------------------
always @(slave_sel_coding) begin
    case(slave_sel_coding)
        `MEM_MAP_HSEL_S0:
            HSEL_MUX <= `MUX_SEL_S0;
        `MEM_MAP_HSEL_S1:
            HSEL_MUX <= `MUX_SEL_S1;
        `MEM_MAP_HSEL_S2:
            HSEL_MUX <= `MUX_SEL_S2;
        `MEM_MAP_HSEL_S3:
            HSEL_MUX <= `MUX_SEL_S3;
        `MEM_MAP_HSEL_DEF:
            HSEL_MUX <= `MUX_SEL_NOMAP;
        default:
            HSEL_MUX <= `MUX_SEL_NOMAP;
    endcase
end

endmodule
//--------------------------------------------------------------------------
