//
// Verilog description for cell serial_to_parallel, 
// 09/29/13 06:24:54
//
// Precision RTL Synthesis, 2013a.9//


module serial_to_parallel ( clk, rstN, shift_enable, serial_in, data_out ) ;

    input clk ;
    input rstN ;
    input shift_enable ;
    input serial_in ;
    output [7:0]data_out ;

    wire [7:7]data_out_dup_0;



    OBUF \data_out_obuf(0)  (.O (data_out[0]), .I (data_out_dup_0[7])) ;
    OBUF \data_out_obuf(1)  (.O (data_out[1]), .I (data_out_dup_0[7])) ;
    OBUF \data_out_obuf(2)  (.O (data_out[2]), .I (data_out_dup_0[7])) ;
    OBUF \data_out_obuf(3)  (.O (data_out[3]), .I (data_out_dup_0[7])) ;
    OBUF \data_out_obuf(4)  (.O (data_out[4]), .I (data_out_dup_0[7])) ;
    OBUF \data_out_obuf(5)  (.O (data_out[5]), .I (data_out_dup_0[7])) ;
    OBUF \data_out_obuf(6)  (.O (data_out[6]), .I (data_out_dup_0[7])) ;
    OBUF \data_out_obuf(7)  (.O (data_out[7]), .I (data_out_dup_0[7])) ;
    GND \data_out(7)_rename_rename  (.G (data_out_dup_0[7])) ;
endmodule

