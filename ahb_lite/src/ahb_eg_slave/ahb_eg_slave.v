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
// Brief: ahb lite ram, only support read
// Change Log:
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Include File
//--------------------------------------------------------------------------
`include "ahb_lite_config.v"

//--------------------------------------------------------------------------
// Module
//--------------------------------------------------------------------------
module ahb_eg_slave
//--------------------------------------------------------------------------
// Parameters
//--------------------------------------------------------------------------
#(
    ADDR_WIDTH = 32,
    DATA_WIDTH = 32
)
//--------------------------------------------------------------------------
// Ports
//--------------------------------------------------------------------------
(
    // global inputs
    input wire                   HCLK,
    input wire                   HRESETn,

    input wire                   HSEL,
    input wire [ADDR_WIDTH-1:0]  HADDR,
    input wire                   HWRITE,
    input wire [2:0]             HSIZE,
    input wire [2:0]             HBURST,
    input wire [3:0]             HPROT,
    input wire [1:0]             HTRANS,
    input wire                   HMASTLOCK,
    input wire                   HREADY,
    input wire [DATA_WIDTH-1:0]  HWDATA,

    // outputs
    output wire [DATA_WIDTH-1:0] HRDATA,
    output wire                  HREADYOUT,
    output wire                  HRESP
);

//--------------------------------------------------------------------------
// Design:register module interface signals
//--------------------------------------------------------------------------
wire  [ADDR_WIDTH-1:0]         reg_addr;
wire                           reg_read_en;
wire                           reg_write_en;
wire  [3:0]                    reg_byte_strobe;
wire  [DATA_WIDTH-1:0]         reg_wdata;
wire  [DATA_WIDTH-1:0]         reg_rdata;

//--------------------------------------------------------------------------
// Design: interface block to convert AHB transfers to simple read/write
//         controls.
//--------------------------------------------------------------------------
ahb_eg_intf # (
    /*autoinstparam*/
        .ADDR_WIDTH             (32                             ),
        .DATA_WIDTH             (32                             )
    )
    ahb_eg_intf_u (
    /*autoinst*/
        // global inputs
        .hclk                   (HCLK                           ), //input
        .hresetn                (HRESETN                        ), //input
        .hsel                   (HSEL                           ), //input
        .haddr                  (HADDR                          ), //input
        .hwrite                 (HWRITE                         ), //input
        .hsize                  (HSIZE                          ), //input
        .hburst                 (HBURST                         ), //input
        .hprot                  (HPROT                          ), //input
        .htrans                 (HTRANS                         ), //input
        .hmastlock              (HMASTLOCK                      ), //input
        .hready                 (HREADY                         ), //input
        .hwdata                 (HWDATA                         ), //input
        // outputs
        .hrdata                 (HRDATA                         ), //output
        .hreadyout              (HREADYOUT                      ), //output
        .hresp                  (HRESP                          ), //output
        // Register interface
        .addr                   (reg_addr                       ), //output
        .read_en                (reg_read_en                    ), //output
        .write_en               (reg_write_en                   ), //output
        .byte_strobe            (reg_byte_strobe                ), //output
        .wdata                  (reg_wdata                      ), //output
        .rdata                  (reg_rdata                      )  //input
    );

//--------------------------------------------------------------------------
// Design: simple data register block with four 32-bit registers
//--------------------------------------------------------------------------
ahb_eg_reg # (
    /*autoinstparam*/
        .ADDR_WIDTH             (32                             ),
        .DATA_WIDTH             (32                             )
    )
ahb_eg_reg_u (
    /*autoinst*/
        //--------------------------------------------------------------------------
        // Ports
        //--------------------------------------------------------------------------
        // global inputs
        .hclk                   (HCLK                           ), //input
        .hresetn                (HRESETN                        ), //input
        // input signals
        .addr                   (reg_addr                       ), //input
        .read_en                (reg_read_en                    ), //input
        .write_en               (reg_write_en                   ), //input
        .byte_strobe            (reg_byte_strobe                ), //input
        .wdata                  (reg_wdata                      ), //input
        // output signals
        .rdata                  (reg_rdata                      )  //output
    );

endmodule
//--------------------------------------------------------------------------
