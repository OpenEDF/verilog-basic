module dmac_fifo(
    input clk,
    input rst,
    input clear,
    input wr,
    input rd,
    input [31:0]wdata,

    output reg [31:0]rdata ,
    output full,
    output empty
);
parameter n=7;
//reg [31:0]mem [0:1023];//1k ,equal to [31:0]mem [1023:0]
reg [31:0]mem [0:n];
reg [9:0]wr_ptr;
reg [9:0]rd_ptr;
reg full_internal;
reg empty_internal;

always @(posedge clk or negedge rst)
    if (!rst)
        wr_ptr<=0;
    else if (clear)
        wr_ptr<=0;
    else if (wr)
        wr_ptr<=wr_ptr+1;

always @(posedge clk or negedge rst)
    if (!rst)
        rd_ptr<=0;
    else if (clear)
        rd_ptr<=0;
    else if (rd)
        rd_ptr<=rd_ptr+1;

always @(posedge clk)
    if (wr)
        mem[wr_ptr]<=wdata;

always @(posedge clk or negedge rst)
    if (!rst)
        rdata<=0;
    else if (rd)
        rdata<=mem[rd_ptr];

always @(posedge clk or negedge rst)
    if (!rst)
        full_internal<=0;
    else if (wr && (wr_ptr+1==rd_ptr) && (~rd) || wr_ptr==n && rd_ptr==0 )
        full_internal<=1;
    else if (rd && (~wr))//if rd is valid which means one data is out and fifo is not full 
        full_internal<=0;

assign full=full_internal || (wr && (wr_ptr+1==rd_ptr) && (~rd));

always @(posedge clk or negedge rst)
    if (!rst)
        empty_internal<=1;
    else if (rd && (rd_ptr+1==wr_ptr) && (~wr))
        empty_internal<=1;
    else if (wr && (~rd)) 
        empty_internal<=0;

assign empty=empty_internal || (rd && (rd_ptr+1==wr_ptr) && (~wr));

endmodule
