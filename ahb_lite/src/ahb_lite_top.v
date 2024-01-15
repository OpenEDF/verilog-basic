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
// Brief: amba 3.0 ahb lite top
// Change Log:
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Include File
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Module
//--------------------------------------------------------------------------
module ahb_lite_top
//--------------------------------------------------------------------------
// Ports
//--------------------------------------------------------------------------
(
    // global inputs
    input wire         HCLK,
    input wire         HRESETn,

    // AHB master inputs
    input wire [31:0]  master_haddr,
    input wire         master_hwrite,
    input wire [2:0]   master_hsize,
    input wire [2:0]   master_hburst,
    input wire [3:0]   master_hport,
    input wire [1:0]   master_htrans,
    input wire         master_hmasterlock,
    input wire [31:0]  master_hwdata,

    //custom master outputs
    output wire        master_hready_wait,
    output wire        master_hresp_error,
    output wire [31:0] master_out_data
);

//--------------------------------------------------------------------------
// Design: module inner connect signal
//--------------------------------------------------------------------------
/* ahb matser */
wire [31:0] master_haddr_slave;
wire        master_hwrite_slave;
wire [2:0]  master_hsize_slave;
wire [2:0]  master_hburst_slave;
wire [3:0]  master_hprot_slave;
wire [1:0]  master_htrans_slave;
wire        master_hmasterlock_slave;
wire [31:0] master_hwdata_slave;

/* decoder signal */
wire        decoder_hsel_def_slave;
wire [3:0]  decoder_hsel_mux_multi;

/* multiplexor */
wire        multi_hready_master;
wire        multi_hresp_master;
wire [31:0] multi_hrdata_master;

/* default slave */
wire [31:0] defslave_rdata_multi;
wire        defslave_hreadyout_multi;
wire        defslave_hresp_multi;

//--------------------------------------------------------------------------
// Design: instance ahb lite master
//--------------------------------------------------------------------------
ahb_lite_master ahb_lite_master_u
(
    .HCLK                   (HCLK),
    .HRESETn                (HRESETn),

    // AHB master inputs
    .master_haddr           (master_haddr),
    .master_hwrite          (master_hwrite),
    .master_hsize           (master_hsize),
    .master_hburst          (master_hburst),
    .master_hport           (master_hport),
    .master_htrans          (master_htrans),
    .master_hmasterlock     (master_hmasterlock),
    .master_hwdata          (master_hwdata),
    .HREADY                 (multi_hready_master),
    .HRESP                  (multi_hresp_master),
    .HRDATA                 (multi_hrdata_master),

    // AHB master outputs
    .HADDR                  (master_haddr_slave),
    .HWRITE                 (master_hwrite_slave),
    .HSIZE                  (master_hsize_slave),
    .HBURST                 (master_hburst_slave),
    .HPROT                  (master_hprot_slave),
    .HTRANS                 (master_htrans_slave),
    .HMASTERLOCK            (master_hmasterlock_slave),
    .HWDATA                 (master_hwdata_slave),

    //custom master outputs
    .master_hready_wait     (master_hready_wait),
    .master_hresp_error     (master_hresp_error),
    .master_out_data        (master_out_data)
);

//--------------------------------------------------------------------------
// Design: instance ahb lite decoder
//--------------------------------------------------------------------------
ahb_lite_decoder ahb_lite_decoder_u
(
    // master inputs
    .HADDR                  (master_haddr_slave),

    // outputs to slave
    .HSEL_ROM               (),
    .HSEL_DEF_SLAVE         (decoder_hsel_def_slave),
    .HSEL_NOMAP             (),

    // outputs to multiplexor
    .HSEL_MUX               (decoder_hsel_mux_multi)
);

//--------------------------------------------------------------------------
// Design: instance ahb lite multiplexor
//--------------------------------------------------------------------------
ahb_lite_multiplexor ahb_lite_multiplexor_u
(
    // global inputs
    .HCLK                   (HCLK),
    .HRESETn                (HRESETn),

    // decoder input
    .HSEL_MUX               (decoder_hsel_mux_multi),

    // slave inputs data
    .rom_rdata_mux          (),
    .defslave_rdata_mux     (defslave_rdata_multi),
    .nomap_rdata_mux        (),

    // slave inputs hreadyout
    .rom_hredayout_mux      (),
    .defslave_hreadyout_mux (defslave_hreadyout_multi),
    .nomap_hreadyout_mux    (),

    // slave inputs hresp
    .rom_hresp_mux          (),
    .defslave_hresp_mux     (defslave_hresp_multi),
    .nomap_hresp_mux        (),

    // outputs to master
    .HREADY                 (multi_hready_master),
    .HRESP                  (multi_hresp_master),
    .HRDATA                 (multi_hrdata_master)
);

//--------------------------------------------------------------------------
// Design: instance ahb lite default slave
//--------------------------------------------------------------------------
ahb_lite_def_slave ahb_lite_def_slave_u
(
    // global inputs
    .HCLK                   (HCLK),
    .HRESETn                (HRESETn),

    .HSEL                   (decoder_hsel_def_slave),
    .HADDR                  (master_haddr_slave),
    .HWRITE                 (master_hwrite_slave),
    .HSIZE                  (master_hsize_slave),
    .HBURST                 (master_hburst_slave),
    .HPROT                  (master_hprot_slave),
    .HTRANS                 (master_htrans_slave),
    .HMASTLOCK              (master_hmasterlock_slave),
    .HREADY                 (multi_hready_master),
    .HWDATA                 (master_hwdata_slave),

    // outputs
    .HRDATA                 (defslave_rdata_multi),
    .HREADYOUT              (defslave_hreadyout_multi),
    .HRESP                  (defslave_hresp_multi)
);

endmodule
//--------------------------------------------------------------------------
