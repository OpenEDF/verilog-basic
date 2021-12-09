//
// Verilog description for cell reverse_bits, 
// 10/05/13 15:08:32
//
// Precision RTL Synthesis, 2013a.9//


module reverse_bits ( data_in, data_out ) ;

    input [7:0]data_in ;
    output [7:0]data_out ;

    wire [7:0]data_in_int;



    OBUF \data_out_obuf(0)  (.O (data_out[0]), .I (data_in_int[7])) ;
    OBUF \data_out_obuf(1)  (.O (data_out[1]), .I (data_in_int[6])) ;
    OBUF \data_out_obuf(2)  (.O (data_out[2]), .I (data_in_int[5])) ;
    OBUF \data_out_obuf(3)  (.O (data_out[3]), .I (data_in_int[4])) ;
    OBUF \data_out_obuf(4)  (.O (data_out[4]), .I (data_in_int[3])) ;
    OBUF \data_out_obuf(5)  (.O (data_out[5]), .I (data_in_int[2])) ;
    OBUF \data_out_obuf(6)  (.O (data_out[6]), .I (data_in_int[1])) ;
    OBUF \data_out_obuf(7)  (.O (data_out[7]), .I (data_in_int[0])) ;
    IBUF \data_in_ibuf(0)  (.O (data_in_int[0]), .I (data_in[0])) ;
    IBUF \data_in_ibuf(1)  (.O (data_in_int[1]), .I (data_in[1])) ;
    IBUF \data_in_ibuf(2)  (.O (data_in_int[2]), .I (data_in[2])) ;
    IBUF \data_in_ibuf(3)  (.O (data_in_int[3]), .I (data_in[3])) ;
    IBUF \data_in_ibuf(4)  (.O (data_in_int[4]), .I (data_in[4])) ;
    IBUF \data_in_ibuf(5)  (.O (data_in_int[5]), .I (data_in[5])) ;
    IBUF \data_in_ibuf(6)  (.O (data_in_int[6]), .I (data_in[6])) ;
    IBUF \data_in_ibuf(7)  (.O (data_in_int[7]), .I (data_in[7])) ;
endmodule

