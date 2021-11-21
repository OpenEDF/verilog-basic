/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : L-2016.03-SP1
// Date      : Sun Nov 21 16:06:51 2021
/////////////////////////////////////////////////////////////


module flowled_DW01_inc_0 ( A, SUM );
  input [23:0] A;
  output [23:0] SUM;

  wire   [23:2] carry;

  ADDHXL U1_1_22 ( .A(A[22]), .B(carry[22]), .CO(carry[23]), .S(SUM[22]) );
  ADDHXL U1_1_13 ( .A(A[13]), .B(carry[13]), .CO(carry[14]), .S(SUM[13]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_19 ( .A(A[19]), .B(carry[19]), .CO(carry[20]), .S(SUM[19]) );
  ADDHXL U1_1_8 ( .A(A[8]), .B(carry[8]), .CO(carry[9]), .S(SUM[8]) );
  ADDHXL U1_1_14 ( .A(A[14]), .B(carry[14]), .CO(carry[15]), .S(SUM[14]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_20 ( .A(A[20]), .B(carry[20]), .CO(carry[21]), .S(SUM[20]) );
  ADDHXL U1_1_9 ( .A(A[9]), .B(carry[9]), .CO(carry[10]), .S(SUM[9]) );
  ADDHXL U1_1_18 ( .A(A[18]), .B(carry[18]), .CO(carry[19]), .S(SUM[18]) );
  ADDHXL U1_1_7 ( .A(A[7]), .B(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  ADDHXL U1_1_21 ( .A(A[21]), .B(carry[21]), .CO(carry[22]), .S(SUM[21]) );
  ADDHXL U1_1_16 ( .A(A[16]), .B(carry[16]), .CO(carry[17]), .S(SUM[16]) );
  ADDHXL U1_1_15 ( .A(A[15]), .B(carry[15]), .CO(carry[16]), .S(SUM[15]) );
  ADDHXL U1_1_12 ( .A(A[12]), .B(carry[12]), .CO(carry[13]), .S(SUM[12]) );
  ADDHXL U1_1_10 ( .A(A[10]), .B(carry[10]), .CO(carry[11]), .S(SUM[10]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_17 ( .A(A[17]), .B(carry[17]), .CO(carry[18]), .S(SUM[17]) );
  ADDHXL U1_1_11 ( .A(A[11]), .B(carry[11]), .CO(carry[12]), .S(SUM[11]) );
  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  INVX1 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[23]), .B(A[23]), .Y(SUM[23]) );
endmodule


module flowled ( sys_clk, sys_rst_n, led_out );
  output [7:0] led_out;
  input sys_clk, sys_rst_n;
  wire   N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15, N16, N17, N18, N19,
         N20, N21, N22, N23, N24, N25, N26, N27, N28, N29, N30, N31, N32, N33,
         N34, N35, N36, N37, N38, N39, N40, N41, N42, N43, N44, N45, N46, N47,
         N48, N49, N50, N51, N52, n33, n34, n35, n36, n37, n38, n39, n40, n41,
         n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93,
         n94, n95, n96, n97;
  wire   [23:0] counter;

  flowled_DW01_inc_0 add_19 ( .A(counter), .SUM({N28, N27, N26, N25, N24, N23, 
        N22, N21, N20, N19, N18, N17, N16, N15, N14, N13, N12, N11, N10, N9, 
        N8, N7, N6, N5}) );
  DFFSX1 \led_out_reg[0]  ( .D(n41), .CK(sys_clk), .SN(sys_rst_n), .Q(
        led_out[0]), .QN(n33) );
  DFFRHQX1 \led_out_reg[1]  ( .D(n40), .CK(sys_clk), .RN(sys_rst_n), .Q(
        led_out[1]) );
  DFFRHQX1 \led_out_reg[2]  ( .D(n39), .CK(sys_clk), .RN(sys_rst_n), .Q(
        led_out[2]) );
  DFFRHQX1 \led_out_reg[3]  ( .D(n38), .CK(sys_clk), .RN(sys_rst_n), .Q(
        led_out[3]) );
  DFFRHQX1 \led_out_reg[4]  ( .D(n37), .CK(sys_clk), .RN(sys_rst_n), .Q(
        led_out[4]) );
  DFFRHQX1 \led_out_reg[5]  ( .D(n36), .CK(sys_clk), .RN(sys_rst_n), .Q(
        led_out[5]) );
  DFFRHQX1 \led_out_reg[6]  ( .D(n35), .CK(sys_clk), .RN(sys_rst_n), .Q(
        led_out[6]) );
  DFFRHQX1 \led_out_reg[7]  ( .D(n34), .CK(sys_clk), .RN(sys_rst_n), .Q(
        led_out[7]) );
  DFFRHQX1 \counter_reg[23]  ( .D(N52), .CK(sys_clk), .RN(sys_rst_n), .Q(
        counter[23]) );
  DFFRHQX1 \counter_reg[13]  ( .D(N42), .CK(sys_clk), .RN(sys_rst_n), .Q(
        counter[13]) );
  DFFRHQX1 \counter_reg[2]  ( .D(N31), .CK(sys_clk), .RN(sys_rst_n), .Q(
        counter[2]) );
  DFFRHQX1 \counter_reg[19]  ( .D(N48), .CK(sys_clk), .RN(sys_rst_n), .Q(
        counter[19]) );
  DFFRHQX1 \counter_reg[8]  ( .D(N37), .CK(sys_clk), .RN(sys_rst_n), .Q(
        counter[8]) );
  DFFRHQX1 \counter_reg[14]  ( .D(N43), .CK(sys_clk), .RN(sys_rst_n), .Q(
        counter[14]) );
  DFFRHQX1 \counter_reg[3]  ( .D(N32), .CK(sys_clk), .RN(sys_rst_n), .Q(
        counter[3]) );
  DFFRHQX1 \counter_reg[20]  ( .D(N49), .CK(sys_clk), .RN(sys_rst_n), .Q(
        counter[20]) );
  DFFRHQX1 \counter_reg[9]  ( .D(N38), .CK(sys_clk), .RN(sys_rst_n), .Q(
        counter[9]) );
  DFFRHQX1 \counter_reg[18]  ( .D(N47), .CK(sys_clk), .RN(sys_rst_n), .Q(
        counter[18]) );
  DFFRHQX1 \counter_reg[7]  ( .D(N36), .CK(sys_clk), .RN(sys_rst_n), .Q(
        counter[7]) );
  DFFRHQX1 \counter_reg[16]  ( .D(N45), .CK(sys_clk), .RN(sys_rst_n), .Q(
        counter[16]) );
  DFFRHQX1 \counter_reg[12]  ( .D(N41), .CK(sys_clk), .RN(sys_rst_n), .Q(
        counter[12]) );
  DFFRHQX1 \counter_reg[5]  ( .D(N34), .CK(sys_clk), .RN(sys_rst_n), .Q(
        counter[5]) );
  DFFRHQX1 \counter_reg[21]  ( .D(N50), .CK(sys_clk), .RN(sys_rst_n), .Q(
        counter[21]) );
  DFFRHQX1 \counter_reg[15]  ( .D(N44), .CK(sys_clk), .RN(sys_rst_n), .Q(
        counter[15]) );
  DFFRHQX1 \counter_reg[10]  ( .D(N39), .CK(sys_clk), .RN(sys_rst_n), .Q(
        counter[10]) );
  DFFRHQX1 \counter_reg[4]  ( .D(N33), .CK(sys_clk), .RN(sys_rst_n), .Q(
        counter[4]) );
  DFFRHQX1 \counter_reg[22]  ( .D(N51), .CK(sys_clk), .RN(sys_rst_n), .Q(
        counter[22]) );
  DFFRHQX1 \counter_reg[17]  ( .D(N46), .CK(sys_clk), .RN(sys_rst_n), .Q(
        counter[17]) );
  DFFRHQX1 \counter_reg[11]  ( .D(N40), .CK(sys_clk), .RN(sys_rst_n), .Q(
        counter[11]) );
  DFFRHQX1 \counter_reg[6]  ( .D(N35), .CK(sys_clk), .RN(sys_rst_n), .Q(
        counter[6]) );
  DFFRHQX1 \counter_reg[1]  ( .D(N30), .CK(sys_clk), .RN(sys_rst_n), .Q(
        counter[1]) );
  DFFRHQX1 \counter_reg[0]  ( .D(N29), .CK(sys_clk), .RN(sys_rst_n), .Q(
        counter[0]) );
  MXI2X1 U118 ( .A(n33), .B(n80), .S0(n81), .Y(n41) );
  MXI2X1 U119 ( .A(n82), .B(n33), .S0(n81), .Y(n40) );
  MXI2X1 U120 ( .A(n83), .B(n82), .S0(n81), .Y(n39) );
  INVX1 U121 ( .A(led_out[1]), .Y(n82) );
  MXI2X1 U122 ( .A(n84), .B(n83), .S0(n81), .Y(n38) );
  INVX1 U123 ( .A(led_out[2]), .Y(n83) );
  MXI2X1 U124 ( .A(n85), .B(n84), .S0(n81), .Y(n37) );
  INVX1 U125 ( .A(led_out[3]), .Y(n84) );
  MXI2X1 U126 ( .A(n86), .B(n85), .S0(n81), .Y(n36) );
  INVX1 U127 ( .A(led_out[4]), .Y(n85) );
  MXI2X1 U128 ( .A(n87), .B(n86), .S0(n81), .Y(n35) );
  INVX1 U129 ( .A(led_out[5]), .Y(n86) );
  MXI2X1 U130 ( .A(n80), .B(n87), .S0(n81), .Y(n34) );
  NOR3BX1 U131 ( .AN(counter[1]), .B(counter[0]), .C(n88), .Y(n81) );
  INVX1 U132 ( .A(led_out[6]), .Y(n87) );
  INVX1 U133 ( .A(led_out[7]), .Y(n80) );
  NOR2BX1 U134 ( .AN(N28), .B(n89), .Y(N52) );
  NOR2BX1 U135 ( .AN(N27), .B(n89), .Y(N51) );
  NOR2BX1 U136 ( .AN(N26), .B(n89), .Y(N50) );
  NOR2BX1 U137 ( .AN(N25), .B(n89), .Y(N49) );
  NOR2BX1 U138 ( .AN(N24), .B(n89), .Y(N48) );
  NOR2BX1 U139 ( .AN(N23), .B(n89), .Y(N47) );
  NOR2BX1 U140 ( .AN(N22), .B(n89), .Y(N46) );
  NOR2BX1 U141 ( .AN(N21), .B(n89), .Y(N45) );
  NOR2BX1 U142 ( .AN(N20), .B(n89), .Y(N44) );
  NOR2BX1 U143 ( .AN(N19), .B(n89), .Y(N43) );
  NOR2BX1 U144 ( .AN(N18), .B(n89), .Y(N42) );
  NOR2BX1 U145 ( .AN(N17), .B(n89), .Y(N41) );
  NOR2BX1 U146 ( .AN(N16), .B(n89), .Y(N40) );
  NOR2BX1 U147 ( .AN(N15), .B(n89), .Y(N39) );
  NOR2BX1 U148 ( .AN(N14), .B(n89), .Y(N38) );
  NOR2BX1 U149 ( .AN(N13), .B(n89), .Y(N37) );
  NOR2BX1 U150 ( .AN(N12), .B(n89), .Y(N36) );
  NOR2BX1 U151 ( .AN(N11), .B(n89), .Y(N35) );
  NOR2BX1 U152 ( .AN(N10), .B(n89), .Y(N34) );
  NOR2BX1 U153 ( .AN(N9), .B(n89), .Y(N33) );
  NOR2BX1 U154 ( .AN(N8), .B(n89), .Y(N32) );
  NOR2BX1 U155 ( .AN(N7), .B(n89), .Y(N31) );
  NOR2BX1 U156 ( .AN(N6), .B(n89), .Y(N30) );
  NOR2BX1 U157 ( .AN(N5), .B(n89), .Y(N29) );
  OR2X1 U158 ( .A(n88), .B(counter[1]), .Y(n89) );
  NAND4X1 U159 ( .A(n90), .B(n91), .C(n92), .D(n93), .Y(n88) );
  NOR4BX1 U160 ( .AN(n94), .B(counter[6]), .C(counter[4]), .D(counter[5]), .Y(
        n93) );
  NOR3X1 U161 ( .A(counter[7]), .B(counter[9]), .C(counter[8]), .Y(n94) );
  NOR4BX1 U162 ( .AN(n95), .B(counter[22]), .C(counter[21]), .D(counter[23]), 
        .Y(n92) );
  NOR2X1 U163 ( .A(counter[3]), .B(counter[2]), .Y(n95) );
  NOR4BX1 U164 ( .AN(n96), .B(counter[17]), .C(counter[15]), .D(counter[16]), 
        .Y(n91) );
  NOR3X1 U165 ( .A(counter[18]), .B(counter[20]), .C(counter[19]), .Y(n96) );
  NOR4BX1 U166 ( .AN(n97), .B(counter[11]), .C(counter[10]), .D(counter[12]), 
        .Y(n90) );
  NOR2X1 U167 ( .A(counter[14]), .B(counter[13]), .Y(n97) );
endmodule

