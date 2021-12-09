//
// Verilog description for cell add_third_byte, 
// 02/06/14 02:49:22
//
// Precision RTL Synthesis, 2013a.9//


module add_third_byte ( \a(0) , \a(1) , \a(2) , \a(3) , \b(0) , \b(1) , \b(2) , 
                        \b(3) , sum, co ) ;

    input [7:0]\a(0)  ;
    input [7:0]\a(1)  ;
    input [7:0]\a(2)  ;
    input [7:0]\a(3)  ;
    input [7:0]\b(0)  ;
    input [7:0]\b(1)  ;
    input [7:0]\b(2)  ;
    input [7:0]\b(3)  ;
    output [7:0]sum ;
    output co ;

    wire [7:0]sum_dup_0;
    wire co_dup_0, nx3610z2, nx3611z2, nx3612z2, nx3613z2, nx3614z2, nx3615z2, 
         nx56545z2;
    wire [7:0]a_int;
    wire [7:0]b_int;
    wire GND, nx3609z1, nx3610z1, nx3611z1, nx3612z1, nx3613z1, nx3614z1, 
         nx3615z1, nx56545z1;



    XORCY co_add8_0_xorcy_0 (.O (sum_dup_0[0]), .LI (nx3609z1), .CI (GND)) ;
    MUXCY_L co_add8_0_muxcy_0 (.LO (nx3610z2), .S (nx3609z1), .DI (a_int[0]), .CI (
            GND)) ;
    XORCY co_add8_0_xorcy_1 (.O (sum_dup_0[1]), .LI (nx3610z1), .CI (nx3610z2)
          ) ;
    MUXCY_L co_add8_0_muxcy_1 (.LO (nx3611z2), .S (nx3610z1), .DI (a_int[1]), .CI (
            nx3610z2)) ;
    XORCY co_add8_0_xorcy_2 (.O (sum_dup_0[2]), .LI (nx3611z1), .CI (nx3611z2)
          ) ;
    MUXCY_L co_add8_0_muxcy_2 (.LO (nx3612z2), .S (nx3611z1), .DI (a_int[2]), .CI (
            nx3611z2)) ;
    XORCY co_add8_0_xorcy_3 (.O (sum_dup_0[3]), .LI (nx3612z1), .CI (nx3612z2)
          ) ;
    MUXCY_L co_add8_0_muxcy_3 (.LO (nx3613z2), .S (nx3612z1), .DI (a_int[3]), .CI (
            nx3612z2)) ;
    XORCY co_add8_0_xorcy_4 (.O (sum_dup_0[4]), .LI (nx3613z1), .CI (nx3613z2)
          ) ;
    MUXCY_L co_add8_0_muxcy_4 (.LO (nx3614z2), .S (nx3613z1), .DI (a_int[4]), .CI (
            nx3613z2)) ;
    XORCY co_add8_0_xorcy_5 (.O (sum_dup_0[5]), .LI (nx3614z1), .CI (nx3614z2)
          ) ;
    MUXCY_L co_add8_0_muxcy_5 (.LO (nx3615z2), .S (nx3614z1), .DI (a_int[5]), .CI (
            nx3614z2)) ;
    XORCY co_add8_0_xorcy_6 (.O (sum_dup_0[6]), .LI (nx3615z1), .CI (nx3615z2)
          ) ;
    MUXCY_L co_add8_0_muxcy_6 (.LO (nx56545z2), .S (nx3615z1), .DI (a_int[6]), .CI (
            nx3615z2)) ;
    XORCY co_add8_0_xorcy_7 (.O (sum_dup_0[7]), .LI (nx56545z1), .CI (nx56545z2)
          ) ;
    MUXCY co_add8_0_muxcy_7 (.O (co_dup_0), .S (nx56545z1), .DI (a_int[7]), .CI (
          nx56545z2)) ;
    OBUF co_obuf (.O (co), .I (co_dup_0)) ;
    OBUF \sum_obuf(0)  (.O (sum[0]), .I (sum_dup_0[0])) ;
    OBUF \sum_obuf(1)  (.O (sum[1]), .I (sum_dup_0[1])) ;
    OBUF \sum_obuf(2)  (.O (sum[2]), .I (sum_dup_0[2])) ;
    OBUF \sum_obuf(3)  (.O (sum[3]), .I (sum_dup_0[3])) ;
    OBUF \sum_obuf(4)  (.O (sum[4]), .I (sum_dup_0[4])) ;
    OBUF \sum_obuf(5)  (.O (sum[5]), .I (sum_dup_0[5])) ;
    OBUF \sum_obuf(6)  (.O (sum[6]), .I (sum_dup_0[6])) ;
    OBUF \sum_obuf(7)  (.O (sum[7]), .I (sum_dup_0[7])) ;
    IBUF \b_ibuf(2)(0)  (.O (b_int[0]), .I (\b(2) [0])) ;
    IBUF \b_ibuf(2)(1)  (.O (b_int[1]), .I (\b(2) [1])) ;
    IBUF \b_ibuf(2)(2)  (.O (b_int[2]), .I (\b(2) [2])) ;
    IBUF \b_ibuf(2)(3)  (.O (b_int[3]), .I (\b(2) [3])) ;
    IBUF \b_ibuf(2)(4)  (.O (b_int[4]), .I (\b(2) [4])) ;
    IBUF \b_ibuf(2)(5)  (.O (b_int[5]), .I (\b(2) [5])) ;
    IBUF \b_ibuf(2)(6)  (.O (b_int[6]), .I (\b(2) [6])) ;
    IBUF \b_ibuf(2)(7)  (.O (b_int[7]), .I (\b(2) [7])) ;
    IBUF \a_ibuf(2)(0)  (.O (a_int[0]), .I (\a(2) [0])) ;
    IBUF \a_ibuf(2)(1)  (.O (a_int[1]), .I (\a(2) [1])) ;
    IBUF \a_ibuf(2)(2)  (.O (a_int[2]), .I (\a(2) [2])) ;
    IBUF \a_ibuf(2)(3)  (.O (a_int[3]), .I (\a(2) [3])) ;
    IBUF \a_ibuf(2)(4)  (.O (a_int[4]), .I (\a(2) [4])) ;
    IBUF \a_ibuf(2)(5)  (.O (a_int[5]), .I (\a(2) [5])) ;
    IBUF \a_ibuf(2)(6)  (.O (a_int[6]), .I (\a(2) [6])) ;
    IBUF \a_ibuf(2)(7)  (.O (a_int[7]), .I (\a(2) [7])) ;
    GND GND_rename12 (.G (GND)) ;
    LUT2 ix3609z1320 (.O (nx3609z1), .I0 (a_int[0]), .I1 (b_int[0])) ;
         defparam ix3609z1320.INIT = 4'h6;
    LUT2 ix3610z1320 (.O (nx3610z1), .I0 (a_int[1]), .I1 (b_int[1])) ;
         defparam ix3610z1320.INIT = 4'h6;
    LUT2 ix3611z1320 (.O (nx3611z1), .I0 (a_int[2]), .I1 (b_int[2])) ;
         defparam ix3611z1320.INIT = 4'h6;
    LUT2 ix3612z1320 (.O (nx3612z1), .I0 (a_int[3]), .I1 (b_int[3])) ;
         defparam ix3612z1320.INIT = 4'h6;
    LUT2 ix3613z1320 (.O (nx3613z1), .I0 (a_int[4]), .I1 (b_int[4])) ;
         defparam ix3613z1320.INIT = 4'h6;
    LUT2 ix3614z1320 (.O (nx3614z1), .I0 (a_int[5]), .I1 (b_int[5])) ;
         defparam ix3614z1320.INIT = 4'h6;
    LUT2 ix3615z1320 (.O (nx3615z1), .I0 (a_int[6]), .I1 (b_int[6])) ;
         defparam ix3615z1320.INIT = 4'h6;
    LUT2 ix56545z1320 (.O (nx56545z1), .I0 (a_int[7]), .I1 (b_int[7])) ;
         defparam ix56545z1320.INIT = 4'h6;
endmodule

