`timescale 1ns/10ps
module dmac(

input             HCLK,
input             HRESETn,

input             HSEL_SLV,
input             HREADYIN_SLV,
input       [1: 0]HTRANS_SLV,
input       [2: 0]HSIZE_SLV,
input             HWRITE_SLV,
input       [31:0]HADDR_SLV,
input       [31:0]HWDATA_SLV,
output            HREADYOUT_SLV,
output            HRESP_SLV,
output      [31:0]HRDATA_SLV,
//FOLLOWING ARE AHB MASTER PORTS
output            HSEL,
//output            HREADY,
output      [1: 0]HTRANS,
output      [2: 0]HSIZE,
output            HWRITE,
output      [31:0]HADDR,
output      [31:0]HWDATA,
input             HREADY_IN,//423
input             HRESP,
input       [31:0]HRDATA,

input           req_0,
output          ack_0,
input           req_1,
output          ack_1,
input           req_2,
output          ack_2,
input           req_3,
output          ack_3
);


wire [9:0]ch_0_size;
wire [9:0]ch_1_size;
wire [9:0]ch_2_size;
wire [9:0]ch_3_size;
wire [31:0]ch_0_sour;
wire [31:0]ch_0_dest;
wire [31:0]ch_1_sour;
wire [31:0]ch_1_dest;
wire [31:0]ch_2_sour;
wire [31:0]ch_2_dest;
wire [31:0]ch_3_sour;
wire [31:0]ch_3_dest;
wire [31:0]addr;
wire [31:0]wdata;
wire [31:0]rdata;
wire [31:0]wr_fifo_data_0;
wire [31:0]rd_fifo_data_0;
wire [31:0]wr_fifo_data_1;
wire [31:0]rd_fifo_data_1;
wire [31:0]wr_fifo_data_2;
wire [31:0]rd_fifo_data_2;
wire [31:0]wr_fifo_data_3;
wire [31:0]rd_fifo_data_3;

dmac_intf u_dmac_intf(

.HCLK       (      HCLK   ),
.HRESETn    (      HRESETn),
.HSEL       (     HSEL_SLV),
.HREADY     (   HREADYIN_SLV),//hreadyin
.HTRANS     (   HTRANS_SLV),
.HSIZE      (    HSIZE_SLV),
.HWRITE     (   HWRITE_SLV),
.HADDR      (    HADDR_SLV),
.HWDATA     (   HWDATA_SLV),
.HREADYOUT  (HREADYOUT_SLV),//to master meaning transfer done or not
.HRESP      (    HRESP_SLV),
.HRDATA     (   HRDATA_SLV),
.ch_0_en    (ch_0_en    ),
.ch_0_target(ch_0_target),
.ch_0_size  (ch_0_size  ),
.ch_1_en    (ch_1_en    ),
.ch_1_target(ch_1_target),
.ch_1_size  (ch_1_size  ),
.ch_2_en    (ch_2_en    ),
.ch_2_target(ch_2_target),
.ch_2_size  (ch_2_size  ),
.ch_3_en    (ch_3_en    ),
.ch_3_target(ch_3_target),
.ch_3_size  (ch_3_size  ),
.ch_0_sour  (ch_0_sour  ),
.ch_0_dest  (ch_0_dest  ),
.ch_1_sour  (ch_1_sour  ),
.ch_1_dest  (ch_1_dest  ),
.ch_2_sour  (ch_2_sour  ),
.ch_2_dest  (ch_2_dest  ),
.ch_3_sour  (ch_3_sour  ),
.ch_3_dest  (ch_3_dest  )

);

dmac_ahb_ctrl u_dmac_ahb_ctrl(

.clk       (HCLK     ),
.rst       (HRESETn  ),
.wr        (wr       ),
.rd        (rd       ),
.addr      (addr     ),
.wdata     (wdata    ),
.rdata     (rdata    ),
.rd_en     (rd_en    ),
.hsel      (     HSEL),
//.hready    (   HREADY),
.htrans    (   HTRANS),
.hsize     (    HSIZE),
.hwrite    (   HWRITE),
.haddr     (    HADDR),
.hwdata    (   HWDATA),
.hreadyin (HREADY_IN),//423
.hresp     (    HRESP),
.hrdata    (   HRDATA)

);

dmac_channel_ctrl u_dmac_channel_ctrl(

.clk            (HCLK   )       ,
.rst            (HRESETn)       ,
.req_0          (req_0   )      ,
.req_1          (req_1   )      ,
.req_2          (req_2   )      ,
.req_3          (req_3   )      ,
.wr             (wr      )      ,
.rd             (rd      )      ,
.addr           (addr    )      ,
.wdata          (wdata   )      ,
.rdata          (rdata   )      ,
.rd_en          (rd_en   )      ,
.en_0           (en_0    )      ,
.en_1           (en_1    )      ,
.en_2           (en_2    )      ,
.en_3           (en_3    )      ,
.target_0       (ch_0_target)   ,
.target_1       (ch_1_target)   ,
.target_2       (ch_2_target)   ,
.target_3       (ch_3_target)   ,
.ch_0_size      (ch_0_size)     ,
.ch_1_size      (ch_1_size)     ,
.ch_2_size      (ch_2_size)     ,
.ch_3_size      (ch_3_size)     ,
.ch_0_sour      (ch_0_sour)     ,
.ch_0_dest      (ch_0_dest)     ,
.ch_1_sour      (ch_1_sour)     ,
.ch_1_dest      (ch_1_dest)     ,
.ch_2_sour      (ch_2_sour)     ,
.ch_2_dest      (ch_2_dest)     ,
.ch_3_sour      (ch_3_sour)     ,
.ch_3_dest      (ch_3_dest)     ,
.fifo_0_empty   (fifo_0_empty  ),
.fifo_1_empty   (fifo_1_empty  ),
.fifo_2_empty   (fifo_2_empty  ),
.fifo_3_empty   (fifo_3_empty  ),
.fifo_0_full    (fifo_0_full   ),
.fifo_1_full    (fifo_1_full   ),
.fifo_2_full    (fifo_2_full   ),
.fifo_3_full    (fifo_3_full   ),
.wr_fifo_0      (wr_fifo_0     ),
.wr_fifo_data_0 (wr_fifo_data_0),
.rd_fifo_0      (rd_fifo_0     ),
.rd_fifo_data_0 (rd_fifo_data_0),
.wr_fifo_1      (wr_fifo_1     ),
.wr_fifo_data_1 (wr_fifo_data_1),
.rd_fifo_1      (rd_fifo_1     ),
.rd_fifo_data_1 (rd_fifo_data_1),
.wr_fifo_2      (wr_fifo_2     ),
.wr_fifo_data_2 (wr_fifo_data_2),
.rd_fifo_2      (rd_fifo_2     ),
.rd_fifo_data_2 (rd_fifo_data_2),
.wr_fifo_3      (wr_fifo_3     ),
.wr_fifo_data_3 (wr_fifo_data_3),
.rd_fifo_3      (rd_fifo_3     ),
.rd_fifo_data_3 (rd_fifo_data_3),
.hready_in         (HREADY_IN)     ,//423
.req_done       (req_done)      ,
.ch_0_t0_done   (ch_0_t0_done)  ,
.ch_1_t0_done   (ch_1_t0_done)  ,
.ch_2_t0_done   (ch_2_t0_done)  ,
.ch_3_t0_done   (ch_3_t0_done)

);

dmac_arb u_dmac_arb(

.clk          (HCLK         ),
.rst          (HRESETn      ),
.req_0        (req_0       ),
.req_1        (req_1       ),
.req_2        (req_2       ),
.req_3        (req_3       ),
.ch_0_en      (ch_0_en     ),
.ch_1_en      (ch_1_en     ),
.ch_2_en      (ch_2_en     ),
.ch_3_en      (ch_3_en     ),
.target_0     (ch_0_target ),
.target_1     (ch_1_target ),
.target_2     (ch_2_target ),
.target_3     (ch_3_target ),
.en_0         (en_0        ),
.en_1         (en_1        ),
.en_2         (en_2        ),
.en_3         (en_3        ),
.ack_0        (ack_0       ),
.ack_1        (ack_1       ),
.ack_2        (ack_2       ),
.ack_3        (ack_3       ),
.req_done     (req_done    ),
.ch_0_t0_done (ch_0_t0_done),
.ch_1_t0_done (ch_1_t0_done),
.ch_2_t0_done (ch_2_t0_done),
.ch_3_t0_done (ch_3_t0_done),
.fifo_0_empty (fifo_0_empty),
.fifo_1_empty (fifo_1_empty),
.fifo_2_empty (fifo_2_empty),
.fifo_3_empty (fifo_3_empty),
.fifo_0_full  (fifo_0_full ),
.fifo_1_full  (fifo_1_full ),
.fifo_2_full  (fifo_2_full ),
.fifo_3_full  (fifo_3_full )

);

dmac_channel u_dmac_channel(
.    clk (HCLK   )             ,
.    rst (HRESETn)             ,
.  clr_0 (1'b0)                ,
.   wr_0 (     wr_fifo_0)      ,
.   rd_0 (     rd_fifo_0)      ,
.wdata_0 (wr_fifo_data_0)      ,
.rdata_0 (rd_fifo_data_0)      ,
. full_0 (        fifo_0_full) ,
.empty_0 (        fifo_0_empty),
.  clr_1 (1'b0)                ,
.   wr_1 (     wr_fifo_1)      ,
.   rd_1 (     rd_fifo_1)      ,
.wdata_1 (wr_fifo_data_1)      ,
.rdata_1 (rd_fifo_data_1)      ,
. full_1 (        fifo_1_full) ,
.empty_1 (        fifo_1_empty),
.  clr_2 (1'b0)                ,
.   wr_2 (     wr_fifo_2)      ,
.   rd_2 (     rd_fifo_2)      ,
.wdata_2 (wr_fifo_data_2)      ,
.rdata_2 (rd_fifo_data_2)      ,
. full_2 (        fifo_2_full) ,
.empty_2 (        fifo_2_empty),
.  clr_3 (1'b0)                ,
.   wr_3 (     wr_fifo_3)      ,
.   rd_3 (     rd_fifo_3)      ,
.wdata_3 (wr_fifo_data_3)      ,
.rdata_3 (rd_fifo_data_3)      ,
. full_3 (        fifo_3_full) ,
.empty_3 (        fifo_3_empty)

);
endmodule 
