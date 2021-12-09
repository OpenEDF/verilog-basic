//
// Verilog description for cell decoder, 
// 02/06/14 11:38:05
//
// Precision RTL Synthesis, 2013a.9//


module decoder ( data, sel1, sel2, sel3 ) ;

    input [15:0]data ;
    output sel1 ;
    output sel2 ;
    output sel3 ;

    wire [15:0]data_int;
    wire sel1_dup_0, sel2_dup_0, sel3_dup_0, nx19432z5, nx19432z2, nx19432z3, 
         nx11645z1, nx19432z1, nx19432z4, nx19432z6;



    OBUF sel3_obuf (.O (sel3), .I (sel3_dup_0)) ;
    OBUF sel2_obuf (.O (sel2), .I (sel2_dup_0)) ;
    OBUF sel1_obuf (.O (sel1), .I (sel1_dup_0)) ;
    IBUF \data_ibuf(0)  (.O (data_int[0]), .I (data[0])) ;
    IBUF \data_ibuf(1)  (.O (data_int[1]), .I (data[1])) ;
    IBUF \data_ibuf(2)  (.O (data_int[2]), .I (data[2])) ;
    IBUF \data_ibuf(3)  (.O (data_int[3]), .I (data[3])) ;
    IBUF \data_ibuf(4)  (.O (data_int[4]), .I (data[4])) ;
    IBUF \data_ibuf(5)  (.O (data_int[5]), .I (data[5])) ;
    IBUF \data_ibuf(6)  (.O (data_int[6]), .I (data[6])) ;
    IBUF \data_ibuf(7)  (.O (data_int[7]), .I (data[7])) ;
    IBUF \data_ibuf(8)  (.O (data_int[8]), .I (data[8])) ;
    IBUF \data_ibuf(9)  (.O (data_int[9]), .I (data[9])) ;
    IBUF \data_ibuf(10)  (.O (data_int[10]), .I (data[10])) ;
    IBUF \data_ibuf(11)  (.O (data_int[11]), .I (data[11])) ;
    IBUF \data_ibuf(12)  (.O (data_int[12]), .I (data[12])) ;
    IBUF \data_ibuf(13)  (.O (data_int[13]), .I (data[13])) ;
    IBUF \data_ibuf(14)  (.O (data_int[14]), .I (data[14])) ;
    IBUF \data_ibuf(15)  (.O (data_int[15]), .I (data[15])) ;
    LUT4 ix19432z1318 (.O (sel1_dup_0), .I0 (nx19432z1), .I1 (nx19432z4), .I2 (
         nx19432z5), .I3 (nx19432z6)) ;
         defparam ix19432z1318.INIT = 16'h0004;
    LUT4 ix11645z1315 (.O (sel2_dup_0), .I0 (nx19432z5), .I1 (nx11645z1), .I2 (
         data_int[9]), .I3 (data_int[8])) ;
         defparam ix11645z1315.INIT = 16'h0001;
    LUT4 ix3858z1322 (.O (sel3_dup_0), .I0 (data_int[1]), .I1 (data_int[3]), .I2 (
         nx19432z5), .I3 (nx19432z6)) ;
         defparam ix3858z1322.INIT = 16'h0008;
    LUT4 ix19432z1317 (.O (nx19432z5), .I0 (data_int[15]), .I1 (data_int[14]), .I2 (
         data_int[13]), .I3 (data_int[12])) ;
         defparam ix19432z1317.INIT = 16'hFFFE;
    LUT4 ix19432z22885 (.O (nx19432z2), .I0 (data_int[11]), .I1 (data_int[10]), 
         .I2 (data_int[9]), .I3 (data_int[8])) ;
         defparam ix19432z22885.INIT = 16'h5441;
    LUT4 ix19432z45005 (.O (nx19432z3), .I0 (data_int[11]), .I1 (data_int[10]), 
         .I2 (data_int[9]), .I3 (data_int[8])) ;
         defparam ix19432z45005.INIT = 16'hAAA8;
    LUT2 ix11645z1329 (.O (nx11645z1), .I0 (data_int[11]), .I1 (data_int[10])) ;
         defparam ix11645z1329.INIT = 4'hE;
    LUT4 ix19432z1313 (.O (nx19432z1), .I0 (data_int[3]), .I1 (data_int[1]), .I2 (
         nx19432z2), .I3 (nx19432z3)) ;
         defparam ix19432z1313.INIT = 16'hFFFE;
    LUT4 ix19432z1319 (.O (nx19432z4), .I0 (data_int[7]), .I1 (data_int[6]), .I2 (
         data_int[5]), .I3 (data_int[4])) ;
         defparam ix19432z1319.INIT = 16'h0001;
    LUT2 ix19432z1334 (.O (nx19432z6), .I0 (data_int[2]), .I1 (data_int[0])) ;
         defparam ix19432z1334.INIT = 4'hE;
endmodule

