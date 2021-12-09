//
// Verilog description for cell unsigned_adder, 
// 08/04/16 20:52:00
//
// Precision RTL Synthesis, 32-bit 2015.1.6//


module unsigned_adder ( a, b, sum ) ;

    input [12:0]a ;
    input [12:0]b ;
    output [12:0]sum ;

    wire [12:0]sum_dup_0;
    wire nx25435z2, nx25434z2, nx25433z2, nx25432z2, nx25431z2, nx25430z2, 
         nx25429z2, nx25428z2, nx25427z2, nx3785z2, nx3786z2, nx54246z2;
    wire [12:0]a_int;
    wire [12:0]b_int;
    wire GND, nx25436z1, nx25435z1, nx25434z1, nx25433z1, nx25432z1, nx25431z1, 
         nx25430z1, nx25429z1, nx25428z1, nx25427z1, nx3785z1, nx3786z1, 
         nx54246z1;



    XORCY sum_add13_0_xorcy_0 (.O (sum_dup_0[0]), .LI (nx25436z1), .CI (GND)) ;
    MUXCY_L sum_add13_0_muxcy_0 (.LO (nx25435z2), .S (nx25436z1), .DI (a_int[0])
            , .CI (GND)) ;
    XORCY sum_add13_0_xorcy_1 (.O (sum_dup_0[1]), .LI (nx25435z1), .CI (
          nx25435z2)) ;
    MUXCY_L sum_add13_0_muxcy_1 (.LO (nx25434z2), .S (nx25435z1), .DI (a_int[1])
            , .CI (nx25435z2)) ;
    XORCY sum_add13_0_xorcy_2 (.O (sum_dup_0[2]), .LI (nx25434z1), .CI (
          nx25434z2)) ;
    MUXCY_L sum_add13_0_muxcy_2 (.LO (nx25433z2), .S (nx25434z1), .DI (a_int[2])
            , .CI (nx25434z2)) ;
    XORCY sum_add13_0_xorcy_3 (.O (sum_dup_0[3]), .LI (nx25433z1), .CI (
          nx25433z2)) ;
    MUXCY_L sum_add13_0_muxcy_3 (.LO (nx25432z2), .S (nx25433z1), .DI (a_int[3])
            , .CI (nx25433z2)) ;
    XORCY sum_add13_0_xorcy_4 (.O (sum_dup_0[4]), .LI (nx25432z1), .CI (
          nx25432z2)) ;
    MUXCY_L sum_add13_0_muxcy_4 (.LO (nx25431z2), .S (nx25432z1), .DI (a_int[4])
            , .CI (nx25432z2)) ;
    XORCY sum_add13_0_xorcy_5 (.O (sum_dup_0[5]), .LI (nx25431z1), .CI (
          nx25431z2)) ;
    MUXCY_L sum_add13_0_muxcy_5 (.LO (nx25430z2), .S (nx25431z1), .DI (a_int[5])
            , .CI (nx25431z2)) ;
    XORCY sum_add13_0_xorcy_6 (.O (sum_dup_0[6]), .LI (nx25430z1), .CI (
          nx25430z2)) ;
    MUXCY_L sum_add13_0_muxcy_6 (.LO (nx25429z2), .S (nx25430z1), .DI (a_int[6])
            , .CI (nx25430z2)) ;
    XORCY sum_add13_0_xorcy_7 (.O (sum_dup_0[7]), .LI (nx25429z1), .CI (
          nx25429z2)) ;
    MUXCY_L sum_add13_0_muxcy_7 (.LO (nx25428z2), .S (nx25429z1), .DI (a_int[7])
            , .CI (nx25429z2)) ;
    XORCY sum_add13_0_xorcy_8 (.O (sum_dup_0[8]), .LI (nx25428z1), .CI (
          nx25428z2)) ;
    MUXCY_L sum_add13_0_muxcy_8 (.LO (nx25427z2), .S (nx25428z1), .DI (a_int[8])
            , .CI (nx25428z2)) ;
    XORCY sum_add13_0_xorcy_9 (.O (sum_dup_0[9]), .LI (nx25427z1), .CI (
          nx25427z2)) ;
    MUXCY_L sum_add13_0_muxcy_9 (.LO (nx3785z2), .S (nx25427z1), .DI (a_int[9])
            , .CI (nx25427z2)) ;
    XORCY sum_add13_0_xorcy_10 (.O (sum_dup_0[10]), .LI (nx3785z1), .CI (
          nx3785z2)) ;
    MUXCY_L sum_add13_0_muxcy_10 (.LO (nx3786z2), .S (nx3785z1), .DI (a_int[10])
            , .CI (nx3785z2)) ;
    XORCY sum_add13_0_xorcy_11 (.O (sum_dup_0[11]), .LI (nx3786z1), .CI (
          nx3786z2)) ;
    MUXCY_L sum_add13_0_muxcy_11 (.LO (nx54246z2), .S (nx3786z1), .DI (a_int[11]
            ), .CI (nx3786z2)) ;
    XORCY sum_add13_0_xorcy_12 (.O (sum_dup_0[12]), .LI (nx54246z1), .CI (
          nx54246z2)) ;
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
    GND GND_rename10 (.G (GND)) ;
    LUT2 ix25436z1320 (.O (nx25436z1), .I0 (a_int[0]), .I1 (b_int[0])) ;
         defparam ix25436z1320.INIT = 4'h6;
    LUT2 ix25435z1320 (.O (nx25435z1), .I0 (a_int[1]), .I1 (b_int[1])) ;
         defparam ix25435z1320.INIT = 4'h6;
    LUT2 ix25434z1320 (.O (nx25434z1), .I0 (a_int[2]), .I1 (b_int[2])) ;
         defparam ix25434z1320.INIT = 4'h6;
    LUT2 ix25433z1320 (.O (nx25433z1), .I0 (a_int[3]), .I1 (b_int[3])) ;
         defparam ix25433z1320.INIT = 4'h6;
    LUT2 ix25432z1320 (.O (nx25432z1), .I0 (a_int[4]), .I1 (b_int[4])) ;
         defparam ix25432z1320.INIT = 4'h6;
    LUT2 ix25431z1320 (.O (nx25431z1), .I0 (a_int[5]), .I1 (b_int[5])) ;
         defparam ix25431z1320.INIT = 4'h6;
    LUT2 ix25430z1320 (.O (nx25430z1), .I0 (a_int[6]), .I1 (b_int[6])) ;
         defparam ix25430z1320.INIT = 4'h6;
    LUT2 ix25429z1320 (.O (nx25429z1), .I0 (a_int[7]), .I1 (b_int[7])) ;
         defparam ix25429z1320.INIT = 4'h6;
    LUT2 ix25428z1320 (.O (nx25428z1), .I0 (a_int[8]), .I1 (b_int[8])) ;
         defparam ix25428z1320.INIT = 4'h6;
    LUT2 ix25427z1320 (.O (nx25427z1), .I0 (a_int[9]), .I1 (b_int[9])) ;
         defparam ix25427z1320.INIT = 4'h6;
    LUT2 ix3785z1320 (.O (nx3785z1), .I0 (a_int[10]), .I1 (b_int[10])) ;
         defparam ix3785z1320.INIT = 4'h6;
    LUT2 ix3786z1320 (.O (nx3786z1), .I0 (a_int[11]), .I1 (b_int[11])) ;
         defparam ix3786z1320.INIT = 4'h6;
    LUT2 ix54246z1320 (.O (nx54246z1), .I0 (a_int[12]), .I1 (b_int[12])) ;
         defparam ix54246z1320.INIT = 4'h6;
endmodule

