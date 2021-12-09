//
// Verilog description for cell exmp11b, 
// 02/06/14 23:30:13
//
// Precision RTL Synthesis, 2013a.9//


module exmp11b ( data_in, clock, swap_bits, data_out ) ;

    input [7:0]data_in ;
    input clock ;
    input swap_bits ;
    output [7:0]data_out ;

    wire [7:0]data_out_dup_0;
    wire [7:0]data_in_int;
    wire clock_int, swap_bits_int;
    wire [7:0]d_0n1ss1;



    OBUF \data_out_obuf(0)  (.O (data_out[0]), .I (data_out_dup_0[0])) ;
    OBUF \data_out_obuf(1)  (.O (data_out[1]), .I (data_out_dup_0[1])) ;
    OBUF \data_out_obuf(2)  (.O (data_out[2]), .I (data_out_dup_0[2])) ;
    OBUF \data_out_obuf(3)  (.O (data_out[3]), .I (data_out_dup_0[3])) ;
    OBUF \data_out_obuf(4)  (.O (data_out[4]), .I (data_out_dup_0[4])) ;
    OBUF \data_out_obuf(5)  (.O (data_out[5]), .I (data_out_dup_0[5])) ;
    OBUF \data_out_obuf(6)  (.O (data_out[6]), .I (data_out_dup_0[6])) ;
    OBUF \data_out_obuf(7)  (.O (data_out[7]), .I (data_out_dup_0[7])) ;
    IBUF swap_bits_ibuf (.O (swap_bits_int), .I (swap_bits)) ;
    IBUF \data_in_ibuf(0)  (.O (data_in_int[0]), .I (data_in[0])) ;
    IBUF \data_in_ibuf(1)  (.O (data_in_int[1]), .I (data_in[1])) ;
    IBUF \data_in_ibuf(2)  (.O (data_in_int[2]), .I (data_in[2])) ;
    IBUF \data_in_ibuf(3)  (.O (data_in_int[3]), .I (data_in[3])) ;
    IBUF \data_in_ibuf(4)  (.O (data_in_int[4]), .I (data_in[4])) ;
    IBUF \data_in_ibuf(5)  (.O (data_in_int[5]), .I (data_in[5])) ;
    IBUF \data_in_ibuf(6)  (.O (data_in_int[6]), .I (data_in[6])) ;
    IBUF \data_in_ibuf(7)  (.O (data_in_int[7]), .I (data_in[7])) ;
    FD \reg_d(7)  (.Q (data_out_dup_0[7]), .D (d_0n1ss1[7]), .C (clock_int)) ;
    FD \reg_d(6)  (.Q (data_out_dup_0[6]), .D (d_0n1ss1[6]), .C (clock_int)) ;
    FD \reg_d(5)  (.Q (data_out_dup_0[5]), .D (d_0n1ss1[5]), .C (clock_int)) ;
    FD \reg_d(4)  (.Q (data_out_dup_0[4]), .D (d_0n1ss1[4]), .C (clock_int)) ;
    FD \reg_d(3)  (.Q (data_out_dup_0[3]), .D (d_0n1ss1[3]), .C (clock_int)) ;
    FD \reg_d(2)  (.Q (data_out_dup_0[2]), .D (d_0n1ss1[2]), .C (clock_int)) ;
    FD \reg_d(1)  (.Q (data_out_dup_0[1]), .D (d_0n1ss1[1]), .C (clock_int)) ;
    FD \reg_d(0)  (.Q (data_out_dup_0[0]), .D (d_0n1ss1[0]), .C (clock_int)) ;
    LUT3 ix36625z1530 (.O (d_0n1ss1[7]), .I0 (swap_bits_int), .I1 (
         data_out_dup_0[0]), .I2 (data_in_int[7])) ;
         defparam ix36625z1530.INIT = 8'hD8;
    LUT3 ix35628z1530 (.O (d_0n1ss1[6]), .I0 (swap_bits_int), .I1 (
         data_out_dup_0[1]), .I2 (data_in_int[6])) ;
         defparam ix35628z1530.INIT = 8'hD8;
    LUT3 ix34631z1530 (.O (d_0n1ss1[5]), .I0 (swap_bits_int), .I1 (
         data_out_dup_0[2]), .I2 (data_in_int[5])) ;
         defparam ix34631z1530.INIT = 8'hD8;
    LUT3 ix33634z1530 (.O (d_0n1ss1[4]), .I0 (swap_bits_int), .I1 (
         data_out_dup_0[3]), .I2 (data_in_int[4])) ;
         defparam ix33634z1530.INIT = 8'hD8;
    LUT3 ix32637z1530 (.O (d_0n1ss1[3]), .I0 (swap_bits_int), .I1 (
         data_out_dup_0[4]), .I2 (data_in_int[3])) ;
         defparam ix32637z1530.INIT = 8'hD8;
    LUT3 ix31640z1530 (.O (d_0n1ss1[2]), .I0 (swap_bits_int), .I1 (
         data_out_dup_0[5]), .I2 (data_in_int[2])) ;
         defparam ix31640z1530.INIT = 8'hD8;
    LUT3 ix30643z1530 (.O (d_0n1ss1[1]), .I0 (swap_bits_int), .I1 (
         data_out_dup_0[6]), .I2 (data_in_int[1])) ;
         defparam ix30643z1530.INIT = 8'hD8;
    LUT3 ix29646z1486 (.O (d_0n1ss1[0]), .I0 (data_out_dup_0[7]), .I1 (
         data_in_int[0]), .I2 (swap_bits_int)) ;
         defparam ix29646z1486.INIT = 8'hAC;
    BUFGP clock_ibuf (.O (clock_int), .I (clock)) ;
endmodule

