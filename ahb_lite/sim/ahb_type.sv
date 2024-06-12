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
`ifdef  _AHB_TYPES_SV_
`define _AHB_TYPES_SV_

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
// enum: operation types 
//--------------------------------------------------------------------------
typedef enum bit {
    READ, 
    WRITE
} rw_e;

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

`endif _AHB_TYPES_SV_ 
//--------------------------------------------------------------------------
