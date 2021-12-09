//
// Verilog description for cell exmp3b, 
// 02/06/14 02:28:54
//
// Precision RTL Synthesis, 2013a.9//


module exmp3b ( sel, a, b, y ) ;

    input sel ;
    input [7:0]a ;
    input [7:0]b ;
    output [7:0]y ;

    wire sel_int;
    wire [7:0]a_int;
    wire [7:0]b_int;
    wire [7:0]y_dup_0;



    OBUF \y_obuf(0)  (.O (y[0]), .I (y_dup_0[0])) ;
    OBUF \y_obuf(1)  (.O (y[1]), .I (y_dup_0[1])) ;
    OBUF \y_obuf(2)  (.O (y[2]), .I (y_dup_0[2])) ;
    OBUF \y_obuf(3)  (.O (y[3]), .I (y_dup_0[3])) ;
    OBUF \y_obuf(4)  (.O (y[4]), .I (y_dup_0[4])) ;
    OBUF \y_obuf(5)  (.O (y[5]), .I (y_dup_0[5])) ;
    OBUF \y_obuf(6)  (.O (y[6]), .I (y_dup_0[6])) ;
    OBUF \y_obuf(7)  (.O (y[7]), .I (y_dup_0[7])) ;
    IBUF \b_ibuf(0)  (.O (b_int[0]), .I (b[0])) ;
    IBUF \b_ibuf(1)  (.O (b_int[1]), .I (b[1])) ;
    IBUF \b_ibuf(2)  (.O (b_int[2]), .I (b[2])) ;
    IBUF \b_ibuf(3)  (.O (b_int[3]), .I (b[3])) ;
    IBUF \b_ibuf(4)  (.O (b_int[4]), .I (b[4])) ;
    IBUF \b_ibuf(5)  (.O (b_int[5]), .I (b[5])) ;
    IBUF \b_ibuf(6)  (.O (b_int[6]), .I (b[6])) ;
    IBUF \b_ibuf(7)  (.O (b_int[7]), .I (b[7])) ;
    IBUF \a_ibuf(0)  (.O (a_int[0]), .I (a[0])) ;
    IBUF \a_ibuf(1)  (.O (a_int[1]), .I (a[1])) ;
    IBUF \a_ibuf(2)  (.O (a_int[2]), .I (a[2])) ;
    IBUF \a_ibuf(3)  (.O (a_int[3]), .I (a[3])) ;
    IBUF \a_ibuf(4)  (.O (a_int[4]), .I (a[4])) ;
    IBUF \a_ibuf(5)  (.O (a_int[5]), .I (a[5])) ;
    IBUF \a_ibuf(6)  (.O (a_int[6]), .I (a[6])) ;
    IBUF \a_ibuf(7)  (.O (a_int[7]), .I (a[7])) ;
    IBUF sel_ibuf (.O (sel_int), .I (sel)) ;
    LUT3 ix1388z1530 (.O (y_dup_0[7]), .I0 (sel_int), .I1 (a_int[7]), .I2 (
         b_int[7])) ;
         defparam ix1388z1530.INIT = 8'hD8;
    LUT3 ix2385z1530 (.O (y_dup_0[6]), .I0 (sel_int), .I1 (a_int[6]), .I2 (
         b_int[6])) ;
         defparam ix2385z1530.INIT = 8'hD8;
    LUT3 ix3382z1530 (.O (y_dup_0[5]), .I0 (sel_int), .I1 (a_int[5]), .I2 (
         b_int[5])) ;
         defparam ix3382z1530.INIT = 8'hD8;
    LUT3 ix4379z1530 (.O (y_dup_0[4]), .I0 (sel_int), .I1 (a_int[4]), .I2 (
         b_int[4])) ;
         defparam ix4379z1530.INIT = 8'hD8;
    LUT3 ix5376z1530 (.O (y_dup_0[3]), .I0 (sel_int), .I1 (a_int[3]), .I2 (
         b_int[3])) ;
         defparam ix5376z1530.INIT = 8'hD8;
    LUT3 ix6373z1530 (.O (y_dup_0[2]), .I0 (sel_int), .I1 (a_int[2]), .I2 (
         b_int[2])) ;
         defparam ix6373z1530.INIT = 8'hD8;
    LUT3 ix7370z1530 (.O (y_dup_0[1]), .I0 (sel_int), .I1 (a_int[1]), .I2 (
         b_int[1])) ;
         defparam ix7370z1530.INIT = 8'hD8;
    LUT3 ix8367z1530 (.O (y_dup_0[0]), .I0 (sel_int), .I1 (a_int[0]), .I2 (
         b_int[0])) ;
         defparam ix8367z1530.INIT = 8'hD8;
endmodule

