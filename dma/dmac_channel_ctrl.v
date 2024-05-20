`timescale 1ns/10ps
module dmac_channel_ctrl(
    input clk,
    input rst,

    input req_0,
    input req_1,
    input req_2,
    input req_3,

    output wr,
    output rd,
    output [31:0] addr,
    output [31:0] wdata,
    input  [31:0] rdata,
    input         rd_en,

    input en_0,
    input en_1,
    input en_2,
    input en_3,

    input target_0,
    input target_1,
    input target_2,
    input target_3,

    input [9:0] ch_0_size,
    input [9:0] ch_1_size,
    input [9:0] ch_2_size,
    input [9:0] ch_3_size,

    input [31:0] ch_0_sour,
    input [31:0] ch_0_dest,
    input [31:0] ch_1_sour,
    input [31:0] ch_1_dest,
    input [31:0] ch_2_sour,
    input [31:0] ch_2_dest,
    input [31:0] ch_3_sour,
    input [31:0] ch_3_dest,

    input fifo_0_empty,
    input fifo_1_empty,
    input fifo_2_empty,
    input fifo_3_empty,

    input fifo_0_full,
    input fifo_1_full,
    input fifo_2_full,
    input fifo_3_full,

    output wr_fifo_0,
    output [31:0] wr_fifo_data_0,
    output rd_fifo_0,
    input  [31:0] rd_fifo_data_0,

    output wr_fifo_1,
    output [31:0] wr_fifo_data_1,
    output rd_fifo_1,
    input  [31:0] rd_fifo_data_1,

    output wr_fifo_2,
    output [31:0] wr_fifo_data_2,
    output rd_fifo_2,
    input  [31:0] rd_fifo_data_2,

    output wr_fifo_3,
    output [31:0] wr_fifo_data_3,
    output rd_fifo_3,
    input  [31:0] rd_fifo_data_3,

    input hready_in,
    output req_done,

    output reg ch_0_t0_done,
    output reg ch_1_t0_done,
    output reg ch_2_t0_done,
    output reg ch_3_t0_done
);

parameter MAX_TRANS=8;
parameter TRANS_W=3;//2^3=8

reg [9:0] cnt_t0_0;
reg [9:0] cnt_t0_1;
reg [9:0] cnt_t0_2;
reg [9:0] cnt_t0_3;

reg [TRANS_W-1:0] t0_cnt;
wire              t0_mt_done;

wire              peri_t0_req;
wire              peri_t1_req;

wire              mem_t0_req;
wire              mem_t1_req;

wire             ch0_t0_en;
wire             ch1_t0_en;
wire             ch2_t0_en;
wire             ch3_t0_en;

wire             ch0_t1_en;
wire             ch1_t1_en;
wire             ch2_t1_en;
wire             ch3_t1_en;

reg   [31:0]     rd_addr_0;
reg   [31:0]     rd_addr_1;
reg   [31:0]     rd_addr_2;
reg   [31:0]     rd_addr_3;

wire  [31:0]     t0_rm_addr;
wire  [31:0]     t0_wp_addr;
reg              t0_wr;
reg              t0_rd;

wire             t0_done;

wire  [31:0]     t1_rp_addr;
wire  [31:0]     t1_wm_addr;
reg              t1_wr;
reg              t1_rd;

wire            wr_fifo;
wire     [31:0] wr_fifo_data;
wire            rd_fifo;

reg             en_0_d;
reg             en_1_d;
reg             en_2_d;
reg             en_3_d;

wire            en_0_r;
wire            en_1_r;
wire            en_2_r;
wire            en_3_r;

reg             en_0_r_d;
reg             en_1_r_d;
reg             en_2_r_d;
reg             en_3_r_d;

reg   [31:0] rd_addr_t1_0;
reg   [31:0] rd_addr_t1_1;
reg   [31:0] rd_addr_t1_2;
reg   [31:0] rd_addr_t1_3;


//logic of direction 0
reg [5:0] s0_cs;
reg [5:0] s0_ns;

parameter S0_IDLE   = 6'b000000;
parameter S0_R_M    = 6'b000001;
parameter S0_WAIT_R = 6'b000010;
parameter S0_W_P    = 6'b000100;
parameter S0_WAIT_W = 6'b001000;

assign ch0_t0_en=en_0==1 && target_0==0;
assign ch1_t0_en=en_1==1 && target_1==0;
assign ch2_t0_en=en_2==1 && target_2==0;
assign ch3_t0_en=en_3==1 && target_3==0;

//peri_t0_req :data from mem to peri and this process is requsted by peri
assign peri_t0_req =(req_0 && ch0_t0_en && fifo_0_empty==0) ||//fifo is not empty
                    (req_1 && ch1_t0_en && fifo_1_empty==0) ||
                    (req_2 && ch2_t0_en && fifo_2_empty==0) ||
                    (req_3 && ch3_t0_en && fifo_3_empty==0) ;
//mem_t0_req:data from mem to peri and this process is initiated by mem
assign mem_t0_req=(ch0_t0_en | ch1_t0_en | ch2_t0_en | ch3_t0_en ) && (~t0_done);

always @(posedge clk or negedge rst)
    if (!rst)
        s0_cs<=S0_IDLE;
    else 
        s0_cs<=s0_ns;

always @(*)
    case (s0_cs)
        S0_IDLE: if (peri_t0_req)
                    s0_ns=S0_W_P;
                 else if (mem_t0_req)
                    s0_ns=S0_R_M;
                 else 
                    s0_ns=S0_IDLE;

        S0_R_M:  s0_ns=S0_WAIT_R;

        S0_WAIT_R: if (rd_en && (t0_mt_done || t0_done ))
                        s0_ns=S0_IDLE;
                   else if (rd_en && (~t0_mt_done)) 
                        s0_ns=S0_R_M;
                   else 
                        s0_ns=S0_WAIT_R;

        S0_W_P:  s0_ns=  S0_WAIT_W;

        S0_WAIT_W: if (hready_in)
                      s0_ns=S0_IDLE;
                   else 
                      s0_ns=  S0_WAIT_W;

        default : s0_ns=S0_IDLE;
    endcase 

always @(posedge clk or negedge rst)
    if (!rst)
        cnt_t0_0<=0;
    else if (target_0)
        cnt_t0_0<=0;
    else if (en_0 && s0_cs==S0_R_M)
        cnt_t0_0<=cnt_t0_0+1;

always @(posedge clk or negedge rst)
    if (!rst)
        cnt_t0_1<=0;
    else if (target_1)
        cnt_t0_1<=0;
    else if (en_1 && s0_cs==S0_R_M)
        cnt_t0_1<=cnt_t0_1+1;

always @(posedge clk or negedge rst)
    if (!rst)
        cnt_t0_2<=0;
    else if (target_2)
        cnt_t0_2<=0;
    else if (en_2 && s0_cs==S0_R_M)
        cnt_t0_2<=cnt_t0_2+1;

always @(posedge clk or negedge rst)
    if (!rst)
        cnt_t0_3<=0;
    else if (target_3)
        cnt_t0_3<=0;
    else if (en_3 && s0_cs==S0_R_M)
        cnt_t0_3<=cnt_t0_3+1;

always @(posedge clk or negedge rst)
    if (!rst)
        t0_cnt<={(TRANS_W){1'b0}};
    else if (s0_cs==S0_IDLE)
        t0_cnt<={(TRANS_W){1'b0}};
    else if(s0_cs==S0_R_M)
        t0_cnt<=t0_cnt+1;
 
assign t0_mt_done=t0_cnt==0 && s0_cs==S0_WAIT_R;

//for ch_*_t0_done
always @(posedge clk or negedge rst)
    if (!rst)
        ch_0_t0_done<=0;
    else if (en_0 && target_0==0 && cnt_t0_0==ch_0_size)
        ch_0_t0_done<=1;

always @(posedge clk or negedge rst)
    if (!rst)
        ch_1_t0_done<=0;
    else if (en_1 && target_1==0 && cnt_t0_1==ch_1_size)
        ch_1_t0_done<=1;

always @(posedge clk or negedge rst)
    if (!rst)
        ch_2_t0_done<=0;
    else if (en_2 && target_2==0 && cnt_t0_2==ch_2_size)
        ch_2_t0_done<=1;

always @(posedge clk or negedge rst)
    if (!rst)
        ch_3_t0_done<=0;
    else if (en_3 && target_3==0 && cnt_t0_3==ch_3_size)
        ch_3_t0_done<=1;

assign t0_done=ch_0_t0_done | ch_1_t0_done | ch_2_t0_done | ch_3_t0_done;

//for t0_rd and t0_wr
always @(posedge clk or negedge rst)
    if (!rst)
        t0_wr<=0;
    else if (s0_cs==S0_W_P)
        t0_wr<=1;
    else 
        t0_wr<=0;

always @(posedge clk or negedge rst)
    if (!rst)
        t0_rd<=0;
    else if (s0_cs==S0_R_M)
        t0_rd<=1;
    else 
        t0_rd<=0;

//for rd_addr_*
always @(posedge clk or negedge rst)
    if (!rst)
        rd_addr_0<=0;
    else if (en_0 && cnt_t0_0==0)
        rd_addr_0<=ch_0_sour;
    else if (en_0 && s0_cs==S0_R_M)
        rd_addr_0<=rd_addr_0+4;

always @(posedge clk or negedge rst)
    if (!rst)
        rd_addr_1<=0;
    else if (en_1 && cnt_t0_1==0)
        rd_addr_1<=ch_1_sour;
    else if (en_1 && s0_cs==S0_R_M)
        rd_addr_1<=rd_addr_1+4;

always @(posedge clk or negedge rst)
    if (!rst)
        rd_addr_2<=0;
    else if (en_2 && cnt_t0_2==0)
        rd_addr_2<=ch_2_sour;
    else if (en_2 && s0_cs==S0_R_M)
        rd_addr_2<=rd_addr_2+4;

always @(posedge clk or negedge rst)
    if (!rst)
        rd_addr_3<=0;
    else if (en_3 && cnt_t0_3==0)
        rd_addr_3<=ch_3_sour;
    else if (en_3 && s0_cs==S0_R_M)
        rd_addr_3<=rd_addr_3+4;


assign t0_rm_addr=(en_0)?rd_addr_0:
                  (en_1)?rd_addr_1:
                  (en_2)?rd_addr_2:
                  (en_3)?rd_addr_3:0;




assign t0_wp_addr=(en_0)?ch_0_dest:
                  (en_1)?ch_1_dest:
                  (en_2)?ch_2_dest:
                  (en_3)?ch_3_dest:0;

 //logic of direction 1 
reg [5:0] s1_cs;
reg [5:0] s1_ns;

parameter S1_IDLE   = 6'b000000;
parameter S1_R_P    = 6'b000001;
parameter S1_WAIT_R = 6'b000010;
parameter S1_W_M    = 6'b000100;
parameter S1_WAIT_W = 6'b001000;

assign ch0_t1_en=en_0==1 && target_0==1;
assign ch1_t1_en=en_1==1 && target_1==1;
assign ch2_t1_en=en_2==1 && target_2==1;
assign ch3_t1_en=en_3==1 && target_3==1;

assign peri_t1_req =(req_0 && ch0_t1_en && fifo_0_full==0) ||
                    (req_1 && ch1_t1_en && fifo_1_full==0) ||
                    (req_2 && ch2_t1_en && fifo_2_full==0) ||
                    (req_3 && ch3_t1_en && fifo_3_full==0) ; //req_* is highest priority,but if fifo is full,
                                                             // peri_t1_req is low
                                                                  
assign mem_t1_req=ch0_t1_en | ch1_t1_en | ch2_t1_en | ch3_t1_en; //????
                                                                      
always @(posedge clk or negedge rst)
    if (!rst)
        s1_cs<=S1_IDLE;
    else 
        s1_cs<=s1_ns;

always @(*)
    case (s1_cs)
        S1_IDLE: if (peri_t1_req)
                    s1_ns=S1_R_P;
                 else if (mem_t1_req)
                    s1_ns=S1_W_M;
                 else 
                    s1_ns=S1_IDLE;

        S1_R_P:  s1_ns=S1_WAIT_R;

        S1_WAIT_R: if (rd_en)
                        s1_ns=S1_IDLE;
                   else 
                        s1_ns=S1_WAIT_R;

        S1_W_M:  s1_ns=  S1_WAIT_W;

        S1_WAIT_W: if (hready_in)
                      s1_ns=S1_IDLE;
                   else 
                      s1_ns=  S1_WAIT_W;

        default : s1_ns=S1_IDLE;
    endcase 
//for t1_wr and t1_rd
always @(posedge clk or negedge rst)
    if (!rst)
        t1_wr<=0;
    else if (s1_cs==S1_W_M)
        t1_wr<=1;
    else 
        t1_wr<=0;

always @(posedge clk or negedge rst)
    if (!rst)
        t1_rd<=0;
    else if (s1_cs==S1_R_P)
        t1_rd<=1;
    else 
        t1_rd<=0;

always @(posedge clk or negedge rst)
    if (!rst) begin
        en_0_d<=0;
        en_1_d<=0;
        en_2_d<=0;
        en_3_d<=0;
    end
    else begin
        en_0_d<=en_0;
        en_1_d<=en_1;
        en_2_d<=en_2;
        en_3_d<=en_3;
    end

assign en_0_r=en_0 && (~en_0_d);
assign en_1_r=en_1 && (~en_1_d); 
assign en_2_r=en_2 && (~en_2_d);
assign en_3_r=en_3 && (~en_3_d);

always @(posedge clk or negedge rst)
    if (!rst) 
        en_0_r_d<=0;
    else if (en_0_r)
        en_0_r_d<=1;

always @(posedge clk or negedge rst)
    if (!rst) 
        en_1_r_d<=0;
    else if (en_1_r)
        en_1_r_d<=1;

always @(posedge clk or negedge rst)
    if (!rst) 
        en_2_r_d<=0;
    else if (en_2_r)
        en_2_r_d<=1;

always @(posedge clk or negedge rst)
    if (!rst) 
        en_3_r_d<=0;
    else if (en_3_r)
        en_3_r_d<=1;

always @(posedge clk or negedge rst)
    if (!rst)
        rd_addr_t1_0<=0;
    else if (en_0_r && (en_0_r_d==0) && (target_0==1) )
        rd_addr_t1_0<=ch_0_dest;
    else if (en_0 && s1_cs==S1_WAIT_W)
        rd_addr_t1_0<=rd_addr_t1_0+4;

always @(posedge clk or negedge rst)
    if (!rst)
        rd_addr_t1_1<=0;
    else if (en_1_r && (en_1_r_d==0) && (target_1==1) )
        rd_addr_t1_1<=ch_1_dest;
    else if (en_1 && s1_cs==S1_WAIT_W)
        rd_addr_t1_1<=rd_addr_t1_1+4;

always @(posedge clk or negedge rst)
    if (!rst)
        rd_addr_t1_2<=0;
    else if (en_2_r && (en_2_r_d==0) && (target_2==1) )
        rd_addr_t1_2<=ch_2_dest;
    else if (en_2 && s1_cs==S1_WAIT_W)
        rd_addr_t1_2<=rd_addr_t1_2+4;

always @(posedge clk or negedge rst)
    if (!rst)
        rd_addr_t1_3<=0;
    else if (en_3_r && (en_3_r_d==0) && (target_3==1) )
        rd_addr_t1_3<=ch_3_dest;
    else if (en_3 && s1_cs==S1_WAIT_W)
        rd_addr_t1_3<=rd_addr_t1_3+4;

assign t1_rp_addr=(en_0) ? ch_0_sour:(
                  (en_1) ? ch_1_sour:(
                  (en_2) ? ch_2_sour:(
                  (en_3) ? ch_3_sour: 0
              )
              )
              );





assign t1_wm_addr=(en_0) ? rd_addr_t1_0:(
                  (en_1) ? rd_addr_t1_1:(
                  (en_2) ? rd_addr_t1_2:(
                  (en_3) ? rd_addr_t1_3: 0
                  )
                  )
                  );


assign wr_fifo      =rd_en;//rd peri and wr into fifo
assign wr_fifo_data =rdata;
assign rd_fifo_t0   =s0_cs==S0_W_P;
assign rd_fifo_t1   =s1_cs==S1_W_M;
assign rd_fifo      =rd_fifo_t0 | rd_fifo_t1;

assign wr_fifo_0    =en_0 && wr_fifo;
assign rd_fifo_0    =en_0 && rd_fifo;
assign wr_fifo_data_0 = (en_0)? wr_fifo_data:0;

assign wr_fifo_1    =en_1 && wr_fifo;
assign rd_fifo_1    =en_1 && rd_fifo;
assign wr_fifo_data_1 = (en_1)? wr_fifo_data:0;

assign wr_fifo_2    =en_2 && wr_fifo;
assign rd_fifo_2    =en_2 && rd_fifo;
assign wr_fifo_data_2 = (en_2)? wr_fifo_data:0;


assign wr_fifo_3    =en_3 && wr_fifo;
assign rd_fifo_3    =en_3 && rd_fifo;
assign wr_fifo_data_3 = (en_3)? wr_fifo_data:0;

assign addr =(t0_rd)? t0_rm_addr:
             (t0_wr)? t0_wp_addr:
             (t1_rd)? t1_rp_addr:
             (t1_wr)? t1_wm_addr:0;

//assign wdata =(wr)?(
//              (en_0)?rd_fifo_data_0:
//              (en_1)?rd_fifo_data_1:
//              (en_2)?rd_fifo_data_2:
//              (en_3)?rd_fifo_data_3:0):
//              0;
assign wdata =(wr)?(
              (en_0)?rd_fifo_data_0:(
              (en_1)?rd_fifo_data_1:(
              (en_2)?rd_fifo_data_2:(
              (en_3)?rd_fifo_data_3:0
              )
              )
              )
              ):0;





assign  wr  =t0_wr |  t1_wr;
assign  rd  =t0_rd |  t1_rd;

assign req_done =(rd_en && t0_mt_done) || (rd_en && t0_done ) || 
                 (s0_cs==S0_WAIT_W && hready_in) || (s1_cs==S1_WAIT_R && rd_en)
                 || (s1_cs==S1_WAIT_W && hready_in);

endmodule
