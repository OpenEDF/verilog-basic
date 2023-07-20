/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : L-2016.03-SP1
// Date      : Thu May  5 09:01:51 2022
/////////////////////////////////////////////////////////////


module flowled_DW01_inc_1 ( A, SUM );
  input [23:0] A;
  output [23:0] SUM;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22;

  XOR2XL U1 ( .A(n1), .B(A[23]), .Y(SUM[23]) );
  ADDHXL U2 ( .A(A[22]), .B(n2), .CO(n1), .S(SUM[22]) );
  ADDHXL U3 ( .A(A[21]), .B(n3), .CO(n2), .S(SUM[21]) );
  ADDHXL U4 ( .A(A[20]), .B(n4), .CO(n3), .S(SUM[20]) );
  ADDHXL U5 ( .A(A[19]), .B(n5), .CO(n4), .S(SUM[19]) );
  ADDHXL U6 ( .A(A[18]), .B(n6), .CO(n5), .S(SUM[18]) );
  ADDHXL U7 ( .A(A[17]), .B(n7), .CO(n6), .S(SUM[17]) );
  ADDHXL U8 ( .A(A[16]), .B(n8), .CO(n7), .S(SUM[16]) );
  ADDHXL U9 ( .A(A[15]), .B(n9), .CO(n8), .S(SUM[15]) );
  ADDHXL U10 ( .A(A[14]), .B(n10), .CO(n9), .S(SUM[14]) );
  ADDHXL U11 ( .A(A[13]), .B(n11), .CO(n10), .S(SUM[13]) );
  ADDHXL U12 ( .A(A[12]), .B(n12), .CO(n11), .S(SUM[12]) );
  ADDHXL U13 ( .A(A[11]), .B(n13), .CO(n12), .S(SUM[11]) );
  ADDHXL U14 ( .A(A[10]), .B(n14), .CO(n13), .S(SUM[10]) );
  ADDHXL U15 ( .A(A[9]), .B(n15), .CO(n14), .S(SUM[9]) );
  ADDHXL U16 ( .A(A[8]), .B(n16), .CO(n15), .S(SUM[8]) );
  ADDHXL U17 ( .A(A[7]), .B(n17), .CO(n16), .S(SUM[7]) );
  ADDHXL U18 ( .A(A[6]), .B(n18), .CO(n17), .S(SUM[6]) );
  ADDHXL U19 ( .A(A[5]), .B(n19), .CO(n18), .S(SUM[5]) );
  ADDHXL U20 ( .A(A[4]), .B(n20), .CO(n19), .S(SUM[4]) );
  ADDHXL U21 ( .A(A[3]), .B(n21), .CO(n20), .S(SUM[3]) );
  ADDHXL U22 ( .A(A[2]), .B(n22), .CO(n21), .S(SUM[2]) );
  ADDHXL U23 ( .A(A[1]), .B(A[0]), .CO(n22), .S(SUM[1]) );
  INVXL U24 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module flowled ( sys_clk, sys_rst_n, led_out );
  output [7:0] led_out;
  input sys_clk, sys_rst_n;
  wire   N5, N6, N7, N8, N9, N10, N11, N12, N13, N14, N15, N16, N17, N18, N19,
         N20, N21, N22, N23, N24, N25, N26, N27, N28, N29, N30, N31, N32, N33,
         N34, N35, N36, N37, N38, N39, N40, N41, N42, N43, N44, N45, N46, N47,
         N48, N49, N50, N51, N52, N55, N56, N57, N58, N59, N60, N61, N62, N63,
         N64, N65, N66, N67, N68, N69, N70, N71, N72, N73, N74, N78, N79, N80,
         N81, N82, N83, N84, N85, N86, N87, N88, N89, N90, N91, N92, N93, N94,
         N95, N96, N97, N98, N99, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n12,
         n14, n16, n18, n20, n22, n24, n26;
  wire   [23:0] counter;

  OR2XL C182 ( .A(counter[23]), .B(counter[22]), .Y(N78) );
  OR2XL C181 ( .A(N78), .B(counter[21]), .Y(N79) );
  OR2XL C180 ( .A(N79), .B(counter[20]), .Y(N80) );
  OR2XL C179 ( .A(N80), .B(counter[19]), .Y(N81) );
  OR2XL C178 ( .A(N81), .B(counter[18]), .Y(N82) );
  OR2XL C177 ( .A(N82), .B(counter[17]), .Y(N83) );
  OR2XL C176 ( .A(N83), .B(counter[16]), .Y(N84) );
  OR2XL C175 ( .A(N84), .B(counter[15]), .Y(N85) );
  OR2XL C174 ( .A(N85), .B(counter[14]), .Y(N86) );
  OR2XL C173 ( .A(N86), .B(counter[13]), .Y(N87) );
  OR2XL C172 ( .A(N87), .B(counter[12]), .Y(N88) );
  OR2XL C171 ( .A(N88), .B(counter[11]), .Y(N89) );
  OR2XL C170 ( .A(N89), .B(counter[10]), .Y(N90) );
  OR2XL C169 ( .A(N90), .B(counter[9]), .Y(N91) );
  OR2XL C168 ( .A(N91), .B(counter[8]), .Y(N92) );
  OR2XL C167 ( .A(N92), .B(counter[7]), .Y(N93) );
  OR2XL C166 ( .A(N93), .B(counter[6]), .Y(N94) );
  OR2XL C165 ( .A(N94), .B(counter[5]), .Y(N95) );
  OR2XL C164 ( .A(N95), .B(counter[4]), .Y(N96) );
  OR2XL C163 ( .A(N96), .B(counter[3]), .Y(N97) );
  OR2XL C162 ( .A(N97), .B(counter[2]), .Y(N98) );
  OR2XL C161 ( .A(N98), .B(counter[1]), .Y(N99) );
  OR2XL C149 ( .A(counter[3]), .B(N73), .Y(N74) );
  OR2XL C148 ( .A(counter[4]), .B(N72), .Y(N73) );
  OR2XL C147 ( .A(counter[5]), .B(N71), .Y(N72) );
  OR2XL C146 ( .A(counter[6]), .B(N70), .Y(N71) );
  OR2XL C145 ( .A(counter[7]), .B(N69), .Y(N70) );
  OR2XL C144 ( .A(counter[8]), .B(N68), .Y(N69) );
  OR2XL C143 ( .A(counter[9]), .B(N67), .Y(N68) );
  OR2XL C142 ( .A(counter[10]), .B(N66), .Y(N67) );
  OR2XL C141 ( .A(counter[11]), .B(N65), .Y(N66) );
  OR2XL C140 ( .A(counter[12]), .B(N64), .Y(N65) );
  OR2XL C139 ( .A(counter[13]), .B(N63), .Y(N64) );
  OR2XL C138 ( .A(counter[14]), .B(N62), .Y(N63) );
  OR2XL C137 ( .A(counter[15]), .B(N61), .Y(N62) );
  OR2XL C136 ( .A(counter[16]), .B(N60), .Y(N61) );
  OR2XL C135 ( .A(counter[17]), .B(N59), .Y(N60) );
  OR2XL C134 ( .A(counter[18]), .B(N58), .Y(N59) );
  OR2XL C133 ( .A(counter[19]), .B(N57), .Y(N58) );
  OR2XL C132 ( .A(counter[20]), .B(N56), .Y(N57) );
  OR2XL C131 ( .A(counter[21]), .B(N55), .Y(N56) );
  OR2XL C130 ( .A(counter[22]), .B(counter[23]), .Y(N55) );
  SDFFRHQX1 \counter_reg[0]  ( .D(N29), .SI(1'b0), .SE(1'b0), .CK(sys_clk), 
        .RN(sys_rst_n), .Q(counter[0]) );
  SDFFRHQX1 \counter_reg[23]  ( .D(N52), .SI(1'b0), .SE(1'b0), .CK(sys_clk), 
        .RN(sys_rst_n), .Q(counter[23]) );
  SDFFRHQX1 \counter_reg[1]  ( .D(N30), .SI(1'b0), .SE(1'b0), .CK(sys_clk), 
        .RN(sys_rst_n), .Q(counter[1]) );
  SDFFRHQX1 \counter_reg[2]  ( .D(N31), .SI(1'b0), .SE(1'b0), .CK(sys_clk), 
        .RN(sys_rst_n), .Q(counter[2]) );
  SDFFRHQX1 \counter_reg[3]  ( .D(N32), .SI(1'b0), .SE(1'b0), .CK(sys_clk), 
        .RN(sys_rst_n), .Q(counter[3]) );
  SDFFRHQX1 \counter_reg[4]  ( .D(N33), .SI(1'b0), .SE(1'b0), .CK(sys_clk), 
        .RN(sys_rst_n), .Q(counter[4]) );
  SDFFRHQX1 \counter_reg[5]  ( .D(N34), .SI(1'b0), .SE(1'b0), .CK(sys_clk), 
        .RN(sys_rst_n), .Q(counter[5]) );
  SDFFRHQX1 \counter_reg[6]  ( .D(N35), .SI(1'b0), .SE(1'b0), .CK(sys_clk), 
        .RN(sys_rst_n), .Q(counter[6]) );
  SDFFRHQX1 \counter_reg[7]  ( .D(N36), .SI(1'b0), .SE(1'b0), .CK(sys_clk), 
        .RN(sys_rst_n), .Q(counter[7]) );
  SDFFRHQX1 \counter_reg[8]  ( .D(N37), .SI(1'b0), .SE(1'b0), .CK(sys_clk), 
        .RN(sys_rst_n), .Q(counter[8]) );
  SDFFRHQX1 \counter_reg[9]  ( .D(N38), .SI(1'b0), .SE(1'b0), .CK(sys_clk), 
        .RN(sys_rst_n), .Q(counter[9]) );
  SDFFRHQX1 \counter_reg[10]  ( .D(N39), .SI(1'b0), .SE(1'b0), .CK(sys_clk), 
        .RN(sys_rst_n), .Q(counter[10]) );
  SDFFRHQX1 \counter_reg[11]  ( .D(N40), .SI(1'b0), .SE(1'b0), .CK(sys_clk), 
        .RN(sys_rst_n), .Q(counter[11]) );
  SDFFRHQX1 \counter_reg[12]  ( .D(N41), .SI(1'b0), .SE(1'b0), .CK(sys_clk), 
        .RN(sys_rst_n), .Q(counter[12]) );
  SDFFRHQX1 \counter_reg[14]  ( .D(N43), .SI(1'b0), .SE(1'b0), .CK(sys_clk), 
        .RN(sys_rst_n), .Q(counter[14]) );
  SDFFRHQX1 \counter_reg[15]  ( .D(N44), .SI(1'b0), .SE(1'b0), .CK(sys_clk), 
        .RN(sys_rst_n), .Q(counter[15]) );
  SDFFRHQX1 \counter_reg[16]  ( .D(N45), .SI(1'b0), .SE(1'b0), .CK(sys_clk), 
        .RN(sys_rst_n), .Q(counter[16]) );
  SDFFRHQX1 \counter_reg[17]  ( .D(N46), .SI(1'b0), .SE(1'b0), .CK(sys_clk), 
        .RN(sys_rst_n), .Q(counter[17]) );
  SDFFRHQX1 \counter_reg[18]  ( .D(N47), .SI(1'b0), .SE(1'b0), .CK(sys_clk), 
        .RN(sys_rst_n), .Q(counter[18]) );
  SDFFRHQX1 \counter_reg[19]  ( .D(N48), .SI(1'b0), .SE(1'b0), .CK(sys_clk), 
        .RN(sys_rst_n), .Q(counter[19]) );
  SDFFRHQX1 \counter_reg[20]  ( .D(N49), .SI(1'b0), .SE(1'b0), .CK(sys_clk), 
        .RN(sys_rst_n), .Q(counter[20]) );
  SDFFRHQX1 \counter_reg[21]  ( .D(N50), .SI(1'b0), .SE(1'b0), .CK(sys_clk), 
        .RN(sys_rst_n), .Q(counter[21]) );
  SDFFRHQX1 \counter_reg[22]  ( .D(N51), .SI(1'b0), .SE(1'b0), .CK(sys_clk), 
        .RN(sys_rst_n), .Q(counter[22]) );
  SDFFSHQXL \led_out_reg[0]  ( .D(n26), .SI(1'b0), .SE(1'b0), .CK(sys_clk), 
        .SN(sys_rst_n), .Q(led_out[0]) );
  SDFFRHQX1 \led_out_reg[1]  ( .D(n24), .SI(1'b0), .SE(1'b0), .CK(sys_clk), 
        .RN(sys_rst_n), .Q(led_out[1]) );
  SDFFRHQX1 \led_out_reg[2]  ( .D(n22), .SI(1'b0), .SE(1'b0), .CK(sys_clk), 
        .RN(sys_rst_n), .Q(led_out[2]) );
  SDFFRHQX1 \led_out_reg[3]  ( .D(n20), .SI(1'b0), .SE(1'b0), .CK(sys_clk), 
        .RN(sys_rst_n), .Q(led_out[3]) );
  SDFFRHQX1 \led_out_reg[4]  ( .D(n18), .SI(1'b0), .SE(1'b0), .CK(sys_clk), 
        .RN(sys_rst_n), .Q(led_out[4]) );
  SDFFRHQX1 \led_out_reg[6]  ( .D(n14), .SI(1'b0), .SE(1'b0), .CK(sys_clk), 
        .RN(sys_rst_n), .Q(led_out[6]) );
  INVXL U3 ( .A(n1), .Y(n12) );
  AOI22XL U4 ( .A0(n2), .A1(led_out[6]), .B0(led_out[7]), .B1(n3), .Y(n1) );
  INVXL U5 ( .A(n4), .Y(n14) );
  AOI22XL U6 ( .A0(n2), .A1(led_out[5]), .B0(led_out[6]), .B1(n3), .Y(n4) );
  INVXL U7 ( .A(n5), .Y(n16) );
  AOI22XL U8 ( .A0(n2), .A1(led_out[4]), .B0(led_out[5]), .B1(n3), .Y(n5) );
  INVXL U9 ( .A(n6), .Y(n18) );
  AOI22XL U10 ( .A0(n2), .A1(led_out[3]), .B0(led_out[4]), .B1(n3), .Y(n6) );
  INVXL U11 ( .A(n7), .Y(n20) );
  AOI22XL U12 ( .A0(n2), .A1(led_out[2]), .B0(led_out[3]), .B1(n3), .Y(n7) );
  INVXL U13 ( .A(n8), .Y(n22) );
  AOI22XL U14 ( .A0(n2), .A1(led_out[1]), .B0(led_out[2]), .B1(n3), .Y(n8) );
  INVXL U15 ( .A(n9), .Y(n24) );
  AOI22XL U16 ( .A0(n2), .A1(led_out[0]), .B0(led_out[1]), .B1(n3), .Y(n9) );
  INVXL U17 ( .A(n10), .Y(n26) );
  AOI22XL U18 ( .A0(n2), .A1(led_out[7]), .B0(led_out[0]), .B1(n3), .Y(n10) );
  INVXL U19 ( .A(n2), .Y(n3) );
  NOR4BXL U20 ( .AN(counter[1]), .B(counter[2]), .C(counter[0]), .D(N74), .Y(
        n2) );
  NOR2BXL U53 ( .AN(N28), .B(N99), .Y(N52) );
  NOR2BXL U54 ( .AN(N27), .B(N99), .Y(N51) );
  NOR2BXL U55 ( .AN(N26), .B(N99), .Y(N50) );
  NOR2BXL U56 ( .AN(N25), .B(N99), .Y(N49) );
  NOR2BXL U57 ( .AN(N24), .B(N99), .Y(N48) );
  NOR2BXL U58 ( .AN(N23), .B(N99), .Y(N47) );
  NOR2BXL U59 ( .AN(N22), .B(N99), .Y(N46) );
  NOR2BXL U60 ( .AN(N21), .B(N99), .Y(N45) );
  NOR2BXL U61 ( .AN(N20), .B(N99), .Y(N44) );
  NOR2BXL U62 ( .AN(N19), .B(N99), .Y(N43) );
  NOR2BXL U63 ( .AN(N18), .B(N99), .Y(N42) );
  NOR2BXL U64 ( .AN(N17), .B(N99), .Y(N41) );
  NOR2BXL U65 ( .AN(N16), .B(N99), .Y(N40) );
  NOR2BXL U66 ( .AN(N15), .B(N99), .Y(N39) );
  NOR2BXL U67 ( .AN(N14), .B(N99), .Y(N38) );
  NOR2BXL U68 ( .AN(N13), .B(N99), .Y(N37) );
  NOR2BXL U69 ( .AN(N12), .B(N99), .Y(N36) );
  NOR2BXL U70 ( .AN(N11), .B(N99), .Y(N35) );
  NOR2BXL U71 ( .AN(N10), .B(N99), .Y(N34) );
  NOR2BXL U72 ( .AN(N9), .B(N99), .Y(N33) );
  NOR2BXL U73 ( .AN(N8), .B(N99), .Y(N32) );
  NOR2BXL U74 ( .AN(N7), .B(N99), .Y(N31) );
  NOR2BXL U75 ( .AN(N6), .B(N99), .Y(N30) );
  NOR2BXL U76 ( .AN(N5), .B(N99), .Y(N29) );
  flowled_DW01_inc_1 add_x_1 ( .A(counter), .SUM({N28, N27, N26, N25, N24, N23, 
        N22, N21, N20, N19, N18, N17, N16, N15, N14, N13, N12, N11, N10, N9, 
        N8, N7, N6, N5}) );
  SDFFRHQXL \counter_reg[13]  ( .D(N42), .SI(1'b0), .SE(1'b0), .CK(sys_clk), 
        .RN(sys_rst_n), .Q(counter[13]) );
  SDFFRHQXL \led_out_reg[5]  ( .D(n16), .SI(1'b0), .SE(1'b0), .CK(sys_clk), 
        .RN(sys_rst_n), .Q(led_out[5]) );
  SDFFRHQXL \led_out_reg[7]  ( .D(n12), .SI(1'b0), .SE(1'b0), .CK(sys_clk), 
        .RN(sys_rst_n), .Q(led_out[7]) );
endmodule

