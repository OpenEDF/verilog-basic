//
// Verilog description for cell rtl_adder, 
// 02/06/14 02:34:51
//
// Precision RTL Synthesis, 2013a.9//


module rtl_adder ( a, b, ci, sum, co ) ;

    input [15:0]a ;
    input [15:0]b ;
    input ci ;
    output [15:0]sum ;
    output co ;

    wire [15:0]sum_dup_0;
    wire co_dup_0, nx33795z2, nx33794z2, nx33793z2, nx33792z2, nx33791z2, 
         nx33790z2, nx33789z2, nx33788z2, nx33787z2, nx57473z2, nx57474z2, 
         nx57475z2, nx57476z2, nx57477z2, nx23135z2;
    wire [15:0]a_int;
    wire [15:0]b_int;
    wire ci_int, nx33796z1, nx33795z1, nx33794z1, nx33793z1, nx33792z1, 
         nx33791z1, nx33790z1, nx33789z1, nx33788z1, nx33787z1, nx57473z1, 
         nx57474z1, nx57475z1, nx57476z1, nx57477z1, nx23135z1;



    XORCY co_add16_0_xorcy_0 (.O (sum_dup_0[0]), .LI (nx33796z1), .CI (ci_int)
          ) ;
    MUXCY_L co_add16_0_muxcy_0 (.LO (nx33795z2), .S (nx33796z1), .DI (a_int[0])
            , .CI (ci_int)) ;
    XORCY co_add16_0_xorcy_1 (.O (sum_dup_0[1]), .LI (nx33795z1), .CI (nx33795z2
          )) ;
    MUXCY_L co_add16_0_muxcy_1 (.LO (nx33794z2), .S (nx33795z1), .DI (a_int[1])
            , .CI (nx33795z2)) ;
    XORCY co_add16_0_xorcy_2 (.O (sum_dup_0[2]), .LI (nx33794z1), .CI (nx33794z2
          )) ;
    MUXCY_L co_add16_0_muxcy_2 (.LO (nx33793z2), .S (nx33794z1), .DI (a_int[2])
            , .CI (nx33794z2)) ;
    XORCY co_add16_0_xorcy_3 (.O (sum_dup_0[3]), .LI (nx33793z1), .CI (nx33793z2
          )) ;
    MUXCY_L co_add16_0_muxcy_3 (.LO (nx33792z2), .S (nx33793z1), .DI (a_int[3])
            , .CI (nx33793z2)) ;
    XORCY co_add16_0_xorcy_4 (.O (sum_dup_0[4]), .LI (nx33792z1), .CI (nx33792z2
          )) ;
    MUXCY_L co_add16_0_muxcy_4 (.LO (nx33791z2), .S (nx33792z1), .DI (a_int[4])
            , .CI (nx33792z2)) ;
    XORCY co_add16_0_xorcy_5 (.O (sum_dup_0[5]), .LI (nx33791z1), .CI (nx33791z2
          )) ;
    MUXCY_L co_add16_0_muxcy_5 (.LO (nx33790z2), .S (nx33791z1), .DI (a_int[5])
            , .CI (nx33791z2)) ;
    XORCY co_add16_0_xorcy_6 (.O (sum_dup_0[6]), .LI (nx33790z1), .CI (nx33790z2
          )) ;
    MUXCY_L co_add16_0_muxcy_6 (.LO (nx33789z2), .S (nx33790z1), .DI (a_int[6])
            , .CI (nx33790z2)) ;
    XORCY co_add16_0_xorcy_7 (.O (sum_dup_0[7]), .LI (nx33789z1), .CI (nx33789z2
          )) ;
    MUXCY_L co_add16_0_muxcy_7 (.LO (nx33788z2), .S (nx33789z1), .DI (a_int[7])
            , .CI (nx33789z2)) ;
    XORCY co_add16_0_xorcy_8 (.O (sum_dup_0[8]), .LI (nx33788z1), .CI (nx33788z2
          )) ;
    MUXCY_L co_add16_0_muxcy_8 (.LO (nx33787z2), .S (nx33788z1), .DI (a_int[8])
            , .CI (nx33788z2)) ;
    XORCY co_add16_0_xorcy_9 (.O (sum_dup_0[9]), .LI (nx33787z1), .CI (nx33787z2
          )) ;
    MUXCY_L co_add16_0_muxcy_9 (.LO (nx57473z2), .S (nx33787z1), .DI (a_int[9])
            , .CI (nx33787z2)) ;
    XORCY co_add16_0_xorcy_10 (.O (sum_dup_0[10]), .LI (nx57473z1), .CI (
          nx57473z2)) ;
    MUXCY_L co_add16_0_muxcy_10 (.LO (nx57474z2), .S (nx57473z1), .DI (a_int[10]
            ), .CI (nx57473z2)) ;
    XORCY co_add16_0_xorcy_11 (.O (sum_dup_0[11]), .LI (nx57474z1), .CI (
          nx57474z2)) ;
    MUXCY_L co_add16_0_muxcy_11 (.LO (nx57475z2), .S (nx57474z1), .DI (a_int[11]
            ), .CI (nx57474z2)) ;
    XORCY co_add16_0_xorcy_12 (.O (sum_dup_0[12]), .LI (nx57475z1), .CI (
          nx57475z2)) ;
    MUXCY_L co_add16_0_muxcy_12 (.LO (nx57476z2), .S (nx57475z1), .DI (a_int[12]
            ), .CI (nx57475z2)) ;
    XORCY co_add16_0_xorcy_13 (.O (sum_dup_0[13]), .LI (nx57476z1), .CI (
          nx57476z2)) ;
    MUXCY_L co_add16_0_muxcy_13 (.LO (nx57477z2), .S (nx57476z1), .DI (a_int[13]
            ), .CI (nx57476z2)) ;
    XORCY co_add16_0_xorcy_14 (.O (sum_dup_0[14]), .LI (nx57477z1), .CI (
          nx57477z2)) ;
    MUXCY_L co_add16_0_muxcy_14 (.LO (nx23135z2), .S (nx57477z1), .DI (a_int[14]
            ), .CI (nx57477z2)) ;
    XORCY co_add16_0_xorcy_15 (.O (sum_dup_0[15]), .LI (nx23135z1), .CI (
          nx23135z2)) ;
    MUXCY co_add16_0_muxcy_15 (.O (co_dup_0), .S (nx23135z1), .DI (a_int[15]), .CI (
          nx23135z2)) ;
    OBUF co_obuf (.O (co), .I (co_dup_0)) ;
    OBUF \sum_obuf(0)  (.O (sum[0]), .I (sum_dup_0[0])) ;
    OBUF \sum_obuf(1)  (.O (sum[1]), .I (sum_dup_0[1])) ;
    OBUF \sum_obuf(2)  (.O (sum[2]), .I (sum_dup_0[2])) ;
    OBUF \sum_obuf(3)  (.O (sum[3]), .I (sum_dup_0[3])) ;
    OBUF \sum_obuf(4)  (.O (sum[4]), .I (sum_dup_0[4])) ;
    OBUF \sum_obuf(5)  (.O (sum[5]), .I (sum_dup_0[5])) ;
    OBUF \sum_obuf(6)  (.O (sum[6]), .I (sum_dup_0[6])) ;
    OBUF \sum_obuf(7)  (.O (sum[7]), .I (sum_dup_0[7])) ;
    OBUF \sum_obuf(8)  (.O (sum[8]), .I (sum_dup_0[8])) ;
    OBUF \sum_obuf(9)  (.O (sum[9]), .I (sum_dup_0[9])) ;
    OBUF \sum_obuf(10)  (.O (sum[10]), .I (sum_dup_0[10])) ;
    OBUF \sum_obuf(11)  (.O (sum[11]), .I (sum_dup_0[11])) ;
    OBUF \sum_obuf(12)  (.O (sum[12]), .I (sum_dup_0[12])) ;
    OBUF \sum_obuf(13)  (.O (sum[13]), .I (sum_dup_0[13])) ;
    OBUF \sum_obuf(14)  (.O (sum[14]), .I (sum_dup_0[14])) ;
    OBUF \sum_obuf(15)  (.O (sum[15]), .I (sum_dup_0[15])) ;
    IBUF ci_ibuf (.O (ci_int), .I (ci)) ;
    IBUF \b_ibuf(0)  (.O (b_int[0]), .I (b[0])) ;
    IBUF \b_ibuf(1)  (.O (b_int[1]), .I (b[1])) ;
    IBUF \b_ibuf(2)  (.O (b_int[2]), .I (b[2])) ;
    IBUF \b_ibuf(3)  (.O (b_int[3]), .I (b[3])) ;
    IBUF \b_ibuf(4)  (.O (b_int[4]), .I (b[4])) ;
    IBUF \b_ibuf(5)  (.O (b_int[5]), .I (b[5])) ;
    IBUF \b_ibuf(6)  (.O (b_int[6]), .I (b[6])) ;
    IBUF \b_ibuf(7)  (.O (b_int[7]), .I (b[7])) ;
    IBUF \b_ibuf(8)  (.O (b_int[8]), .I (b[8])) ;
    IBUF \b_ibuf(9)  (.O (b_int[9]), .I (b[9])) ;
    IBUF \b_ibuf(10)  (.O (b_int[10]), .I (b[10])) ;
    IBUF \b_ibuf(11)  (.O (b_int[11]), .I (b[11])) ;
    IBUF \b_ibuf(12)  (.O (b_int[12]), .I (b[12])) ;
    IBUF \b_ibuf(13)  (.O (b_int[13]), .I (b[13])) ;
    IBUF \b_ibuf(14)  (.O (b_int[14]), .I (b[14])) ;
    IBUF \b_ibuf(15)  (.O (b_int[15]), .I (b[15])) ;
    IBUF \a_ibuf(0)  (.O (a_int[0]), .I (a[0])) ;
    IBUF \a_ibuf(1)  (.O (a_int[1]), .I (a[1])) ;
    IBUF \a_ibuf(2)  (.O (a_int[2]), .I (a[2])) ;
    IBUF \a_ibuf(3)  (.O (a_int[3]), .I (a[3])) ;
    IBUF \a_ibuf(4)  (.O (a_int[4]), .I (a[4])) ;
    IBUF \a_ibuf(5)  (.O (a_int[5]), .I (a[5])) ;
    IBUF \a_ibuf(6)  (.O (a_int[6]), .I (a[6])) ;
    IBUF \a_ibuf(7)  (.O (a_int[7]), .I (a[7])) ;
    IBUF \a_ibuf(8)  (.O (a_int[8]), .I (a[8])) ;
    IBUF \a_ibuf(9)  (.O (a_int[9]), .I (a[9])) ;
    IBUF \a_ibuf(10)  (.O (a_int[10]), .I (a[10])) ;
    IBUF \a_ibuf(11)  (.O (a_int[11]), .I (a[11])) ;
    IBUF \a_ibuf(12)  (.O (a_int[12]), .I (a[12])) ;
    IBUF \a_ibuf(13)  (.O (a_int[13]), .I (a[13])) ;
    IBUF \a_ibuf(14)  (.O (a_int[14]), .I (a[14])) ;
    IBUF \a_ibuf(15)  (.O (a_int[15]), .I (a[15])) ;
    LUT2 ix33796z1320 (.O (nx33796z1), .I0 (a_int[0]), .I1 (b_int[0])) ;
         defparam ix33796z1320.INIT = 4'h6;
    LUT2 ix33795z1320 (.O (nx33795z1), .I0 (a_int[1]), .I1 (b_int[1])) ;
         defparam ix33795z1320.INIT = 4'h6;
    LUT2 ix33794z1320 (.O (nx33794z1), .I0 (a_int[2]), .I1 (b_int[2])) ;
         defparam ix33794z1320.INIT = 4'h6;
    LUT2 ix33793z1320 (.O (nx33793z1), .I0 (a_int[3]), .I1 (b_int[3])) ;
         defparam ix33793z1320.INIT = 4'h6;
    LUT2 ix33792z1320 (.O (nx33792z1), .I0 (a_int[4]), .I1 (b_int[4])) ;
         defparam ix33792z1320.INIT = 4'h6;
    LUT2 ix33791z1320 (.O (nx33791z1), .I0 (a_int[5]), .I1 (b_int[5])) ;
         defparam ix33791z1320.INIT = 4'h6;
    LUT2 ix33790z1320 (.O (nx33790z1), .I0 (a_int[6]), .I1 (b_int[6])) ;
         defparam ix33790z1320.INIT = 4'h6;
    LUT2 ix33789z1320 (.O (nx33789z1), .I0 (a_int[7]), .I1 (b_int[7])) ;
         defparam ix33789z1320.INIT = 4'h6;
    LUT2 ix33788z1320 (.O (nx33788z1), .I0 (a_int[8]), .I1 (b_int[8])) ;
         defparam ix33788z1320.INIT = 4'h6;
    LUT2 ix33787z1320 (.O (nx33787z1), .I0 (a_int[9]), .I1 (b_int[9])) ;
         defparam ix33787z1320.INIT = 4'h6;
    LUT2 ix57473z1320 (.O (nx57473z1), .I0 (a_int[10]), .I1 (b_int[10])) ;
         defparam ix57473z1320.INIT = 4'h6;
    LUT2 ix57474z1320 (.O (nx57474z1), .I0 (a_int[11]), .I1 (b_int[11])) ;
         defparam ix57474z1320.INIT = 4'h6;
    LUT2 ix57475z1320 (.O (nx57475z1), .I0 (a_int[12]), .I1 (b_int[12])) ;
         defparam ix57475z1320.INIT = 4'h6;
    LUT2 ix57476z1320 (.O (nx57476z1), .I0 (a_int[13]), .I1 (b_int[13])) ;
         defparam ix57476z1320.INIT = 4'h6;
    LUT2 ix57477z1320 (.O (nx57477z1), .I0 (a_int[14]), .I1 (b_int[14])) ;
         defparam ix57477z1320.INIT = 4'h6;
    LUT2 ix23135z1320 (.O (nx23135z1), .I0 (a_int[15]), .I1 (b_int[15])) ;
         defparam ix23135z1320.INIT = 4'h6;
endmodule

