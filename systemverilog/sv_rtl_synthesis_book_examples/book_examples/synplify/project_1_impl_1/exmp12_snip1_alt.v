//
// Verilog description for cell exmp12_snip1_alt, 
// 02/07/14 10:47:48
//
// Precision RTL Synthesis, 2013a.9//


module exmp12_snip1_alt ( clk, rstn, pstn, count ) ;

    input clk ;
    input rstn ;
    input pstn ;
    output [7:0]count ;

    wire [7:0]count_dup_0;
    wire [7:0]rtlcn1;
    wire clk_int, rstn_int, pstn_int, nx29823z2, nx32814z2, not_rstn;
    wire [1:0] \$dummy ;




    inc_8_0 ix28826z59249 (.cin (\$dummy [0]), .a ({count_dup_0[7],
            count_dup_0[6],count_dup_0[5],count_dup_0[4],count_dup_0[3],
            count_dup_0[2],count_dup_0[1],count_dup_0[0]}), .d (rtlcn1), .cout (
            \$dummy [1])) ;
    OBUF \count_obuf(0)  (.O (count[0]), .I (count_dup_0[0])) ;
    OBUF \count_obuf(1)  (.O (count[1]), .I (count_dup_0[1])) ;
    OBUF \count_obuf(2)  (.O (count[2]), .I (count_dup_0[2])) ;
    OBUF \count_obuf(3)  (.O (count[3]), .I (count_dup_0[3])) ;
    OBUF \count_obuf(4)  (.O (count[4]), .I (count_dup_0[4])) ;
    OBUF \count_obuf(5)  (.O (count[5]), .I (count_dup_0[5])) ;
    OBUF \count_obuf(6)  (.O (count[6]), .I (count_dup_0[6])) ;
    OBUF \count_obuf(7)  (.O (count[7]), .I (count_dup_0[7])) ;
    IBUF pstn_ibuf (.O (pstn_int), .I (pstn)) ;
    IBUF rstn_ibuf (.O (rstn_int), .I (rstn)) ;
    FDCP \reg_count(0)  (.Q (count_dup_0[0]), .D (rtlcn1[0]), .C (clk_int), .CLR (
         not_rstn), .PRE (nx32814z2)) ;
    FDCP \reg_count(1)  (.Q (count_dup_0[1]), .D (rtlcn1[1]), .C (clk_int), .CLR (
         not_rstn), .PRE (nx32814z2)) ;
    FDCP \reg_count(2)  (.Q (count_dup_0[2]), .D (rtlcn1[2]), .C (clk_int), .CLR (
         not_rstn), .PRE (nx32814z2)) ;
    FDCP \reg_count(3)  (.Q (count_dup_0[3]), .D (rtlcn1[3]), .C (clk_int), .CLR (
         not_rstn), .PRE (nx32814z2)) ;
    FDC \reg_count(4)  (.Q (count_dup_0[4]), .D (rtlcn1[4]), .C (clk_int), .CLR (
        nx29823z2)) ;
    FDC \reg_count(5)  (.Q (count_dup_0[5]), .D (rtlcn1[5]), .C (clk_int), .CLR (
        nx29823z2)) ;
    FDC \reg_count(6)  (.Q (count_dup_0[6]), .D (rtlcn1[6]), .C (clk_int), .CLR (
        nx29823z2)) ;
    FDC \reg_count(7)  (.Q (count_dup_0[7]), .D (rtlcn1[7]), .C (clk_int), .CLR (
        nx29823z2)) ;
    LUT2 ix29823z1321 (.O (nx29823z2), .I0 (rstn_int), .I1 (pstn_int)) ;
         defparam ix29823z1321.INIT = 4'h7;
    LUT2 ix32814z1317 (.O (nx32814z2), .I0 (rstn_int), .I1 (pstn_int)) ;
         defparam ix32814z1317.INIT = 4'h2;
    LUT1 ix32814z1315 (.O (not_rstn), .I0 (rstn_int)) ;
         defparam ix32814z1315.INIT = 4'h1;
    BUFGP clk_ibuf (.O (clk_int), .I (clk)) ;
endmodule


module inc_8_0 ( cin, a, d, cout ) ;

    input cin ;
    input [7:0]a ;
    output [7:0]d ;
    output cout ;

    wire nx8479z3, nx8473z3, nx8473z1, nx8474z3, nx8474z1, nx8475z3, nx8475z1, 
         nx8476z3, nx8476z1, nx8477z3, nx8477z1, nx8478z3, nx8478z1, nx8479z4, 
         nx8479z1, nx51681z2;



    GND ps_gnd (.G (nx8479z3)) ;
    VCC ps_vcc (.P (nx8473z3)) ;
    LUT1_L ix8473z1316 (.LO (nx8473z1), .I0 (a[0])) ;
           defparam ix8473z1316.INIT = 4'h2;
    XORCY xorcy_0 (.O (d[0]), .LI (nx8473z1), .CI (nx8473z3)) ;
    MUXCY_L muxcy_0 (.LO (nx8474z3), .S (nx8473z1), .DI (nx8479z3), .CI (
            nx8473z3)) ;
    LUT1_L ix8474z1316 (.LO (nx8474z1), .I0 (a[1])) ;
           defparam ix8474z1316.INIT = 4'h2;
    XORCY xorcy_1 (.O (d[1]), .LI (nx8474z1), .CI (nx8474z3)) ;
    MUXCY_L muxcy_1 (.LO (nx8475z3), .S (nx8474z1), .DI (nx8479z3), .CI (
            nx8474z3)) ;
    LUT1_L ix8475z1316 (.LO (nx8475z1), .I0 (a[2])) ;
           defparam ix8475z1316.INIT = 4'h2;
    XORCY xorcy_2 (.O (d[2]), .LI (nx8475z1), .CI (nx8475z3)) ;
    MUXCY_L muxcy_2 (.LO (nx8476z3), .S (nx8475z1), .DI (nx8479z3), .CI (
            nx8475z3)) ;
    LUT1_L ix8476z1316 (.LO (nx8476z1), .I0 (a[3])) ;
           defparam ix8476z1316.INIT = 4'h2;
    XORCY xorcy_3 (.O (d[3]), .LI (nx8476z1), .CI (nx8476z3)) ;
    MUXCY_L muxcy_3 (.LO (nx8477z3), .S (nx8476z1), .DI (nx8479z3), .CI (
            nx8476z3)) ;
    LUT1_L ix8477z1316 (.LO (nx8477z1), .I0 (a[4])) ;
           defparam ix8477z1316.INIT = 4'h2;
    XORCY xorcy_4 (.O (d[4]), .LI (nx8477z1), .CI (nx8477z3)) ;
    MUXCY_L muxcy_4 (.LO (nx8478z3), .S (nx8477z1), .DI (nx8479z3), .CI (
            nx8477z3)) ;
    LUT1_L ix8478z1316 (.LO (nx8478z1), .I0 (a[5])) ;
           defparam ix8478z1316.INIT = 4'h2;
    XORCY xorcy_5 (.O (d[5]), .LI (nx8478z1), .CI (nx8478z3)) ;
    MUXCY_L muxcy_5 (.LO (nx8479z4), .S (nx8478z1), .DI (nx8479z3), .CI (
            nx8478z3)) ;
    LUT1_L ix8479z1316 (.LO (nx8479z1), .I0 (a[6])) ;
           defparam ix8479z1316.INIT = 4'h2;
    XORCY xorcy_6 (.O (d[6]), .LI (nx8479z1), .CI (nx8479z4)) ;
    MUXCY_L muxcy_6 (.LO (nx51681z2), .S (nx8479z1), .DI (nx8479z3), .CI (
            nx8479z4)) ;
    XORCY xorcy_7 (.O (d[7]), .LI (a[7]), .CI (nx51681z2)) ;
endmodule

