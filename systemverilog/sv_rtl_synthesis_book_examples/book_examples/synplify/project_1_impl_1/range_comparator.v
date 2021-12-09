//
// Verilog description for cell range_comparator, 
// 02/11/14 15:44:28
//
// Precision RTL Synthesis, 2013a.9//


module range_comparator ( data, a, b, d, c, pass1, pass2, pass3 ) ;

    input [15:0]data ;
    input [15:0]a ;
    input [15:0]b ;
    input [15:0]d ;
    input [15:0]c ;
    output pass1 ;
    output pass2 ;
    output pass3 ;

    wire pass1_0n1s7, pass1_0n1s6, pass1_0n1s4, pass1_0n1s2, nx12528z1, 
         nx12528z33, nx12528z31, nx12528z29, nx12528z27, nx12528z25, nx12528z23, 
         nx12528z21, nx12528z19, nx12528z17, nx12528z15, nx12528z13, nx12528z11, 
         nx12528z9, nx12528z7, nx12528z5, nx12528z3, nx12528z63, nx12528z61, 
         nx12528z59, nx12528z57, nx12528z55, nx12528z53, nx12528z51, nx12528z49, 
         nx12528z47, nx12528z45, nx12528z43, nx12528z41, nx12528z39, nx12528z37, 
         nx12528z35, nx52065z1, nx52064z2, nx52064z1, nx52063z2, nx52063z1, 
         nx52062z2, nx52062z1, nx52061z2, nx52061z1, nx52060z2, nx52060z1, 
         nx52059z2, nx52059z1, nx52058z2, nx52058z1, nx47844z1, nx47843z2, 
         nx47843z1, nx47842z2, nx47842z1, nx47841z2, nx47841z1, nx47840z2, 
         nx47840z1, nx47839z2, nx47839z1, nx47838z2, nx47838z1, nx47837z2, 
         nx47837z1, nx21913z1, nx21914z2, nx21914z1, nx21915z2, nx21915z1, 
         nx21916z2, nx21916z1, nx21917z2, nx21917z1, nx21918z2, nx21918z1, 
         nx21919z2, nx21919z1, nx21920z2, nx21920z1, nx39402z1, nx39401z2, 
         nx39401z1, nx39400z2, nx39400z1, nx39399z2, nx39399z1, nx39398z2, 
         nx39398z1, nx39397z2, nx39397z1, nx39396z2, nx39396z1, nx39395z3, 
         nx39395z1;
    wire [15:0]data_int;
    wire [15:0]a_int;
    wire [15:0]b_int;
    wire [15:0]d_int;
    wire [15:0]c_int;
    wire pass1_dup_0, pass2_dup_0, pass3_dup_0, nx39402z2, nx12528z32, 
         nx12528z30, nx12528z28, nx12528z26, nx12528z24, nx12528z22, nx12528z20, 
         nx12528z18, nx12528z16, nx12528z14, nx12528z12, nx12528z10, nx12528z8, 
         nx12528z6, nx12528z4, nx12528z2, nx39395z2, nx12528z64, nx12528z62, 
         nx12528z60, nx12528z58, nx12528z56, nx12528z54, nx12528z52, nx12528z50, 
         nx12528z48, nx12528z46, nx12528z44, nx12528z42, nx12528z40, nx12528z38, 
         nx12528z36, nx12528z34, nx20315z1, nx20315z2;



    MUXCY_L ix12528z63371 (.LO (nx12528z31), .S (nx12528z32), .DI (data_int[0])
            , .CI (nx39402z2)) ;
    MUXCY_L ix12528z63369 (.LO (nx12528z29), .S (nx12528z30), .DI (data_int[1])
            , .CI (nx12528z31)) ;
    MUXCY_L ix12528z63367 (.LO (nx12528z27), .S (nx12528z28), .DI (data_int[2])
            , .CI (nx12528z29)) ;
    MUXCY_L ix12528z63365 (.LO (nx12528z25), .S (nx12528z26), .DI (data_int[3])
            , .CI (nx12528z27)) ;
    MUXCY_L ix12528z63363 (.LO (nx12528z23), .S (nx12528z24), .DI (data_int[4])
            , .CI (nx12528z25)) ;
    MUXCY_L ix12528z63361 (.LO (nx12528z21), .S (nx12528z22), .DI (data_int[5])
            , .CI (nx12528z23)) ;
    MUXCY_L ix12528z63359 (.LO (nx12528z19), .S (nx12528z20), .DI (data_int[6])
            , .CI (nx12528z21)) ;
    MUXCY_L ix12528z63357 (.LO (nx12528z17), .S (nx12528z18), .DI (data_int[7])
            , .CI (nx12528z19)) ;
    MUXCY_L ix12528z63355 (.LO (nx12528z15), .S (nx12528z16), .DI (data_int[8])
            , .CI (nx12528z17)) ;
    MUXCY_L ix12528z63353 (.LO (nx12528z13), .S (nx12528z14), .DI (data_int[9])
            , .CI (nx12528z15)) ;
    MUXCY_L ix12528z63351 (.LO (nx12528z11), .S (nx12528z12), .DI (data_int[10])
            , .CI (nx12528z13)) ;
    MUXCY_L ix12528z63349 (.LO (nx12528z9), .S (nx12528z10), .DI (data_int[11])
            , .CI (nx12528z11)) ;
    MUXCY_L ix12528z63347 (.LO (nx12528z7), .S (nx12528z8), .DI (data_int[12]), 
            .CI (nx12528z9)) ;
    MUXCY_L ix12528z63345 (.LO (nx12528z5), .S (nx12528z6), .DI (data_int[13]), 
            .CI (nx12528z7)) ;
    MUXCY_L ix12528z63343 (.LO (nx12528z3), .S (nx12528z4), .DI (data_int[14]), 
            .CI (nx12528z5)) ;
    MUXCY ix12528z52224 (.O (nx12528z1), .S (nx12528z2), .DI (data_int[15]), .CI (
          nx12528z3)) ;
    MUXCY_L ix12528z63403 (.LO (nx12528z63), .S (nx12528z64), .DI (b_int[0]), .CI (
            nx39402z2)) ;
    MUXCY_L ix12528z63401 (.LO (nx12528z61), .S (nx12528z62), .DI (b_int[1]), .CI (
            nx12528z63)) ;
    MUXCY_L ix12528z63399 (.LO (nx12528z59), .S (nx12528z60), .DI (b_int[2]), .CI (
            nx12528z61)) ;
    MUXCY_L ix12528z63397 (.LO (nx12528z57), .S (nx12528z58), .DI (b_int[3]), .CI (
            nx12528z59)) ;
    MUXCY_L ix12528z63395 (.LO (nx12528z55), .S (nx12528z56), .DI (b_int[4]), .CI (
            nx12528z57)) ;
    MUXCY_L ix12528z63393 (.LO (nx12528z53), .S (nx12528z54), .DI (b_int[5]), .CI (
            nx12528z55)) ;
    MUXCY_L ix12528z63391 (.LO (nx12528z51), .S (nx12528z52), .DI (b_int[6]), .CI (
            nx12528z53)) ;
    MUXCY_L ix12528z63389 (.LO (nx12528z49), .S (nx12528z50), .DI (b_int[7]), .CI (
            nx12528z51)) ;
    MUXCY_L ix12528z63387 (.LO (nx12528z47), .S (nx12528z48), .DI (b_int[8]), .CI (
            nx12528z49)) ;
    MUXCY_L ix12528z63385 (.LO (nx12528z45), .S (nx12528z46), .DI (b_int[9]), .CI (
            nx12528z47)) ;
    MUXCY_L ix12528z63383 (.LO (nx12528z43), .S (nx12528z44), .DI (b_int[10]), .CI (
            nx12528z45)) ;
    MUXCY_L ix12528z63381 (.LO (nx12528z41), .S (nx12528z42), .DI (b_int[11]), .CI (
            nx12528z43)) ;
    MUXCY_L ix12528z63379 (.LO (nx12528z39), .S (nx12528z40), .DI (b_int[12]), .CI (
            nx12528z41)) ;
    MUXCY_L ix12528z63377 (.LO (nx12528z37), .S (nx12528z38), .DI (b_int[13]), .CI (
            nx12528z39)) ;
    MUXCY_L ix12528z63375 (.LO (nx12528z35), .S (nx12528z36), .DI (b_int[14]), .CI (
            nx12528z37)) ;
    MUXCY ix12528z52256 (.O (nx12528z33), .S (nx12528z34), .DI (b_int[15]), .CI (
          nx12528z35)) ;
    LUT4_L pass1_eq_0i1_eq_LUT_0 (.LO (nx52065z1), .I0 (data_int[15]), .I1 (
           d_int[15]), .I2 (data_int[14]), .I3 (d_int[14])) ;
           defparam pass1_eq_0i1_eq_LUT_0.INIT = 16'h9009;
    MUXCY_L pass1_eq_0i1_eq_muxcy_0 (.LO (nx52064z2), .S (nx52065z1), .DI (
            nx39395z2), .CI (nx39402z2)) ;
    LUT4_L pass1_eq_0i1_eq_LUT_1 (.LO (nx52064z1), .I0 (data_int[13]), .I1 (
           d_int[13]), .I2 (data_int[12]), .I3 (d_int[12])) ;
           defparam pass1_eq_0i1_eq_LUT_1.INIT = 16'h9009;
    MUXCY_L pass1_eq_0i1_eq_muxcy_1 (.LO (nx52063z2), .S (nx52064z1), .DI (
            nx39395z2), .CI (nx52064z2)) ;
    LUT4_L pass1_eq_0i1_eq_LUT_2 (.LO (nx52063z1), .I0 (data_int[11]), .I1 (
           d_int[11]), .I2 (data_int[10]), .I3 (d_int[10])) ;
           defparam pass1_eq_0i1_eq_LUT_2.INIT = 16'h9009;
    MUXCY_L pass1_eq_0i1_eq_muxcy_2 (.LO (nx52062z2), .S (nx52063z1), .DI (
            nx39395z2), .CI (nx52063z2)) ;
    LUT4_L pass1_eq_0i1_eq_LUT_3 (.LO (nx52062z1), .I0 (data_int[9]), .I1 (
           d_int[9]), .I2 (data_int[8]), .I3 (d_int[8])) ;
           defparam pass1_eq_0i1_eq_LUT_3.INIT = 16'h9009;
    MUXCY_L pass1_eq_0i1_eq_muxcy_3 (.LO (nx52061z2), .S (nx52062z1), .DI (
            nx39395z2), .CI (nx52062z2)) ;
    LUT4_L pass1_eq_0i1_eq_LUT_4 (.LO (nx52061z1), .I0 (data_int[7]), .I1 (
           d_int[7]), .I2 (data_int[6]), .I3 (d_int[6])) ;
           defparam pass1_eq_0i1_eq_LUT_4.INIT = 16'h9009;
    MUXCY_L pass1_eq_0i1_eq_muxcy_4 (.LO (nx52060z2), .S (nx52061z1), .DI (
            nx39395z2), .CI (nx52061z2)) ;
    LUT4_L pass1_eq_0i1_eq_LUT_5 (.LO (nx52060z1), .I0 (data_int[5]), .I1 (
           d_int[5]), .I2 (data_int[4]), .I3 (d_int[4])) ;
           defparam pass1_eq_0i1_eq_LUT_5.INIT = 16'h9009;
    MUXCY_L pass1_eq_0i1_eq_muxcy_5 (.LO (nx52059z2), .S (nx52060z1), .DI (
            nx39395z2), .CI (nx52060z2)) ;
    LUT4_L pass1_eq_0i1_eq_LUT_6 (.LO (nx52059z1), .I0 (data_int[3]), .I1 (
           d_int[3]), .I2 (data_int[2]), .I3 (d_int[2])) ;
           defparam pass1_eq_0i1_eq_LUT_6.INIT = 16'h9009;
    MUXCY_L pass1_eq_0i1_eq_muxcy_6 (.LO (nx52058z2), .S (nx52059z1), .DI (
            nx39395z2), .CI (nx52059z2)) ;
    LUT4_L pass1_eq_0i1_eq_LUT_7 (.LO (nx52058z1), .I0 (data_int[1]), .I1 (
           d_int[1]), .I2 (data_int[0]), .I3 (d_int[0])) ;
           defparam pass1_eq_0i1_eq_LUT_7.INIT = 16'h9009;
    MUXCY pass1_eq_0i1_eq_muxcy_7 (.O (pass1_0n1s2), .S (nx52058z1), .DI (
          nx39395z2), .CI (nx52058z2)) ;
    LUT4_L pass1_eq_0i2_eq_LUT_0 (.LO (nx47844z1), .I0 (data_int[15]), .I1 (
           c_int[15]), .I2 (data_int[14]), .I3 (c_int[14])) ;
           defparam pass1_eq_0i2_eq_LUT_0.INIT = 16'h9009;
    MUXCY_L pass1_eq_0i2_eq_muxcy_0 (.LO (nx47843z2), .S (nx47844z1), .DI (
            nx39395z2), .CI (nx39402z2)) ;
    LUT4_L pass1_eq_0i2_eq_LUT_1 (.LO (nx47843z1), .I0 (data_int[13]), .I1 (
           c_int[13]), .I2 (data_int[12]), .I3 (c_int[12])) ;
           defparam pass1_eq_0i2_eq_LUT_1.INIT = 16'h9009;
    MUXCY_L pass1_eq_0i2_eq_muxcy_1 (.LO (nx47842z2), .S (nx47843z1), .DI (
            nx39395z2), .CI (nx47843z2)) ;
    LUT4_L pass1_eq_0i2_eq_LUT_2 (.LO (nx47842z1), .I0 (data_int[11]), .I1 (
           c_int[11]), .I2 (data_int[10]), .I3 (c_int[10])) ;
           defparam pass1_eq_0i2_eq_LUT_2.INIT = 16'h9009;
    MUXCY_L pass1_eq_0i2_eq_muxcy_2 (.LO (nx47841z2), .S (nx47842z1), .DI (
            nx39395z2), .CI (nx47842z2)) ;
    LUT4_L pass1_eq_0i2_eq_LUT_3 (.LO (nx47841z1), .I0 (data_int[9]), .I1 (
           c_int[9]), .I2 (data_int[8]), .I3 (c_int[8])) ;
           defparam pass1_eq_0i2_eq_LUT_3.INIT = 16'h9009;
    MUXCY_L pass1_eq_0i2_eq_muxcy_3 (.LO (nx47840z2), .S (nx47841z1), .DI (
            nx39395z2), .CI (nx47841z2)) ;
    LUT4_L pass1_eq_0i2_eq_LUT_4 (.LO (nx47840z1), .I0 (data_int[7]), .I1 (
           c_int[7]), .I2 (data_int[6]), .I3 (c_int[6])) ;
           defparam pass1_eq_0i2_eq_LUT_4.INIT = 16'h9009;
    MUXCY_L pass1_eq_0i2_eq_muxcy_4 (.LO (nx47839z2), .S (nx47840z1), .DI (
            nx39395z2), .CI (nx47840z2)) ;
    LUT4_L pass1_eq_0i2_eq_LUT_5 (.LO (nx47839z1), .I0 (data_int[5]), .I1 (
           c_int[5]), .I2 (data_int[4]), .I3 (c_int[4])) ;
           defparam pass1_eq_0i2_eq_LUT_5.INIT = 16'h9009;
    MUXCY_L pass1_eq_0i2_eq_muxcy_5 (.LO (nx47838z2), .S (nx47839z1), .DI (
            nx39395z2), .CI (nx47839z2)) ;
    LUT4_L pass1_eq_0i2_eq_LUT_6 (.LO (nx47838z1), .I0 (data_int[3]), .I1 (
           c_int[3]), .I2 (data_int[2]), .I3 (c_int[2])) ;
           defparam pass1_eq_0i2_eq_LUT_6.INIT = 16'h9009;
    MUXCY_L pass1_eq_0i2_eq_muxcy_6 (.LO (nx47837z2), .S (nx47838z1), .DI (
            nx39395z2), .CI (nx47838z2)) ;
    LUT4_L pass1_eq_0i2_eq_LUT_7 (.LO (nx47837z1), .I0 (data_int[1]), .I1 (
           c_int[1]), .I2 (data_int[0]), .I3 (c_int[0])) ;
           defparam pass1_eq_0i2_eq_LUT_7.INIT = 16'h9009;
    MUXCY pass1_eq_0i2_eq_muxcy_7 (.O (pass1_0n1s4), .S (nx47837z1), .DI (
          nx39395z2), .CI (nx47837z2)) ;
    LUT4_L pass1_eq_0i3_eq_LUT_0 (.LO (nx21913z1), .I0 (data_int[15]), .I1 (
           b_int[15]), .I2 (data_int[14]), .I3 (b_int[14])) ;
           defparam pass1_eq_0i3_eq_LUT_0.INIT = 16'h9009;
    MUXCY_L pass1_eq_0i3_eq_muxcy_0 (.LO (nx21914z2), .S (nx21913z1), .DI (
            nx39395z2), .CI (nx39402z2)) ;
    LUT4_L pass1_eq_0i3_eq_LUT_1 (.LO (nx21914z1), .I0 (data_int[13]), .I1 (
           b_int[13]), .I2 (data_int[12]), .I3 (b_int[12])) ;
           defparam pass1_eq_0i3_eq_LUT_1.INIT = 16'h9009;
    MUXCY_L pass1_eq_0i3_eq_muxcy_1 (.LO (nx21915z2), .S (nx21914z1), .DI (
            nx39395z2), .CI (nx21914z2)) ;
    LUT4_L pass1_eq_0i3_eq_LUT_2 (.LO (nx21915z1), .I0 (data_int[11]), .I1 (
           b_int[11]), .I2 (data_int[10]), .I3 (b_int[10])) ;
           defparam pass1_eq_0i3_eq_LUT_2.INIT = 16'h9009;
    MUXCY_L pass1_eq_0i3_eq_muxcy_2 (.LO (nx21916z2), .S (nx21915z1), .DI (
            nx39395z2), .CI (nx21915z2)) ;
    LUT4_L pass1_eq_0i3_eq_LUT_3 (.LO (nx21916z1), .I0 (data_int[9]), .I1 (
           b_int[9]), .I2 (data_int[8]), .I3 (b_int[8])) ;
           defparam pass1_eq_0i3_eq_LUT_3.INIT = 16'h9009;
    MUXCY_L pass1_eq_0i3_eq_muxcy_3 (.LO (nx21917z2), .S (nx21916z1), .DI (
            nx39395z2), .CI (nx21916z2)) ;
    LUT4_L pass1_eq_0i3_eq_LUT_4 (.LO (nx21917z1), .I0 (data_int[7]), .I1 (
           b_int[7]), .I2 (data_int[6]), .I3 (b_int[6])) ;
           defparam pass1_eq_0i3_eq_LUT_4.INIT = 16'h9009;
    MUXCY_L pass1_eq_0i3_eq_muxcy_4 (.LO (nx21918z2), .S (nx21917z1), .DI (
            nx39395z2), .CI (nx21917z2)) ;
    LUT4_L pass1_eq_0i3_eq_LUT_5 (.LO (nx21918z1), .I0 (data_int[5]), .I1 (
           b_int[5]), .I2 (data_int[4]), .I3 (b_int[4])) ;
           defparam pass1_eq_0i3_eq_LUT_5.INIT = 16'h9009;
    MUXCY_L pass1_eq_0i3_eq_muxcy_5 (.LO (nx21919z2), .S (nx21918z1), .DI (
            nx39395z2), .CI (nx21918z2)) ;
    LUT4_L pass1_eq_0i3_eq_LUT_6 (.LO (nx21919z1), .I0 (data_int[3]), .I1 (
           b_int[3]), .I2 (data_int[2]), .I3 (b_int[2])) ;
           defparam pass1_eq_0i3_eq_LUT_6.INIT = 16'h9009;
    MUXCY_L pass1_eq_0i3_eq_muxcy_6 (.LO (nx21920z2), .S (nx21919z1), .DI (
            nx39395z2), .CI (nx21919z2)) ;
    LUT4_L pass1_eq_0i3_eq_LUT_7 (.LO (nx21920z1), .I0 (data_int[1]), .I1 (
           b_int[1]), .I2 (data_int[0]), .I3 (b_int[0])) ;
           defparam pass1_eq_0i3_eq_LUT_7.INIT = 16'h9009;
    MUXCY pass1_eq_0i3_eq_muxcy_7 (.O (pass1_0n1s6), .S (nx21920z1), .DI (
          nx39395z2), .CI (nx21920z2)) ;
    LUT4_L pass1_eq_0i4_eq_LUT_0 (.LO (nx39402z1), .I0 (data_int[15]), .I1 (
           a_int[15]), .I2 (data_int[14]), .I3 (a_int[14])) ;
           defparam pass1_eq_0i4_eq_LUT_0.INIT = 16'h9009;
    MUXCY_L pass1_eq_0i4_eq_muxcy_0 (.LO (nx39401z2), .S (nx39402z1), .DI (
            nx39395z2), .CI (nx39402z2)) ;
    LUT4_L pass1_eq_0i4_eq_LUT_1 (.LO (nx39401z1), .I0 (data_int[13]), .I1 (
           a_int[13]), .I2 (data_int[12]), .I3 (a_int[12])) ;
           defparam pass1_eq_0i4_eq_LUT_1.INIT = 16'h9009;
    MUXCY_L pass1_eq_0i4_eq_muxcy_1 (.LO (nx39400z2), .S (nx39401z1), .DI (
            nx39395z2), .CI (nx39401z2)) ;
    LUT4_L pass1_eq_0i4_eq_LUT_2 (.LO (nx39400z1), .I0 (data_int[11]), .I1 (
           a_int[11]), .I2 (data_int[10]), .I3 (a_int[10])) ;
           defparam pass1_eq_0i4_eq_LUT_2.INIT = 16'h9009;
    MUXCY_L pass1_eq_0i4_eq_muxcy_2 (.LO (nx39399z2), .S (nx39400z1), .DI (
            nx39395z2), .CI (nx39400z2)) ;
    LUT4_L pass1_eq_0i4_eq_LUT_3 (.LO (nx39399z1), .I0 (data_int[9]), .I1 (
           a_int[9]), .I2 (data_int[8]), .I3 (a_int[8])) ;
           defparam pass1_eq_0i4_eq_LUT_3.INIT = 16'h9009;
    MUXCY_L pass1_eq_0i4_eq_muxcy_3 (.LO (nx39398z2), .S (nx39399z1), .DI (
            nx39395z2), .CI (nx39399z2)) ;
    LUT4_L pass1_eq_0i4_eq_LUT_4 (.LO (nx39398z1), .I0 (data_int[7]), .I1 (
           a_int[7]), .I2 (data_int[6]), .I3 (a_int[6])) ;
           defparam pass1_eq_0i4_eq_LUT_4.INIT = 16'h9009;
    MUXCY_L pass1_eq_0i4_eq_muxcy_4 (.LO (nx39397z2), .S (nx39398z1), .DI (
            nx39395z2), .CI (nx39398z2)) ;
    LUT4_L pass1_eq_0i4_eq_LUT_5 (.LO (nx39397z1), .I0 (data_int[5]), .I1 (
           a_int[5]), .I2 (data_int[4]), .I3 (a_int[4])) ;
           defparam pass1_eq_0i4_eq_LUT_5.INIT = 16'h9009;
    MUXCY_L pass1_eq_0i4_eq_muxcy_5 (.LO (nx39396z2), .S (nx39397z1), .DI (
            nx39395z2), .CI (nx39397z2)) ;
    LUT4_L pass1_eq_0i4_eq_LUT_6 (.LO (nx39396z1), .I0 (data_int[3]), .I1 (
           a_int[3]), .I2 (data_int[2]), .I3 (a_int[2])) ;
           defparam pass1_eq_0i4_eq_LUT_6.INIT = 16'h9009;
    MUXCY_L pass1_eq_0i4_eq_muxcy_6 (.LO (nx39395z3), .S (nx39396z1), .DI (
            nx39395z2), .CI (nx39396z2)) ;
    LUT4_L pass1_eq_0i4_eq_LUT_7 (.LO (nx39395z1), .I0 (data_int[1]), .I1 (
           a_int[1]), .I2 (data_int[0]), .I3 (a_int[0])) ;
           defparam pass1_eq_0i4_eq_LUT_7.INIT = 16'h9009;
    MUXCY pass1_eq_0i4_eq_muxcy_7 (.O (pass1_0n1s7), .S (nx39395z1), .DI (
          nx39395z2), .CI (nx39395z3)) ;
    OBUF pass3_obuf (.O (pass3), .I (pass3_dup_0)) ;
    OBUF pass2_obuf (.O (pass2), .I (pass2_dup_0)) ;
    OBUF pass1_obuf (.O (pass1), .I (pass1_dup_0)) ;
    IBUF \c_ibuf(0)  (.O (c_int[0]), .I (c[0])) ;
    IBUF \c_ibuf(1)  (.O (c_int[1]), .I (c[1])) ;
    IBUF \c_ibuf(2)  (.O (c_int[2]), .I (c[2])) ;
    IBUF \c_ibuf(3)  (.O (c_int[3]), .I (c[3])) ;
    IBUF \c_ibuf(4)  (.O (c_int[4]), .I (c[4])) ;
    IBUF \c_ibuf(5)  (.O (c_int[5]), .I (c[5])) ;
    IBUF \c_ibuf(6)  (.O (c_int[6]), .I (c[6])) ;
    IBUF \c_ibuf(7)  (.O (c_int[7]), .I (c[7])) ;
    IBUF \c_ibuf(8)  (.O (c_int[8]), .I (c[8])) ;
    IBUF \c_ibuf(9)  (.O (c_int[9]), .I (c[9])) ;
    IBUF \c_ibuf(10)  (.O (c_int[10]), .I (c[10])) ;
    IBUF \c_ibuf(11)  (.O (c_int[11]), .I (c[11])) ;
    IBUF \c_ibuf(12)  (.O (c_int[12]), .I (c[12])) ;
    IBUF \c_ibuf(13)  (.O (c_int[13]), .I (c[13])) ;
    IBUF \c_ibuf(14)  (.O (c_int[14]), .I (c[14])) ;
    IBUF \c_ibuf(15)  (.O (c_int[15]), .I (c[15])) ;
    IBUF \d_ibuf(0)  (.O (d_int[0]), .I (d[0])) ;
    IBUF \d_ibuf(1)  (.O (d_int[1]), .I (d[1])) ;
    IBUF \d_ibuf(2)  (.O (d_int[2]), .I (d[2])) ;
    IBUF \d_ibuf(3)  (.O (d_int[3]), .I (d[3])) ;
    IBUF \d_ibuf(4)  (.O (d_int[4]), .I (d[4])) ;
    IBUF \d_ibuf(5)  (.O (d_int[5]), .I (d[5])) ;
    IBUF \d_ibuf(6)  (.O (d_int[6]), .I (d[6])) ;
    IBUF \d_ibuf(7)  (.O (d_int[7]), .I (d[7])) ;
    IBUF \d_ibuf(8)  (.O (d_int[8]), .I (d[8])) ;
    IBUF \d_ibuf(9)  (.O (d_int[9]), .I (d[9])) ;
    IBUF \d_ibuf(10)  (.O (d_int[10]), .I (d[10])) ;
    IBUF \d_ibuf(11)  (.O (d_int[11]), .I (d[11])) ;
    IBUF \d_ibuf(12)  (.O (d_int[12]), .I (d[12])) ;
    IBUF \d_ibuf(13)  (.O (d_int[13]), .I (d[13])) ;
    IBUF \d_ibuf(14)  (.O (d_int[14]), .I (d[14])) ;
    IBUF \d_ibuf(15)  (.O (d_int[15]), .I (d[15])) ;
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
    LUT4 ix60795z1312 (.O (pass1_dup_0), .I0 (pass1_0n1s7), .I1 (pass1_0n1s6), .I2 (
         pass1_0n1s4), .I3 (pass1_0n1s2)) ;
         defparam ix60795z1312.INIT = 16'hFFFE;
    LUT2 ix12528z1322 (.O (pass2_dup_0), .I0 (nx12528z1), .I1 (nx12528z33)) ;
         defparam ix12528z1322.INIT = 4'h8;
    LUT4 ix20315z1330 (.O (pass3_dup_0), .I0 (nx20315z1), .I1 (nx20315z2), .I2 (
         data_int[1]), .I3 (data_int[0])) ;
         defparam ix20315z1330.INIT = 16'h0010;
    VCC ps_vcc (.P (nx39402z2)) ;
    LUT2 ix12528z1355 (.O (nx12528z32), .I0 (data_int[0]), .I1 (a_int[0])) ;
         defparam ix12528z1355.INIT = 4'h9;
    LUT2 ix12528z1353 (.O (nx12528z30), .I0 (data_int[1]), .I1 (a_int[1])) ;
         defparam ix12528z1353.INIT = 4'h9;
    LUT2 ix12528z1351 (.O (nx12528z28), .I0 (data_int[2]), .I1 (a_int[2])) ;
         defparam ix12528z1351.INIT = 4'h9;
    LUT2 ix12528z1349 (.O (nx12528z26), .I0 (data_int[3]), .I1 (a_int[3])) ;
         defparam ix12528z1349.INIT = 4'h9;
    LUT2 ix12528z1347 (.O (nx12528z24), .I0 (data_int[4]), .I1 (a_int[4])) ;
         defparam ix12528z1347.INIT = 4'h9;
    LUT2 ix12528z1345 (.O (nx12528z22), .I0 (data_int[5]), .I1 (a_int[5])) ;
         defparam ix12528z1345.INIT = 4'h9;
    LUT2 ix12528z1343 (.O (nx12528z20), .I0 (data_int[6]), .I1 (a_int[6])) ;
         defparam ix12528z1343.INIT = 4'h9;
    LUT2 ix12528z1341 (.O (nx12528z18), .I0 (data_int[7]), .I1 (a_int[7])) ;
         defparam ix12528z1341.INIT = 4'h9;
    LUT2 ix12528z1339 (.O (nx12528z16), .I0 (data_int[8]), .I1 (a_int[8])) ;
         defparam ix12528z1339.INIT = 4'h9;
    LUT2 ix12528z1337 (.O (nx12528z14), .I0 (data_int[9]), .I1 (a_int[9])) ;
         defparam ix12528z1337.INIT = 4'h9;
    LUT2 ix12528z1335 (.O (nx12528z12), .I0 (data_int[10]), .I1 (a_int[10])) ;
         defparam ix12528z1335.INIT = 4'h9;
    LUT2 ix12528z1333 (.O (nx12528z10), .I0 (data_int[11]), .I1 (a_int[11])) ;
         defparam ix12528z1333.INIT = 4'h9;
    LUT2 ix12528z1331 (.O (nx12528z8), .I0 (data_int[12]), .I1 (a_int[12])) ;
         defparam ix12528z1331.INIT = 4'h9;
    LUT2 ix12528z1329 (.O (nx12528z6), .I0 (data_int[13]), .I1 (a_int[13])) ;
         defparam ix12528z1329.INIT = 4'h9;
    LUT2 ix12528z1327 (.O (nx12528z4), .I0 (data_int[14]), .I1 (a_int[14])) ;
         defparam ix12528z1327.INIT = 4'h9;
    LUT2 ix12528z1325 (.O (nx12528z2), .I0 (data_int[15]), .I1 (a_int[15])) ;
         defparam ix12528z1325.INIT = 4'h9;
    GND ps_gnd (.G (nx39395z2)) ;
    LUT2 ix12528z1387 (.O (nx12528z64), .I0 (data_int[0]), .I1 (b_int[0])) ;
         defparam ix12528z1387.INIT = 4'h9;
    LUT2 ix12528z1385 (.O (nx12528z62), .I0 (data_int[1]), .I1 (b_int[1])) ;
         defparam ix12528z1385.INIT = 4'h9;
    LUT2 ix12528z1383 (.O (nx12528z60), .I0 (data_int[2]), .I1 (b_int[2])) ;
         defparam ix12528z1383.INIT = 4'h9;
    LUT2 ix12528z1381 (.O (nx12528z58), .I0 (data_int[3]), .I1 (b_int[3])) ;
         defparam ix12528z1381.INIT = 4'h9;
    LUT2 ix12528z1379 (.O (nx12528z56), .I0 (data_int[4]), .I1 (b_int[4])) ;
         defparam ix12528z1379.INIT = 4'h9;
    LUT2 ix12528z1377 (.O (nx12528z54), .I0 (data_int[5]), .I1 (b_int[5])) ;
         defparam ix12528z1377.INIT = 4'h9;
    LUT2 ix12528z1375 (.O (nx12528z52), .I0 (data_int[6]), .I1 (b_int[6])) ;
         defparam ix12528z1375.INIT = 4'h9;
    LUT2 ix12528z1373 (.O (nx12528z50), .I0 (data_int[7]), .I1 (b_int[7])) ;
         defparam ix12528z1373.INIT = 4'h9;
    LUT2 ix12528z1371 (.O (nx12528z48), .I0 (data_int[8]), .I1 (b_int[8])) ;
         defparam ix12528z1371.INIT = 4'h9;
    LUT2 ix12528z1369 (.O (nx12528z46), .I0 (data_int[9]), .I1 (b_int[9])) ;
         defparam ix12528z1369.INIT = 4'h9;
    LUT2 ix12528z1367 (.O (nx12528z44), .I0 (data_int[10]), .I1 (b_int[10])) ;
         defparam ix12528z1367.INIT = 4'h9;
    LUT2 ix12528z1365 (.O (nx12528z42), .I0 (data_int[11]), .I1 (b_int[11])) ;
         defparam ix12528z1365.INIT = 4'h9;
    LUT2 ix12528z1363 (.O (nx12528z40), .I0 (data_int[12]), .I1 (b_int[12])) ;
         defparam ix12528z1363.INIT = 4'h9;
    LUT2 ix12528z1361 (.O (nx12528z38), .I0 (data_int[13]), .I1 (b_int[13])) ;
         defparam ix12528z1361.INIT = 4'h9;
    LUT2 ix12528z1359 (.O (nx12528z36), .I0 (data_int[14]), .I1 (b_int[14])) ;
         defparam ix12528z1359.INIT = 4'h9;
    LUT2 ix12528z1357 (.O (nx12528z34), .I0 (data_int[15]), .I1 (b_int[15])) ;
         defparam ix12528z1357.INIT = 4'h9;
    LUT4 ix20315z1313 (.O (nx20315z1), .I0 (data_int[15]), .I1 (data_int[14]), .I2 (
         data_int[13]), .I3 (data_int[12])) ;
         defparam ix20315z1313.INIT = 16'hFFFE;
    LUT2 ix20315z1329 (.O (nx20315z2), .I0 (data_int[3]), .I1 (data_int[2])) ;
         defparam ix20315z1329.INIT = 4'hD;
endmodule

