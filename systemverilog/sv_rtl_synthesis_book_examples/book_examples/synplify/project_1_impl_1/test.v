//
// Verilog description for cell test, 
// 02/08/14 01:16:32
//
// Precision RTL Synthesis, 2013a.9//


module test ( i_clk, o_clk, rd_ptr, wr_ptr, data_in, data_out ) ;

    input i_clk ;
    input o_clk ;
    input [4:0]rd_ptr ;
    input [4:0]wr_ptr ;
    input [7:0]data_in ;
    output [7:0]data_out ;

    wire [7:0]data_out_dup_0;
    wire i_clk_int, o_clk_int;
    wire [4:0]rd_ptr_int;
    wire [4:0]wr_ptr_int;
    wire [7:0]data_in_int;
    wire [27:0] \$dummy ;




    ram_dq_8_0 storage (.wr_data1 ({data_in_int[7],data_in_int[6],data_in_int[5]
               ,data_in_int[4],data_in_int[3],data_in_int[2],data_in_int[1],
               data_in_int[0]}), .rd_data1 ({\$dummy [0],\$dummy [1],\$dummy [2]
               ,\$dummy [3],\$dummy [4],\$dummy [5],\$dummy [6],\$dummy [7]}), .addr1 (
               {wr_ptr_int[4],wr_ptr_int[3],wr_ptr_int[2],wr_ptr_int[1],
               wr_ptr_int[0]}), .wr_clk1 (i_clk_int), .rd_clk1 (\$dummy [8]), .wr_ena1 (
               \$dummy [9]), .rd_ena1 (\$dummy [10]), .ena1 (\$dummy [11]), .rst1 (
               \$dummy [12]), .regce1 (\$dummy [13]), .wr_data2 ({\$dummy [14],
               \$dummy [15],\$dummy [16],\$dummy [17],\$dummy [18],\$dummy [19],
               \$dummy [20],\$dummy [21]}), .rd_data2 ({data_out_dup_0[7],
               data_out_dup_0[6],data_out_dup_0[5],data_out_dup_0[4],
               data_out_dup_0[3],data_out_dup_0[2],data_out_dup_0[1],
               data_out_dup_0[0]}), .addr2 ({rd_ptr_int[4],rd_ptr_int[3],
               rd_ptr_int[2],rd_ptr_int[1],rd_ptr_int[0]}), .wr_clk2 (
               \$dummy [22]), .rd_clk2 (o_clk_int), .wr_ena2 (\$dummy [23]), .rd_ena2 (
               \$dummy [24]), .ena2 (\$dummy [25]), .rst2 (\$dummy [26]), .regce2 (
               \$dummy [27])) ;
    OBUF \data_out_obuf(0)  (.O (data_out[0]), .I (data_out_dup_0[0])) ;
    OBUF \data_out_obuf(1)  (.O (data_out[1]), .I (data_out_dup_0[1])) ;
    OBUF \data_out_obuf(2)  (.O (data_out[2]), .I (data_out_dup_0[2])) ;
    OBUF \data_out_obuf(3)  (.O (data_out[3]), .I (data_out_dup_0[3])) ;
    OBUF \data_out_obuf(4)  (.O (data_out[4]), .I (data_out_dup_0[4])) ;
    OBUF \data_out_obuf(5)  (.O (data_out[5]), .I (data_out_dup_0[5])) ;
    OBUF \data_out_obuf(6)  (.O (data_out[6]), .I (data_out_dup_0[6])) ;
    OBUF \data_out_obuf(7)  (.O (data_out[7]), .I (data_out_dup_0[7])) ;
    IBUF \data_in_ibuf(0)  (.O (data_in_int[0]), .I (data_in[0])) ;
    IBUF \data_in_ibuf(1)  (.O (data_in_int[1]), .I (data_in[1])) ;
    IBUF \data_in_ibuf(2)  (.O (data_in_int[2]), .I (data_in[2])) ;
    IBUF \data_in_ibuf(3)  (.O (data_in_int[3]), .I (data_in[3])) ;
    IBUF \data_in_ibuf(4)  (.O (data_in_int[4]), .I (data_in[4])) ;
    IBUF \data_in_ibuf(5)  (.O (data_in_int[5]), .I (data_in[5])) ;
    IBUF \data_in_ibuf(6)  (.O (data_in_int[6]), .I (data_in[6])) ;
    IBUF \data_in_ibuf(7)  (.O (data_in_int[7]), .I (data_in[7])) ;
    IBUF \wr_ptr_ibuf(0)  (.O (wr_ptr_int[0]), .I (wr_ptr[0])) ;
    IBUF \wr_ptr_ibuf(1)  (.O (wr_ptr_int[1]), .I (wr_ptr[1])) ;
    IBUF \wr_ptr_ibuf(2)  (.O (wr_ptr_int[2]), .I (wr_ptr[2])) ;
    IBUF \wr_ptr_ibuf(3)  (.O (wr_ptr_int[3]), .I (wr_ptr[3])) ;
    IBUF \wr_ptr_ibuf(4)  (.O (wr_ptr_int[4]), .I (wr_ptr[4])) ;
    IBUF \rd_ptr_ibuf(0)  (.O (rd_ptr_int[0]), .I (rd_ptr[0])) ;
    IBUF \rd_ptr_ibuf(1)  (.O (rd_ptr_int[1]), .I (rd_ptr[1])) ;
    IBUF \rd_ptr_ibuf(2)  (.O (rd_ptr_int[2]), .I (rd_ptr[2])) ;
    IBUF \rd_ptr_ibuf(3)  (.O (rd_ptr_int[3]), .I (rd_ptr[3])) ;
    IBUF \rd_ptr_ibuf(4)  (.O (rd_ptr_int[4]), .I (rd_ptr[4])) ;
    BUFGP i_clk_ibuf (.O (i_clk_int), .I (i_clk)) ;
    BUFGP o_clk_ibuf (.O (o_clk_int), .I (o_clk)) ;
endmodule


module ram_dq_8_0 ( wr_data1, rd_data1, addr1, wr_clk1, rd_clk1, wr_ena1, 
                    rd_ena1, ena1, rst1, regce1, wr_data2, rd_data2, addr2, 
                    wr_clk2, rd_clk2, wr_ena2, rd_ena2, ena2, rst2, regce2 ) ;

    input [7:0]wr_data1 ;
    output [7:0]rd_data1 ;
    input [4:0]addr1 ;
    input wr_clk1 ;
    input rd_clk1 ;
    input wr_ena1 ;
    input rd_ena1 ;
    input ena1 ;
    input rst1 ;
    input regce1 ;
    input [7:0]wr_data2 ;
    output [7:0]rd_data2 ;
    input [4:0]addr2 ;
    input wr_clk2 ;
    input rd_clk2 ;
    input wr_ena2 ;
    input rd_ena2 ;
    input ena2 ;
    input rst2 ;
    input regce2 ;

    wire rst1_rename2, wr_ena1_rename3;
    wire [7:0] \$dummy ;




    GND ps_gnd (.G (rst1_rename2)) ;
    RAMB4_S8_S8 storage_1 (.DOA ({\$dummy [0],\$dummy [1],\$dummy [2],
                \$dummy [3],\$dummy [4],\$dummy [5],\$dummy [6],\$dummy [7]}), .DOB (
                {rd_data2[7],rd_data2[6],rd_data2[5],rd_data2[4],rd_data2[3],
                rd_data2[2],rd_data2[1],rd_data2[0]}), .WEA (wr_ena1_rename3), .RSTA (
                rst1_rename2), .ENA (wr_ena1_rename3), .CLKA (wr_clk1), .WEB (
                rst1_rename2), .RSTB (rst1_rename2), .ENB (wr_ena1_rename3), .CLKB (
                rd_clk2), .ADDRA ({rst1_rename2,rst1_rename2,rst1_rename2,
                rst1_rename2,addr1[4],addr1[3],addr1[2],addr1[1],addr1[0]}), .DIA (
                {wr_data1[7],wr_data1[6],wr_data1[5],wr_data1[4],wr_data1[3],
                wr_data1[2],wr_data1[1],wr_data1[0]}), .ADDRB ({rst1_rename2,
                rst1_rename2,rst1_rename2,rst1_rename2,addr2[4],addr2[3],
                addr2[2],addr2[1],addr2[0]}), .DIB ({rst1_rename2,rst1_rename2,
                rst1_rename2,rst1_rename2,rst1_rename2,rst1_rename2,rst1_rename2
                ,rst1_rename2})) ;
    VCC ps_vcc (.P (wr_ena1_rename3)) ;
endmodule

