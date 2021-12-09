//
// Verilog description for cell rotate_left_rfactor_times, 
// 10/01/13 21:02:02
//
// Precision RTL Synthesis, 2013a.9//


module rotate_left_rfactor_times ( data_in, rfactor, data_out ) ;

    input [7:0]data_in ;
    input [2:0]rfactor ;
    output [7:0]data_out ;

    wire [7:0]data_in_int;
    wire [2:0]rfactor_int;
    wire [7:0]data_out_dup_0;
    wire con_0_2, con_0_3, con_0_4, con_0_5, con_0_6, con_0_7, con_0_8, con_0_9, 
         con_1_4, con_1_5, con_1_6, con_1_7, con_1_8, con_1_9, con_1_10, 
         con_1_11;



    OBUF \data_out_obuf(0)  (.O (data_out[0]), .I (data_out_dup_0[0])) ;
    OBUF \data_out_obuf(1)  (.O (data_out[1]), .I (data_out_dup_0[1])) ;
    OBUF \data_out_obuf(2)  (.O (data_out[2]), .I (data_out_dup_0[2])) ;
    OBUF \data_out_obuf(3)  (.O (data_out[3]), .I (data_out_dup_0[3])) ;
    OBUF \data_out_obuf(4)  (.O (data_out[4]), .I (data_out_dup_0[4])) ;
    OBUF \data_out_obuf(5)  (.O (data_out[5]), .I (data_out_dup_0[5])) ;
    OBUF \data_out_obuf(6)  (.O (data_out[6]), .I (data_out_dup_0[6])) ;
    OBUF \data_out_obuf(7)  (.O (data_out[7]), .I (data_out_dup_0[7])) ;
    IBUF \rfactor_ibuf(0)  (.O (rfactor_int[0]), .I (rfactor[0])) ;
    IBUF \rfactor_ibuf(1)  (.O (rfactor_int[1]), .I (rfactor[1])) ;
    IBUF \rfactor_ibuf(2)  (.O (rfactor_int[2]), .I (rfactor[2])) ;
    IBUF \data_in_ibuf(0)  (.O (data_in_int[0]), .I (data_in[0])) ;
    IBUF \data_in_ibuf(1)  (.O (data_in_int[1]), .I (data_in[1])) ;
    IBUF \data_in_ibuf(2)  (.O (data_in_int[2]), .I (data_in[2])) ;
    IBUF \data_in_ibuf(3)  (.O (data_in_int[3]), .I (data_in[3])) ;
    IBUF \data_in_ibuf(4)  (.O (data_in_int[4]), .I (data_in[4])) ;
    IBUF \data_in_ibuf(5)  (.O (data_in_int[5]), .I (data_in[5])) ;
    IBUF \data_in_ibuf(6)  (.O (data_in_int[6]), .I (data_in[6])) ;
    IBUF \data_in_ibuf(7)  (.O (data_in_int[7]), .I (data_in[7])) ;
    LUT3 ix62628z1530 (.O (data_out_dup_0[7]), .I0 (rfactor_int[2]), .I1 (
         con_1_11), .I2 (con_1_7)) ;
         defparam ix62628z1530.INIT = 8'hD8;
    LUT3 ix61631z1530 (.O (data_out_dup_0[6]), .I0 (rfactor_int[2]), .I1 (
         con_1_10), .I2 (con_1_6)) ;
         defparam ix61631z1530.INIT = 8'hD8;
    LUT3 ix60634z1530 (.O (data_out_dup_0[5]), .I0 (rfactor_int[2]), .I1 (
         con_1_9), .I2 (con_1_5)) ;
         defparam ix60634z1530.INIT = 8'hD8;
    LUT3 ix59637z1516 (.O (data_out_dup_0[4]), .I0 (con_1_4), .I1 (con_1_8), .I2 (
         rfactor_int[2])) ;
         defparam ix59637z1516.INIT = 8'hCA;
    LUT3 ix58640z1530 (.O (data_out_dup_0[3]), .I0 (rfactor_int[2]), .I1 (
         con_1_7), .I2 (con_1_11)) ;
         defparam ix58640z1530.INIT = 8'hD8;
    LUT3 ix57643z1530 (.O (data_out_dup_0[2]), .I0 (rfactor_int[2]), .I1 (
         con_1_6), .I2 (con_1_10)) ;
         defparam ix57643z1530.INIT = 8'hD8;
    LUT3 ix56646z1530 (.O (data_out_dup_0[1]), .I0 (rfactor_int[2]), .I1 (
         con_1_5), .I2 (con_1_9)) ;
         defparam ix56646z1530.INIT = 8'hD8;
    LUT3 ix55649z1486 (.O (data_out_dup_0[0]), .I0 (con_1_4), .I1 (con_1_8), .I2 (
         rfactor_int[2])) ;
         defparam ix55649z1486.INIT = 8'hAC;
    LUT3 ix61631z1532 (.O (con_0_2), .I0 (rfactor_int[0]), .I1 (data_in_int[1])
         , .I2 (data_in_int[2])) ;
         defparam ix61631z1532.INIT = 8'hD8;
    LUT3 ix62628z1533 (.O (con_0_3), .I0 (rfactor_int[0]), .I1 (data_in_int[2])
         , .I2 (data_in_int[3])) ;
         defparam ix62628z1533.INIT = 8'hD8;
    LUT3 ix61631z1535 (.O (con_0_4), .I0 (rfactor_int[0]), .I1 (data_in_int[3])
         , .I2 (data_in_int[4])) ;
         defparam ix61631z1535.INIT = 8'hD8;
    LUT3 ix62628z1535 (.O (con_0_5), .I0 (rfactor_int[0]), .I1 (data_in_int[4])
         , .I2 (data_in_int[5])) ;
         defparam ix62628z1535.INIT = 8'hD8;
    LUT3 ix61631z1536 (.O (con_0_6), .I0 (rfactor_int[0]), .I1 (data_in_int[5])
         , .I2 (data_in_int[6])) ;
         defparam ix61631z1536.INIT = 8'hD8;
    LUT3 ix62628z1536 (.O (con_0_7), .I0 (rfactor_int[0]), .I1 (data_in_int[6])
         , .I2 (data_in_int[7])) ;
         defparam ix62628z1536.INIT = 8'hD8;
    LUT3 ix61631z1489 (.O (con_0_8), .I0 (data_in_int[7]), .I1 (data_in_int[0])
         , .I2 (rfactor_int[0])) ;
         defparam ix61631z1489.INIT = 8'hAC;
    LUT3 ix62628z1518 (.O (con_0_9), .I0 (data_in_int[1]), .I1 (data_in_int[0])
         , .I2 (rfactor_int[0])) ;
         defparam ix62628z1518.INIT = 8'hCA;
    LUT3 ix59637z1531 (.O (con_1_4), .I0 (rfactor_int[1]), .I1 (con_0_2), .I2 (
         con_0_4)) ;
         defparam ix59637z1531.INIT = 8'hD8;
    LUT3 ix60634z1532 (.O (con_1_5), .I0 (rfactor_int[1]), .I1 (con_0_3), .I2 (
         con_0_5)) ;
         defparam ix60634z1532.INIT = 8'hD8;
    LUT3 ix61631z1534 (.O (con_1_6), .I0 (rfactor_int[1]), .I1 (con_0_4), .I2 (
         con_0_6)) ;
         defparam ix61631z1534.INIT = 8'hD8;
    LUT3 ix62628z1534 (.O (con_1_7), .I0 (rfactor_int[1]), .I1 (con_0_5), .I2 (
         con_0_7)) ;
         defparam ix62628z1534.INIT = 8'hD8;
    LUT3 ix59637z1488 (.O (con_1_8), .I0 (con_0_6), .I1 (con_0_8), .I2 (
         rfactor_int[1])) ;
         defparam ix59637z1488.INIT = 8'hAC;
    LUT3 ix60634z1531 (.O (con_1_9), .I0 (rfactor_int[1]), .I1 (con_0_7), .I2 (
         con_0_9)) ;
         defparam ix60634z1531.INIT = 8'hD8;
    LUT3 ix61631z1517 (.O (con_1_10), .I0 (con_0_2), .I1 (con_0_8), .I2 (
         rfactor_int[1])) ;
         defparam ix61631z1517.INIT = 8'hCA;
    LUT3 ix62628z1531 (.O (con_1_11), .I0 (rfactor_int[1]), .I1 (con_0_9), .I2 (
         con_0_3)) ;
         defparam ix62628z1531.INIT = 8'hD8;
endmodule

