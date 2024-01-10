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
/* memory map */
`define MEM_MAP_ROM            16'h0050
`define MEM_MAP_DEF_SLAVE      16'h005E

/* sel slave */
`define MUX_SEL_ROM            4'h1
`define MUX_SEL_DEF_SLAVE      4'hE
`define MUX_SEL_NOMAP          4'hF

/* master hsel signal */
`define MEM_MAP_HSEL_ROM       16'b0000_0000_0000_0001
`define MEM_MAP_HSEL_DEF_SLAVE 16'b0100_0000_0000_0000
`define MEM_MAP_HSEL_NO_MAP    16'b1000_0000_0000_0000

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
`define TRANS_IDLE             2'b00
`define TRANS_BUSY             2'b01
`define TRANS_NONSEQ           2'b10
`define TRANS_SEQ              2'b11

/* read and write */
`define MASTER_WIRTE           1'b1
`define MASTER_READ            1'b0

/* hready and resp */
`define READYOUT               1'b1
`define WAIT_READYOUT          1'b0
`define RESP_ERROR             1'b1
`define RESP_OKAY              1'b0

/* slave select */
`define SLAVE_SEL              1'b1
`define SLAVE_FRE              1'b0

/* config define */
`define DEF_ACCRESS_SLAVE_ADDR 32'h005E_0000

//--------------------------------------------------------------------------
