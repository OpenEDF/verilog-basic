//
// Verilog description for cell multiply_by_power_of_two, 
// 09/30/13 11:13:35
//
// Precision RTL Synthesis, 2013a.9//


module multiply_by_power_of_two ( data_in, base2exp, data_out ) ;

    input [7:0]data_in ;
    input [2:0]base2exp ;
    output [7:0]data_out ;

    wire [7:0]data_in_int;
    wire [2:0]base2exp_int;
    wire [7:0]data_out_dup_0;
    wire nx57643z1, nx62628z2, nx61631z5, nx62628z3, nx61631z2, nx60634z2, 
         nx62628z1, nx59637z1, nx59637z2, nx61631z3, nx59637z3, nx62628z4, 
         nx60634z1, nx60634z3, nx61631z1, nx61631z4, nx62628z5, nx62628z6;



    OBUF \data_out_obuf(0)  (.O (data_out[0]), .I (data_out_dup_0[0])) ;
    OBUF \data_out_obuf(1)  (.O (data_out[1]), .I (data_out_dup_0[1])) ;
    OBUF \data_out_obuf(2)  (.O (data_out[2]), .I (data_out_dup_0[2])) ;
    OBUF \data_out_obuf(3)  (.O (data_out[3]), .I (data_out_dup_0[3])) ;
    OBUF \data_out_obuf(4)  (.O (data_out[4]), .I (data_out_dup_0[4])) ;
    OBUF \data_out_obuf(5)  (.O (data_out[5]), .I (data_out_dup_0[5])) ;
    OBUF \data_out_obuf(6)  (.O (data_out[6]), .I (data_out_dup_0[6])) ;
    OBUF \data_out_obuf(7)  (.O (data_out[7]), .I (data_out_dup_0[7])) ;
    IBUF \base2exp_ibuf(0)  (.O (base2exp_int[0]), .I (base2exp[0])) ;
    IBUF \base2exp_ibuf(1)  (.O (base2exp_int[1]), .I (base2exp[1])) ;
    IBUF \base2exp_ibuf(2)  (.O (base2exp_int[2]), .I (base2exp[2])) ;
    IBUF \data_in_ibuf(0)  (.O (data_in_int[0]), .I (data_in[0])) ;
    IBUF \data_in_ibuf(1)  (.O (data_in_int[1]), .I (data_in[1])) ;
    IBUF \data_in_ibuf(2)  (.O (data_in_int[2]), .I (data_in[2])) ;
    IBUF \data_in_ibuf(3)  (.O (data_in_int[3]), .I (data_in[3])) ;
    IBUF \data_in_ibuf(4)  (.O (data_in_int[4]), .I (data_in[4])) ;
    IBUF \data_in_ibuf(5)  (.O (data_in_int[5]), .I (data_in[5])) ;
    IBUF \data_in_ibuf(6)  (.O (data_in_int[6]), .I (data_in[6])) ;
    IBUF \data_in_ibuf(7)  (.O (data_in_int[7]), .I (data_in[7])) ;
    LUT3 ix62628z1562 (.O (data_out_dup_0[7]), .I0 (nx62628z1), .I1 (
         base2exp_int[2]), .I2 (nx62628z4)) ;
         defparam ix62628z1562.INIT = 8'hF8;
    LUT3 ix61631z1516 (.O (data_out_dup_0[6]), .I0 (nx61631z1), .I1 (nx61631z4)
         , .I2 (base2exp_int[2])) ;
         defparam ix61631z1516.INIT = 8'hCA;
    LUT3 ix60634z1516 (.O (data_out_dup_0[5]), .I0 (nx60634z1), .I1 (nx60634z3)
         , .I2 (base2exp_int[1])) ;
         defparam ix60634z1516.INIT = 8'hCA;
    LUT4 ix59637z1059 (.O (data_out_dup_0[4]), .I0 (base2exp_int[2]), .I1 (
         nx59637z1), .I2 (nx59637z2), .I3 (nx59637z3)) ;
         defparam ix59637z1059.INIT = 16'hFF01;
    LUT4 ix58640z3886 (.O (data_out_dup_0[3]), .I0 (nx62628z2), .I1 (nx62628z3)
         , .I2 (base2exp_int[2]), .I3 (base2exp_int[1])) ;
         defparam ix58640z3886.INIT = 16'h0A0C;
    LUT4 ix57643z2422 (.O (data_out_dup_0[2]), .I0 (base2exp_int[2]), .I1 (
         nx61631z5), .I2 (base2exp_int[1]), .I3 (nx57643z1)) ;
         defparam ix57643z2422.INIT = 16'h0454;
    LUT3 ix56646z1318 (.O (data_out_dup_0[1]), .I0 (base2exp_int[1]), .I1 (
         nx62628z2), .I2 (base2exp_int[2])) ;
         defparam ix56646z1318.INIT = 8'h04;
    LUT4 ix55649z1330 (.O (data_out_dup_0[0]), .I0 (base2exp_int[1]), .I1 (
         base2exp_int[2]), .I2 (data_in_int[0]), .I3 (base2exp_int[0])) ;
         defparam ix55649z1330.INIT = 16'h0010;
    LUT2 ix57643z1328 (.O (nx57643z1), .I0 (data_in_int[0]), .I1 (
         base2exp_int[0])) ;
         defparam ix57643z1328.INIT = 4'hD;
    LUT3 ix62628z1532 (.O (nx62628z2), .I0 (base2exp_int[0]), .I1 (
         data_in_int[0]), .I2 (data_in_int[1])) ;
         defparam ix62628z1532.INIT = 8'hD8;
    LUT3 ix61631z1535 (.O (nx61631z5), .I0 (base2exp_int[0]), .I1 (
         data_in_int[1]), .I2 (data_in_int[2])) ;
         defparam ix61631z1535.INIT = 8'hD8;
    LUT3 ix62628z1519 (.O (nx62628z3), .I0 (data_in_int[3]), .I1 (data_in_int[2]
         ), .I2 (base2exp_int[0])) ;
         defparam ix62628z1519.INIT = 8'hCA;
    LUT3 ix61631z1518 (.O (nx61631z2), .I0 (data_in_int[4]), .I1 (data_in_int[3]
         ), .I2 (base2exp_int[0])) ;
         defparam ix61631z1518.INIT = 8'hCA;
    LUT3 ix60634z1532 (.O (nx60634z2), .I0 (base2exp_int[0]), .I1 (
         data_in_int[4]), .I2 (data_in_int[5])) ;
         defparam ix60634z1532.INIT = 8'hD8;
    LUT3 ix62628z1487 (.O (nx62628z1), .I0 (nx62628z2), .I1 (nx62628z3), .I2 (
         base2exp_int[1])) ;
         defparam ix62628z1487.INIT = 8'hAC;
    LUT4 ix59637z2088 (.O (nx59637z1), .I0 (data_in_int[4]), .I1 (data_in_int[3]
         ), .I2 (base2exp_int[1]), .I3 (base2exp_int[0])) ;
         defparam ix59637z2088.INIT = 16'h0305;
    LUT4 ix59637z1990 (.O (nx59637z2), .I0 (base2exp_int[1]), .I1 (
         data_in_int[2]), .I2 (base2exp_int[0]), .I3 (data_in_int[1])) ;
         defparam ix59637z1990.INIT = 16'h02A2;
    LUT4 ix61631z22825 (.O (nx61631z3), .I0 (base2exp_int[1]), .I1 (
         data_in_int[6]), .I2 (base2exp_int[0]), .I3 (data_in_int[5])) ;
         defparam ix61631z22825.INIT = 16'h5404;
    LUT4 ix59637z1381 (.O (nx59637z3), .I0 (base2exp_int[1]), .I1 (
         base2exp_int[2]), .I2 (data_in_int[0]), .I3 (base2exp_int[0])) ;
         defparam ix59637z1381.INIT = 16'h0040;
    LUT3 ix62628z1520 (.O (nx62628z4), .I0 (nx62628z5), .I1 (nx62628z6), .I2 (
         base2exp_int[1])) ;
         defparam ix62628z1520.INIT = 8'hCA;
    LUT3 ix60634z1487 (.O (nx60634z1), .I0 (nx62628z2), .I1 (nx60634z2), .I2 (
         base2exp_int[2])) ;
         defparam ix60634z1487.INIT = 8'hAC;
    LUT4 ix60634z4399 (.O (nx60634z3), .I0 (data_in_int[3]), .I1 (data_in_int[2]
         ), .I2 (base2exp_int[2]), .I3 (base2exp_int[0])) ;
         defparam ix60634z4399.INIT = 16'h0C0A;
    LUT3 ix61631z1563 (.O (nx61631z1), .I0 (nx61631z2), .I1 (base2exp_int[1]), .I2 (
         nx61631z3)) ;
         defparam ix61631z1563.INIT = 8'hF8;
    LUT4 ix61631z4080 (.O (nx61631z4), .I0 (nx61631z5), .I1 (data_in_int[0]), .I2 (
         base2exp_int[1]), .I3 (base2exp_int[0])) ;
         defparam ix61631z4080.INIT = 16'h0ACA;
    LUT4 ix62628z22827 (.O (nx62628z5), .I0 (base2exp_int[2]), .I1 (
         data_in_int[7]), .I2 (base2exp_int[0]), .I3 (data_in_int[6])) ;
         defparam ix62628z22827.INIT = 16'h5404;
    LUT4 ix62628z22840 (.O (nx62628z6), .I0 (base2exp_int[2]), .I1 (
         base2exp_int[0]), .I2 (data_in_int[5]), .I3 (data_in_int[4])) ;
         defparam ix62628z22840.INIT = 16'h5410;
endmodule

