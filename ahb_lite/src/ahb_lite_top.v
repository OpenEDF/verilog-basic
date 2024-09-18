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
    input wire [31:0]  m0_haddr,
    input wire         m0_hwrite,
    input wire [2:0]   m0_hsize,
    input wire [2:0]   m0_hburst,
    input wire [3:0]   m0_hport,
    input wire [1:0]   m0_htrans,
    input wire         m0_hmastlock,
    input wire [31:0]  m0_hwdata,

    //custom master outputs
    output wire        m0_hready,
    output wire        m0_hresp,
    output wire [31:0] m0_rdata,

    //interrupt
    output wire        eg_int
);

//--------------------------------------------------------------------------
// Design: module inner connect signal
//--------------------------------------------------------------------------
/* decoder signal */
wire        dcdr_hsel_def_slave;
wire        dcdr_hsel_s0;
wire        dcdr_hsel_s1;
wire        dcdr_hsel_s2;
wire        dcdr_hsel_s3;
wire        dcdr_hsel_s4;
wire [3:0]  dcdr_hsel_mux_multi;

/* default slave */
wire [31:0] defs_rdata_multi;
wire        defs_hreadyout_multi;
wire        defs_hresp_multi;

/* slave 0 */
wire [31:0] s0_rdata_multi;
wire        s0_hreadyout_multi;
wire        s0_hresp_multi;

/* slave 1 */
wire [31:0] s1_rdata_multi;
wire        s1_hreadyout_multi;
wire        s1_hresp_multi;

/* slave 2 */
wire [31:0] s2_rdata_multi;
wire        s2_hreadyout_multi;
wire        s2_hresp_multi;

/* slave 3 */
wire [31:0] s3_rdata_multi;
wire        s3_hreadyout_multi;
wire        s3_hresp_multi;

/* slave43 */
wire [31:0] s4_rdata_multi;
wire        s4_hreadyout_multi;
wire        s4_hresp_multi;

//--------------------------------------------------------------------------
// Design: instance ahb lite decoder
//--------------------------------------------------------------------------
ahb_lite_decoder ahb_lite_decoder_u
(
    /*autoinst*/
        //--------------------------------------------------------------------------
        // Ports
        //--------------------------------------------------------------------------
        // global inputs
        .HADDR                  (m0_haddr                       ), //input
        // outputs to slave
        .HSEL_S0                (dcdr_hsel_s0                   ), //output
        .HSEL_S1                (dcdr_hsel_s1                   ), //output
        .HSEL_S2                (dcdr_hsel_s2                   ), //output
        .HSEL_S3                (dcdr_hsel_s3                   ), //output
        .HSEL_S4                (dcdr_hsel_s4                   ), //output
        .HSEL_DEF               (dcdr_hsel_def_slave            ), //output
        // outputs to multiplexor
        .HSEL_MUX               (dcdr_hsel_mux_multi            )  //output
    );

//--------------------------------------------------------------------------
// Design: instance ahb lite multiplexor
//--------------------------------------------------------------------------
ahb_lite_multiplexor ahb_lite_multiplexor_u
(
    /*autoinst*/
        //--------------------------------------------------------------------------
        // Ports
        //--------------------------------------------------------------------------
        // global inputs
        .HCLK                   (HCLK                           ), //input
        .HRESETn                (HRESETn                        ), //input
        // decoder input
        .HSEL_MUX               (dcdr_hsel_mux_multi            ), //input
        // slave inputs data
        .slave_s0_data          (s0_rdata_multi                 ), //input
        .slave_s1_data          (s1_rdata_multi                 ), //input
        .slave_s2_data          (s2_rdata_multi                 ), //input
        .slave_s3_data          (s3_rdata_multi                 ), //input
        .slave_s4_data          (s4_rdata_multi                 ), //input
        .slave_def_data         (defs_rdata_multi               ), //input
        // slave inputs hreadyout
        .slave_s0_hreadyout     (s0_hreadyout_multi             ), //input
        .slave_s1_hreadyout     (s1_hreadyout_multi             ), //input
        .slave_s2_hreadyout     (s2_hreadyout_multi             ), //input
        .slave_s3_hreadyout     (s3_hreadyout_multi             ), //input
        .slave_s4_hreadyout     (s4_hreadyout_multi             ), //input
        .slave_def_hreadyout    (defs_hreadyout_multi           ), //input
        // slave inputs hresp
        .slave_s0_hresp         (s0_hresp_multi                 ), //input
        .slave_s1_hresp         (s1_hresp_multi                 ), //input
        .slave_s2_hresp         (s2_hresp_multi                 ), //input
        .slave_s3_hresp         (s3_hresp_multi                 ), //input
        .slave_s4_hresp         (s4_hresp_multi                 ), //input
        .slave_def_hresp        (defs_hresp_multi               ), //input
        // outputs to master
        .HREADY                 (m0_hready                      ), //output
        .HRESP                  (m0_hresp                       ), //output
        .HRDATA                 (m0_rdata                       )  //output
    );

//--------------------------------------------------------------------------
// Design: instance ahb lite default slave
//--------------------------------------------------------------------------
ahb_lite_def_slave ahb_lite_def_slave_u
(
    /*autoinst*/
        //--------------------------------------------------------------------------
        // Ports
        //--------------------------------------------------------------------------
        // global inputs
        .HCLK                   (HCLK                           ), //input
        .HRESETn                (HRESETn                        ), //input
        .HSEL                   (dcdr_hsel_def_slave            ), //input
        .HADDR                  (m0_haddr                       ), //input
        .HWRITE                 (m0_hwrite                      ), //input
        .HSIZE                  (m0_hsize                       ), //input
        .HBURST                 (m0_hburst                      ), //input
        .HPROT                  (m0_hport                       ), //input
        .HTRANS                 (m0_htrans                      ), //input
        .HMASTLOCK              (m0_hmastlock                   ), //input
        .HREADY                 (m0_hready                      ), //input
        .HWDATA                 (m0_hwdata                      ), //input
        // outputs
        .HRDATA                 (defs_rdata_multi               ), //output
        .HREADYOUT              (defs_hreadyout_multi           ), //output
        .HRESP                  (defs_hresp_multi               )  //output
    );

//--------------------------------------------------------------------------
// Design: instance ahb lite rom slave 0
//--------------------------------------------------------------------------
ahb_lite_rom # (
    /*autoinst*/
    /*autoinstparam*/
    /*autoinstparam_value*/
        .ROM_WIDTH              (8                              ),
        .ROM_DEPTH              (4096                           )
    )
ahb_lite_rom_u1
(
        //--------------------------------------------------------------------------
        // Ports
        //--------------------------------------------------------------------------
        // global inputs
        .HCLK                   (HCLK                           ), //input
        .HRESETn                (HRESETn                        ), //input
        .HSEL                   (dcdr_hsel_s0                   ), //input
        .HADDR                  (m0_haddr                       ), //input
        .HWRITE                 (m0_hwrite                      ), //input
        .HSIZE                  (m0_hsize                       ), //input
        .HBURST                 (m0_hburst                      ), //input
        .HPROT                  (m0_hport                       ), //input
        .HTRANS                 (m0_htrans                      ), //input
        .HMASTLOCK              (m0_hmastlock                   ), //input
        .HREADY                 (m0_hready                      ), //input
        .HWDATA                 (m0_hwdata                      ), //input
        // outputs
        .HRDATA                 (s0_rdata_multi                 ), //output
        .HREADYOUT              (s0_hreadyout_multi             ), //output
        .HRESP                  (s0_hresp_multi                 )  //output
    );

//--------------------------------------------------------------------------
// Design: instance ahb lite ram slave 1
//--------------------------------------------------------------------------
ahb_lite_ram # (
    /*autoinst*/
    /*autoinstparam*/
    /*autoinstparam_value*/
        .RAM_WIDTH              (8                              ),
        .RAM_DEPTH              (4096                           )
    )
ahb_lite_ram_u1
(
        //--------------------------------------------------------------------------
        // Ports
        //--------------------------------------------------------------------------
        // global inputs
        .HCLK                   (HCLK                           ), //input
        .HRESETn                (HRESETn                        ), //input
        .HSEL                   (dcdr_hsel_s1                   ), //input
        .HADDR                  (m0_haddr                       ), //input
        .HWRITE                 (m0_hwrite                      ), //input
        .HSIZE                  (m0_hsize                       ), //input
        .HBURST                 (m0_hburst                      ), //input
        .HPROT                  (m0_hport                       ), //input
        .HTRANS                 (m0_htrans                      ), //input
        .HMASTLOCK              (m0_hmastlock                   ), //input
        .HREADY                 (m0_hready                      ), //input
        .HWDATA                 (m0_hwdata                      ), //input
        // outputs
        .HRDATA                 (s1_rdata_multi                 ), //output
        .HREADYOUT              (s1_hreadyout_multi             ), //output
        .HRESP                  (s1_hresp_multi                 )  //output
    );

//--------------------------------------------------------------------------
// Design: instance ahb lite ram slave 2
//--------------------------------------------------------------------------
ahb_lite_ram # (
    /*autoinst*/
    /*autoinstparam*/
    /*autoinstparam_value*/
        .RAM_WIDTH              (8                              ),
        .RAM_DEPTH              (1024                           )
    )
ahb_lite_ram_u2
(
        //--------------------------------------------------------------------------
        // Ports
        //--------------------------------------------------------------------------
        // global inputs
        .HCLK                   (HCLK                           ), //input
        .HRESETn                (HRESETn                        ), //input
        .HSEL                   (dcdr_hsel_s2                   ), //input
        .HADDR                  (m0_haddr                       ), //input
        .HWRITE                 (m0_hwrite                      ), //input
        .HSIZE                  (m0_hsize                       ), //input
        .HBURST                 (m0_hburst                      ), //input
        .HPROT                  (m0_hport                       ), //input
        .HTRANS                 (m0_htrans                      ), //input
        .HMASTLOCK              (m0_hmastlock                   ), //input
        .HREADY                 (m0_hready                      ), //input
        .HWDATA                 (m0_hwdata                      ), //input
        // outputs
        .HRDATA                 (s2_rdata_multi                 ), //output
        .HREADYOUT              (s2_hreadyout_multi             ), //output
        .HRESP                  (s2_hresp_multi                 )  //output
    );

//--------------------------------------------------------------------------
// Design: instance ahb lite ram slave 3
//--------------------------------------------------------------------------
ahb_lite_ram # (
    /*autoinst*/
    /*autoinstparam*/
    /*autoinstparam_value*/
        .RAM_WIDTH              (8                              ),
        .RAM_DEPTH              (1024                           )
    )
ahb_lite_ram_u3
(
        //--------------------------------------------------------------------------
        // Ports
        //--------------------------------------------------------------------------
        // global inputs
        .HCLK                   (HCLK                           ), //input
        .HRESETn                (HRESETn                        ), //input
        .HSEL                   (dcdr_hsel_s3                   ), //input
        .HADDR                  (m0_haddr                       ), //input
        .HWRITE                 (m0_hwrite                      ), //input
        .HSIZE                  (m0_hsize                       ), //input
        .HBURST                 (m0_hburst                      ), //input
        .HPROT                  (m0_hport                       ), //input
        .HTRANS                 (m0_htrans                      ), //input
        .HMASTLOCK              (m0_hmastlock                   ), //input
        .HREADY                 (m0_hready                      ), //input
        .HWDATA                 (m0_hwdata                      ), //input
        // outputs
        .HRDATA                 (s3_rdata_multi                 ), //output
        .HREADYOUT              (s3_hreadyout_multi             ), //output
        .HRESP                  (s3_hresp_multi                 )  //output
    );

//--------------------------------------------------------------------------
// Design: instance ahb lite example slave
//--------------------------------------------------------------------------
ahb_eg_slave # (
    /*autoinst*/
    /*autoinstparam*/
    /*autoinstparam_value*/
    )
ahb_eg_slave_u0
(
        //--------------------------------------------------------------------------
        // Ports
        //--------------------------------------------------------------------------
        // global inputs
        .HCLK                   (HCLK                           ), //input
        .HRESETn                (HRESETn                        ), //input
        .HSEL                   (dcdr_hsel_s4                   ), //input
        .HADDR                  (m0_haddr                       ), //input
        .HWRITE                 (m0_hwrite                      ), //input
        .HSIZE                  (m0_hsize                       ), //input
        .HBURST                 (m0_hburst                      ), //input
        .HPROT                  (m0_hport                       ), //input
        .HTRANS                 (m0_htrans                      ), //input
        .HMASTLOCK              (m0_hmastlock                   ), //input
        .HREADY                 (m0_hready                      ), //input
        .HWDATA                 (m0_hwdata                      ), //input
        // outputs
        .HRDATA                 (s4_rdata_multi                 ), //output
        .HREADYOUT              (s4_hreadyout_multi             ), //output
        .HRESP                  (s4_hresp_multi                 ), //output
        // interrupt
        .eg_int                 (eg_int                         )  //output
    );
endmodule

//--------------------------------------------------------------------------
