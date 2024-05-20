//this module is regard as ahb master 
`timescale 1ns / 10ps 
module dmac_ahb_ctrl(
    input clk,
    input rst,
    input wr,
    input rd,
    input [31:0]addr,
    input [31:0]wdata,
    output [31:0]rdata,
    output rd_en,
    output hsel,
  //  output hready,
    output [1:0]htrans,
    output [2:0]hsize,
    output hwrite,
    output [31:0]haddr,
    output reg [31:0]hwdata,
    input hreadyin,
    input hresp,
    input [31:0]hrdata
);
parameter IDLE = 3'b001;
parameter S0 = 3'b010;
parameter S1 = 3'b100; 
reg [31:0] addr_d;
reg [31:0] data_1d;
reg wr_d ;
reg wr_2d;
reg rd_d ;
reg [2:0] c_state;
reg [2:0] n_state;

always @(posedge clk or negedge rst) begin
    if(!rst) 
        c_state <= IDLE;
    else 
        c_state <= n_state;
end

always @(*) begin
    case (c_state)
        IDLE : begin
            if(wr||rd)begin
                n_state = S0;
                end else begin
                n_state = IDLE;
                end
            end
        S0 : begin
            n_state = S1;
            end
        S1 :begin
                if(hreadyin==1'b1 && (wr||rd))
                n_state = S0;
                else if(hreadyin==1'b1)
                n_state = IDLE;
                else 
                n_state = S1;
            end
        default: n_state = IDLE ;
        endcase
            end
reg rd_2d;
 always@(posedge clk or negedge rst) begin 
    if (!rst) begin
        wr_d <= 1'b0;
        wr_2d <= 1'b0;
        rd_d <= 1'b0;
        rd_2d<= 1'b0;
    end else begin
        wr_d <= wr;
        rd_d <= rd;
        wr_2d <=wr_d;
        rd_2d<= rd_d;
    end
end

always@(posedge clk or negedge rst) begin 
        if(!rst) begin
            addr_d<=32'h0;
            end else if(wr || rd) begin
            addr_d<=addr;
            end
        end

always@(posedge clk or negedge rst) begin 
    if(!rst) begin
        data_1d<=32'h0;
    end else if(wr) begin 
        data_1d<=wdata;
    end
end

assign hsel = (c_state==S0)||(c_state==S1 &&(wr_d || rd_d)) ;
assign htrans = ( hsel == 1'b1 )? 2'h2:2'h0;
assign hsize = ( hsel == 1'b1 )? 2'h2:2'h0;
assign hwrite =wr_d ;
assign haddr = ( hsel == 1'b1 )?addr_d:32'h0;
always@(posedge clk or negedge rst) begin
    if(!rst) begin
        hwdata<=32'h0;
    end else if(hsel) begin 
        hwdata<=data_1d;
    end 
    end 

//assign hready = 1'b1 ;
//assign rd_en = c_state == S1 && hreadyin==1'b1&& (~wr_2d);//hreadyin means slv is ok and can 
                                                          // accept a transfer


assign rd_en = c_state == S1 && hreadyin==1'b1&& (rd_2d);
//assign rd_en = c_state == S1 && hreadyin==1'b1&& (~wr_d);
assign rdata = (rd_en == 1'b1 ) ? hrdata : 32'h0; 
endmodule
