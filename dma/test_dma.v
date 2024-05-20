`timescale 1ns/10ps
module test_dma;
parameter PERIOD=100;
parameter BASE_ADDR= 32'h4000_0000;

parameter CH0_EN =1;
parameter CH1_EN =1;
parameter CH2_EN =1;
parameter CH3_EN =1;

parameter CH0_TGT =32'h10;
parameter CH1_TGT =32'h10;
parameter CH2_TGT =32'h10;
parameter CH3_TGT =32'h10;

parameter CH0_CTRL=BASE_ADDR+32'h0;
parameter CH1_CTRL=BASE_ADDR+32'h12;
parameter CH2_CTRL=BASE_ADDR+32'h24;
parameter CH3_CTRL=BASE_ADDR+32'h36;
parameter CH0_SOUR=BASE_ADDR+32'h4;
parameter CH1_SOUR=BASE_ADDR+32'h16;
parameter CH2_SOUR=BASE_ADDR+32'h28;
parameter CH3_SOUR=BASE_ADDR+32'h40;
parameter CH0_DEST=BASE_ADDR+32'h8;
parameter CH1_DEST=BASE_ADDR+32'h20;
parameter CH2_DEST=BASE_ADDR+32'h32;
parameter CH3_DEST=BASE_ADDR+32'h44;

integer testcase;
reg [7:0] cnt;
reg hreset_n,hclk;

reg cpu_s_hsel;
reg [31:0] cpu_s_haddr;
reg [31:0] cpu_s_hwdata;
reg cpu_s_hwrite;
reg [1:0] cpu_s_htrans;
reg [2:0] cpu_s_hburst;
reg [2:0] cpu_s_hsize;
reg [3:0] cpu_s_hprot;
reg cpu_s_hlock;
reg cpu_s_hbusreq;
wire [31:0]hrdata;
wire hreadyout_from_dmaslv;
reg [31:0]xfr_reg;

reg req_0_trig;
reg req_1_trig;
reg req_2_trig;
reg req_3_trig;

reg peri_req_0;
reg peri_req_1;
reg peri_req_2;
reg peri_req_3;

wire dmac_ack_0;
wire dmac_ack_1;
wire dmac_ack_2;
wire dmac_ack_3;

reg tb_ch_en_0;
reg tb_ch_en_1;
reg tb_ch_en_2;
reg tb_ch_en_3;

reg tb_ch_tgt_0;
reg tb_ch_tgt_1;
reg tb_ch_tgt_2;
reg tb_ch_tgt_3;

reg [31:0] tb_hrdatain;
reg [31:0] tb_ch_datain_0;
reg [31:0] tb_ch_datain_1;
reg [31:0] tb_ch_datain_2;
reg [31:0] tb_ch_datain_3;

`include "sim_ahb_task.v"
dmac u_dmac(
        .HCLK(hclk),
        .HRESETn(hreset_n),
        .HSEL_SLV(cpu_s_hsel),
        .HREADYIN_SLV(1'b1),
        .HTRANS_SLV(cpu_s_htrans),
        .HSIZE_SLV(cpu_s_hsize),
        .HWRITE_SLV(cpu_s_hwrite),
        .HADDR_SLV(cpu_s_haddr),
        .HWDATA_SLV(cpu_s_hwdata),
        .HREADYOUT_SLV(hreadyout_from_dmaslv),
        .HRESP_SLV(),
        .HRDATA_SLV(hrdata),
        .HSEL(),
    //    .HREADY(),
        .HTRANS(),
        .HSIZE(),
        .HWRITE(),
        .HADDR(),
        .HWDATA(),
        .HREADY_IN(1'b1),
        .HRESP(),
        .HRDATA(tb_hrdatain),
        .req_0(peri_req_0),
        .req_1(peri_req_1),
        .req_2(peri_req_2),
        .req_3(peri_req_3),
        .ack_0(dmac_ack_0),
        .ack_1(dmac_ack_1),
        .ack_2(dmac_ack_2),
        .ack_3(dmac_ack_3)
);

always @(posedge hclk or negedge hreset_n)
    if (!hreset_n)
        peri_req_0<=0;
    else if (req_0_trig)
        peri_req_0<=1;
    else if (dmac_ack_0) 
        peri_req_0<=0;

always @(posedge hclk or negedge hreset_n)
    if (!hreset_n)
        peri_req_1<=0;
    else if (req_1_trig)
        peri_req_1<=1;
    else if (dmac_ack_1)
        peri_req_1<=0;
 
always @(posedge hclk or negedge hreset_n)
    if (!hreset_n)
        peri_req_2<=0;
    else if (req_2_trig)
        peri_req_2<=1;
    else if (dmac_ack_2)
        peri_req_2<=0;

always @(posedge hclk or negedge hreset_n)
    if (!hreset_n)
        peri_req_3<=0;
    else if (req_3_trig)
        peri_req_3<=1;
    else if (dmac_ack_3)
        peri_req_3<=0;

always @(posedge hclk or negedge hreset_n)
    if (!hreset_n)
        tb_ch_datain_0<=0;
    else if (~tb_ch_en_0)
        tb_ch_datain_0<=0;
    else if (req_0_trig)
        tb_ch_datain_0<=tb_ch_datain_0+1;

always @(posedge hclk or negedge hreset_n)
    if (!hreset_n)
        tb_ch_datain_1<=0;
    else if (~tb_ch_en_1)
        tb_ch_datain_1<=0;
    else if (req_0_trig)
        tb_ch_datain_1<=tb_ch_datain_1+1;

always @(posedge hclk or negedge hreset_n)
    if (!hreset_n)
        tb_ch_datain_2<=0;
    else if (~tb_ch_en_2)
        tb_ch_datain_2<=0;
    else if (req_0_trig)
        tb_ch_datain_2<=tb_ch_datain_2+1;
    
always @(posedge hclk or negedge hreset_n)
    if (!hreset_n)
        tb_ch_datain_3<=0;
    else if (~tb_ch_en_3)
        tb_ch_datain_3<=0;
    else if (req_0_trig)
        tb_ch_datain_3<=tb_ch_datain_3+1;
    
always @(posedge hclk or negedge hreset_n)
    if (!hreset_n)
        tb_hrdatain<=1;
    else if (peri_req_0)
        tb_hrdatain<=tb_ch_datain_0;
    else if (peri_req_1)
        tb_hrdatain<=tb_ch_datain_1;
    else if (peri_req_2)
        tb_hrdatain<=tb_ch_datain_2;
    else if (peri_req_3)
        tb_hrdatain<=tb_ch_datain_3;
 
initial begin 
    forever #(PERIOD/2) hclk=~hclk;
end

initial begin
    testcase =0;
    hreset_n=1;
    hclk=1;
    xfr_reg=0;
    req_0_trig=0;
    req_1_trig=0;
    req_2_trig=0;
    req_3_trig=0;
    tb_ch_en_0=0;
    tb_ch_en_1=0;
    tb_ch_en_2=0;
    tb_ch_en_3=0;
    tb_ch_tgt_0=0;
    tb_ch_tgt_1=0;
    tb_ch_tgt_2=0;
    tb_ch_tgt_3=0;
    #(PERIOD*20) hreset_n=0;
    #(PERIOD*20) hreset_n=1;
//case 1    
    #(PERIOD*1) AHB_SIGNLE_WR(CH0_SOUR,32'h4001_1000);
    #(PERIOD*1) AHB_SIGNLE_WR(CH0_DEST,32'h4001_0000);
    #(PERIOD*1) AHB_SIGNLE_WR(CH0_CTRL,32'h900+CH0_EN);
    tb_ch_en_0=1;
    tb_ch_tgt_0=0;
    #(PERIOD*60);

    repeat (9) begin 
     #(PERIOD*1) req_0_trig=1;
     #(PERIOD*1) req_0_trig=0;
     #(PERIOD*10);
    end
     #(PERIOD*300);
     #(PERIOD*20) hreset_n=0;
     #(PERIOD*20) hreset_n=1;
 //case 2
 testcase =2;
#(PERIOD*1) AHB_SIGNLE_WR(CH0_SOUR,32'h4001_0000);
#(PERIOD*1) AHB_SIGNLE_WR(CH0_DEST,32'h4001_1000);
#(PERIOD*1) AHB_SIGNLE_WR(CH0_CTRL,32'ha00+CH0_TGT+CH0_EN);
    tb_ch_en_0=1;
    tb_ch_tgt_0=0;
    repeat (10) begin 
     #(PERIOD*1) req_0_trig=1;
     #(PERIOD*1) req_0_trig=0;
     #(PERIOD*20);
    end
     #(PERIOD*300);
     $finish;
 end

 initial begin
    $fsdbDumpfile("test_dma.fsdb");
    $fsdbDumpvars(0,"test_dma");
    $fsdbDumpMDA();
 end
 endmodule








    
