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
// Brief: ahb to apb bridge
// Change Log:
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Include File
//--------------------------------------------------------------------------
`include "ahb_lite_config.v"

//--------------------------------------------------------------------------
// Module
//--------------------------------------------------------------------------
module ahb2apb_bridge

//--------------------------------------------------------------------------
// Ports
//--------------------------------------------------------------------------
(
    // global inputs
    input wire [31:0]  HCLK,
    input wire         HRESETn,

    // ahb input bus 
    input wire         HSEL,
    input wire [31:0]  HADDR,
    input wire         HWRITE,
    input wire [2:0]   HSIZE,
    input wire [2:0]   HBURST,
    input wire [3:0]   HPROT,
    input wire [1:0]   HTRANS,
    input wire         HMASTLOCK,
    input wire         HREADY,
    input wire [31:0]  HWDATA,

    // apb output bus 
    output wire        PCLK,
    output wire        PRESETn,

    output wire [31:0] PADDR,

    // apb select signal
    output wire        PSEL,
    output wire        PSEL_S0,
    output wire        PSEL_S1,
    output wire        PSEL_S2,
    output wire        PSEL_DEF,

    output wire        PENABLE,
    output wire        PWRITE,
    output wire [31:0] PWDATA,

    // apb input
    input wire         PREADY,
    input wire [31:0]  PRDATA,
    input wire         PSLVERR

    // ahb output
    output wire [31:0] HRDATA,
    output wire        HREADYOUT,
    output wire        HRESP
);

//--------------------------------------------------------------------------
// Design: module internal control signal
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Design: output the slave select signal
//--------------------------------------------------------------------------

endmodule
//--------------------------------------------------------------------------
