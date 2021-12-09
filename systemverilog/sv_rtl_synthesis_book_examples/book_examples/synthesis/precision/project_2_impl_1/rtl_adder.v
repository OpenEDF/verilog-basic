//
// Verilog description for cell rtl_adder, 
// 08/04/16 11:14:32
//
// Precision RTL Synthesis , 64-bit 2016.1.0.15//


module rtl_adder ( a, b, ci, sum, co ) ;

    input a ;
    input b ;
    input ci ;
    output sum ;
    output co ;

    wire a_int, b_int, ci_int, sum_dup_0, co_dup_0;



    OBUF co_obuf (.O (co), .I (co_dup_0)) ;
    OBUF sum_obuf (.O (sum), .I (sum_dup_0)) ;
    IBUF ci_ibuf (.O (ci_int), .I (ci)) ;
    IBUF b_ibuf (.O (b_int), .I (b)) ;
    IBUF a_ibuf (.O (a_int), .I (a)) ;
    LUT3 ix21384z1464 (.O (sum_dup_0), .I0 (ci_int), .I1 (a_int), .I2 (b_int)) ;
         defparam ix21384z1464.INIT = 8'h96;
    LUT3 ix40455z1546 (.O (co_dup_0), .I0 (a_int), .I1 (b_int), .I2 (ci_int)) ;
         defparam ix40455z1546.INIT = 8'hE8;
endmodule

