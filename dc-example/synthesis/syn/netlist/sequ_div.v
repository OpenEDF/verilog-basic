/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : L-2016.03-SP1
// Date      : Sun Aug 13 22:09:51 2023
/////////////////////////////////////////////////////////////


module sequ_div_DW_cmp_1 ( p_A, p_B, TC, GE_LT, GE_GT_EQ, GE_LT_GT_LE, EQ_NE
 );
  input [31:0] p_A;
  input [31:0] p_B;
  input TC, GE_LT, GE_GT_EQ;
  output GE_LT_GT_LE, EQ_NE;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, n124, n125, n126, n127, n128, n129, n130, n131, n132, n133,
         n134, n135, n136, n137, n138, n139, n140, n141, n142, n143, n144,
         n145, n146, n147, n148, n149, n150, n151;

  OAI21XL U9 ( .A0(n14), .A1(n17), .B0(n15), .Y(n13) );
  NAND2XL U11 ( .A(n151), .B(p_A[31]), .Y(n15) );
  NOR2X1 U12 ( .A(n150), .B(p_A[30]), .Y(n16) );
  NAND2XL U13 ( .A(n150), .B(p_A[30]), .Y(n17) );
  NOR2X1 U14 ( .A(n22), .B(n20), .Y(n18) );
  OAI21XL U15 ( .A0(n20), .A1(n23), .B0(n21), .Y(n19) );
  NOR2X1 U16 ( .A(n149), .B(p_A[29]), .Y(n20) );
  NAND2XL U17 ( .A(n149), .B(p_A[29]), .Y(n21) );
  NOR2X1 U18 ( .A(n148), .B(p_A[28]), .Y(n22) );
  NAND2XL U19 ( .A(n148), .B(p_A[28]), .Y(n23) );
  AOI21X1 U21 ( .A0(n24), .A1(n31), .B0(n25), .Y(n4) );
  NOR2X1 U22 ( .A(n28), .B(n26), .Y(n24) );
  OAI21XL U23 ( .A0(n26), .A1(n29), .B0(n27), .Y(n25) );
  NOR2X1 U24 ( .A(n147), .B(p_A[27]), .Y(n26) );
  NAND2XL U25 ( .A(n147), .B(p_A[27]), .Y(n27) );
  NOR2X1 U26 ( .A(n146), .B(p_A[26]), .Y(n28) );
  NAND2XL U27 ( .A(n146), .B(p_A[26]), .Y(n29) );
  NOR2X1 U28 ( .A(n34), .B(n32), .Y(n30) );
  OAI21XL U29 ( .A0(n32), .A1(n35), .B0(n33), .Y(n31) );
  NOR2X1 U30 ( .A(n145), .B(p_A[25]), .Y(n32) );
  NAND2XL U31 ( .A(n145), .B(p_A[25]), .Y(n33) );
  NOR2X1 U32 ( .A(n144), .B(p_A[24]), .Y(n34) );
  NAND2XL U33 ( .A(n144), .B(p_A[24]), .Y(n35) );
  AOI21X1 U37 ( .A0(n38), .A1(n45), .B0(n39), .Y(n37) );
  OAI21XL U39 ( .A0(n40), .A1(n43), .B0(n41), .Y(n39) );
  NOR2X1 U40 ( .A(n143), .B(p_A[23]), .Y(n40) );
  NAND2XL U41 ( .A(n143), .B(p_A[23]), .Y(n41) );
  NOR2X1 U42 ( .A(n142), .B(p_A[22]), .Y(n42) );
  NAND2XL U43 ( .A(n142), .B(p_A[22]), .Y(n43) );
  NOR2X1 U44 ( .A(n48), .B(n46), .Y(n44) );
  OAI21XL U45 ( .A0(n46), .A1(n49), .B0(n47), .Y(n45) );
  NOR2X1 U46 ( .A(n141), .B(p_A[21]), .Y(n46) );
  NAND2XL U47 ( .A(n141), .B(p_A[21]), .Y(n47) );
  NOR2X1 U48 ( .A(n140), .B(p_A[20]), .Y(n48) );
  NAND2XL U49 ( .A(n140), .B(p_A[20]), .Y(n49) );
  NAND2X1 U50 ( .A(n58), .B(n52), .Y(n50) );
  AOI21X1 U51 ( .A0(n52), .A1(n59), .B0(n53), .Y(n51) );
  NOR2X1 U52 ( .A(n56), .B(n54), .Y(n52) );
  OAI21XL U53 ( .A0(n54), .A1(n57), .B0(n55), .Y(n53) );
  NOR2X1 U54 ( .A(n139), .B(p_A[19]), .Y(n54) );
  NAND2XL U55 ( .A(n139), .B(p_A[19]), .Y(n55) );
  NAND2XL U57 ( .A(n138), .B(p_A[18]), .Y(n57) );
  NOR2X1 U58 ( .A(n62), .B(n60), .Y(n58) );
  OAI21XL U59 ( .A0(n60), .A1(n63), .B0(n61), .Y(n59) );
  NOR2X1 U60 ( .A(n137), .B(p_A[17]), .Y(n60) );
  NAND2XL U61 ( .A(n137), .B(p_A[17]), .Y(n61) );
  NOR2X1 U62 ( .A(n136), .B(p_A[16]), .Y(n62) );
  NAND2XL U63 ( .A(n136), .B(p_A[16]), .Y(n63) );
  NAND2X1 U67 ( .A(n74), .B(n68), .Y(n66) );
  AOI21X1 U68 ( .A0(n68), .A1(n75), .B0(n69), .Y(n67) );
  NOR2X1 U69 ( .A(n72), .B(n70), .Y(n68) );
  OAI21XL U70 ( .A0(n70), .A1(n73), .B0(n71), .Y(n69) );
  NOR2X1 U71 ( .A(n135), .B(p_A[15]), .Y(n70) );
  NAND2XL U72 ( .A(n135), .B(p_A[15]), .Y(n71) );
  NOR2X1 U73 ( .A(n134), .B(p_A[14]), .Y(n72) );
  NAND2XL U74 ( .A(n134), .B(p_A[14]), .Y(n73) );
  NOR2X1 U75 ( .A(n78), .B(n76), .Y(n74) );
  OAI21XL U76 ( .A0(n76), .A1(n79), .B0(n77), .Y(n75) );
  NOR2X1 U77 ( .A(n133), .B(p_A[13]), .Y(n76) );
  NAND2XL U78 ( .A(n133), .B(p_A[13]), .Y(n77) );
  NOR2X1 U79 ( .A(n132), .B(p_A[12]), .Y(n78) );
  NAND2XL U80 ( .A(n132), .B(p_A[12]), .Y(n79) );
  NAND2X1 U81 ( .A(n88), .B(n82), .Y(n80) );
  AOI21X1 U82 ( .A0(n82), .A1(n89), .B0(n83), .Y(n81) );
  NOR2X1 U83 ( .A(n86), .B(n84), .Y(n82) );
  OAI21XL U84 ( .A0(n84), .A1(n87), .B0(n85), .Y(n83) );
  NAND2XL U86 ( .A(n131), .B(p_A[11]), .Y(n85) );
  NOR2X1 U87 ( .A(n130), .B(p_A[10]), .Y(n86) );
  NAND2XL U88 ( .A(n130), .B(p_A[10]), .Y(n87) );
  NOR2X1 U89 ( .A(n92), .B(n90), .Y(n88) );
  OAI21XL U90 ( .A0(n90), .A1(n93), .B0(n91), .Y(n89) );
  NOR2X1 U91 ( .A(n129), .B(p_A[9]), .Y(n90) );
  NAND2XL U92 ( .A(n129), .B(p_A[9]), .Y(n91) );
  NOR2XL U93 ( .A(n128), .B(p_A[8]), .Y(n92) );
  NAND2XL U94 ( .A(n128), .B(p_A[8]), .Y(n93) );
  NAND2XL U96 ( .A(n103), .B(n97), .Y(n95) );
  AOI21X1 U97 ( .A0(n97), .A1(n104), .B0(n98), .Y(n96) );
  OAI21XL U99 ( .A0(n99), .A1(n102), .B0(n100), .Y(n98) );
  NAND2XL U101 ( .A(n127), .B(p_A[7]), .Y(n100) );
  NOR2X1 U102 ( .A(n126), .B(p_A[6]), .Y(n101) );
  NAND2XL U103 ( .A(n126), .B(p_A[6]), .Y(n102) );
  NOR2X1 U104 ( .A(n107), .B(n105), .Y(n103) );
  OAI21XL U105 ( .A0(n105), .A1(n108), .B0(n106), .Y(n104) );
  NOR2X1 U106 ( .A(n125), .B(p_A[5]), .Y(n105) );
  NAND2XL U107 ( .A(n125), .B(p_A[5]), .Y(n106) );
  NOR2XL U108 ( .A(n124), .B(p_A[4]), .Y(n107) );
  NAND2XL U109 ( .A(n124), .B(p_A[4]), .Y(n108) );
  AOI21X1 U110 ( .A0(n110), .A1(n116), .B0(n111), .Y(n109) );
  NOR2XL U111 ( .A(n114), .B(n112), .Y(n110) );
  OAI21XL U112 ( .A0(n112), .A1(n115), .B0(n113), .Y(n111) );
  NOR2X1 U113 ( .A(n123), .B(p_A[3]), .Y(n112) );
  NAND2XL U114 ( .A(n123), .B(p_A[3]), .Y(n113) );
  NOR2XL U115 ( .A(n122), .B(p_A[2]), .Y(n114) );
  NAND2XL U116 ( .A(n122), .B(p_A[2]), .Y(n115) );
  OAI21XL U117 ( .A0(n117), .A1(n119), .B0(n118), .Y(n116) );
  NOR2XL U118 ( .A(n121), .B(p_A[1]), .Y(n117) );
  NAND2XL U119 ( .A(n121), .B(p_A[1]), .Y(n118) );
  NAND2XL U120 ( .A(n120), .B(p_A[0]), .Y(n119) );
  INVX1 U122 ( .A(p_B[30]), .Y(n150) );
  INVX1 U123 ( .A(p_B[29]), .Y(n149) );
  INVX1 U124 ( .A(p_B[28]), .Y(n148) );
  INVX1 U125 ( .A(p_B[27]), .Y(n147) );
  INVX1 U126 ( .A(p_B[26]), .Y(n146) );
  INVX1 U127 ( .A(p_B[25]), .Y(n145) );
  INVX1 U128 ( .A(p_B[24]), .Y(n144) );
  INVX1 U129 ( .A(p_B[23]), .Y(n143) );
  INVX1 U131 ( .A(p_B[21]), .Y(n141) );
  INVX1 U132 ( .A(p_B[20]), .Y(n140) );
  INVX1 U133 ( .A(p_B[19]), .Y(n139) );
  INVX1 U134 ( .A(p_B[18]), .Y(n138) );
  INVX1 U135 ( .A(p_B[17]), .Y(n137) );
  INVXL U136 ( .A(p_B[16]), .Y(n136) );
  INVX1 U138 ( .A(p_B[14]), .Y(n134) );
  INVX1 U139 ( .A(p_B[13]), .Y(n133) );
  INVXL U140 ( .A(p_B[12]), .Y(n132) );
  INVX1 U141 ( .A(p_B[11]), .Y(n131) );
  INVXL U142 ( .A(p_B[10]), .Y(n130) );
  INVXL U143 ( .A(p_B[9]), .Y(n129) );
  INVXL U144 ( .A(p_B[8]), .Y(n128) );
  INVX1 U145 ( .A(p_B[7]), .Y(n127) );
  INVXL U146 ( .A(p_B[6]), .Y(n126) );
  INVXL U147 ( .A(p_B[5]), .Y(n125) );
  INVXL U148 ( .A(p_B[4]), .Y(n124) );
  INVXL U149 ( .A(p_B[3]), .Y(n123) );
  INVXL U150 ( .A(p_B[2]), .Y(n122) );
  INVXL U151 ( .A(p_B[1]), .Y(n121) );
  INVXL U152 ( .A(p_B[0]), .Y(n120) );
  NOR2XL U38 ( .A(n42), .B(n40), .Y(n38) );
  NAND2X1 U36 ( .A(n44), .B(n38), .Y(n36) );
  NAND2X1 U6 ( .A(n18), .B(n12), .Y(n10) );
  NOR2X1 U4 ( .A(n5), .B(n10), .Y(n8) );
  OAI21XL U5 ( .A0(n4), .A1(n10), .B0(n11), .Y(n9) );
  OAI21XL U35 ( .A0(n51), .A1(n36), .B0(n37), .Y(n2) );
  OAI21XL U95 ( .A0(n109), .A1(n95), .B0(n96), .Y(n94) );
  NOR2XL U34 ( .A(n50), .B(n36), .Y(n3) );
  OAI21XL U66 ( .A0(n81), .A1(n66), .B0(n67), .Y(n65) );
  NOR2X1 U65 ( .A(n80), .B(n66), .Y(n64) );
  AOI21XL U64 ( .A0(n64), .A1(n94), .B0(n65), .Y(n1) );
  NAND2XL U2 ( .A(n3), .B(n8), .Y(n6) );
  INVXL U157 ( .A(p_B[31]), .Y(n151) );
  INVXL U158 ( .A(p_B[22]), .Y(n142) );
  INVXL U159 ( .A(p_B[15]), .Y(n135) );
  NOR2XL U160 ( .A(n151), .B(p_A[31]), .Y(n14) );
  NOR2XL U161 ( .A(n138), .B(p_A[18]), .Y(n56) );
  NOR2XL U162 ( .A(n127), .B(p_A[7]), .Y(n99) );
  NOR2XL U163 ( .A(n131), .B(p_A[11]), .Y(n84) );
  NOR2XL U164 ( .A(n16), .B(n14), .Y(n12) );
  NOR2XL U165 ( .A(n101), .B(n99), .Y(n97) );
  AOI21XL U166 ( .A0(n12), .A1(n19), .B0(n13), .Y(n11) );
  NAND2XL U167 ( .A(n30), .B(n24), .Y(n5) );
  AOI21XL U168 ( .A0(n8), .A1(n2), .B0(n9), .Y(n7) );
  OAI21XL U169 ( .A0(n1), .A1(n6), .B0(n7), .Y(GE_LT_GT_LE) );
endmodule


module sequ_div_DW01_sub_3 ( p_A, p_B, CI, p_DIFF, CO );
  input [32:0] p_A;
  input [32:0] p_B;
  output [32:0] p_DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n34, n36, n37, n38, n39, n40, n42, n44, n45, n46, n47, n48,
         n50, n52, n53, n54, n55, n56, n58, n60, n61, n62, n63, n64, n66, n68,
         n69, n70, n71, n72, n74, n76, n77, n78, n79, n80, n82, n84, n85, n86,
         n87, n89, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101,
         n102, n103, n104, n105, n106, n107, n108, n109, n110, n111, n112,
         n114, n115, n116, n117, n118, n119, n120, n121, n122, n123, n124,
         n126, n127, n128, n129, n130, n131, n132, n133, n134, n135, n136,
         n137, n139, n140, n141, n142, n143, n144, n145, n146, n147, n148,
         n149, n150, n151, n152, n153, n154, n155, n156, n157, n158, n159,
         n160, n161, n162, n163, n164, n165, n166, n167, n168, n170, n171,
         n172, n173, n174, n175, n176, n177, n178, n179, n180, n181, n182,
         n183, n184, n185, n186, n188, n190, n192, n194, n196, n198, n201,
         n203, n204, n205, n206, n207, n208, n209, n210, n211, n212, n213,
         n214, n215, n216, n217, n218, n219, n220, n221, n222, n223, n224,
         n225, n226, n227, n228, n229, n230, n231, n232, n233, n234, n235,
         n236, n237, n238, n239, n240, n241, n242, n243, n244, n245, n246,
         n247, n248, n249, n355, n356, n357, n358, n359, n360, n361, n362;

  XNOR2X1 U2 ( .A(n37), .B(n1), .Y(p_DIFF[31]) );
  NAND2XL U6 ( .A(n362), .B(n36), .Y(n1) );
  XOR2X1 U10 ( .A(n40), .B(n2), .Y(p_DIFF[30]) );
  NAND2XL U12 ( .A(n188), .B(n39), .Y(n2) );
  XNOR2X1 U16 ( .A(n45), .B(n3), .Y(p_DIFF[29]) );
  NAND2XL U20 ( .A(n361), .B(n44), .Y(n3) );
  NAND2XL U26 ( .A(n190), .B(n47), .Y(n4) );
  XNOR2X1 U30 ( .A(n53), .B(n5), .Y(p_DIFF[27]) );
  NAND2XL U34 ( .A(n360), .B(n52), .Y(n5) );
  XOR2X1 U38 ( .A(n56), .B(n6), .Y(p_DIFF[26]) );
  NAND2XL U40 ( .A(n192), .B(n55), .Y(n6) );
  XNOR2X1 U44 ( .A(n61), .B(n7), .Y(p_DIFF[25]) );
  NAND2XL U48 ( .A(n359), .B(n60), .Y(n7) );
  XOR2X1 U52 ( .A(n64), .B(n8), .Y(p_DIFF[24]) );
  NAND2XL U54 ( .A(n194), .B(n63), .Y(n8) );
  XNOR2X1 U58 ( .A(n69), .B(n9), .Y(p_DIFF[23]) );
  NAND2XL U62 ( .A(n358), .B(n68), .Y(n9) );
  XOR2X1 U66 ( .A(n72), .B(n10), .Y(p_DIFF[22]) );
  NAND2XL U68 ( .A(n196), .B(n71), .Y(n10) );
  XNOR2X1 U72 ( .A(n77), .B(n11), .Y(p_DIFF[21]) );
  NAND2XL U76 ( .A(n357), .B(n76), .Y(n11) );
  XOR2X1 U80 ( .A(n80), .B(n12), .Y(p_DIFF[20]) );
  NAND2XL U82 ( .A(n198), .B(n79), .Y(n12) );
  XNOR2X1 U86 ( .A(n85), .B(n13), .Y(p_DIFF[19]) );
  NAND2XL U90 ( .A(n356), .B(n84), .Y(n13) );
  XOR2X1 U94 ( .A(n92), .B(n14), .Y(p_DIFF[18]) );
  NAND2XL U100 ( .A(n355), .B(n91), .Y(n14) );
  NAND2X1 U103 ( .A(n231), .B(p_A[18]), .Y(n91) );
  XOR2X1 U104 ( .A(n97), .B(n15), .Y(p_DIFF[17]) );
  AOI21XL U105 ( .A0(n102), .A1(n93), .B0(n94), .Y(n92) );
  NAND2XL U108 ( .A(n201), .B(n96), .Y(n15) );
  XNOR2X1 U112 ( .A(n102), .B(n16), .Y(p_DIFF[16]) );
  AOI21XL U113 ( .A0(n102), .A1(n98), .B0(n99), .Y(n97) );
  NAND2XL U116 ( .A(n98), .B(n101), .Y(n16) );
  NAND2X1 U119 ( .A(n233), .B(p_A[16]), .Y(n101) );
  AOI21X1 U126 ( .A0(n108), .A1(n121), .B0(n109), .Y(n107) );
  OAI21XL U128 ( .A0(n110), .A1(n116), .B0(n111), .Y(n109) );
  NAND2XL U129 ( .A(n203), .B(n111), .Y(n17) );
  NAND2XL U132 ( .A(n234), .B(p_A[15]), .Y(n111) );
  XNOR2X1 U133 ( .A(n117), .B(n18), .Y(p_DIFF[14]) );
  AOI21X1 U134 ( .A0(n117), .A1(n204), .B0(n114), .Y(n112) );
  NAND2XL U137 ( .A(n204), .B(n116), .Y(n18) );
  NAND2X1 U140 ( .A(n235), .B(p_A[14]), .Y(n116) );
  XOR2X1 U141 ( .A(n124), .B(n19), .Y(p_DIFF[13]) );
  OAI21XL U146 ( .A0(n122), .A1(n128), .B0(n123), .Y(n121) );
  NAND2XL U147 ( .A(n205), .B(n123), .Y(n19) );
  NAND2XL U150 ( .A(n236), .B(p_A[13]), .Y(n123) );
  XOR2X1 U151 ( .A(n129), .B(n20), .Y(p_DIFF[12]) );
  AOI21X1 U152 ( .A0(n130), .A1(n206), .B0(n126), .Y(n124) );
  NAND2XL U155 ( .A(n206), .B(n128), .Y(n20) );
  NOR2X1 U157 ( .A(n237), .B(p_A[12]), .Y(n127) );
  XOR2X1 U159 ( .A(n137), .B(n21), .Y(p_DIFF[11]) );
  OAI21XL U165 ( .A0(n135), .A1(n141), .B0(n136), .Y(n134) );
  NAND2XL U166 ( .A(n207), .B(n136), .Y(n21) );
  NAND2XL U169 ( .A(n238), .B(p_A[11]), .Y(n136) );
  XNOR2X1 U170 ( .A(n142), .B(n22), .Y(p_DIFF[10]) );
  NAND2XL U174 ( .A(n208), .B(n141), .Y(n22) );
  NAND2X1 U177 ( .A(n239), .B(p_A[10]), .Y(n141) );
  XNOR2X1 U178 ( .A(n149), .B(n23), .Y(p_DIFF[9]) );
  OAI21XL U179 ( .A0(n152), .A1(n143), .B0(n144), .Y(n142) );
  OAI21XL U183 ( .A0(n147), .A1(n151), .B0(n148), .Y(n146) );
  NAND2XL U184 ( .A(n209), .B(n148), .Y(n23) );
  NAND2XL U187 ( .A(n240), .B(p_A[9]), .Y(n148) );
  XOR2X1 U188 ( .A(n152), .B(n24), .Y(p_DIFF[8]) );
  OAI21XL U189 ( .A0(n152), .A1(n150), .B0(n151), .Y(n149) );
  NAND2XL U190 ( .A(n210), .B(n151), .Y(n24) );
  NOR2X1 U192 ( .A(n241), .B(p_A[8]), .Y(n150) );
  NAND2X1 U193 ( .A(n241), .B(p_A[8]), .Y(n151) );
  XNOR2X1 U194 ( .A(n160), .B(n25), .Y(p_DIFF[7]) );
  NAND2X1 U197 ( .A(n164), .B(n156), .Y(n154) );
  OAI21XL U200 ( .A0(n158), .A1(n162), .B0(n159), .Y(n157) );
  NAND2XL U201 ( .A(n211), .B(n159), .Y(n25) );
  NAND2XL U204 ( .A(n242), .B(p_A[7]), .Y(n159) );
  XOR2X1 U205 ( .A(n163), .B(n26), .Y(p_DIFF[6]) );
  OAI21XL U206 ( .A0(n163), .A1(n161), .B0(n162), .Y(n160) );
  NAND2XL U207 ( .A(n212), .B(n162), .Y(n26) );
  XOR2X1 U211 ( .A(n168), .B(n27), .Y(p_DIFF[5]) );
  AOI21X1 U212 ( .A0(n173), .A1(n164), .B0(n165), .Y(n163) );
  NOR2X1 U213 ( .A(n171), .B(n166), .Y(n164) );
  OAI21XL U214 ( .A0(n166), .A1(n172), .B0(n167), .Y(n165) );
  NAND2XL U215 ( .A(n213), .B(n167), .Y(n27) );
  NOR2X1 U217 ( .A(n244), .B(p_A[5]), .Y(n166) );
  NAND2XL U218 ( .A(n244), .B(p_A[5]), .Y(n167) );
  XNOR2X1 U219 ( .A(n173), .B(n28), .Y(p_DIFF[4]) );
  AOI21XL U220 ( .A0(n173), .A1(n214), .B0(n170), .Y(n168) );
  NAND2XL U223 ( .A(n214), .B(n172), .Y(n28) );
  NOR2X1 U225 ( .A(n245), .B(p_A[4]), .Y(n171) );
  NAND2X1 U226 ( .A(n245), .B(p_A[4]), .Y(n172) );
  XNOR2X1 U227 ( .A(n179), .B(n29), .Y(p_DIFF[3]) );
  NOR2X1 U230 ( .A(n180), .B(n177), .Y(n175) );
  OAI21XL U231 ( .A0(n177), .A1(n181), .B0(n178), .Y(n176) );
  NAND2XL U232 ( .A(n215), .B(n178), .Y(n29) );
  NOR2X1 U234 ( .A(n246), .B(p_A[3]), .Y(n177) );
  NAND2XL U235 ( .A(n246), .B(p_A[3]), .Y(n178) );
  XOR2X1 U236 ( .A(n182), .B(n30), .Y(p_DIFF[2]) );
  OAI21XL U237 ( .A0(n182), .A1(n180), .B0(n181), .Y(n179) );
  NAND2XL U238 ( .A(n216), .B(n181), .Y(n30) );
  NOR2X1 U240 ( .A(n247), .B(p_A[2]), .Y(n180) );
  NAND2X1 U241 ( .A(n247), .B(p_A[2]), .Y(n181) );
  XOR2X1 U242 ( .A(n31), .B(n186), .Y(p_DIFF[1]) );
  NAND2XL U245 ( .A(n217), .B(n185), .Y(n31) );
  NAND2X1 U248 ( .A(n248), .B(p_A[1]), .Y(n185) );
  NOR2X1 U250 ( .A(n249), .B(p_A[0]), .Y(n186) );
  NOR2X1 U176 ( .A(n239), .B(p_A[10]), .Y(n140) );
  NOR2X1 U139 ( .A(n235), .B(p_A[14]), .Y(n115) );
  NOR2X1 U209 ( .A(n243), .B(p_A[6]), .Y(n161) );
  NOR2X1 U149 ( .A(n236), .B(p_A[13]), .Y(n122) );
  NOR2X1 U168 ( .A(n238), .B(p_A[11]), .Y(n135) );
  NOR2X1 U203 ( .A(n242), .B(p_A[7]), .Y(n158) );
  NOR2X1 U131 ( .A(n234), .B(p_A[15]), .Y(n110) );
  NOR2X1 U182 ( .A(n150), .B(n147), .Y(n145) );
  NOR2XL U127 ( .A(n115), .B(n110), .Y(n108) );
  NOR2XL U199 ( .A(n161), .B(n158), .Y(n156) );
  NOR2XL U164 ( .A(n140), .B(n135), .Y(n133) );
  AOI21X1 U229 ( .A0(n175), .A1(n183), .B0(n176), .Y(n174) );
  AOI21X1 U163 ( .A0(n133), .A1(n146), .B0(n134), .Y(n132) );
  NAND2X1 U162 ( .A(n145), .B(n133), .Y(n131) );
  AOI21XL U198 ( .A0(n156), .A1(n165), .B0(n157), .Y(n155) );
  NOR2X1 U110 ( .A(n232), .B(p_A[17]), .Y(n95) );
  NAND2XL U125 ( .A(n120), .B(n108), .Y(n106) );
  NOR2X1 U118 ( .A(n233), .B(p_A[16]), .Y(n100) );
  OAI21XL U107 ( .A0(n95), .A1(n101), .B0(n96), .Y(n94) );
  NOR2X1 U106 ( .A(n100), .B(n95), .Y(n93) );
  OAI21XL U124 ( .A0(n132), .A1(n106), .B0(n107), .Y(n105) );
  OAI21XL U196 ( .A0(n174), .A1(n154), .B0(n155), .Y(n153) );
  NOR2XL U123 ( .A(n131), .B(n106), .Y(n104) );
  AOI21XL U97 ( .A0(n94), .A1(n355), .B0(n89), .Y(n87) );
  AOI21X1 U122 ( .A0(n104), .A1(n153), .B0(n105), .Y(n103) );
  NAND2XL U96 ( .A(n93), .B(n355), .Y(n86) );
  NAND2X1 U93 ( .A(n230), .B(p_A[19]), .Y(n84) );
  AOI21X1 U87 ( .A0(n85), .A1(n356), .B0(n82), .Y(n80) );
  NAND2X1 U85 ( .A(n229), .B(p_A[20]), .Y(n79) );
  NOR2X1 U84 ( .A(n229), .B(p_A[20]), .Y(n78) );
  OAI21XL U81 ( .A0(n80), .A1(n78), .B0(n79), .Y(n77) );
  AOI21X1 U73 ( .A0(n77), .A1(n357), .B0(n74), .Y(n72) );
  NAND2X1 U65 ( .A(n226), .B(p_A[23]), .Y(n68) );
  NAND2X1 U71 ( .A(n227), .B(p_A[22]), .Y(n71) );
  NOR2X1 U70 ( .A(n227), .B(p_A[22]), .Y(n70) );
  OAI21XL U67 ( .A0(n72), .A1(n70), .B0(n71), .Y(n69) );
  AOI21X1 U59 ( .A0(n69), .A1(n358), .B0(n66), .Y(n64) );
  NAND2X1 U51 ( .A(n224), .B(p_A[25]), .Y(n60) );
  NAND2X1 U57 ( .A(n225), .B(p_A[24]), .Y(n63) );
  NOR2X1 U56 ( .A(n225), .B(p_A[24]), .Y(n62) );
  AOI21X1 U45 ( .A0(n61), .A1(n359), .B0(n58), .Y(n56) );
  NAND2X1 U37 ( .A(n222), .B(p_A[27]), .Y(n52) );
  NAND2X1 U43 ( .A(n223), .B(p_A[26]), .Y(n55) );
  NOR2X1 U42 ( .A(n223), .B(p_A[26]), .Y(n54) );
  OAI21XL U39 ( .A0(n56), .A1(n54), .B0(n55), .Y(n53) );
  NAND2X1 U23 ( .A(n220), .B(p_A[29]), .Y(n44) );
  NOR2X1 U28 ( .A(n221), .B(p_A[28]), .Y(n46) );
  OAI21XL U25 ( .A0(n48), .A1(n46), .B0(n47), .Y(n45) );
  AOI21X1 U17 ( .A0(n45), .A1(n361), .B0(n42), .Y(n40) );
  NAND2X1 U9 ( .A(n218), .B(p_A[31]), .Y(n36) );
  NAND2X1 U15 ( .A(n219), .B(p_A[30]), .Y(n39) );
  NOR2X1 U14 ( .A(n219), .B(p_A[30]), .Y(n38) );
  OAI21XL U11 ( .A0(n40), .A1(n38), .B0(n39), .Y(n37) );
  OAI21XL U161 ( .A0(n152), .A1(n131), .B0(n132), .Y(n130) );
  XOR2XL U1 ( .A(n32), .B(p_A[32]), .Y(p_DIFF[32]) );
  OAI21XL U142 ( .A0(n129), .A1(n118), .B0(n119), .Y(n117) );
  INVXL U286 ( .A(n36), .Y(n34) );
  INVXL U287 ( .A(p_B[30]), .Y(n219) );
  INVXL U288 ( .A(n44), .Y(n42) );
  INVX1 U289 ( .A(p_B[31]), .Y(n218) );
  INVXL U290 ( .A(n52), .Y(n50) );
  INVX1 U291 ( .A(p_B[29]), .Y(n220) );
  INVX1 U292 ( .A(p_B[28]), .Y(n221) );
  INVXL U293 ( .A(p_B[26]), .Y(n223) );
  INVXL U294 ( .A(n60), .Y(n58) );
  INVX1 U295 ( .A(p_B[27]), .Y(n222) );
  INVXL U296 ( .A(p_B[24]), .Y(n225) );
  INVXL U297 ( .A(n68), .Y(n66) );
  INVX1 U298 ( .A(p_B[25]), .Y(n224) );
  INVXL U299 ( .A(p_B[22]), .Y(n227) );
  INVXL U300 ( .A(n76), .Y(n74) );
  INVX1 U301 ( .A(p_B[23]), .Y(n226) );
  INVXL U302 ( .A(n84), .Y(n82) );
  INVXL U303 ( .A(p_B[21]), .Y(n228) );
  INVXL U304 ( .A(n91), .Y(n89) );
  INVX1 U305 ( .A(p_B[19]), .Y(n230) );
  NOR2XL U306 ( .A(n248), .B(p_A[1]), .Y(n184) );
  NOR2XL U307 ( .A(n240), .B(p_A[9]), .Y(n147) );
  NOR2XL U308 ( .A(n127), .B(n122), .Y(n120) );
  INVXL U309 ( .A(p_B[20]), .Y(n229) );
  OAI21XL U310 ( .A0(n184), .A1(n186), .B0(n185), .Y(n183) );
  NAND2XL U311 ( .A(n243), .B(p_A[6]), .Y(n162) );
  NAND2XL U312 ( .A(n237), .B(p_A[12]), .Y(n128) );
  NAND2XL U313 ( .A(n232), .B(p_A[17]), .Y(n96) );
  NAND2XL U314 ( .A(n228), .B(p_A[21]), .Y(n76) );
  AOI21XL U315 ( .A0(n37), .A1(n362), .B0(n34), .Y(n32) );
  NAND2XL U316 ( .A(n221), .B(p_A[28]), .Y(n47) );
  INVXL U317 ( .A(n174), .Y(n173) );
  AOI21XL U318 ( .A0(n142), .A1(n208), .B0(n139), .Y(n137) );
  OAI21XL U319 ( .A0(n103), .A1(n86), .B0(n87), .Y(n85) );
  OAI21XL U320 ( .A0(n64), .A1(n62), .B0(n63), .Y(n61) );
  AOI21XL U321 ( .A0(n53), .A1(n360), .B0(n50), .Y(n48) );
  XNOR2XL U322 ( .A(n249), .B(p_A[0]), .Y(p_DIFF[0]) );
  XOR2XL U323 ( .A(n112), .B(n17), .Y(p_DIFF[15]) );
  XOR2XL U324 ( .A(n48), .B(n4), .Y(p_DIFF[28]) );
  OR2XL U325 ( .A(n231), .B(p_A[18]), .Y(n355) );
  OR2XL U326 ( .A(n230), .B(p_A[19]), .Y(n356) );
  OR2XL U327 ( .A(n228), .B(p_A[21]), .Y(n357) );
  OR2XL U328 ( .A(n226), .B(p_A[23]), .Y(n358) );
  OR2XL U329 ( .A(n224), .B(p_A[25]), .Y(n359) );
  OR2XL U330 ( .A(n222), .B(p_A[27]), .Y(n360) );
  OR2XL U331 ( .A(n220), .B(p_A[29]), .Y(n361) );
  OR2XL U332 ( .A(n218), .B(p_A[31]), .Y(n362) );
  INVXL U333 ( .A(n101), .Y(n99) );
  INVXL U334 ( .A(p_B[0]), .Y(n249) );
  INVXL U335 ( .A(p_B[1]), .Y(n248) );
  INVXL U336 ( .A(p_B[2]), .Y(n247) );
  INVXL U337 ( .A(p_B[3]), .Y(n246) );
  INVXL U338 ( .A(p_B[4]), .Y(n245) );
  INVXL U339 ( .A(p_B[5]), .Y(n244) );
  INVXL U340 ( .A(p_B[6]), .Y(n243) );
  INVXL U341 ( .A(p_B[7]), .Y(n242) );
  INVXL U342 ( .A(p_B[8]), .Y(n241) );
  INVXL U343 ( .A(p_B[9]), .Y(n240) );
  INVXL U344 ( .A(p_B[10]), .Y(n239) );
  INVXL U345 ( .A(p_B[11]), .Y(n238) );
  INVXL U346 ( .A(p_B[12]), .Y(n237) );
  INVX1 U347 ( .A(p_B[13]), .Y(n236) );
  INVXL U348 ( .A(p_B[14]), .Y(n235) );
  INVXL U349 ( .A(p_B[15]), .Y(n234) );
  INVX1 U350 ( .A(p_B[16]), .Y(n233) );
  INVX1 U351 ( .A(p_B[17]), .Y(n232) );
  INVX1 U352 ( .A(p_B[18]), .Y(n231) );
  INVXL U353 ( .A(n184), .Y(n217) );
  INVXL U354 ( .A(n180), .Y(n216) );
  INVXL U355 ( .A(n177), .Y(n215) );
  INVXL U356 ( .A(n166), .Y(n213) );
  INVXL U357 ( .A(n161), .Y(n212) );
  INVXL U358 ( .A(n158), .Y(n211) );
  INVXL U359 ( .A(n150), .Y(n210) );
  INVXL U360 ( .A(n147), .Y(n209) );
  INVXL U361 ( .A(n135), .Y(n207) );
  INVXL U362 ( .A(n122), .Y(n205) );
  INVXL U363 ( .A(n110), .Y(n203) );
  INVXL U364 ( .A(n100), .Y(n98) );
  INVXL U365 ( .A(n95), .Y(n201) );
  INVXL U366 ( .A(n78), .Y(n198) );
  INVXL U367 ( .A(n70), .Y(n196) );
  INVXL U368 ( .A(n62), .Y(n194) );
  INVXL U369 ( .A(n54), .Y(n192) );
  INVXL U370 ( .A(n46), .Y(n190) );
  INVXL U371 ( .A(n38), .Y(n188) );
  INVXL U372 ( .A(n183), .Y(n182) );
  INVXL U373 ( .A(n172), .Y(n170) );
  INVXL U374 ( .A(n171), .Y(n214) );
  INVX1 U375 ( .A(n153), .Y(n152) );
  INVXL U376 ( .A(n146), .Y(n144) );
  INVXL U377 ( .A(n145), .Y(n143) );
  INVXL U378 ( .A(n141), .Y(n139) );
  INVXL U379 ( .A(n140), .Y(n208) );
  INVX1 U380 ( .A(n130), .Y(n129) );
  INVXL U381 ( .A(n128), .Y(n126) );
  INVXL U382 ( .A(n127), .Y(n206) );
  INVXL U383 ( .A(n121), .Y(n119) );
  INVXL U384 ( .A(n120), .Y(n118) );
  INVXL U385 ( .A(n116), .Y(n114) );
  INVXL U386 ( .A(n115), .Y(n204) );
  INVX1 U387 ( .A(n103), .Y(n102) );
endmodule


module sequ_div ( clk, rst_n, divider, dividend, start, quotient, remainder, 
        ready, illegal_divider_zero );
  input [31:0] divider;
  input [31:0] dividend;
  output [31:0] quotient;
  output [31:0] remainder;
  input clk, rst_n, start;
  output ready, illegal_divider_zero;
  wire   n780, n781, n782, n783, n784, n785, n786, n787, n788, n789, n790,
         n791, n792, n793, n794, n795, n796, n797, n798, n799, n800, n801,
         n802, n803, n804, n805, n806, n807, n808, n809, n810, n811, n812,
         n813, n814, n815, n816, n817, n818, n819, n820, n821, n822, n823,
         n824, n825, n826, n827, n828, n829, n830, n831, n832, n833, n834,
         n835, n836, n837, n838, n839, n840, n841, n842, n843, n844, n845, N22,
         N27, N28, N29, N32, N33, N34, N35, N37, N38, N39, N42, N47, N48, N49,
         N52, N54, N55, N56, N57, N58, N59, N62, N65, N67, N68, N69, N72, N73,
         N74, N75, N76, N77, N78, N79, N82, N84, N87, N88, N89, N92, N94, N95,
         N96, N97, N98, N99, N100, N101, N102, N107, N108, N109, N124, N125,
         illegal, N129, N130, N131, N132, N133, N139, N140, N141, N145, N146,
         N147, N148, N149, N152, N153, N154, N155, N156, N157, N160, N161,
         N162, N163, N164, N165, N166, N167, N168, N169, N170, N171, N172,
         N173, N176, N177, N178, N179, N180, N181, N182, N183, N184, N185,
         N186, N187, N188, N189, N202, N203, N204, N205, N206, N207, N208,
         N209, N210, N211, N212, N213, N214, N215, N216, N217, N218, N219,
         N220, N221, N222, N223, N224, N225, N226, N227, N228, N229, N230,
         N231, N232, N233, N234, N236, N269, N270, N271, N272, N273, N275,
         N276, N277, N278, N279, N280, N281, N282, N283, N284, N285, N286,
         N287, N288, N289, N290, N291, N292, N293, N294, N295, N296, N297,
         N298, N299, N300, N301, N302, N303, N304, N305, N306, N307, N308,
         N309, N310, N311, N312, N313, N314, N315, N316, N317, N318, N319,
         N320, N321, N322, N323, N324, N325, N326, N327, N328, N329, N330,
         N331, N332, N333, N334, N335, N336, N337, N338, N341, N342, N343,
         N344, N345, N412, N413, N414, N415, N416, N417, N418, N419, N420,
         N421, N422, N423, N424, N425, N426, N427, N428, N429, N430, N431,
         N432, N433, N434, N435, N436, N437, N438, N439, N440, N441, N442,
         N443, N444, N445, N446, N447, N448, N450, N451, N452, N453, N454,
         N455, N456, N457, N458, N459, N460, N461, N462, N463, N464, N465,
         N466, N467, N468, N469, N470, N471, N472, N473, N474, N475, N476,
         N477, N478, N479, N480, N481, N482, N483, N484, N487, N488, N489,
         N490, N491, N492, N493, N494, N495, N496, N497, N498, N499, N500,
         N501, N502, N503, N504, N505, N506, N507, N508, N509, N510, N511,
         N512, N513, N514, N515, N516, N517, N520, N521, N522, N523, N524,
         N525, N526, N527, N528, N529, N530, N531, N532, N533, N534, N535,
         N536, N537, N538, N539, N540, N541, N542, N543, N544, N545, N546,
         N547, N548, N549, N197, N196, N195, N194, N193, N192, N118, N117,
         N116, N115, N114, N113, N112, n146, n147, n148, n150, n152, n153,
         n155, n156, n157, n158, n160, n161, n162, n163, n164, n165, n166,
         n167, n168, n169, n170, n171, n172, n173, n174, n175, n176, n177,
         n178, n179, n180, n181, n182, n183, n184, n185, n186, n187, n188,
         n189, n190, n191, n192, n193, n194, n195, n196, n197, n334, n335,
         n336, n337, n338, n339, n340, n341, n342, n343, n344, n345, n346,
         n347, n348, n349, n350, n351, n352, n353, n354, n355, n356, n357,
         n358, n359, n360, n361, n362, n363, n364, n365, n366, n367, n368,
         n369, n370, n371, n372, n373, n374, n375, n376, n377, n378, n379,
         n380, n381, n382, n383, n384, n385, n386, n387, n388, n389, n390,
         n391, n392, n393, n394, n395, n396, n397, n398, n399, n400, n401,
         n404, n405, n407, n410, n412, n414, n416, n418, n493, n494, n495,
         n496, n497, n498, n500, n502, n504, n506, n508, n510, n512, n514,
         n516, n518, n520, n522, n524, n526, n528, n530, n532, n534, n536,
         n538, n540, n542, n544, n546, n548, n550, n552, n554, n556, n558,
         n560, n562, n564, n566, n568, n570, n572, n574, n576, n578, n580,
         n582, n584, n586, n588, n590, n592, n594, n596, n598, n600, n602,
         n604, n606, n608, n610, n612, n614, n616, n618, n620, n622, n624,
         n626, n628, n630, n632, n634, n636, n638, n640, n642, n644, n646,
         n648, n650, n652, n654, n656, n658, n660, n662, n664, n666, n668,
         n670, n672, n674, n676, n678, n680, n682, n684, n686, n688, n690,
         n692, n694, n696, n698, n700, n702, n704, n706, n708, n710, n712,
         n714, n716, n718, n720, n722, n724, n726, n728, n730, n732, n734,
         n736, n738, n740, n742, n744, n746, n748, n750, n752, n754, n756,
         n758, n759, n760, n761, n762, n763, n764, n765, n766, n767, n768,
         n769, n770, n771, n772, n773, n774, n775, n776, n777, n778, n779;
  wire   [8:0] cur_state;
  wire   [8:0] next_state;
  wire   [4:0] shift_count;
  wire   [63:0] remainder_quotient;

  OR2X1 C2155 ( .A(N101), .B(N117), .Y(N118) );
  OR2X1 C2154 ( .A(n772), .B(N116), .Y(N117) );
  OR2XL C2153 ( .A(n773), .B(N115), .Y(N116) );
  OR2XL C2152 ( .A(n774), .B(N114), .Y(N115) );
  OR2XL C2151 ( .A(n775), .B(N113), .Y(N114) );
  OR2XL C2150 ( .A(n776), .B(N112), .Y(N113) );
  OR2XL C2149 ( .A(n777), .B(n779), .Y(N112) );
  OR2X4 C1925 ( .A(divider[3]), .B(N514), .Y(N515) );
  OR2X4 C1924 ( .A(divider[4]), .B(N513), .Y(N514) );
  OR2X4 C1923 ( .A(divider[5]), .B(N512), .Y(N513) );
  OR2XL C1894 ( .A(shift_count[1]), .B(N483), .Y(N484) );
  OR2XL C1893 ( .A(shift_count[2]), .B(N482), .Y(N483) );
  OR2XL C1892 ( .A(shift_count[3]), .B(shift_count[4]), .Y(N482) );
  OR2X2 C229 ( .A(cur_state[4]), .B(N52), .Y(N146) );
  OR2X2 C228 ( .A(cur_state[6]), .B(cur_state[5]), .Y(N145) );
  OR2XL C114 ( .A(N107), .B(N108), .Y(N109) );
  OR2XL C113 ( .A(N130), .B(N187), .Y(N108) );
  OR2XL C112 ( .A(N184), .B(N129), .Y(N107) );
  OR2XL C104 ( .A(N97), .B(N98), .Y(N99) );
  OR2XL C103 ( .A(N95), .B(N96), .Y(N98) );
  OR2XL C102 ( .A(N176), .B(N94), .Y(N97) );
  OR2XL C101 ( .A(cur_state[2]), .B(cur_state[1]), .Y(N96) );
  OR2XL C100 ( .A(cur_state[4]), .B(cur_state[3]), .Y(N95) );
  OR2XL C99 ( .A(cur_state[6]), .B(cur_state[5]), .Y(N94) );
  OR2XL C94 ( .A(N87), .B(N88), .Y(N89) );
  OR2XL C93 ( .A(N95), .B(N96), .Y(N88) );
  OR2XL C92 ( .A(N73), .B(N84), .Y(N87) );
  OR2XL C89 ( .A(N82), .B(cur_state[5]), .Y(N84) );
  OR2XL C84 ( .A(N77), .B(N78), .Y(N79) );
  OR2XL C83 ( .A(N75), .B(N76), .Y(N78) );
  OR2XL C82 ( .A(N73), .B(N74), .Y(N77) );
  OR2XL C81 ( .A(cur_state[2]), .B(cur_state[1]), .Y(N76) );
  OR2XL C80 ( .A(cur_state[4]), .B(cur_state[3]), .Y(N75) );
  OR2XL C79 ( .A(cur_state[6]), .B(N72), .Y(N74) );
  OR2XL C74 ( .A(N67), .B(N68), .Y(N69) );
  OR2XL C73 ( .A(N65), .B(N76), .Y(N68) );
  OR2XL C72 ( .A(N73), .B(N94), .Y(N67) );
  OR2XL C70 ( .A(N62), .B(cur_state[3]), .Y(N65) );
  OR2XL C64 ( .A(N57), .B(N58), .Y(N59) );
  OR2XL C63 ( .A(N55), .B(N56), .Y(N58) );
  OR2XL C62 ( .A(N33), .B(N54), .Y(N57) );
  OR2XL C61 ( .A(cur_state[2]), .B(cur_state[1]), .Y(N56) );
  OR2XL C60 ( .A(cur_state[4]), .B(N52), .Y(N55) );
  OR2XL C59 ( .A(cur_state[6]), .B(cur_state[5]), .Y(N54) );
  OR2X1 C54 ( .A(N47), .B(N48), .Y(N49) );
  OR2XL C53 ( .A(N75), .B(N139), .Y(N48) );
  OR2XL C52 ( .A(N33), .B(N54), .Y(N47) );
  OR2XL C44 ( .A(N37), .B(N38), .Y(N39) );
  OR2XL C43 ( .A(N35), .B(N131), .Y(N38) );
  OR2XL C42 ( .A(N33), .B(N34), .Y(N37) );
  OR2XL C40 ( .A(cur_state[4]), .B(cur_state[3]), .Y(N35) );
  OR2XL C39 ( .A(cur_state[6]), .B(cur_state[5]), .Y(N34) );
  OR2X1 C34 ( .A(N27), .B(N28), .Y(N29) );
  OR2XL C33 ( .A(N35), .B(N56), .Y(N28) );
  OR2XL C32 ( .A(N33), .B(N34), .Y(N27) );
  NAND3X1 U148 ( .A(n146), .B(n147), .C(n148), .Y(next_state[8]) );
  AOI22X1 U150 ( .A0(n495), .A1(n775), .B0(n772), .B1(N124), .Y(n147) );
  AOI22XL U151 ( .A0(N101), .A1(n498), .B0(n773), .B1(n150), .Y(n146) );
  INVXL U152 ( .A(n496), .Y(n150) );
  OAI2BB2XL U153 ( .B0(n498), .B1(N100), .A0N(N125), .A1N(n772), .Y(
        next_state[7]) );
  AND2X1 U155 ( .A(n773), .B(n496), .Y(next_state[6]) );
  NOR2BX1 U156 ( .AN(n774), .B(n764), .Y(next_state[5]) );
  NOR2BX1 U157 ( .AN(n775), .B(n495), .Y(next_state[4]) );
  AND2XL U159 ( .A(n779), .B(start), .Y(next_state[1]) );
  OR3XL U160 ( .A(n771), .B(n778), .C(n152), .Y(next_state[0]) );
  NOR2BXL U161 ( .AN(n779), .B(start), .Y(n152) );
  AND2X1 U162 ( .A(remainder_quotient[31]), .B(N413), .Y(N481) );
  AND2X1 U163 ( .A(remainder_quotient[30]), .B(N413), .Y(N480) );
  AND2X1 U164 ( .A(remainder_quotient[29]), .B(N413), .Y(N479) );
  AND2X1 U165 ( .A(remainder_quotient[28]), .B(N413), .Y(N478) );
  AND2X1 U166 ( .A(remainder_quotient[27]), .B(N413), .Y(N477) );
  AND2X1 U167 ( .A(remainder_quotient[26]), .B(N413), .Y(N476) );
  AND2X1 U168 ( .A(remainder_quotient[25]), .B(N413), .Y(N475) );
  AND2X1 U169 ( .A(remainder_quotient[24]), .B(N413), .Y(N474) );
  AND2X1 U170 ( .A(remainder_quotient[23]), .B(N413), .Y(N473) );
  AND2X1 U171 ( .A(remainder_quotient[22]), .B(N413), .Y(N472) );
  AND2X1 U173 ( .A(remainder_quotient[20]), .B(N413), .Y(N470) );
  AND2X1 U174 ( .A(remainder_quotient[19]), .B(N413), .Y(N469) );
  AND2X1 U175 ( .A(remainder_quotient[18]), .B(N413), .Y(N468) );
  AND2X1 U176 ( .A(remainder_quotient[17]), .B(N413), .Y(N467) );
  AND2X1 U177 ( .A(remainder_quotient[16]), .B(N413), .Y(N466) );
  AND2X1 U178 ( .A(remainder_quotient[15]), .B(N413), .Y(N465) );
  AND2X1 U179 ( .A(remainder_quotient[14]), .B(N413), .Y(N464) );
  AND2X1 U180 ( .A(remainder_quotient[13]), .B(N413), .Y(N463) );
  AND2X1 U181 ( .A(remainder_quotient[12]), .B(N413), .Y(N462) );
  AND2X1 U182 ( .A(remainder_quotient[11]), .B(N413), .Y(N461) );
  AND2X1 U183 ( .A(remainder_quotient[10]), .B(N413), .Y(N460) );
  AND2X1 U184 ( .A(remainder_quotient[9]), .B(N413), .Y(N459) );
  AND2X1 U185 ( .A(remainder_quotient[8]), .B(N413), .Y(N458) );
  AND2X1 U186 ( .A(remainder_quotient[7]), .B(N413), .Y(N457) );
  AND2X1 U188 ( .A(remainder_quotient[5]), .B(N413), .Y(N455) );
  AND2X1 U189 ( .A(remainder_quotient[4]), .B(N413), .Y(N454) );
  AND2X1 U190 ( .A(remainder_quotient[3]), .B(N413), .Y(N453) );
  AND2X1 U191 ( .A(remainder_quotient[2]), .B(N413), .Y(N452) );
  AND2X1 U192 ( .A(remainder_quotient[1]), .B(N413), .Y(N451) );
  AND2X1 U193 ( .A(remainder_quotient[0]), .B(N413), .Y(N450) );
  AND2X1 U195 ( .A(N413), .B(remainder_quotient[63]), .Y(N448) );
  AND2X1 U196 ( .A(remainder_quotient[62]), .B(N413), .Y(N447) );
  AND2X1 U197 ( .A(remainder_quotient[61]), .B(N413), .Y(N446) );
  AND2X1 U198 ( .A(remainder_quotient[60]), .B(N413), .Y(N445) );
  AND2X1 U199 ( .A(remainder_quotient[59]), .B(N413), .Y(N444) );
  AND2X1 U200 ( .A(remainder_quotient[58]), .B(N413), .Y(N443) );
  AND2X1 U201 ( .A(remainder_quotient[57]), .B(N413), .Y(N442) );
  AND2X1 U202 ( .A(remainder_quotient[56]), .B(N413), .Y(N441) );
  AND2X1 U203 ( .A(remainder_quotient[55]), .B(N413), .Y(N440) );
  AND2X1 U204 ( .A(remainder_quotient[54]), .B(N413), .Y(N439) );
  AND2X1 U205 ( .A(remainder_quotient[53]), .B(N413), .Y(N438) );
  AND2X1 U206 ( .A(remainder_quotient[52]), .B(N413), .Y(N437) );
  AND2X1 U207 ( .A(remainder_quotient[51]), .B(N413), .Y(N436) );
  AND2X1 U209 ( .A(remainder_quotient[49]), .B(N413), .Y(N434) );
  AND2X1 U210 ( .A(remainder_quotient[48]), .B(N413), .Y(N433) );
  AND2X1 U211 ( .A(remainder_quotient[47]), .B(N413), .Y(N432) );
  AND2X1 U212 ( .A(remainder_quotient[46]), .B(N413), .Y(N431) );
  AND2X1 U213 ( .A(remainder_quotient[45]), .B(N413), .Y(N430) );
  AND2X1 U214 ( .A(remainder_quotient[44]), .B(N413), .Y(N429) );
  AND2X1 U215 ( .A(remainder_quotient[43]), .B(N413), .Y(N428) );
  AND2X1 U216 ( .A(remainder_quotient[42]), .B(N413), .Y(N427) );
  AND2X1 U217 ( .A(remainder_quotient[41]), .B(N413), .Y(N426) );
  AND2X1 U218 ( .A(remainder_quotient[40]), .B(N413), .Y(N425) );
  AND2X1 U219 ( .A(remainder_quotient[39]), .B(N413), .Y(N424) );
  AND2X1 U220 ( .A(remainder_quotient[38]), .B(N413), .Y(N423) );
  AND2X1 U221 ( .A(remainder_quotient[37]), .B(N413), .Y(N422) );
  AND2X1 U222 ( .A(remainder_quotient[36]), .B(N413), .Y(N421) );
  AND2X1 U224 ( .A(remainder_quotient[34]), .B(N413), .Y(N419) );
  AND2X1 U225 ( .A(remainder_quotient[33]), .B(N413), .Y(N418) );
  AND2X1 U226 ( .A(remainder_quotient[32]), .B(N413), .Y(N417) );
  AOI21X1 U227 ( .A0(n153), .A1(N182), .B0(cur_state[0]), .Y(N416) );
  OAI21XL U228 ( .A0(cur_state[0]), .A1(n155), .B0(n156), .Y(N414) );
  INVX1 U229 ( .A(N415), .Y(n156) );
  AOI211X1 U232 ( .A0(n766), .A1(N124), .B0(N183), .C0(n158), .Y(n155) );
  OAI21XL U233 ( .A0(n496), .A1(N166), .B0(n160), .Y(n158) );
  AOI22X1 U234 ( .A0(n495), .A1(n767), .B0(n764), .B1(n497), .Y(n160) );
  AND2X1 U236 ( .A(N413), .B(illegal), .Y(N412) );
  OAI2BB1XL U238 ( .A0N(N183), .A1N(N273), .B0(n153), .Y(N345) );
  OAI2BB1XL U239 ( .A0N(N183), .A1N(N272), .B0(n153), .Y(N344) );
  OAI2BB1XL U240 ( .A0N(N183), .A1N(N271), .B0(n153), .Y(N343) );
  OAI2BB1XL U241 ( .A0N(N183), .A1N(N270), .B0(n153), .Y(N342) );
  OAI2BB1XL U242 ( .A0N(N183), .A1N(N269), .B0(n153), .Y(N341) );
  INVX1 U243 ( .A(n770), .Y(n153) );
  OAI21XL U244 ( .A0(n354), .A1(n161), .B0(n162), .Y(N338) );
  AOI22X1 U245 ( .A0(n163), .A1(N233), .B0(n164), .B1(remainder_quotient[62]), 
        .Y(n162) );
  OAI21XL U246 ( .A0(n355), .A1(n161), .B0(n165), .Y(N337) );
  AOI22X1 U247 ( .A0(n163), .A1(N232), .B0(n164), .B1(remainder_quotient[61]), 
        .Y(n165) );
  OAI21XL U248 ( .A0(n351), .A1(n161), .B0(n166), .Y(N336) );
  AOI22X1 U249 ( .A0(n163), .A1(N231), .B0(n164), .B1(remainder_quotient[60]), 
        .Y(n166) );
  OAI21XL U250 ( .A0(n352), .A1(n161), .B0(n167), .Y(N335) );
  AOI22X1 U251 ( .A0(n163), .A1(N230), .B0(n164), .B1(remainder_quotient[59]), 
        .Y(n167) );
  OAI21XL U252 ( .A0(n360), .A1(n161), .B0(n168), .Y(N334) );
  AOI22X1 U253 ( .A0(n163), .A1(N229), .B0(n164), .B1(remainder_quotient[58]), 
        .Y(n168) );
  OAI21XL U254 ( .A0(n361), .A1(n161), .B0(n169), .Y(N333) );
  AOI22X1 U255 ( .A0(n163), .A1(N228), .B0(n164), .B1(remainder_quotient[57]), 
        .Y(n169) );
  OAI21XL U256 ( .A0(n357), .A1(n161), .B0(n170), .Y(N332) );
  AOI22X1 U257 ( .A0(n163), .A1(N227), .B0(n164), .B1(remainder_quotient[56]), 
        .Y(n170) );
  OAI21XL U258 ( .A0(n358), .A1(n161), .B0(n171), .Y(N331) );
  AOI22X1 U259 ( .A0(n163), .A1(N226), .B0(n164), .B1(remainder_quotient[55]), 
        .Y(n171) );
  OAI21XL U260 ( .A0(n338), .A1(n161), .B0(n172), .Y(N330) );
  AOI22X1 U261 ( .A0(n163), .A1(N225), .B0(n164), .B1(remainder_quotient[54]), 
        .Y(n172) );
  OAI21XL U262 ( .A0(n339), .A1(n161), .B0(n173), .Y(N329) );
  AOI22X1 U263 ( .A0(n163), .A1(N224), .B0(n164), .B1(remainder_quotient[53]), 
        .Y(n173) );
  OAI21XL U264 ( .A0(n335), .A1(n161), .B0(n174), .Y(N328) );
  AOI22X1 U265 ( .A0(n163), .A1(N223), .B0(n164), .B1(remainder_quotient[52]), 
        .Y(n174) );
  OAI21XL U266 ( .A0(n336), .A1(n161), .B0(n175), .Y(N327) );
  AOI22X1 U267 ( .A0(n163), .A1(N222), .B0(n164), .B1(remainder_quotient[51]), 
        .Y(n175) );
  OAI21XL U268 ( .A0(n344), .A1(n161), .B0(n176), .Y(N326) );
  AOI22X1 U269 ( .A0(n163), .A1(N221), .B0(n164), .B1(remainder_quotient[50]), 
        .Y(n176) );
  OAI21XL U270 ( .A0(n345), .A1(n161), .B0(n177), .Y(N325) );
  AOI22X1 U271 ( .A0(n163), .A1(N220), .B0(n164), .B1(remainder_quotient[49]), 
        .Y(n177) );
  OAI21XL U272 ( .A0(n341), .A1(n161), .B0(n178), .Y(N324) );
  AOI22X1 U273 ( .A0(n163), .A1(N219), .B0(n164), .B1(remainder_quotient[48]), 
        .Y(n178) );
  OAI21XL U274 ( .A0(n342), .A1(n161), .B0(n179), .Y(N323) );
  AOI22X1 U275 ( .A0(n163), .A1(N218), .B0(n164), .B1(remainder_quotient[47]), 
        .Y(n179) );
  OAI21XL U276 ( .A0(n386), .A1(n161), .B0(n180), .Y(N322) );
  AOI22X1 U277 ( .A0(n163), .A1(N217), .B0(n164), .B1(remainder_quotient[46]), 
        .Y(n180) );
  OAI21XL U278 ( .A0(n387), .A1(n161), .B0(n181), .Y(N321) );
  AOI22X1 U279 ( .A0(n163), .A1(N216), .B0(n164), .B1(remainder_quotient[45]), 
        .Y(n181) );
  OAI21XL U280 ( .A0(n383), .A1(n161), .B0(n182), .Y(N320) );
  AOI22X1 U281 ( .A0(n163), .A1(N215), .B0(n164), .B1(remainder_quotient[44]), 
        .Y(n182) );
  OAI21XL U282 ( .A0(n384), .A1(n161), .B0(n183), .Y(N319) );
  OAI21XL U284 ( .A0(n392), .A1(n161), .B0(n184), .Y(N318) );
  AOI22X1 U285 ( .A0(n163), .A1(N213), .B0(n164), .B1(remainder_quotient[42]), 
        .Y(n184) );
  OAI21XL U286 ( .A0(n393), .A1(n161), .B0(n185), .Y(N317) );
  AOI22X1 U287 ( .A0(n163), .A1(N212), .B0(n164), .B1(remainder_quotient[41]), 
        .Y(n185) );
  OAI21XL U288 ( .A0(n389), .A1(n161), .B0(n186), .Y(N316) );
  AOI22X1 U289 ( .A0(n163), .A1(N211), .B0(n164), .B1(remainder_quotient[40]), 
        .Y(n186) );
  OAI21XL U290 ( .A0(n390), .A1(n161), .B0(n187), .Y(N315) );
  AOI22X1 U291 ( .A0(n163), .A1(N210), .B0(n164), .B1(remainder_quotient[39]), 
        .Y(n187) );
  OAI21XL U292 ( .A0(n370), .A1(n161), .B0(n188), .Y(N314) );
  AOI22X1 U293 ( .A0(n163), .A1(N209), .B0(n164), .B1(remainder_quotient[38]), 
        .Y(n188) );
  OAI21XL U294 ( .A0(n371), .A1(n161), .B0(n189), .Y(N313) );
  AOI22X1 U295 ( .A0(n163), .A1(N208), .B0(n164), .B1(remainder_quotient[37]), 
        .Y(n189) );
  OAI21XL U296 ( .A0(n367), .A1(n161), .B0(n190), .Y(N312) );
  AOI22X1 U297 ( .A0(n163), .A1(N207), .B0(n164), .B1(remainder_quotient[36]), 
        .Y(n190) );
  OAI21XL U298 ( .A0(n368), .A1(n161), .B0(n191), .Y(N311) );
  AOI22X1 U299 ( .A0(n163), .A1(N206), .B0(n164), .B1(remainder_quotient[35]), 
        .Y(n191) );
  OAI21XL U300 ( .A0(n376), .A1(n161), .B0(n192), .Y(N310) );
  AOI22X1 U301 ( .A0(n163), .A1(N205), .B0(n164), .B1(remainder_quotient[34]), 
        .Y(n192) );
  OAI21XL U302 ( .A0(n377), .A1(n161), .B0(n193), .Y(N309) );
  AOI22X1 U303 ( .A0(n163), .A1(N204), .B0(n164), .B1(remainder_quotient[33]), 
        .Y(n193) );
  OAI21XL U304 ( .A0(n373), .A1(n161), .B0(n194), .Y(N308) );
  AOI22X1 U305 ( .A0(n163), .A1(N203), .B0(n164), .B1(remainder_quotient[32]), 
        .Y(n194) );
  OAI21XL U306 ( .A0(n374), .A1(n161), .B0(n195), .Y(N307) );
  AOI22X1 U307 ( .A0(n163), .A1(N202), .B0(remainder_quotient[31]), .B1(n164), 
        .Y(n195) );
  OAI2BB2X1 U312 ( .B0(n354), .B1(n197), .A0N(N183), .A1N(
        remainder_quotient[30]), .Y(N306) );
  OAI2BB2X1 U314 ( .B0(n351), .B1(n197), .A0N(N183), .A1N(
        remainder_quotient[28]), .Y(N304) );
  OAI2BB2X1 U315 ( .B0(n352), .B1(n197), .A0N(N183), .A1N(
        remainder_quotient[27]), .Y(N303) );
  OAI2BB2X1 U316 ( .B0(n360), .B1(n197), .A0N(N183), .A1N(
        remainder_quotient[26]), .Y(N302) );
  OAI2BB2X1 U317 ( .B0(n361), .B1(n197), .A0N(N183), .A1N(
        remainder_quotient[25]), .Y(N301) );
  OAI2BB2X1 U318 ( .B0(n357), .B1(n197), .A0N(N183), .A1N(
        remainder_quotient[24]), .Y(N300) );
  OAI2BB2X1 U319 ( .B0(n358), .B1(n197), .A0N(N183), .A1N(
        remainder_quotient[23]), .Y(N299) );
  OAI2BB2X1 U320 ( .B0(n338), .B1(n197), .A0N(N183), .A1N(
        remainder_quotient[22]), .Y(N298) );
  OAI2BB2X1 U321 ( .B0(n339), .B1(n197), .A0N(N183), .A1N(
        remainder_quotient[21]), .Y(N297) );
  OAI2BB2X1 U322 ( .B0(n335), .B1(n197), .A0N(N183), .A1N(
        remainder_quotient[20]), .Y(N296) );
  OAI2BB2X1 U323 ( .B0(n336), .B1(n197), .A0N(N183), .A1N(
        remainder_quotient[19]), .Y(N295) );
  OAI2BB2X1 U324 ( .B0(n344), .B1(n197), .A0N(N183), .A1N(
        remainder_quotient[18]), .Y(N294) );
  OAI2BB2X1 U325 ( .B0(n345), .B1(n197), .A0N(N183), .A1N(
        remainder_quotient[17]), .Y(N293) );
  OAI2BB2X1 U326 ( .B0(n341), .B1(n197), .A0N(N183), .A1N(
        remainder_quotient[16]), .Y(N292) );
  OAI2BB2X1 U327 ( .B0(n342), .B1(n197), .A0N(N183), .A1N(
        remainder_quotient[15]), .Y(N291) );
  OAI2BB2X1 U329 ( .B0(n387), .B1(n197), .A0N(N183), .A1N(
        remainder_quotient[13]), .Y(N289) );
  OAI2BB2X1 U330 ( .B0(n383), .B1(n197), .A0N(N183), .A1N(
        remainder_quotient[12]), .Y(N288) );
  OAI2BB2X1 U331 ( .B0(n384), .B1(n197), .A0N(N183), .A1N(
        remainder_quotient[11]), .Y(N287) );
  OAI2BB2X1 U332 ( .B0(n392), .B1(n197), .A0N(N183), .A1N(
        remainder_quotient[10]), .Y(N286) );
  OAI2BB2X1 U333 ( .B0(n393), .B1(n197), .A0N(N183), .A1N(
        remainder_quotient[9]), .Y(N285) );
  OAI2BB2X1 U334 ( .B0(n389), .B1(n197), .A0N(N183), .A1N(
        remainder_quotient[8]), .Y(N284) );
  OAI2BB2X1 U335 ( .B0(n390), .B1(n197), .A0N(N183), .A1N(
        remainder_quotient[7]), .Y(N283) );
  OAI2BB2X1 U336 ( .B0(n370), .B1(n197), .A0N(N183), .A1N(
        remainder_quotient[6]), .Y(N282) );
  OAI2BB2X1 U337 ( .B0(n371), .B1(n197), .A0N(N183), .A1N(
        remainder_quotient[5]), .Y(N281) );
  OAI2BB2X1 U338 ( .B0(n367), .B1(n197), .A0N(N183), .A1N(
        remainder_quotient[4]), .Y(N280) );
  OAI2BB2X1 U339 ( .B0(n368), .B1(n197), .A0N(N183), .A1N(
        remainder_quotient[3]), .Y(N279) );
  OAI2BB2X1 U340 ( .B0(n376), .B1(n197), .A0N(N183), .A1N(
        remainder_quotient[2]), .Y(N278) );
  OAI2BB2X1 U341 ( .B0(n377), .B1(n197), .A0N(N183), .A1N(
        remainder_quotient[1]), .Y(N277) );
  OAI2BB2X1 U342 ( .B0(n373), .B1(n197), .A0N(N183), .A1N(
        remainder_quotient[0]), .Y(N276) );
  MX2X1 U347 ( .A(shift_count[0]), .B(N341), .S0(N416), .Y(n410) );
  MX2X1 U348 ( .A(shift_count[4]), .B(N345), .S0(N416), .Y(n418) );
  MX2X1 U350 ( .A(shift_count[2]), .B(N343), .S0(N416), .Y(n414) );
  MX2X1 U351 ( .A(shift_count[3]), .B(N344), .S0(N416), .Y(n416) );
  MX2XL U482 ( .A(n844), .B(N413), .S0(n405), .Y(n694) );
  INVX1 U483 ( .A(dividend[20]), .Y(n336) );
  INVX1 U484 ( .A(dividend[21]), .Y(n335) );
  OAI221XL U486 ( .A0(n336), .A1(divider[20]), .B0(n335), .B1(divider[21]), 
        .C0(n334), .Y(n349) );
  INVX1 U487 ( .A(dividend[22]), .Y(n339) );
  INVX1 U488 ( .A(dividend[23]), .Y(n338) );
  AOI22X1 U489 ( .A0(divider[22]), .A1(n339), .B0(divider[23]), .B1(n338), .Y(
        n337) );
  OAI221XL U490 ( .A0(n339), .A1(divider[22]), .B0(n338), .B1(divider[23]), 
        .C0(n337), .Y(n348) );
  INVX1 U491 ( .A(dividend[16]), .Y(n342) );
  INVX1 U492 ( .A(dividend[17]), .Y(n341) );
  AOI22X1 U493 ( .A0(divider[16]), .A1(n342), .B0(divider[17]), .B1(n341), .Y(
        n340) );
  OAI221XL U494 ( .A0(n342), .A1(divider[16]), .B0(n341), .B1(divider[17]), 
        .C0(n340), .Y(n347) );
  INVX1 U495 ( .A(dividend[18]), .Y(n345) );
  INVX1 U496 ( .A(dividend[19]), .Y(n344) );
  AOI22X1 U497 ( .A0(divider[18]), .A1(n345), .B0(divider[19]), .B1(n344), .Y(
        n343) );
  OAI221XL U498 ( .A0(n345), .A1(divider[18]), .B0(n344), .B1(divider[19]), 
        .C0(n343), .Y(n346) );
  NOR4X1 U499 ( .A(n349), .B(n348), .C(n347), .D(n346), .Y(n401) );
  INVX1 U500 ( .A(dividend[28]), .Y(n352) );
  INVX1 U501 ( .A(dividend[29]), .Y(n351) );
  AOI22X1 U502 ( .A0(divider[28]), .A1(n352), .B0(divider[29]), .B1(n351), .Y(
        n350) );
  OAI221XL U503 ( .A0(n352), .A1(divider[28]), .B0(n351), .B1(divider[29]), 
        .C0(n350), .Y(n365) );
  INVX1 U504 ( .A(dividend[30]), .Y(n355) );
  INVX1 U505 ( .A(dividend[31]), .Y(n354) );
  OAI221XL U507 ( .A0(n355), .A1(divider[30]), .B0(n354), .B1(divider[31]), 
        .C0(n353), .Y(n364) );
  INVX1 U508 ( .A(dividend[24]), .Y(n358) );
  INVX1 U509 ( .A(dividend[25]), .Y(n357) );
  AOI22X1 U510 ( .A0(divider[24]), .A1(n358), .B0(divider[25]), .B1(n357), .Y(
        n356) );
  OAI221XL U511 ( .A0(n358), .A1(divider[24]), .B0(n357), .B1(divider[25]), 
        .C0(n356), .Y(n363) );
  INVX1 U513 ( .A(dividend[27]), .Y(n360) );
  AOI22X1 U514 ( .A0(divider[26]), .A1(n361), .B0(divider[27]), .B1(n360), .Y(
        n359) );
  OAI221XL U515 ( .A0(n361), .A1(divider[26]), .B0(n360), .B1(divider[27]), 
        .C0(n359), .Y(n362) );
  NOR4X1 U516 ( .A(n365), .B(n364), .C(n363), .D(n362), .Y(n400) );
  INVX1 U517 ( .A(dividend[4]), .Y(n368) );
  INVX1 U518 ( .A(dividend[5]), .Y(n367) );
  AOI22X1 U519 ( .A0(divider[4]), .A1(n368), .B0(divider[5]), .B1(n367), .Y(
        n366) );
  OAI221XL U520 ( .A0(n368), .A1(divider[4]), .B0(n367), .B1(divider[5]), .C0(
        n366), .Y(n381) );
  INVX1 U521 ( .A(dividend[6]), .Y(n371) );
  INVX1 U522 ( .A(dividend[7]), .Y(n370) );
  AOI22X1 U523 ( .A0(divider[6]), .A1(n371), .B0(divider[7]), .B1(n370), .Y(
        n369) );
  OAI221XL U524 ( .A0(n371), .A1(divider[6]), .B0(n370), .B1(divider[7]), .C0(
        n369), .Y(n380) );
  INVX1 U525 ( .A(dividend[0]), .Y(n374) );
  INVX1 U526 ( .A(dividend[1]), .Y(n373) );
  AOI22X1 U527 ( .A0(divider[0]), .A1(n374), .B0(divider[1]), .B1(n373), .Y(
        n372) );
  OAI221XL U528 ( .A0(n374), .A1(divider[0]), .B0(n373), .B1(divider[1]), .C0(
        n372), .Y(n379) );
  INVX1 U529 ( .A(dividend[2]), .Y(n377) );
  INVX1 U530 ( .A(dividend[3]), .Y(n376) );
  OAI221XL U532 ( .A0(n377), .A1(divider[2]), .B0(n376), .B1(divider[3]), .C0(
        n375), .Y(n378) );
  NOR4X1 U533 ( .A(n381), .B(n380), .C(n379), .D(n378), .Y(n399) );
  INVX1 U534 ( .A(dividend[12]), .Y(n384) );
  INVX1 U535 ( .A(dividend[13]), .Y(n383) );
  AOI22X1 U536 ( .A0(divider[12]), .A1(n384), .B0(divider[13]), .B1(n383), .Y(
        n382) );
  OAI221XL U537 ( .A0(n384), .A1(divider[12]), .B0(n383), .B1(divider[13]), 
        .C0(n382), .Y(n397) );
  INVX1 U539 ( .A(dividend[15]), .Y(n386) );
  AOI22X1 U540 ( .A0(divider[14]), .A1(n387), .B0(divider[15]), .B1(n386), .Y(
        n385) );
  OAI221XL U541 ( .A0(n387), .A1(divider[14]), .B0(n386), .B1(divider[15]), 
        .C0(n385), .Y(n396) );
  INVX1 U542 ( .A(dividend[8]), .Y(n390) );
  INVX1 U543 ( .A(dividend[9]), .Y(n389) );
  AOI22X1 U544 ( .A0(divider[8]), .A1(n390), .B0(divider[9]), .B1(n389), .Y(
        n388) );
  OAI221XL U545 ( .A0(n390), .A1(divider[8]), .B0(n389), .B1(divider[9]), .C0(
        n388), .Y(n395) );
  INVX1 U546 ( .A(dividend[10]), .Y(n393) );
  INVX1 U547 ( .A(dividend[11]), .Y(n392) );
  AOI22X1 U548 ( .A0(divider[10]), .A1(n393), .B0(divider[11]), .B1(n392), .Y(
        n391) );
  OAI221XL U549 ( .A0(n393), .A1(divider[10]), .B0(n392), .B1(divider[11]), 
        .C0(n391), .Y(n394) );
  NOR4X1 U550 ( .A(n397), .B(n396), .C(n395), .D(n394), .Y(n398) );
  sequ_div_DW_cmp_1 gt_x_24 ( .p_A(divider), .p_B(dividend), .TC(1'b0), 
        .GE_LT(1'b0), .GE_GT_EQ(1'b1), .GE_LT_GT_LE(N124), .EQ_NE() );
  sequ_div_DW01_sub_3 sub_x_2 ( .p_A(remainder_quotient[63:31]), .p_B({1'b0, 
        divider}), .CI(1'b0), .p_DIFF({N234, N233, N232, N231, N230, N229, 
        N228, N227, N226, N225, N224, N223, N222, N221, N220, N219, N218, N217, 
        N216, N215, N214, N213, N212, N211, N210, N209, N208, N207, N206, N205, 
        N204, N203, N202}), .CO() );
  SDFFRXL remainder_reg_31_ ( .D(n758), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n812), .QN() );
  SDFFRXL remainder_reg_30_ ( .D(n756), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n813), .QN() );
  SDFFRXL remainder_reg_29_ ( .D(n754), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n814), .QN() );
  SDFFRXL remainder_reg_28_ ( .D(n752), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n815), .QN() );
  SDFFRXL remainder_reg_27_ ( .D(n750), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n816), .QN() );
  SDFFRXL remainder_reg_26_ ( .D(n748), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n817), .QN() );
  SDFFRXL remainder_reg_25_ ( .D(n746), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n818), .QN() );
  SDFFRXL remainder_reg_24_ ( .D(n744), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n819), .QN() );
  SDFFRXL remainder_reg_23_ ( .D(n742), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n820), .QN() );
  SDFFRXL remainder_reg_22_ ( .D(n740), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n821), .QN() );
  SDFFRXL remainder_reg_21_ ( .D(n738), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n822), .QN() );
  SDFFRXL remainder_reg_20_ ( .D(n736), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n823), .QN() );
  SDFFRXL remainder_reg_19_ ( .D(n734), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n824), .QN() );
  SDFFRXL remainder_reg_18_ ( .D(n732), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n825), .QN() );
  SDFFRXL remainder_reg_17_ ( .D(n730), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n826), .QN() );
  SDFFRXL remainder_reg_16_ ( .D(n728), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n827), .QN() );
  SDFFRXL remainder_reg_15_ ( .D(n726), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n828), .QN() );
  SDFFRXL remainder_reg_14_ ( .D(n724), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n829), .QN() );
  SDFFRXL remainder_reg_13_ ( .D(n722), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n830), .QN() );
  SDFFRXL remainder_reg_12_ ( .D(n720), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n831), .QN() );
  SDFFRXL remainder_reg_11_ ( .D(n718), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n832), .QN() );
  SDFFRXL remainder_reg_10_ ( .D(n716), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n833), .QN() );
  SDFFRXL remainder_reg_9_ ( .D(n714), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n834), .QN() );
  SDFFRXL remainder_reg_8_ ( .D(n712), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n835), .QN() );
  SDFFRXL remainder_reg_7_ ( .D(n710), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n836), .QN() );
  SDFFRXL remainder_reg_6_ ( .D(n708), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n837), .QN() );
  SDFFRXL remainder_reg_5_ ( .D(n706), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n838), .QN() );
  SDFFRXL remainder_reg_4_ ( .D(n704), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n839), .QN() );
  SDFFRXL remainder_reg_3_ ( .D(n702), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n840), .QN() );
  SDFFRXL remainder_reg_2_ ( .D(n700), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n841), .QN() );
  SDFFRXL remainder_reg_1_ ( .D(n698), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n842), .QN() );
  SDFFRXL remainder_reg_0_ ( .D(n696), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n843), .QN() );
  SDFFRXL ready_reg ( .D(n694), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(rst_n), 
        .Q(n844), .QN() );
  SDFFRXL quotient_reg_31_ ( .D(n692), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n780), .QN() );
  SDFFRXL quotient_reg_30_ ( .D(n690), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n781), .QN() );
  SDFFRXL quotient_reg_29_ ( .D(n688), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n782), .QN() );
  SDFFRXL quotient_reg_28_ ( .D(n686), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n783), .QN() );
  SDFFRXL quotient_reg_27_ ( .D(n684), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n784), .QN() );
  SDFFRXL quotient_reg_26_ ( .D(n682), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n785), .QN() );
  SDFFRXL quotient_reg_25_ ( .D(n680), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n786), .QN() );
  SDFFRXL quotient_reg_24_ ( .D(n678), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n787), .QN() );
  SDFFRXL quotient_reg_23_ ( .D(n676), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n788), .QN() );
  SDFFRXL quotient_reg_22_ ( .D(n674), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n789), .QN() );
  SDFFRXL quotient_reg_21_ ( .D(n672), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n790), .QN() );
  SDFFRXL quotient_reg_20_ ( .D(n670), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n791), .QN() );
  SDFFRXL quotient_reg_19_ ( .D(n668), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n792), .QN() );
  SDFFRXL quotient_reg_18_ ( .D(n666), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n793), .QN() );
  SDFFRXL quotient_reg_17_ ( .D(n664), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n794), .QN() );
  SDFFRXL quotient_reg_16_ ( .D(n662), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n795), .QN() );
  SDFFRXL quotient_reg_15_ ( .D(n660), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n796), .QN() );
  SDFFRXL quotient_reg_14_ ( .D(n658), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n797), .QN() );
  SDFFRXL quotient_reg_13_ ( .D(n656), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n798), .QN() );
  SDFFRXL quotient_reg_12_ ( .D(n654), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n799), .QN() );
  SDFFRXL quotient_reg_11_ ( .D(n652), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n800), .QN() );
  SDFFRXL quotient_reg_10_ ( .D(n650), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n801), .QN() );
  SDFFRXL quotient_reg_9_ ( .D(n648), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n802), .QN() );
  SDFFRXL quotient_reg_8_ ( .D(n646), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n803), .QN() );
  SDFFRXL quotient_reg_7_ ( .D(n644), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n804), .QN() );
  SDFFRXL quotient_reg_6_ ( .D(n642), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n805), .QN() );
  SDFFRXL quotient_reg_5_ ( .D(n640), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n806), .QN() );
  SDFFRXL quotient_reg_4_ ( .D(n638), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n807), .QN() );
  SDFFRXL quotient_reg_3_ ( .D(n636), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n808), .QN() );
  SDFFRXL quotient_reg_2_ ( .D(n634), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n809), .QN() );
  SDFFRXL quotient_reg_1_ ( .D(n632), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n810), .QN() );
  SDFFRXL quotient_reg_0_ ( .D(n630), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n811), .QN() );
  SDFFRXL illegal_divider_zero_reg ( .D(n628), .SI(1'b0), .SE(1'b0), .CK(clk), 
        .RN(rst_n), .Q(n845), .QN() );
  SDFFRXL remainder_quotient_reg_63_ ( .D(n626), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(rst_n), .Q(remainder_quotient[63]), .QN() );
  SDFFRXL remainder_quotient_reg_62_ ( .D(n624), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(rst_n), .Q(remainder_quotient[62]), .QN() );
  SDFFRXL remainder_quotient_reg_61_ ( .D(n622), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(rst_n), .Q(remainder_quotient[61]), .QN() );
  SDFFRXL remainder_quotient_reg_60_ ( .D(n620), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(rst_n), .Q(remainder_quotient[60]), .QN() );
  SDFFRXL remainder_quotient_reg_59_ ( .D(n618), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(rst_n), .Q(remainder_quotient[59]), .QN() );
  SDFFRXL remainder_quotient_reg_58_ ( .D(n616), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(rst_n), .Q(remainder_quotient[58]), .QN() );
  SDFFRXL remainder_quotient_reg_30_ ( .D(n614), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(rst_n), .Q(remainder_quotient[30]), .QN() );
  SDFFRXL remainder_quotient_reg_29_ ( .D(n612), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(rst_n), .Q(remainder_quotient[29]), .QN() );
  SDFFRXL remainder_quotient_reg_28_ ( .D(n610), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(rst_n), .Q(remainder_quotient[28]), .QN() );
  SDFFRXL remainder_quotient_reg_27_ ( .D(n608), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(rst_n), .Q(remainder_quotient[27]), .QN() );
  SDFFRXL remainder_quotient_reg_26_ ( .D(n606), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(rst_n), .Q(remainder_quotient[26]), .QN() );
  SDFFRXL remainder_quotient_reg_25_ ( .D(n604), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(rst_n), .Q(remainder_quotient[25]), .QN() );
  SDFFRXL remainder_quotient_reg_24_ ( .D(n602), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(rst_n), .Q(remainder_quotient[24]), .QN() );
  SDFFRXL remainder_quotient_reg_23_ ( .D(n600), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(rst_n), .Q(remainder_quotient[23]), .QN() );
  SDFFRXL remainder_quotient_reg_22_ ( .D(n598), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(rst_n), .Q(remainder_quotient[22]), .QN() );
  SDFFRXL remainder_quotient_reg_21_ ( .D(n596), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(rst_n), .Q(remainder_quotient[21]), .QN() );
  SDFFRXL remainder_quotient_reg_20_ ( .D(n594), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(rst_n), .Q(remainder_quotient[20]), .QN() );
  SDFFRXL remainder_quotient_reg_19_ ( .D(n592), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(rst_n), .Q(remainder_quotient[19]), .QN() );
  SDFFRXL remainder_quotient_reg_18_ ( .D(n590), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(rst_n), .Q(remainder_quotient[18]), .QN() );
  SDFFRXL remainder_quotient_reg_17_ ( .D(n588), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(rst_n), .Q(remainder_quotient[17]), .QN() );
  SDFFRXL remainder_quotient_reg_16_ ( .D(n586), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(rst_n), .Q(remainder_quotient[16]), .QN() );
  SDFFRXL remainder_quotient_reg_15_ ( .D(n584), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(rst_n), .Q(remainder_quotient[15]), .QN() );
  SDFFRXL remainder_quotient_reg_14_ ( .D(n582), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(rst_n), .Q(remainder_quotient[14]), .QN() );
  SDFFRXL remainder_quotient_reg_13_ ( .D(n580), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(rst_n), .Q(remainder_quotient[13]), .QN() );
  SDFFRXL remainder_quotient_reg_12_ ( .D(n578), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(rst_n), .Q(remainder_quotient[12]), .QN() );
  SDFFRXL remainder_quotient_reg_11_ ( .D(n576), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(rst_n), .Q(remainder_quotient[11]), .QN() );
  SDFFRXL remainder_quotient_reg_10_ ( .D(n574), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(rst_n), .Q(remainder_quotient[10]), .QN() );
  SDFFRXL remainder_quotient_reg_9_ ( .D(n572), .SI(1'b0), .SE(1'b0), .CK(clk), 
        .RN(rst_n), .Q(remainder_quotient[9]), .QN() );
  SDFFRXL remainder_quotient_reg_8_ ( .D(n570), .SI(1'b0), .SE(1'b0), .CK(clk), 
        .RN(rst_n), .Q(remainder_quotient[8]), .QN() );
  SDFFRXL remainder_quotient_reg_7_ ( .D(n568), .SI(1'b0), .SE(1'b0), .CK(clk), 
        .RN(rst_n), .Q(remainder_quotient[7]), .QN() );
  SDFFRXL remainder_quotient_reg_6_ ( .D(n566), .SI(1'b0), .SE(1'b0), .CK(clk), 
        .RN(rst_n), .Q(remainder_quotient[6]), .QN() );
  SDFFRXL remainder_quotient_reg_5_ ( .D(n564), .SI(1'b0), .SE(1'b0), .CK(clk), 
        .RN(rst_n), .Q(remainder_quotient[5]), .QN() );
  SDFFRXL remainder_quotient_reg_4_ ( .D(n562), .SI(1'b0), .SE(1'b0), .CK(clk), 
        .RN(rst_n), .Q(remainder_quotient[4]), .QN() );
  SDFFRXL remainder_quotient_reg_3_ ( .D(n560), .SI(1'b0), .SE(1'b0), .CK(clk), 
        .RN(rst_n), .Q(remainder_quotient[3]), .QN() );
  SDFFRXL remainder_quotient_reg_2_ ( .D(n558), .SI(1'b0), .SE(1'b0), .CK(clk), 
        .RN(rst_n), .Q(remainder_quotient[2]), .QN() );
  SDFFRXL remainder_quotient_reg_1_ ( .D(n556), .SI(1'b0), .SE(1'b0), .CK(clk), 
        .RN(rst_n), .Q(remainder_quotient[1]), .QN() );
  SDFFRXL remainder_quotient_reg_0_ ( .D(n554), .SI(1'b0), .SE(1'b0), .CK(clk), 
        .RN(rst_n), .Q(remainder_quotient[0]), .QN() );
  SDFFRXL remainder_quotient_reg_57_ ( .D(n552), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(rst_n), .Q(remainder_quotient[57]), .QN() );
  SDFFRXL remainder_quotient_reg_56_ ( .D(n550), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(rst_n), .Q(remainder_quotient[56]), .QN() );
  SDFFRXL remainder_quotient_reg_55_ ( .D(n548), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(rst_n), .Q(remainder_quotient[55]), .QN() );
  SDFFRXL remainder_quotient_reg_54_ ( .D(n546), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(rst_n), .Q(remainder_quotient[54]), .QN() );
  SDFFRXL remainder_quotient_reg_53_ ( .D(n544), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(rst_n), .Q(remainder_quotient[53]), .QN() );
  SDFFRXL remainder_quotient_reg_52_ ( .D(n542), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(rst_n), .Q(remainder_quotient[52]), .QN() );
  SDFFRXL remainder_quotient_reg_51_ ( .D(n540), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(rst_n), .Q(remainder_quotient[51]), .QN() );
  SDFFRXL remainder_quotient_reg_50_ ( .D(n538), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(rst_n), .Q(remainder_quotient[50]), .QN() );
  SDFFRXL remainder_quotient_reg_49_ ( .D(n536), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(rst_n), .Q(remainder_quotient[49]), .QN() );
  SDFFRXL remainder_quotient_reg_48_ ( .D(n534), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(rst_n), .Q(remainder_quotient[48]), .QN() );
  SDFFRXL remainder_quotient_reg_47_ ( .D(n532), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(rst_n), .Q(remainder_quotient[47]), .QN() );
  SDFFRXL remainder_quotient_reg_46_ ( .D(n530), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(rst_n), .Q(remainder_quotient[46]), .QN() );
  SDFFRXL remainder_quotient_reg_45_ ( .D(n528), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(rst_n), .Q(remainder_quotient[45]), .QN() );
  SDFFRXL remainder_quotient_reg_44_ ( .D(n526), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(rst_n), .Q(remainder_quotient[44]), .QN() );
  SDFFRXL remainder_quotient_reg_43_ ( .D(n524), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(rst_n), .Q(remainder_quotient[43]), .QN() );
  SDFFRXL remainder_quotient_reg_42_ ( .D(n522), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(rst_n), .Q(remainder_quotient[42]), .QN() );
  SDFFRXL remainder_quotient_reg_41_ ( .D(n520), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(rst_n), .Q(remainder_quotient[41]), .QN() );
  SDFFRXL remainder_quotient_reg_40_ ( .D(n518), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(rst_n), .Q(remainder_quotient[40]), .QN() );
  SDFFRXL remainder_quotient_reg_39_ ( .D(n516), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(rst_n), .Q(remainder_quotient[39]), .QN() );
  SDFFRXL remainder_quotient_reg_38_ ( .D(n514), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(rst_n), .Q(remainder_quotient[38]), .QN() );
  SDFFRXL remainder_quotient_reg_37_ ( .D(n512), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(rst_n), .Q(remainder_quotient[37]), .QN() );
  SDFFRXL remainder_quotient_reg_36_ ( .D(n510), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(rst_n), .Q(remainder_quotient[36]), .QN() );
  SDFFRXL remainder_quotient_reg_35_ ( .D(n508), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(rst_n), .Q(remainder_quotient[35]), .QN() );
  SDFFRXL remainder_quotient_reg_34_ ( .D(n506), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(rst_n), .Q(remainder_quotient[34]), .QN() );
  SDFFRXL remainder_quotient_reg_33_ ( .D(n504), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(rst_n), .Q(remainder_quotient[33]), .QN() );
  SDFFRXL remainder_quotient_reg_32_ ( .D(n502), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(rst_n), .Q(remainder_quotient[32]), .QN() );
  SDFFRXL remainder_quotient_reg_31_ ( .D(n500), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(rst_n), .Q(remainder_quotient[31]), .QN() );
  SDFFRX1 cur_state_reg_5_ ( .D(next_state[5]), .SI(1'b0), .SE(1'b0), .CK(clk), 
        .RN(rst_n), .Q(cur_state[5]), .QN(N72) );
  SDFFRX1 cur_state_reg_6_ ( .D(next_state[6]), .SI(1'b0), .SE(1'b0), .CK(clk), 
        .RN(rst_n), .Q(cur_state[6]), .QN(N82) );
  SDFFRX1 cur_state_reg_4_ ( .D(next_state[4]), .SI(1'b0), .SE(1'b0), .CK(clk), 
        .RN(rst_n), .Q(cur_state[4]), .QN(N62) );
  SDFFRX1 cur_state_reg_3_ ( .D(next_state[3]), .SI(1'b0), .SE(1'b0), .CK(clk), 
        .RN(rst_n), .Q(cur_state[3]), .QN(N52) );
  SDFFRX1 cur_state_reg_2_ ( .D(n777), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(cur_state[2]), .QN(N42) );
  SDFFRX1 cur_state_reg_1_ ( .D(next_state[1]), .SI(1'b0), .SE(1'b0), .CK(clk), 
        .RN(rst_n), .Q(cur_state[1]), .QN(N32) );
  SDFFRX1 cur_state_reg_7_ ( .D(next_state[7]), .SI(1'b0), .SE(1'b0), .CK(clk), 
        .RN(rst_n), .Q(cur_state[7]), .QN(N92) );
  SDFFRX1 shift_count_reg_4_ ( .D(n418), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(shift_count[4]), .QN() );
  SDFFRX1 shift_count_reg_3_ ( .D(n416), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(shift_count[3]), .QN() );
  SDFFRX1 shift_count_reg_2_ ( .D(n414), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(shift_count[2]), .QN() );
  SDFFRX1 shift_count_reg_1_ ( .D(n412), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(shift_count[1]), .QN() );
  SDFFRX1 shift_count_reg_0_ ( .D(n410), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(shift_count[0]), .QN(N269) );
  SDFFSX1 cur_state_reg_0_ ( .D(next_state[0]), .SI(1'b0), .SE(1'b0), .CK(clk), 
        .SN(rst_n), .Q(cur_state[0]), .QN(N22) );
  SDFFRXL illegal_reg ( .D(n407), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(rst_n), 
        .Q(illegal), .QN() );
  SDFFRXL cur_state_reg_8_ ( .D(next_state[8]), .SI(1'b0), .SE(1'b0), .CK(clk), 
        .RN(rst_n), .Q(cur_state[8]), .QN(N102) );
  OR2XL C1898 ( .A(divider[30]), .B(divider[31]), .Y(N488) );
  OR2XL C1899 ( .A(divider[29]), .B(N488), .Y(N489) );
  OR2XL C1900 ( .A(divider[28]), .B(N489), .Y(N490) );
  OR2XL C1901 ( .A(divider[27]), .B(N490), .Y(N491) );
  OR2XL C1902 ( .A(divider[26]), .B(N491), .Y(N492) );
  OR2XL C1903 ( .A(divider[25]), .B(N492), .Y(N493) );
  OR2XL C1904 ( .A(divider[24]), .B(N493), .Y(N494) );
  OR2XL C1905 ( .A(divider[23]), .B(N494), .Y(N495) );
  OR2XL C1906 ( .A(divider[22]), .B(N495), .Y(N496) );
  OR2XL C1907 ( .A(divider[21]), .B(N496), .Y(N497) );
  OR2XL C1908 ( .A(divider[20]), .B(N497), .Y(N498) );
  OR2XL C1909 ( .A(divider[19]), .B(N498), .Y(N499) );
  OR2XL C1910 ( .A(divider[18]), .B(N499), .Y(N500) );
  OR2XL C1911 ( .A(divider[17]), .B(N500), .Y(N501) );
  OR2XL C1912 ( .A(divider[16]), .B(N501), .Y(N502) );
  OR2XL C1913 ( .A(divider[15]), .B(N502), .Y(N503) );
  OR2XL C1914 ( .A(divider[14]), .B(N503), .Y(N504) );
  OR2XL C1915 ( .A(divider[13]), .B(N504), .Y(N505) );
  OR2XL C1916 ( .A(divider[12]), .B(N505), .Y(N506) );
  OR2XL C1917 ( .A(divider[11]), .B(N506), .Y(N507) );
  OR2XL C1918 ( .A(divider[10]), .B(N507), .Y(N508) );
  OR2XL C1953 ( .A(dividend[7]), .B(N542), .Y(N543) );
  OR2XL C1954 ( .A(dividend[6]), .B(N543), .Y(N544) );
  OR2XL C1955 ( .A(dividend[5]), .B(N544), .Y(N545) );
  OR2X2 C212 ( .A(cur_state[2]), .B(N32), .Y(N131) );
  OR2X2 C210 ( .A(cur_state[6]), .B(cur_state[5]), .Y(N129) );
  OR2X2 C273 ( .A(cur_state[6]), .B(cur_state[5]), .Y(N185) );
  OR2X2 C274 ( .A(cur_state[4]), .B(cur_state[3]), .Y(N186) );
  OR2XL C213 ( .A(N73), .B(N129), .Y(N132) );
  OR2XL C1956 ( .A(dividend[4]), .B(N545), .Y(N546) );
  OR2X1 C222 ( .A(N73), .B(N185), .Y(N140) );
  OR2XL C214 ( .A(N130), .B(N131), .Y(N133) );
  OR2X1 C223 ( .A(N186), .B(N139), .Y(N141) );
  OR2X1 C230 ( .A(cur_state[2]), .B(cur_state[1]), .Y(N147) );
  OR2X1 C231 ( .A(N168), .B(N145), .Y(N148) );
  OR2X2 C232 ( .A(N146), .B(N147), .Y(N149) );
  OR2XL C246 ( .A(cur_state[6]), .B(N72), .Y(N161) );
  OR2X1 C238 ( .A(N62), .B(cur_state[3]), .Y(N154) );
  OR2X1 C248 ( .A(cur_state[2]), .B(cur_state[1]), .Y(N163) );
  OR2X1 C239 ( .A(cur_state[2]), .B(cur_state[1]), .Y(N155) );
  OR2XL C237 ( .A(cur_state[6]), .B(cur_state[5]), .Y(N153) );
  OR2XL C247 ( .A(cur_state[4]), .B(cur_state[3]), .Y(N162) );
  OR2X1 C2200 ( .A(n768), .B(n770), .Y(N192) );
  OR2XL C1958 ( .A(dividend[2]), .B(N547), .Y(N548) );
  OR2XL C240 ( .A(N152), .B(N153), .Y(N156) );
  OR2XL C241 ( .A(N154), .B(N155), .Y(N157) );
  OR2XL C249 ( .A(N160), .B(N161), .Y(N164) );
  OR2XL C250 ( .A(N162), .B(N163), .Y(N165) );
  INVXL I_1 ( .A(divider[0]), .Y(N487) );
  OR2XL C2201 ( .A(n767), .B(N192), .Y(N193) );
  OR2XL C1959 ( .A(dividend[1]), .B(N548), .Y(N549) );
  OR2XL C255 ( .A(N82), .B(cur_state[5]), .Y(N169) );
  OR2X2 C263 ( .A(cur_state[8]), .B(N92), .Y(N176) );
  OR2XL C265 ( .A(cur_state[4]), .B(cur_state[3]), .Y(N178) );
  OR2X1 C257 ( .A(cur_state[2]), .B(cur_state[1]), .Y(N171) );
  OR2XL C256 ( .A(cur_state[4]), .B(cur_state[3]), .Y(N170) );
  OR2X1 C264 ( .A(cur_state[6]), .B(cur_state[5]), .Y(N177) );
  OR2X1 C2202 ( .A(n497), .B(N193), .Y(N194) );
  OR2XL C258 ( .A(N168), .B(N169), .Y(N172) );
  OR2XL C259 ( .A(N170), .B(N171), .Y(N173) );
  OR2XL C267 ( .A(N176), .B(N177), .Y(N180) );
  OR2XL C2203 ( .A(N167), .B(N194), .Y(N195) );
  OR2X2 C269 ( .A(N180), .B(N181), .Y(N182) );
  OR2X2 C275 ( .A(cur_state[2]), .B(cur_state[1]), .Y(N187) );
  OR2X1 C2204 ( .A(n766), .B(N195), .Y(N196) );
  OR2XL C276 ( .A(N184), .B(N185), .Y(N188) );
  OR2XL C277 ( .A(N186), .B(N187), .Y(N189) );
  INVX1 I_7 ( .A(N234), .Y(N236) );
  OR2XL C2205 ( .A(N183), .B(N196), .Y(N197) );
  MX2X1 U384 ( .A(remainder_quotient[31]), .B(N306), .S0(n494), .Y(n500) );
  MX2X1 U353 ( .A(remainder_quotient[0]), .B(N275), .S0(n494), .Y(n554) );
  MX2X1 U354 ( .A(remainder_quotient[1]), .B(N276), .S0(n494), .Y(n556) );
  MX2X1 U355 ( .A(remainder_quotient[2]), .B(N277), .S0(n494), .Y(n558) );
  MX2X1 U356 ( .A(remainder_quotient[3]), .B(N278), .S0(n494), .Y(n560) );
  MX2X1 U357 ( .A(remainder_quotient[4]), .B(N279), .S0(n494), .Y(n562) );
  MX2X1 U358 ( .A(remainder_quotient[5]), .B(N280), .S0(n494), .Y(n564) );
  MX2X1 U360 ( .A(remainder_quotient[7]), .B(N282), .S0(n494), .Y(n568) );
  MX2X1 U361 ( .A(remainder_quotient[8]), .B(N283), .S0(n494), .Y(n570) );
  MX2X1 U362 ( .A(remainder_quotient[9]), .B(N284), .S0(n494), .Y(n572) );
  MX2X1 U363 ( .A(remainder_quotient[10]), .B(N285), .S0(n494), .Y(n574) );
  MX2X1 U364 ( .A(remainder_quotient[11]), .B(N286), .S0(n494), .Y(n576) );
  MX2X1 U365 ( .A(remainder_quotient[12]), .B(N287), .S0(n494), .Y(n578) );
  MX2X1 U366 ( .A(remainder_quotient[13]), .B(N288), .S0(n494), .Y(n580) );
  MX2X1 U368 ( .A(remainder_quotient[15]), .B(N290), .S0(n494), .Y(n584) );
  MX2X1 U369 ( .A(remainder_quotient[16]), .B(N291), .S0(n494), .Y(n586) );
  MX2X1 U370 ( .A(remainder_quotient[17]), .B(N292), .S0(n494), .Y(n588) );
  MX2X1 U371 ( .A(remainder_quotient[18]), .B(N293), .S0(n494), .Y(n590) );
  MX2X1 U372 ( .A(remainder_quotient[19]), .B(N294), .S0(n494), .Y(n592) );
  MX2X1 U373 ( .A(remainder_quotient[20]), .B(N295), .S0(n494), .Y(n594) );
  MX2X1 U375 ( .A(remainder_quotient[22]), .B(N297), .S0(n494), .Y(n598) );
  MX2X1 U376 ( .A(remainder_quotient[23]), .B(N298), .S0(n494), .Y(n600) );
  MX2X1 U377 ( .A(remainder_quotient[24]), .B(N299), .S0(n494), .Y(n602) );
  MX2X1 U378 ( .A(remainder_quotient[25]), .B(N300), .S0(n494), .Y(n604) );
  MX2X1 U379 ( .A(remainder_quotient[26]), .B(N301), .S0(n494), .Y(n606) );
  MX2X1 U380 ( .A(remainder_quotient[27]), .B(N302), .S0(n494), .Y(n608) );
  MX2X1 U381 ( .A(remainder_quotient[28]), .B(N303), .S0(n494), .Y(n610) );
  MX2X1 U383 ( .A(remainder_quotient[30]), .B(N305), .S0(n494), .Y(n614) );
  MX2X1 U385 ( .A(n811), .B(N450), .S0(n405), .Y(n630) );
  MX2X1 U386 ( .A(n810), .B(N451), .S0(n405), .Y(n632) );
  MX2X1 U387 ( .A(n809), .B(N452), .S0(n405), .Y(n634) );
  MX2X1 U388 ( .A(n808), .B(N453), .S0(n405), .Y(n636) );
  MX2X1 U389 ( .A(n807), .B(N454), .S0(n405), .Y(n638) );
  MX2X1 U390 ( .A(n806), .B(N455), .S0(n405), .Y(n640) );
  MX2X1 U392 ( .A(n804), .B(N457), .S0(n405), .Y(n644) );
  MX2X1 U393 ( .A(n803), .B(N458), .S0(n405), .Y(n646) );
  MX2X1 U394 ( .A(n802), .B(N459), .S0(n405), .Y(n648) );
  MX2X1 U395 ( .A(n801), .B(N460), .S0(n405), .Y(n650) );
  MX2X1 U396 ( .A(n800), .B(N461), .S0(n405), .Y(n652) );
  MX2X1 U397 ( .A(n799), .B(N462), .S0(n405), .Y(n654) );
  MX2X1 U399 ( .A(n797), .B(N464), .S0(n405), .Y(n658) );
  MX2X1 U400 ( .A(n796), .B(N465), .S0(n405), .Y(n660) );
  MX2X1 U401 ( .A(n795), .B(N466), .S0(n405), .Y(n662) );
  MX2X1 U402 ( .A(n794), .B(N467), .S0(n405), .Y(n664) );
  MX2X1 U403 ( .A(n793), .B(N468), .S0(n405), .Y(n666) );
  MX2X1 U404 ( .A(n792), .B(N469), .S0(n405), .Y(n668) );
  MX2X1 U405 ( .A(n791), .B(N470), .S0(n405), .Y(n670) );
  MX2X1 U407 ( .A(n789), .B(N472), .S0(n405), .Y(n674) );
  MX2X1 U408 ( .A(n788), .B(N473), .S0(n405), .Y(n676) );
  MX2X1 U409 ( .A(n787), .B(N474), .S0(n405), .Y(n678) );
  MX2X1 U410 ( .A(n786), .B(N475), .S0(n405), .Y(n680) );
  MX2X1 U411 ( .A(n785), .B(N476), .S0(n405), .Y(n682) );
  MX2X1 U412 ( .A(n784), .B(N477), .S0(n405), .Y(n684) );
  MX2X1 U414 ( .A(n782), .B(N479), .S0(n405), .Y(n688) );
  MX2X1 U415 ( .A(n781), .B(N480), .S0(n405), .Y(n690) );
  MX2X1 U416 ( .A(n780), .B(N481), .S0(n405), .Y(n692) );
  MX2X1 U449 ( .A(n843), .B(N417), .S0(n405), .Y(n696) );
  MX2X1 U450 ( .A(n842), .B(N418), .S0(n405), .Y(n698) );
  MX2X1 U451 ( .A(n841), .B(N419), .S0(n405), .Y(n700) );
  MX2X1 U453 ( .A(n839), .B(N421), .S0(n405), .Y(n704) );
  MX2X1 U454 ( .A(n838), .B(N422), .S0(n405), .Y(n706) );
  MX2X1 U455 ( .A(n837), .B(N423), .S0(n405), .Y(n708) );
  MX2X1 U456 ( .A(n836), .B(N424), .S0(n405), .Y(n710) );
  MX2X1 U457 ( .A(n835), .B(N425), .S0(n405), .Y(n712) );
  MX2X1 U458 ( .A(n834), .B(N426), .S0(n405), .Y(n714) );
  MX2X1 U460 ( .A(n832), .B(N428), .S0(n405), .Y(n718) );
  MX2X1 U461 ( .A(n831), .B(N429), .S0(n405), .Y(n720) );
  MX2X1 U462 ( .A(n830), .B(N430), .S0(n405), .Y(n722) );
  MX2X1 U463 ( .A(n829), .B(N431), .S0(n405), .Y(n724) );
  MX2X1 U464 ( .A(n828), .B(N432), .S0(n405), .Y(n726) );
  MX2X1 U465 ( .A(n827), .B(N433), .S0(n405), .Y(n728) );
  MX2X1 U466 ( .A(n826), .B(N434), .S0(n405), .Y(n730) );
  MX2X1 U468 ( .A(n824), .B(N436), .S0(n405), .Y(n734) );
  MX2X1 U469 ( .A(n823), .B(N437), .S0(n405), .Y(n736) );
  MX2X1 U470 ( .A(n822), .B(N438), .S0(n405), .Y(n738) );
  MX2X1 U471 ( .A(n821), .B(N439), .S0(n405), .Y(n740) );
  MX2X1 U472 ( .A(n820), .B(N440), .S0(n405), .Y(n742) );
  MX2X1 U473 ( .A(n819), .B(N441), .S0(n405), .Y(n744) );
  MX2X1 U475 ( .A(n817), .B(N443), .S0(n405), .Y(n748) );
  MX2X1 U476 ( .A(n816), .B(N444), .S0(n405), .Y(n750) );
  MX2X1 U477 ( .A(n815), .B(N445), .S0(n405), .Y(n752) );
  MX2X1 U478 ( .A(n814), .B(N446), .S0(n405), .Y(n754) );
  MX2X1 U479 ( .A(n813), .B(N447), .S0(n405), .Y(n756) );
  MX2X1 U480 ( .A(n812), .B(N448), .S0(n405), .Y(n758) );
  MX2X1 U481 ( .A(n845), .B(N412), .S0(n405), .Y(n628) );
  MX2X1 U420 ( .A(remainder_quotient[35]), .B(N310), .S0(n494), .Y(n508) );
  MX2X1 U417 ( .A(remainder_quotient[32]), .B(N307), .S0(n494), .Y(n502) );
  MX2X1 U418 ( .A(remainder_quotient[33]), .B(N308), .S0(n494), .Y(n504) );
  MX2X1 U421 ( .A(remainder_quotient[36]), .B(N311), .S0(n494), .Y(n510) );
  MX2X1 U422 ( .A(remainder_quotient[37]), .B(N312), .S0(n494), .Y(n512) );
  MX2X1 U423 ( .A(remainder_quotient[38]), .B(N313), .S0(n494), .Y(n514) );
  MX2X1 U424 ( .A(remainder_quotient[39]), .B(N314), .S0(n494), .Y(n516) );
  MX2X1 U426 ( .A(remainder_quotient[41]), .B(N316), .S0(n494), .Y(n520) );
  MX2X1 U430 ( .A(remainder_quotient[45]), .B(N320), .S0(n494), .Y(n528) );
  MX2X1 U431 ( .A(remainder_quotient[46]), .B(N321), .S0(n494), .Y(n530) );
  MX2X1 U432 ( .A(remainder_quotient[47]), .B(N322), .S0(n494), .Y(n532) );
  MX2X1 U433 ( .A(remainder_quotient[48]), .B(N323), .S0(n494), .Y(n534) );
  MX2X1 U435 ( .A(remainder_quotient[50]), .B(N325), .S0(n494), .Y(n538) );
  MX2X1 U436 ( .A(remainder_quotient[51]), .B(N326), .S0(n494), .Y(n540) );
  MX2X1 U438 ( .A(remainder_quotient[53]), .B(N328), .S0(n494), .Y(n544) );
  MX2X1 U440 ( .A(remainder_quotient[55]), .B(N330), .S0(n494), .Y(n548) );
  MX2X1 U444 ( .A(remainder_quotient[59]), .B(N334), .S0(n494), .Y(n618) );
  MX2X1 U446 ( .A(remainder_quotient[61]), .B(N336), .S0(n494), .Y(n622) );
  MX2X1 U425 ( .A(remainder_quotient[40]), .B(N315), .S0(n494), .Y(n518) );
  MX2X1 U428 ( .A(remainder_quotient[43]), .B(N318), .S0(n494), .Y(n524) );
  MX2X1 U437 ( .A(remainder_quotient[52]), .B(N327), .S0(n494), .Y(n542) );
  MX2X1 U439 ( .A(remainder_quotient[54]), .B(N329), .S0(n494), .Y(n546) );
  MX2X1 U441 ( .A(remainder_quotient[56]), .B(N331), .S0(n494), .Y(n550) );
  MX2X1 U443 ( .A(remainder_quotient[58]), .B(N333), .S0(n494), .Y(n616) );
  MX2X1 U445 ( .A(remainder_quotient[60]), .B(N335), .S0(n494), .Y(n620) );
  MX2X1 U447 ( .A(remainder_quotient[62]), .B(N337), .S0(n494), .Y(n624) );
  MX2X2 U429 ( .A(remainder_quotient[44]), .B(N319), .S0(n494), .Y(n526) );
  OR2XL C1919 ( .A(divider[9]), .B(N508), .Y(N509) );
  OR2XL C1920 ( .A(divider[8]), .B(N509), .Y(N510) );
  OR2XL C1921 ( .A(divider[7]), .B(N510), .Y(N511) );
  OR2X2 C1922 ( .A(divider[6]), .B(N511), .Y(N512) );
  INVX4 U554 ( .A(N182), .Y(N183) );
  NOR2X1 U555 ( .A(dividend[0]), .B(N549), .Y(n495) );
  NOR2X1 U556 ( .A(N148), .B(N149), .Y(n767) );
  NOR2X1 U557 ( .A(N140), .B(N141), .Y(n768) );
  NAND4X1 U558 ( .A(n401), .B(n400), .C(n399), .D(n398), .Y(n496) );
  OR2XL U559 ( .A(dividend[30]), .B(dividend[31]), .Y(N520) );
  OR2XL U560 ( .A(dividend[29]), .B(N520), .Y(N521) );
  OR2XL U561 ( .A(dividend[28]), .B(N521), .Y(N522) );
  OR2XL U562 ( .A(dividend[27]), .B(N522), .Y(N523) );
  OR2XL U563 ( .A(dividend[26]), .B(N523), .Y(N524) );
  OR2XL U564 ( .A(dividend[25]), .B(N524), .Y(N525) );
  OR2XL U565 ( .A(dividend[24]), .B(N525), .Y(N526) );
  OR2XL U566 ( .A(dividend[23]), .B(N526), .Y(N527) );
  OR2XL U567 ( .A(dividend[22]), .B(N527), .Y(N528) );
  OR2XL U568 ( .A(dividend[21]), .B(N528), .Y(N529) );
  OR2XL U569 ( .A(dividend[20]), .B(N529), .Y(N530) );
  OR2XL U570 ( .A(dividend[19]), .B(N530), .Y(N531) );
  OR2XL U571 ( .A(dividend[18]), .B(N531), .Y(N532) );
  OR2XL U572 ( .A(dividend[17]), .B(N532), .Y(N533) );
  OR2XL U573 ( .A(dividend[16]), .B(N533), .Y(N534) );
  OR2XL U574 ( .A(dividend[15]), .B(N534), .Y(N535) );
  OR2XL U575 ( .A(dividend[14]), .B(N535), .Y(N536) );
  OR2XL U576 ( .A(dividend[13]), .B(N536), .Y(N537) );
  OR2XL U577 ( .A(dividend[12]), .B(N537), .Y(N538) );
  OR2XL U578 ( .A(dividend[11]), .B(N538), .Y(N539) );
  OR2XL U579 ( .A(dividend[10]), .B(N539), .Y(N540) );
  OR2XL U580 ( .A(dividend[9]), .B(N540), .Y(N541) );
  OR2XL U581 ( .A(dividend[8]), .B(N541), .Y(N542) );
  OR2XL U582 ( .A(cur_state[4]), .B(cur_state[3]), .Y(N130) );
  OR2XL U583 ( .A(cur_state[2]), .B(cur_state[1]), .Y(N179) );
  OR2XL U584 ( .A(dividend[3]), .B(N546), .Y(N547) );
  AOI22XL U585 ( .A0(divider[2]), .A1(n377), .B0(divider[3]), .B1(n376), .Y(
        n375) );
  AOI22XL U586 ( .A0(divider[30]), .A1(n355), .B0(divider[31]), .B1(n354), .Y(
        n353) );
  AOI22XL U587 ( .A0(divider[20]), .A1(n336), .B0(divider[21]), .B1(n335), .Y(
        n334) );
  OR2XL U588 ( .A(N42), .B(cur_state[1]), .Y(N139) );
  OR2XL U589 ( .A(N178), .B(N179), .Y(N181) );
  OR2XL U590 ( .A(divider[2]), .B(N515), .Y(N516) );
  NOR2XL U591 ( .A(N156), .B(N157), .Y(n497) );
  AOI21XL U592 ( .A0(n768), .A1(n763), .B0(n770), .Y(n157) );
  OR2XL U593 ( .A(divider[1]), .B(N516), .Y(N517) );
  AOI22XL U594 ( .A0(n163), .A1(N214), .B0(n164), .B1(remainder_quotient[43]), 
        .Y(n183) );
  OR2XL U595 ( .A(N164), .B(N165), .Y(N166) );
  INVXL U596 ( .A(dividend[14]), .Y(n387) );
  INVXL U597 ( .A(dividend[26]), .Y(n361) );
  NOR2XL U598 ( .A(cur_state[0]), .B(n157), .Y(N415) );
  AOI22XL U599 ( .A0(n763), .A1(n776), .B0(n764), .B1(n774), .Y(n148) );
  NOR2XL U600 ( .A(N487), .B(N517), .Y(n764) );
  OAI211XL U601 ( .A0(n374), .A1(n197), .B0(N166), .C0(n196), .Y(N275) );
  OAI2BB2XL U602 ( .B0(n386), .B1(n197), .A0N(N183), .A1N(
        remainder_quotient[14]), .Y(N290) );
  OAI2BB2XL U603 ( .B0(n355), .B1(n197), .A0N(N183), .A1N(
        remainder_quotient[29]), .Y(N305) );
  AND2XL U604 ( .A(remainder_quotient[6]), .B(N413), .Y(N456) );
  AND2XL U605 ( .A(remainder_quotient[21]), .B(N413), .Y(N471) );
  AND2XL U606 ( .A(remainder_quotient[35]), .B(N413), .Y(N420) );
  AND2XL U607 ( .A(remainder_quotient[50]), .B(N413), .Y(N435) );
  MX2XL U608 ( .A(illegal), .B(n768), .S0(N415), .Y(n407) );
  MX2XL U609 ( .A(shift_count[1]), .B(N342), .S0(N416), .Y(n412) );
  NOR2BXL U610 ( .AN(n776), .B(n763), .Y(next_state[3]) );
  MX2XL U611 ( .A(remainder_quotient[34]), .B(N309), .S0(n494), .Y(n506) );
  MX2XL U612 ( .A(remainder_quotient[42]), .B(N317), .S0(n494), .Y(n522) );
  MX2XL U613 ( .A(remainder_quotient[49]), .B(N324), .S0(n494), .Y(n536) );
  MX2XL U614 ( .A(remainder_quotient[57]), .B(N332), .S0(n494), .Y(n552) );
  MX2XL U615 ( .A(remainder_quotient[6]), .B(N281), .S0(n494), .Y(n566) );
  MX2XL U616 ( .A(remainder_quotient[14]), .B(N289), .S0(n494), .Y(n582) );
  MX2XL U617 ( .A(remainder_quotient[21]), .B(N296), .S0(n494), .Y(n596) );
  MX2XL U618 ( .A(remainder_quotient[29]), .B(N304), .S0(n494), .Y(n612) );
  MX2XL U619 ( .A(remainder_quotient[63]), .B(N338), .S0(n494), .Y(n626) );
  MX2XL U620 ( .A(n805), .B(N456), .S0(n405), .Y(n642) );
  MX2XL U621 ( .A(n798), .B(N463), .S0(n405), .Y(n656) );
  MX2XL U622 ( .A(n790), .B(N471), .S0(n405), .Y(n672) );
  MX2XL U623 ( .A(n783), .B(N478), .S0(n405), .Y(n686) );
  MX2XL U624 ( .A(n840), .B(N420), .S0(n405), .Y(n702) );
  MX2XL U625 ( .A(n833), .B(N427), .S0(n405), .Y(n716) );
  MX2XL U626 ( .A(n825), .B(N435), .S0(n405), .Y(n732) );
  MX2XL U627 ( .A(n818), .B(N442), .S0(n405), .Y(n746) );
  NOR3XL U628 ( .A(cur_state[0]), .B(n765), .C(n769), .Y(n404) );
  INVXL U629 ( .A(N414), .Y(n493) );
  INVX8 U630 ( .A(n493), .Y(n494) );
  INVX2 U631 ( .A(n766), .Y(n161) );
  NOR2XL U632 ( .A(N172), .B(N173), .Y(n766) );
  NOR2X2 U633 ( .A(N236), .B(N182), .Y(n164) );
  NOR2X2 U634 ( .A(n770), .B(n497), .Y(n197) );
  NOR2XL U635 ( .A(N132), .B(N133), .Y(n770) );
  INVX2 U636 ( .A(n196), .Y(n163) );
  NAND2XL U637 ( .A(N183), .B(N236), .Y(n196) );
  INVX8 U638 ( .A(n404), .Y(n405) );
  NOR2BX4 U639 ( .AN(n765), .B(cur_state[0]), .Y(N413) );
  NOR2XL U640 ( .A(N188), .B(N189), .Y(n765) );
  CLKBUFX3 U656 ( .A(n845), .Y(illegal_divider_zero) );
  CLKBUFX3 U657 ( .A(n844), .Y(ready) );
  CLKBUFX3 U658 ( .A(n843), .Y(remainder[0]) );
  CLKBUFX3 U659 ( .A(n842), .Y(remainder[1]) );
  CLKBUFX3 U660 ( .A(n841), .Y(remainder[2]) );
  CLKBUFX3 U661 ( .A(n840), .Y(remainder[3]) );
  CLKBUFX3 U662 ( .A(n839), .Y(remainder[4]) );
  CLKBUFX3 U663 ( .A(n838), .Y(remainder[5]) );
  CLKBUFX3 U664 ( .A(n837), .Y(remainder[6]) );
  CLKBUFX3 U665 ( .A(n836), .Y(remainder[7]) );
  CLKBUFX3 U666 ( .A(n835), .Y(remainder[8]) );
  CLKBUFX3 U667 ( .A(n834), .Y(remainder[9]) );
  CLKBUFX3 U668 ( .A(n833), .Y(remainder[10]) );
  CLKBUFX3 U669 ( .A(n832), .Y(remainder[11]) );
  CLKBUFX3 U670 ( .A(n831), .Y(remainder[12]) );
  CLKBUFX3 U671 ( .A(n830), .Y(remainder[13]) );
  CLKBUFX3 U672 ( .A(n829), .Y(remainder[14]) );
  CLKBUFX3 U673 ( .A(n828), .Y(remainder[15]) );
  CLKBUFX3 U674 ( .A(n827), .Y(remainder[16]) );
  CLKBUFX3 U675 ( .A(n826), .Y(remainder[17]) );
  CLKBUFX3 U676 ( .A(n825), .Y(remainder[18]) );
  CLKBUFX3 U677 ( .A(n824), .Y(remainder[19]) );
  CLKBUFX3 U678 ( .A(n823), .Y(remainder[20]) );
  CLKBUFX3 U679 ( .A(n822), .Y(remainder[21]) );
  CLKBUFX3 U680 ( .A(n821), .Y(remainder[22]) );
  CLKBUFX3 U681 ( .A(n820), .Y(remainder[23]) );
  CLKBUFX3 U682 ( .A(n819), .Y(remainder[24]) );
  CLKBUFX3 U683 ( .A(n818), .Y(remainder[25]) );
  CLKBUFX3 U684 ( .A(n817), .Y(remainder[26]) );
  CLKBUFX3 U685 ( .A(n816), .Y(remainder[27]) );
  CLKBUFX3 U686 ( .A(n815), .Y(remainder[28]) );
  CLKBUFX3 U687 ( .A(n814), .Y(remainder[29]) );
  CLKBUFX3 U688 ( .A(n813), .Y(remainder[30]) );
  CLKBUFX3 U689 ( .A(n812), .Y(remainder[31]) );
  CLKBUFX3 U690 ( .A(n811), .Y(quotient[0]) );
  CLKBUFX3 U691 ( .A(n810), .Y(quotient[1]) );
  CLKBUFX3 U692 ( .A(n809), .Y(quotient[2]) );
  CLKBUFX3 U693 ( .A(n808), .Y(quotient[3]) );
  CLKBUFX3 U694 ( .A(n807), .Y(quotient[4]) );
  CLKBUFX3 U695 ( .A(n806), .Y(quotient[5]) );
  CLKBUFX3 U696 ( .A(n805), .Y(quotient[6]) );
  CLKBUFX3 U697 ( .A(n804), .Y(quotient[7]) );
  CLKBUFX3 U698 ( .A(n803), .Y(quotient[8]) );
  CLKBUFX3 U699 ( .A(n802), .Y(quotient[9]) );
  CLKBUFX3 U700 ( .A(n801), .Y(quotient[10]) );
  CLKBUFX3 U701 ( .A(n800), .Y(quotient[11]) );
  CLKBUFX3 U702 ( .A(n799), .Y(quotient[12]) );
  CLKBUFX3 U703 ( .A(n798), .Y(quotient[13]) );
  CLKBUFX3 U704 ( .A(n797), .Y(quotient[14]) );
  CLKBUFX3 U705 ( .A(n796), .Y(quotient[15]) );
  CLKBUFX3 U706 ( .A(n795), .Y(quotient[16]) );
  CLKBUFX3 U707 ( .A(n794), .Y(quotient[17]) );
  CLKBUFX3 U708 ( .A(n793), .Y(quotient[18]) );
  CLKBUFX3 U709 ( .A(n792), .Y(quotient[19]) );
  CLKBUFX3 U710 ( .A(n791), .Y(quotient[20]) );
  CLKBUFX3 U711 ( .A(n790), .Y(quotient[21]) );
  CLKBUFX3 U712 ( .A(n789), .Y(quotient[22]) );
  CLKBUFX3 U713 ( .A(n788), .Y(quotient[23]) );
  CLKBUFX3 U714 ( .A(n787), .Y(quotient[24]) );
  CLKBUFX3 U715 ( .A(n786), .Y(quotient[25]) );
  CLKBUFX3 U716 ( .A(n785), .Y(quotient[26]) );
  CLKBUFX3 U717 ( .A(n784), .Y(quotient[27]) );
  CLKBUFX3 U718 ( .A(n783), .Y(quotient[28]) );
  CLKBUFX3 U719 ( .A(n782), .Y(quotient[29]) );
  CLKBUFX3 U720 ( .A(n781), .Y(quotient[30]) );
  CLKBUFX3 U721 ( .A(n780), .Y(quotient[31]) );
  NOR2XL U722 ( .A(n765), .B(N197), .Y(n769) );
  INVXL U723 ( .A(N124), .Y(N125) );
  NOR2XL U724 ( .A(shift_count[0]), .B(N484), .Y(n498) );
  OR2XL U725 ( .A(cur_state[8]), .B(cur_state[7]), .Y(N152) );
  OR2XL U726 ( .A(cur_state[8]), .B(cur_state[7]), .Y(N160) );
  AOI2BB2XL U857 ( .B0(shift_count[1]), .B1(N269), .A0N(N269), .A1N(
        shift_count[1]), .Y(N270) );
  NOR2XL U858 ( .A(shift_count[1]), .B(shift_count[0]), .Y(n759) );
  XOR2XL U859 ( .A(shift_count[2]), .B(n759), .Y(N271) );
  NOR3XL U860 ( .A(shift_count[2]), .B(shift_count[1]), .C(shift_count[0]), 
        .Y(n760) );
  AOI2BB2XL U861 ( .B0(shift_count[3]), .B1(n760), .A0N(n760), .A1N(
        shift_count[3]), .Y(N272) );
  INVXL U862 ( .A(n760), .Y(n762) );
  OAI21XL U863 ( .A0(shift_count[3]), .A1(n762), .B0(shift_count[4]), .Y(n761)
         );
  OAI31XL U864 ( .A0(shift_count[3]), .A1(shift_count[4]), .A2(n762), .B0(n761), .Y(N273) );
  NOR2XL U865 ( .A(divider[0]), .B(N517), .Y(n763) );
  INVXL U866 ( .A(N100), .Y(N101) );
  OR2XL U867 ( .A(N99), .B(cur_state[0]), .Y(N100) );
  INVXL U868 ( .A(N166), .Y(N167) );
  OR2XL U869 ( .A(cur_state[8]), .B(cur_state[7]), .Y(N168) );
  NOR2XL U870 ( .A(N109), .B(cur_state[0]), .Y(n771) );
  OR2XL U871 ( .A(N102), .B(cur_state[7]), .Y(N184) );
  NOR2XL U872 ( .A(N89), .B(cur_state[0]), .Y(n772) );
  NOR2XL U873 ( .A(N79), .B(cur_state[0]), .Y(n773) );
  NOR2XL U874 ( .A(N69), .B(cur_state[0]), .Y(n774) );
  NOR2XL U875 ( .A(N59), .B(cur_state[0]), .Y(n775) );
  OR2XL U876 ( .A(cur_state[8]), .B(cur_state[7]), .Y(N73) );
  NOR2XL U877 ( .A(N49), .B(cur_state[0]), .Y(n776) );
  NOR2XL U878 ( .A(N39), .B(cur_state[0]), .Y(n777) );
  NOR2XL U879 ( .A(n771), .B(N118), .Y(n778) );
  NOR2XL U880 ( .A(N29), .B(N22), .Y(n779) );
  OR2XL U881 ( .A(cur_state[8]), .B(cur_state[7]), .Y(N33) );
endmodule

