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
// Brief: ahb lite config macro
// Change Log:
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Include File
//--------------------------------------------------------------------------
`define MAX_SLAVE_NUM         4

/* memory map 4K map size defalut */
`define MEM_BLOCK_WIDTH        12
`define MEM_MAP_S0_BASE        32'h0004_0000
`define MEM_MAP_S0_END         32'h0004_0FFF
`define MEM_MAP_S1_BASE        32'h0004_1000
`define MEM_MAP_S1_END         32'h0004_1FFF
`define MEM_MAP_S2_BASE        32'h0004_2000
`define MEM_MAP_S2_END         32'h0004_2FFF
`define MEM_MAP_S3_BASE        32'h0004_3000
`define MEM_MAP_S3_END         32'h0004_3FFF
`define MEM_MAP_S4_BASE        32'h0004_4000
`define MEM_MAP_S4_END         32'h0004_4FFF
`define MEM_MAP_S5_BASE        32'h0004_5000
`define MEM_MAP_S5_END         32'h0004_5FFF
`define MEM_MAP_S6_BASE        32'h0004_6000
`define MEM_MAP_S6_END         32'h0004_6FFF
`define MEM_MAP_S7_BASE        32'h0004_7000
`define MEM_MAP_S7_END         32'h0004_7FFF
`define MEM_MAP_S8_BASE        32'h0004_8000
`define MEM_MAP_S8_END         32'h0004_8FFF
`define MEM_MAP_S9_BASE        32'h0004_9000
`define MEM_MAP_S9_END         32'h0004_9FFF
`define MEM_MAP_S10_BASE       32'h0004_A000
`define MEM_MAP_S10_END        32'h0004_AFFF
`define MEM_MAP_S11_BASE       32'h0004_B000
`define MEM_MAP_S12_END        32'h0004_BFFF
`define MEM_MAP_S13_BASE       32'h0004_C000
`define MEM_MAP_S14_END        32'h0004_CFFF
`define MEM_MAP_S14_BASE       32'h0004_D000
`define MEM_MAP_S16_END        32'h0004_DFFF
`define MEM_MAP_S17_BASE       32'h0004_E000
`define MEM_MAP_S18_END        32'h0004_EFFF

/* sel slave */
`define MUX_SEL_S0             4'h1
`define MUX_SEL_S1             4'h2
`define MUX_SEL_S2             4'h3
`define MUX_SEL_S3             4'h4
`define MUX_SEL_S4             4'h5
`define MUX_SEL_S5             4'h6
`define MUX_SEL_S6             4'h7
`define MUX_SEL_S7             4'h8
`define MUX_SEL_S8             4'h9
`define MUX_SEL_S9             4'hA
`define MUX_SEL_S10            4'hB
`define MUX_SEL_S11            4'hC
`define MUX_SEL_S12            4'hD
`define MUX_SEL_S13            4'hE
`define MUX_SEL_S14            4'hF
`define MUX_SEL_NOMAP          4'h0

/* master hsel signal */
`define MEM_MAP_HSEL_S0        16'b0000_0000_0000_0001
`define MEM_MAP_HSEL_S1        16'b0000_0000_0000_0010
`define MEM_MAP_HSEL_S2        16'b0000_0000_0000_0100
`define MEM_MAP_HSEL_S3        16'b0000_0000_0000_1000
`define MEM_MAP_HSEL_S4        16'b0000_0000_0001_0000
`define MEM_MAP_HSEL_S5        16'b0000_0000_0010_0000
`define MEM_MAP_HSEL_S6        16'b0000_0000_0100_0000
`define MEM_MAP_HSEL_S7        16'b0000_0000_1000_0000
`define MEM_MAP_HSEL_S8        16'b0000_0001_0000_0000
`define MEM_MAP_HSEL_S9        16'b0000_0010_0000_0000
`define MEM_MAP_HSEL_S10       16'b0000_0100_0000_0000
`define MEM_MAP_HSEL_S11       16'b0000_1000_0000_0000
`define MEM_MAP_HSEL_S12       16'b0001_0000_0000_0000
`define MEM_MAP_HSEL_S13       16'b0010_0000_0000_0000
`define MEM_MAP_HSEL_S14       16'b0100_0000_0000_0000
`define MEM_MAP_HSEL_DEF       16'b1000_0000_0000_0000

/* brust operation type */
`define BURST_SINGLE           3'b000
`define BURST_INCR             3'b001
`define BURST_WRAP4            3'b010
`define BURST_INCR4            3'b011
`define BURST_WRAP8            3'b100
`define BURST_INCR8            3'b101
`define BURST_WRAP16           3'b110
`define BURST_INCR16           3'b111

/* transfer size */
`define SIZE_BYTE              3'b000
`define SIZE_HALFWORD          3'b001
`define SIZE_WORD              3'b010
`define SIZE_DOUBLEWORD        3'b011
`define SIZE_4_WORD_LINE       3'b100
`define SIZE_8_WORD_LINE       3'b101
`define SIZE_512_LINE          3'b110
`define SIZE_1024_LINE         3'b111

/* transfer type */
`define TRN_IDLE               2'b00
`define TRN_BUSY               2'b01
`define TRN_NONSEQ             2'b10
`define TRN_SEQ                2'b11

/* read and write */
`define M_WIRTE               1'b1
`define M_READ                1'b0

/* hready and resp */
`define READY                 1'b1
`define WAIT                  1'b0
`define ERROR                 1'b1
`define OKAY                  1'b0

/* slave select */
`define S_SEL                 1'b1
`define S_FRE                 1'b0

/* common */
`define ALL_32BIT_ZERO         32'h0000_0000
`define ALL_32BIT_ONE          32'hFFFF_FFFF
`define SET_BIT0_32WIDTH       32'h0000_0001
`define CLR_BIT0_32WIDTH       32'hFFFF_FFF0

//--------------------------------------------------------------------------
