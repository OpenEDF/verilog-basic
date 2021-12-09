//
// Verilog description for cell exmp12_snip1, 
// 02/06/14 23:56:41
//
// Precision RTL Synthesis, 2013a.9//


module exmp12_snip1 ( clk, rstn, count ) ;

    input clk ;
    input rstn ;
    output [7:0]count ;

    wire \count_dup_0(5)  ;



    OBUF \count_obuf(0)  (.O (count[0]), .I (\count_dup_0(5)  )) ;
    OBUF \count_obuf(1)  (.O (count[1]), .I (\count_dup_0(5)  )) ;
    OBUF \count_obuf(2)  (.O (count[2]), .I (\count_dup_0(5)  )) ;
    OBUF \count_obuf(3)  (.O (count[3]), .I (\count_dup_0(5)  )) ;
    OBUF \count_obuf(4)  (.O (count[4]), .I (\count_dup_0(5)  )) ;
    OBUF \count_obuf(5)  (.O (count[5]), .I (\count_dup_0(5)  )) ;
    OBUF \count_obuf(6)  (.O (count[6]), .I (\count_dup_0(5)  )) ;
    OBUF \count_obuf(7)  (.O (count[7]), .I (\count_dup_0(5)  )) ;
    GND ps_gnd (.G (\count_dup_0(5)  )) ;
endmodule

