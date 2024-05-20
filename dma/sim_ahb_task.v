task AHB_SIGNLE_WR;
input [31:0] AHB_HADDR;
input [31:0] AHB_HWDATA;

begin 
repeat(1) @ (posedge hclk)
begin
    cpu_s_hsel <=1'b1;
    cpu_s_htrans<=2'b10;
    cpu_s_haddr<=AHB_HADDR;
    cpu_s_hburst<=0;
    cpu_s_hwrite<=1;
    cpu_s_hsize<=3'b010;
    cpu_s_hprot<=4'b1111;
end
$display ($time,"<WRITE START>");

repeat (1) @ (posedge hclk)
begin
wait (hreadyout_from_dmaslv == 1'b1) 
cpu_s_hwdata  <= AHB_HWDATA; 
cpu_s_hsel <= 1'b0 ;
cpu_s_htrans    <= 2'b00 ;  //IDLE     
cpu_s_haddr     <= 32'h0 ;          
cpu_s_hburst  <= 3'b000   ;//         
cpu_s_hwrite    <= 1'b0     ;//32       
cpu_s_hsize     <= 3'b010   ;//full func
cpu_s_hprot   <= 4'b1111;              
cpu_s_hbusreq <= 1'b0    ;          
end
repeat (1) @ (posedge hclk)
cpu_s_hwdata<=32'h0;
$display($time," <write done >");
end 
endtask

task AHB_IDLE ;
begin
cpu_s_hlock  <= 1'b0 ;               
cpu_s_htrans <= 2'b00  ;  //IDLE     
cpu_s_haddr  <= 32'h0000;            
cpu_s_hburst <= 3'b000 ;  //         
cpu_s_hwrite <= 1'b0 ;    //         
cpu_s_hbusreq  <= 1'b0  ;              
cpu_s_hsize    <= 3'b010  ; //32       
cpu_s_hprot    <= 4'b1111 ; //full func
cpu_s_hwdata   <= 32'h0000 ;           
end endtask

task AHB_SIGNLE_RD ;
input   [31:0] AHB_HADDR ;
output [31:0] AHB_HRDATA ;
begin
      repeat (1) @ (posedge hclk);
      begin
cpu_s_hsel       <= 1'b1     ;
cpu_s_htrans <= 2'b10      ;//N0NSEQ
cpu_s_haddr  <= AHB_HADDR ;          
cpu_s_hburst <= 3'b000    ;//signle 
cpu_s_hwrite <= 1'b0     ;//read   
cpu_s_hsize  <= 3'b010    ;//32     
cpu_s_hprot  <= 4'b1111 ;//full func
end   

repeat (1) @ (posedge hclk);
$display(" < read start >");
repeat (1) @ (posedge hclk);
begin
wait (hreadyout_from_dmaslv == 1'b1)
AHB_HRDATA = hrdata ;
cpu_s_hsel   <= 1'b0     ;           
cpu_s_htrans <= 2'b00     ;    
cpu_s_haddr    <= 32'h0000 ;           
cpu_s_hburst   <= 3'b000 ;           
cpu_s_hwrite   <= 1'b0    ;           
cpu_s_hsize    <= 3'b010   ;//32       
cpu_s_hprot  <= 4'b1111  ;//full func
cpu_s_hwdata <= 32'h0000 ;
cpu_s_hbusreq <= 1'b0      ;
$display($time, "<  write done >");
end
end
endtask
