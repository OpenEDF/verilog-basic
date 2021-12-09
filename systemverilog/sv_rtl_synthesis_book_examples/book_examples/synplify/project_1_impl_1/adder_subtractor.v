//
// Verilog description for cell adder_subtractor, 
// 02/06/14 02:27:32
//
// Precision RTL Synthesis, 2013a.9//


module adder_subtractor ( mode, a, b, o1, o2 ) ;

    input mode ;
    input [7:0]a ;
    input [7:0]b ;
    output [7:0]o1 ;
    output [7:0]o2 ;

    wire [7:0]o1_dup_0;
    wire [7:0]o2_dup_0;
    wire [7:0]o1_0n1s1;
    wire [7:0]o2_0n1s1;
    wire nx3750z2, nx3751z2, nx3752z2, nx3753z2, nx3754z2, nx3755z2, nx56405z2, 
         nx45093z2, nx45094z2, nx45095z2, nx45096z2, nx45097z2, nx45098z2, 
         nx50474z2, mode_int;
    wire [7:0]a_int;
    wire [7:0]b_int;
    wire GND, PWR, nx3749z1, nx3750z1, nx3751z1, nx3752z1, nx3753z1, nx3754z1, 
         nx3755z1, nx56405z1, nx45092z1, nx45093z1, nx45094z1, nx45095z1, 
         nx45096z1, nx45097z1, nx45098z1, nx50474z1;



    XORCY o1_add8_0i1_xorcy_0 (.O (o1_0n1s1[0]), .LI (nx3749z1), .CI (GND)) ;
    MUXCY_L o1_add8_0i1_muxcy_0 (.LO (nx3750z2), .S (nx3749z1), .DI (a_int[0]), 
            .CI (GND)) ;
    XORCY o1_add8_0i1_xorcy_1 (.O (o1_0n1s1[1]), .LI (nx3750z1), .CI (nx3750z2)
          ) ;
    MUXCY_L o1_add8_0i1_muxcy_1 (.LO (nx3751z2), .S (nx3750z1), .DI (a_int[1]), 
            .CI (nx3750z2)) ;
    XORCY o1_add8_0i1_xorcy_2 (.O (o1_0n1s1[2]), .LI (nx3751z1), .CI (nx3751z2)
          ) ;
    MUXCY_L o1_add8_0i1_muxcy_2 (.LO (nx3752z2), .S (nx3751z1), .DI (a_int[2]), 
            .CI (nx3751z2)) ;
    XORCY o1_add8_0i1_xorcy_3 (.O (o1_0n1s1[3]), .LI (nx3752z1), .CI (nx3752z2)
          ) ;
    MUXCY_L o1_add8_0i1_muxcy_3 (.LO (nx3753z2), .S (nx3752z1), .DI (a_int[3]), 
            .CI (nx3752z2)) ;
    XORCY o1_add8_0i1_xorcy_4 (.O (o1_0n1s1[4]), .LI (nx3753z1), .CI (nx3753z2)
          ) ;
    MUXCY_L o1_add8_0i1_muxcy_4 (.LO (nx3754z2), .S (nx3753z1), .DI (a_int[4]), 
            .CI (nx3753z2)) ;
    XORCY o1_add8_0i1_xorcy_5 (.O (o1_0n1s1[5]), .LI (nx3754z1), .CI (nx3754z2)
          ) ;
    MUXCY_L o1_add8_0i1_muxcy_5 (.LO (nx3755z2), .S (nx3754z1), .DI (a_int[5]), 
            .CI (nx3754z2)) ;
    XORCY o1_add8_0i1_xorcy_6 (.O (o1_0n1s1[6]), .LI (nx3755z1), .CI (nx3755z2)
          ) ;
    MUXCY_L o1_add8_0i1_muxcy_6 (.LO (nx56405z2), .S (nx3755z1), .DI (a_int[6])
            , .CI (nx3755z2)) ;
    XORCY o1_add8_0i1_xorcy_7 (.O (o1_0n1s1[7]), .LI (nx56405z1), .CI (nx56405z2
          )) ;
    XORCY o2_sub8_0i2_xorcy_0 (.O (o2_0n1s1[0]), .LI (nx45092z1), .CI (PWR)) ;
    MUXCY_L o2_sub8_0i2_muxcy_0 (.LO (nx45093z2), .S (nx45092z1), .DI (a_int[0])
            , .CI (PWR)) ;
    XORCY o2_sub8_0i2_xorcy_1 (.O (o2_0n1s1[1]), .LI (nx45093z1), .CI (nx45093z2
          )) ;
    MUXCY_L o2_sub8_0i2_muxcy_1 (.LO (nx45094z2), .S (nx45093z1), .DI (a_int[1])
            , .CI (nx45093z2)) ;
    XORCY o2_sub8_0i2_xorcy_2 (.O (o2_0n1s1[2]), .LI (nx45094z1), .CI (nx45094z2
          )) ;
    MUXCY_L o2_sub8_0i2_muxcy_2 (.LO (nx45095z2), .S (nx45094z1), .DI (a_int[2])
            , .CI (nx45094z2)) ;
    XORCY o2_sub8_0i2_xorcy_3 (.O (o2_0n1s1[3]), .LI (nx45095z1), .CI (nx45095z2
          )) ;
    MUXCY_L o2_sub8_0i2_muxcy_3 (.LO (nx45096z2), .S (nx45095z1), .DI (a_int[3])
            , .CI (nx45095z2)) ;
    XORCY o2_sub8_0i2_xorcy_4 (.O (o2_0n1s1[4]), .LI (nx45096z1), .CI (nx45096z2
          )) ;
    MUXCY_L o2_sub8_0i2_muxcy_4 (.LO (nx45097z2), .S (nx45096z1), .DI (a_int[4])
            , .CI (nx45096z2)) ;
    XORCY o2_sub8_0i2_xorcy_5 (.O (o2_0n1s1[5]), .LI (nx45097z1), .CI (nx45097z2
          )) ;
    MUXCY_L o2_sub8_0i2_muxcy_5 (.LO (nx45098z2), .S (nx45097z1), .DI (a_int[5])
            , .CI (nx45097z2)) ;
    XORCY o2_sub8_0i2_xorcy_6 (.O (o2_0n1s1[6]), .LI (nx45098z1), .CI (nx45098z2
          )) ;
    MUXCY_L o2_sub8_0i2_muxcy_6 (.LO (nx50474z2), .S (nx45098z1), .DI (a_int[6])
            , .CI (nx45098z2)) ;
    XORCY o2_sub8_0i2_xorcy_7 (.O (o2_0n1s1[7]), .LI (nx50474z1), .CI (nx50474z2
          )) ;
    OBUF \o2_obuf(0)  (.O (o2[0]), .I (o2_dup_0[0])) ;
    OBUF \o2_obuf(1)  (.O (o2[1]), .I (o2_dup_0[1])) ;
    OBUF \o2_obuf(2)  (.O (o2[2]), .I (o2_dup_0[2])) ;
    OBUF \o2_obuf(3)  (.O (o2[3]), .I (o2_dup_0[3])) ;
    OBUF \o2_obuf(4)  (.O (o2[4]), .I (o2_dup_0[4])) ;
    OBUF \o2_obuf(5)  (.O (o2[5]), .I (o2_dup_0[5])) ;
    OBUF \o2_obuf(6)  (.O (o2[6]), .I (o2_dup_0[6])) ;
    OBUF \o2_obuf(7)  (.O (o2[7]), .I (o2_dup_0[7])) ;
    OBUF \o1_obuf(0)  (.O (o1[0]), .I (o1_dup_0[0])) ;
    OBUF \o1_obuf(1)  (.O (o1[1]), .I (o1_dup_0[1])) ;
    OBUF \o1_obuf(2)  (.O (o1[2]), .I (o1_dup_0[2])) ;
    OBUF \o1_obuf(3)  (.O (o1[3]), .I (o1_dup_0[3])) ;
    OBUF \o1_obuf(4)  (.O (o1[4]), .I (o1_dup_0[4])) ;
    OBUF \o1_obuf(5)  (.O (o1[5]), .I (o1_dup_0[5])) ;
    OBUF \o1_obuf(6)  (.O (o1[6]), .I (o1_dup_0[6])) ;
    OBUF \o1_obuf(7)  (.O (o1[7]), .I (o1_dup_0[7])) ;
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
    LD_1 \lat_o2(7)  (.Q (o2_dup_0[7]), .D (o2_0n1s1[7]), .G (mode_int)) ;
    LD_1 \lat_o2(6)  (.Q (o2_dup_0[6]), .D (o2_0n1s1[6]), .G (mode_int)) ;
    LD_1 \lat_o2(5)  (.Q (o2_dup_0[5]), .D (o2_0n1s1[5]), .G (mode_int)) ;
    LD_1 \lat_o2(4)  (.Q (o2_dup_0[4]), .D (o2_0n1s1[4]), .G (mode_int)) ;
    LD_1 \lat_o2(3)  (.Q (o2_dup_0[3]), .D (o2_0n1s1[3]), .G (mode_int)) ;
    LD_1 \lat_o2(2)  (.Q (o2_dup_0[2]), .D (o2_0n1s1[2]), .G (mode_int)) ;
    LD_1 \lat_o2(1)  (.Q (o2_dup_0[1]), .D (o2_0n1s1[1]), .G (mode_int)) ;
    LD_1 \lat_o2(0)  (.Q (o2_dup_0[0]), .D (o2_0n1s1[0]), .G (mode_int)) ;
    LD \lat_o1(7)  (.Q (o1_dup_0[7]), .D (o1_0n1s1[7]), .G (mode_int)) ;
    LD \lat_o1(6)  (.Q (o1_dup_0[6]), .D (o1_0n1s1[6]), .G (mode_int)) ;
    LD \lat_o1(5)  (.Q (o1_dup_0[5]), .D (o1_0n1s1[5]), .G (mode_int)) ;
    LD \lat_o1(4)  (.Q (o1_dup_0[4]), .D (o1_0n1s1[4]), .G (mode_int)) ;
    LD \lat_o1(3)  (.Q (o1_dup_0[3]), .D (o1_0n1s1[3]), .G (mode_int)) ;
    LD \lat_o1(2)  (.Q (o1_dup_0[2]), .D (o1_0n1s1[2]), .G (mode_int)) ;
    LD \lat_o1(1)  (.Q (o1_dup_0[1]), .D (o1_0n1s1[1]), .G (mode_int)) ;
    LD \lat_o1(0)  (.Q (o1_dup_0[0]), .D (o1_0n1s1[0]), .G (mode_int)) ;
    GND GND_rename17 (.G (GND)) ;
    VCC PWR_rename18 (.P (PWR)) ;
    LUT2 ix3749z1320 (.O (nx3749z1), .I0 (a_int[0]), .I1 (b_int[0])) ;
         defparam ix3749z1320.INIT = 4'h6;
    LUT2 ix3750z1320 (.O (nx3750z1), .I0 (a_int[1]), .I1 (b_int[1])) ;
         defparam ix3750z1320.INIT = 4'h6;
    LUT2 ix3751z1320 (.O (nx3751z1), .I0 (a_int[2]), .I1 (b_int[2])) ;
         defparam ix3751z1320.INIT = 4'h6;
    LUT2 ix3752z1320 (.O (nx3752z1), .I0 (a_int[3]), .I1 (b_int[3])) ;
         defparam ix3752z1320.INIT = 4'h6;
    LUT2 ix3753z1320 (.O (nx3753z1), .I0 (a_int[4]), .I1 (b_int[4])) ;
         defparam ix3753z1320.INIT = 4'h6;
    LUT2 ix3754z1320 (.O (nx3754z1), .I0 (a_int[5]), .I1 (b_int[5])) ;
         defparam ix3754z1320.INIT = 4'h6;
    LUT2 ix3755z1320 (.O (nx3755z1), .I0 (a_int[6]), .I1 (b_int[6])) ;
         defparam ix3755z1320.INIT = 4'h6;
    LUT2 ix56405z1320 (.O (nx56405z1), .I0 (a_int[7]), .I1 (b_int[7])) ;
         defparam ix56405z1320.INIT = 4'h6;
    LUT2 ix45092z1323 (.O (nx45092z1), .I0 (a_int[0]), .I1 (b_int[0])) ;
         defparam ix45092z1323.INIT = 4'h9;
    LUT2 ix45093z1323 (.O (nx45093z1), .I0 (a_int[1]), .I1 (b_int[1])) ;
         defparam ix45093z1323.INIT = 4'h9;
    LUT2 ix45094z1323 (.O (nx45094z1), .I0 (a_int[2]), .I1 (b_int[2])) ;
         defparam ix45094z1323.INIT = 4'h9;
    LUT2 ix45095z1323 (.O (nx45095z1), .I0 (a_int[3]), .I1 (b_int[3])) ;
         defparam ix45095z1323.INIT = 4'h9;
    LUT2 ix45096z1323 (.O (nx45096z1), .I0 (a_int[4]), .I1 (b_int[4])) ;
         defparam ix45096z1323.INIT = 4'h9;
    LUT2 ix45097z1323 (.O (nx45097z1), .I0 (a_int[5]), .I1 (b_int[5])) ;
         defparam ix45097z1323.INIT = 4'h9;
    LUT2 ix45098z1323 (.O (nx45098z1), .I0 (a_int[6]), .I1 (b_int[6])) ;
         defparam ix45098z1323.INIT = 4'h9;
    LUT2 ix50474z1323 (.O (nx50474z1), .I0 (a_int[7]), .I1 (b_int[7])) ;
         defparam ix50474z1323.INIT = 4'h9;
    BUFGP mode_ibuf (.O (mode_int), .I (mode)) ;
endmodule

