//
// Verilog description for cell always_ff_test, 
// 02/06/14 02:29:35
//
// Precision RTL Synthesis, 2013a.9//


module always_ff_test ( a, b, c, out ) ;

    input a ;
    input b ;
    input c ;
    output out ;

    wire a_int, b_int, c_int, out_dup_0;



    OBUF out_obuf (.O (out), .I (out_dup_0)) ;
    IBUF c_ibuf (.O (c_int), .I (c)) ;
    IBUF b_ibuf (.O (b_int), .I (b)) ;
    IBUF a_ibuf (.O (a_int), .I (a)) ;
    LUT3 ix9881z1530 (.O (out_dup_0), .I0 (a_int), .I1 (b_int), .I2 (c_int)) ;
         defparam ix9881z1530.INIT = 8'hD8;
endmodule

