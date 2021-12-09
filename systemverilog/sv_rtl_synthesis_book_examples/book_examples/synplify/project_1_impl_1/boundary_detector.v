//
// Verilog description for cell boundary_detector, 
// 09/23/13 20:41:53
//
// Precision RTL Synthesis, 2013a.9//


module boundary_detector ( address, boundary_flag ) ;

    input [15:0]address ;
    output boundary_flag ;

    wire [15:2]address_int;
    wire boundary_flag_dup_0, nx36612z1, nx36612z2, nx36612z3, nx36612z4;



    OBUF boundary_flag_obuf (.O (boundary_flag), .I (boundary_flag_dup_0)) ;
    IBUF \address_ibuf(0)  (.O (address_int[2]), .I (address[0])) ;
    IBUF \address_ibuf(1)  (.O (address_int[3]), .I (address[1])) ;
    IBUF \address_ibuf(2)  (.O (address_int[4]), .I (address[2])) ;
    IBUF \address_ibuf(3)  (.O (address_int[5]), .I (address[3])) ;
    IBUF \address_ibuf(4)  (.O (address_int[6]), .I (address[4])) ;
    IBUF \address_ibuf(5)  (.O (address_int[7]), .I (address[5])) ;
    IBUF \address_ibuf(6)  (.O (address_int[8]), .I (address[6])) ;
    IBUF \address_ibuf(7)  (.O (address_int[9]), .I (address[7])) ;
    IBUF \address_ibuf(8)  (.O (address_int[10]), .I (address[8])) ;
    IBUF \address_ibuf(9)  (.O (address_int[11]), .I (address[9])) ;
    IBUF \address_ibuf(10)  (.O (address_int[12]), .I (address[10])) ;
    IBUF \address_ibuf(11)  (.O (address_int[13]), .I (address[11])) ;
    IBUF \address_ibuf(12)  (.O (address_int[14]), .I (address[12])) ;
    IBUF \address_ibuf(13)  (.O (address_int[15]), .I (address[13])) ;
    LUT4 ix36612z1315 (.O (boundary_flag_dup_0), .I0 (nx36612z1), .I1 (nx36612z2
         ), .I2 (nx36612z3), .I3 (nx36612z4)) ;
         defparam ix36612z1315.INIT = 16'h0001;
    LUT4 ix36612z1313 (.O (nx36612z1), .I0 (address_int[15]), .I1 (
         address_int[14]), .I2 (address_int[13]), .I3 (address_int[12])) ;
         defparam ix36612z1313.INIT = 16'hFFFE;
    LUT4 ix36612z1314 (.O (nx36612z2), .I0 (address_int[11]), .I1 (
         address_int[10]), .I2 (address_int[9]), .I3 (address_int[8])) ;
         defparam ix36612z1314.INIT = 16'hFFFE;
    LUT4 ix36612z1321 (.O (nx36612z3), .I0 (address_int[7]), .I1 (address_int[6]
         ), .I2 (address_int[5]), .I3 (address_int[4])) ;
         defparam ix36612z1321.INIT = 16'hFFFE;
    LUT2 ix36612z1333 (.O (nx36612z4), .I0 (address_int[3]), .I1 (address_int[2]
         )) ;
         defparam ix36612z1333.INIT = 4'hE;
endmodule

