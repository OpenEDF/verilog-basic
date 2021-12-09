//
// Verilog description for cell foo, 
// 02/06/14 11:09:01
//
// Precision RTL Synthesis, 2013a.9//


module foo ( data, pass1, pass2, pass3 ) ;

    input [15:0]data ;
    output pass1 ;
    output pass2 ;
    output pass3 ;

    wire [15:0]data_int;
    wire pass1_dup_0, pass2_dup_0, pass3_dup_0, nx60795z5, nx60795z2, nx60795z3, 
         nx12528z1, nx60795z1, nx60795z4, nx60795z6;



    OBUF pass3_obuf (.O (pass3), .I (pass3_dup_0)) ;
    OBUF pass2_obuf (.O (pass2), .I (pass2_dup_0)) ;
    OBUF pass1_obuf (.O (pass1), .I (pass1_dup_0)) ;
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
    LUT4 ix60795z1318 (.O (pass1_dup_0), .I0 (nx60795z1), .I1 (nx60795z4), .I2 (
         nx60795z5), .I3 (nx60795z6)) ;
         defparam ix60795z1318.INIT = 16'h0004;
    LUT4 ix12528z1315 (.O (pass2_dup_0), .I0 (nx60795z5), .I1 (nx12528z1), .I2 (
         data_int[9]), .I3 (data_int[8])) ;
         defparam ix12528z1315.INIT = 16'h0001;
    LUT4 ix20315z1322 (.O (pass3_dup_0), .I0 (data_int[1]), .I1 (data_int[3]), .I2 (
         nx60795z5), .I3 (nx60795z6)) ;
         defparam ix20315z1322.INIT = 16'h0008;
    LUT4 ix60795z1317 (.O (nx60795z5), .I0 (data_int[15]), .I1 (data_int[14]), .I2 (
         data_int[13]), .I3 (data_int[12])) ;
         defparam ix60795z1317.INIT = 16'hFFFE;
    LUT4 ix60795z22885 (.O (nx60795z2), .I0 (data_int[11]), .I1 (data_int[10]), 
         .I2 (data_int[9]), .I3 (data_int[8])) ;
         defparam ix60795z22885.INIT = 16'h5441;
    LUT4 ix60795z45005 (.O (nx60795z3), .I0 (data_int[11]), .I1 (data_int[10]), 
         .I2 (data_int[9]), .I3 (data_int[8])) ;
         defparam ix60795z45005.INIT = 16'hAAA8;
    LUT2 ix12528z1329 (.O (nx12528z1), .I0 (data_int[11]), .I1 (data_int[10])) ;
         defparam ix12528z1329.INIT = 4'hE;
    LUT4 ix60795z1313 (.O (nx60795z1), .I0 (data_int[3]), .I1 (data_int[1]), .I2 (
         nx60795z2), .I3 (nx60795z3)) ;
         defparam ix60795z1313.INIT = 16'hFFFE;
    LUT4 ix60795z1319 (.O (nx60795z4), .I0 (data_int[7]), .I1 (data_int[6]), .I2 (
         data_int[5]), .I3 (data_int[4])) ;
         defparam ix60795z1319.INIT = 16'h0001;
    LUT2 ix60795z1334 (.O (nx60795z6), .I0 (data_int[2]), .I1 (data_int[0])) ;
         defparam ix60795z1334.INIT = 4'hE;
endmodule

