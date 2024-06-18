//--------------------------------------------------------------------------
//                            UVM Lab
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
// Brief: systemverilog define macro
// Change Log:
//--------------------------------------------------------------------------
`ifndef _AHB_TYPE_SV_
`define _AHB_TYPE_SV_

//--------------------------------------------------------------------------
// Include File
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Define data type
//--------------------------------------------------------------------------
//--------------------------------------------------------------------------
// enum: transfer types
//--------------------------------------------------------------------------
typedef enum bit [1:0] {
    IDLE = 2'b00,
    BUSY,
    NONSEQ,
    SEQ
} htrans_e;

//--------------------------------------------------------------------------
// enum: burst signal encoding
//--------------------------------------------------------------------------
typedef enum bit [2:0] {
    SINGLE,
    INCR,
    WRAP4,
    INCR4,
    WRAP8,
    INCR8,
    WRAP16,
    INCR16
} hburst_e;

//--------------------------------------------------------------------------
// enum: transfer size
//--------------------------------------------------------------------------
typedef enum bit [2:0] {
    BYTE,
    HALFWORD,
    WORD,
    DWORD,
    WORD4,
    WORD8,
    WORD16,
    WORD32
} hsize_e;

//--------------------------------------------------------------------------
// enum: read and write opeartion type
//--------------------------------------------------------------------------
typedef enum bit {
    READ,
    WRITE
} hwrite_e;

//--------------------------------------------------------------------------
// enum: response type
//--------------------------------------------------------------------------
typedef enum bit {
    OKAY,
    ERROR
} hresp_e;

//--------------------------------------------------------------------------
// enum: hready type
//--------------------------------------------------------------------------
typedef enum bit {
    WAIT,
    READY
} hready_e;

//--------------------------------------------------------------------------
// enum: hport encoding
//--------------------------------------------------------------------------
typedef enum bit [3:0] {
    OPCODE_FETCH   = 4'bxxx0,
    DATA_ACCESS    = 4'bxxx1,
    USER_ACCESS    = 4'bxx0x,
    PRIVILE_ACCESS = 4'bxx1x,
    NON_BUFFER     = 4'bx0xx,
    BUFFERABLE     = 4'bx1xx,
    NON_CACHE      = 4'b0xxx,
    CACHEABLE      = 4'b1xxx
} hport_e;

`endif /* _AHB_TYPES_SV_ */
//--------------------------------------------------------------------------
