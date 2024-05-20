`timescale 1ns / 10ps 
module dmac_intf(
    input        HCLK       , 
    input        HRESETn    , 
    input        HSEL       , 
    input        HREADY     ,// hreadyin
    input[1:0]   HTRANS     , 
    input[2:0]   HSIZE      , 
    input        HWRITE     , 
    input[31:0]  HADDR      , 
    input[31:0]  HWDATA     , 
    output       HREADYOUT  , 
    output       HRESP      , 
    output reg [31:0] HRDATA,
    output       ch_0_en    , 
    output       ch_0_target,  
    output[9: 0] ch_0_size    , 
    output       ch_1_en    , 
    output       ch_1_target, 
    output[9: 0] ch_1_size    , 
    output       ch_2_en    , 
    output       ch_2_target,  
    output[9: 0] ch_2_size  , 
    output       ch_3_en    , 
    output       ch_3_target,  
    output[9: 0] ch_3_size ,
    output reg [31:0] ch_0_sour ,  
    output reg [31:0] ch_0_dest ,  
    output reg [31:0] ch_1_sour ,  
    output reg [31:0] ch_1_dest ,  
    output reg [31:0] ch_2_sour ,
    output reg [31:0] ch_2_dest ,
    output reg [31:0] ch_3_sour ,
    output reg [31:0] ch_3_dest  
);
parameter BASE_ADDR = 32'h40000000;
wire       ahb_access ;     
wire       ahb_read   ;     
reg        ahb_write   ;   
reg [31:0] haddr_d      ;  
reg [31:0] ch_0_ctrl      ;
reg [31:0] ch_1_ctrl      ;
reg [31:0] ch_2_ctrl      ;
reg [31:0] ch_3_ctrl      ;
wire       ch_0_ctrl_wr ;     
wire       ch_0_sour_wr ;  
wire       ch_0_dest_wr ;  
wire       ch_1_ctrl_wr ;  
wire       ch_1_sour_wr ;  
wire       ch_1_dest_wr ;     
wire       ch_2_ctrl_wr ;  
wire       ch_2_sour_wr ;  
wire       ch_2_dest_wr ;
wire       ch_3_ctrl_wr ;
wire       ch_3_sour_wr ;
wire       ch_3_dest_wr ;
//Read/write control Logic //
assign ahb_access = HTRANS[1] & HSEL & HREADY ;
assign ahb_read = ahb_access & (~HWRITE ) ;

always@(posedge HCLK or negedge HRESETn) begin
if(!HRESETn)begin
ahb_write <= 1'b0;
end else begin
ahb_write <= ahb_access & HWRITE ;
end
end

always@(posedge HCLK or negedge HRESETn) begin
if(!HRESETn) begin
haddr_d <= 32'h0 ;
end else if(ahb_access & HWRITE) begin
haddr_d <= HADDR ;
end
end

assign ch_0_ctrl_wr = (ahb_write==1'b1)&&(haddr_d==BASE_ADDR+0);
assign ch_0_sour_wr = (ahb_write==1'b1)&&(haddr_d==BASE_ADDR+4);
assign ch_0_dest_wr = (ahb_write==1'b1)&&(haddr_d==BASE_ADDR+8);
assign ch_1_ctrl_wr = (ahb_write==1'b1)&&(haddr_d==BASE_ADDR+12); 
assign ch_1_sour_wr = (ahb_write==1'b1)&&(haddr_d==BASE_ADDR+16); 
assign ch_1_dest_wr = (ahb_write==1'b1)&&(haddr_d==BASE_ADDR+20); 
assign ch_2_ctrl_wr = (ahb_write==1'b1)&&(haddr_d==BASE_ADDR+24); 
assign ch_2_sour_wr = (ahb_write==1'b1)&&(haddr_d==BASE_ADDR+28); 
assign ch_2_dest_wr = (ahb_write==1'b1)&&(haddr_d==BASE_ADDR+32); 
assign ch_3_ctrl_wr = (ahb_write==1'b1)&&(haddr_d==BASE_ADDR+36); 
assign ch_3_sour_wr = (ahb_write==1'b1)&&(haddr_d==BASE_ADDR+40); 
assign ch_3_dest_wr = (ahb_write==1'b1)&&(haddr_d==BASE_ADDR+44); 

always@(posedge HCLK or negedge HRESETn) begin
if(!HRESETn) begin
ch_0_ctrl<=32'h0;
end else if(ch_0_ctrl_wr) begin
ch_0_ctrl<= HWDATA;
end
end

always@(posedge HCLK or negedge HRESETn) begin
if(!HRESETn) begin
ch_0_sour<=32'h0 ;
end else if(ch_0_sour_wr) begin
ch_0_sour<= HWDATA ;
end
end

always@(posedge HCLK or negedge HRESETn) begin
if(!HRESETn) begin
ch_0_dest<=32'h0 ;
end else if(ch_0_dest_wr) begin 
ch_0_dest<= HWDATA ;
end
end

always@(posedge HCLK or negedge HRESETn) begin 
if(!HRESETn) begin 
ch_1_ctrl<=32'h0;
end else if(ch_1_ctrl_wr) 
begin ch_1_ctrl<= HWDATA;
end
end

always@(posedge HCLK or negedge HRESETn) 
begin if(!HRESETn) begin 
ch_1_sour<=32'h0 ;
end else if(ch_1_sour_wr) begin 
ch_1_sour<= HWDATA ;
end
end

always@(posedge HCLK or negedge HRESETn) begin 
    if(!HRESETn) begin 
        ch_1_dest<=32'h0 ;
end 
else if(ch_1_dest_wr) begin 
    ch_1_dest<= HWDATA ;
end
end

always@(posedge HCLK or negedge HRESETn) begin
if(!HRESETn) begin
ch_2_ctrl<=32'h0;
end else if(ch_2_ctrl_wr) begin
ch_2_ctrl<=HWDATA;
end
end
always@(posedge HCLK or negedge HRESETn) begin
if(!HRESETn) begin
ch_2_sour<=32'h0 ;
end else if(ch_2_sour_wr) begin
ch_2_sour<= HWDATA ;
end
end

always@(posedge HCLK or negedge HRESETn) begin
if(!HRESETn) begin
ch_2_dest<=32'h0 ;
end else if(ch_2_dest_wr) begin
ch_2_dest<= HWDATA ;
end
end

always@(posedge HCLK or negedge HRESETn) begin
if(!HRESETn) begin
ch_3_ctrl<=32'h0;
end 
else if(ch_3_ctrl_wr) begin
ch_3_ctrl<= HWDATA;
end end

always@(posedge HCLK or negedge HRESETn) 
begin if(!HRESETn) begin
ch_3_sour<=32'h0 ;
end else if(ch_3_sour_wr) begin
ch_3_sour<= HWDATA ;
end end

always@(posedge HCLK or negedge HRESETn) 
begin if(!HRESETn) begin
ch_3_dest<=32'h0 ;
end else if(ch_3_dest_wr) begin
ch_3_dest<= HWDATA ;
end
end

assign ch_0_en = ch_0_ctrl[0] ;
assign ch_0_target= ch_0_ctrl[4] ;//0:m>>p 1:p>>m
assign ch_0_size = ch_0_ctrl[17:8] ;//transfer times, one time== 32bits 
assign ch_1_en = ch_1_ctrl[0] ;
assign ch_1_target= ch_1_ctrl[4] ;
assign ch_1_size = ch_1_ctrl[17:8] ;
assign ch_2_en = ch_2_ctrl[0] ;
assign ch_2_target= ch_2_ctrl[4] ;
assign ch_2_size = ch_2_ctrl[17:8] ;
assign ch_3_en = ch_3_ctrl[0] ;
assign ch_3_target= ch_3_ctrl[4] ;
assign ch_3_size = ch_3_ctrl[17:8] ;

always@(posedge HCLK or negedge HRESETn)begin
    if(!HRESETn) begin
        HRDATA <= 32'h0;
    end else if(ahb_read==1'b1 && HADDR==BASE_ADDR+0 )begin
        HRDATA <= ch_0_ctrl;
    end else if(ahb_read==1'b1 && HADDR==BASE_ADDR+4 )begin
        HRDATA <= ch_0_sour;
    end else if(ahb_read==1'b1 && HADDR==BASE_ADDR+8 )begin
        HRDATA <= ch_0_dest;
    end else if(ahb_read==1'b1 && HADDR==BASE_ADDR+12)begin
        HRDATA <= ch_0_ctrl;
    end else if(ahb_read==1'b1 && HADDR==BASE_ADDR+16)begin
        HRDATA <= ch_1_sour;
    end else if(ahb_read==1'b1 && HADDR==BASE_ADDR+20)begin
        HRDATA <= ch_1_dest;
    end else if(ahb_read==1'b1 && HADDR==BASE_ADDR+24)begin
        HRDATA <= ch_2_ctrl;
    end else if(ahb_read==1'b1 && HADDR==BASE_ADDR+28)begin
        HRDATA <= ch_2_sour;
    end else if(ahb_read==1'b1 && HADDR==BASE_ADDR+32)begin
        HRDATA <= ch_2_dest;
    end else if(ahb_read==1'b1 && HADDR==BASE_ADDR+36)begin
        HRDATA <= ch_3_ctrl;
    end else if(ahb_read==1'b1 && HADDR==BASE_ADDR+40)begin 
        HRDATA <= ch_3_sour;
    end else if(ahb_read==1'b1 && HADDR==BASE_ADDR+44)begin 
        HRDATA <= ch_3_dest;
    end
end
assign HRESP = 0;
assign HREADYOUT = 1;
endmodule
