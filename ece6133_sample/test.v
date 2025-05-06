
module CNT_10B_DW01_inc_0 ( A, SUM );
  input [9:0] A;
  output [9:0] SUM;
  wire   \carry[9] , \carry[8] , \carry[7] , \carry[6] , \carry[5] ,
         \carry[4] , \carry[3] , \carry[2] ;

  HAX1 U1_1_8 ( .A(A[8]), .B(\carry[8] ), .YC(\carry[9] ), .YS(SUM[8]) );
  HAX1 U1_1_7 ( .A(A[7]), .B(\carry[7] ), .YC(\carry[8] ), .YS(SUM[7]) );
  HAX1 U1_1_6 ( .A(A[6]), .B(\carry[6] ), .YC(\carry[7] ), .YS(SUM[6]) );
  HAX1 U1_1_5 ( .A(A[5]), .B(\carry[5] ), .YC(\carry[6] ), .YS(SUM[5]) );
  HAX1 U1_1_4 ( .A(A[4]), .B(\carry[4] ), .YC(\carry[5] ), .YS(SUM[4]) );
  HAX1 U1_1_3 ( .A(A[3]), .B(\carry[3] ), .YC(\carry[4] ), .YS(SUM[3]) );
  HAX1 U1_1_2 ( .A(A[2]), .B(\carry[2] ), .YC(\carry[3] ), .YS(SUM[2]) );
  HAX1 U1_1_1 ( .A(A[1]), .B(A[0]), .YC(\carry[2] ), .YS(SUM[1]) );
  XOR2X1 U1 ( .A(\carry[9] ), .B(A[9]), .Y(SUM[9]) );
  INVX1 U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module BIN2BCD_DW01_dec_0 ( A, SUM );
  input [31:0] A;
  output [31:0] SUM;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88;

  AND2X1 U1 ( .A(n5), .B(n77), .Y(n1) );
  INVX1 U2 ( .A(n1), .Y(n2) );
  AND2X1 U3 ( .A(n1), .B(n76), .Y(n3) );
  INVX1 U4 ( .A(n3), .Y(n4) );
  AND2X1 U5 ( .A(n13), .B(n79), .Y(n5) );
  INVX1 U6 ( .A(n5), .Y(n6) );
  AND2X1 U7 ( .A(n3), .B(n75), .Y(n7) );
  INVX1 U8 ( .A(n7), .Y(n8) );
  AND2X1 U9 ( .A(n78), .B(SUM[0]), .Y(n9) );
  INVX1 U10 ( .A(n9), .Y(n10) );
  AND2X1 U11 ( .A(n7), .B(n74), .Y(n11) );
  INVX1 U12 ( .A(n11), .Y(n12) );
  AND2X1 U13 ( .A(n17), .B(n80), .Y(n13) );
  INVX1 U14 ( .A(n13), .Y(n14) );
  AND2X1 U15 ( .A(n11), .B(n73), .Y(n15) );
  INVX1 U16 ( .A(n15), .Y(n16) );
  AND2X1 U17 ( .A(n21), .B(n81), .Y(n17) );
  INVX1 U18 ( .A(n17), .Y(n18) );
  AND2X1 U19 ( .A(n15), .B(n72), .Y(n19) );
  INVX1 U20 ( .A(n19), .Y(n20) );
  AND2X1 U21 ( .A(n25), .B(n82), .Y(n21) );
  INVX1 U22 ( .A(n21), .Y(n22) );
  AND2X1 U23 ( .A(n19), .B(n71), .Y(n23) );
  INVX1 U24 ( .A(n23), .Y(n24) );
  AND2X1 U25 ( .A(n29), .B(n83), .Y(n25) );
  INVX1 U26 ( .A(n25), .Y(n26) );
  AND2X1 U27 ( .A(n23), .B(n70), .Y(n27) );
  INVX1 U28 ( .A(n27), .Y(n28) );
  AND2X1 U29 ( .A(n33), .B(n84), .Y(n29) );
  INVX1 U30 ( .A(n29), .Y(n30) );
  AND2X1 U31 ( .A(n9), .B(n67), .Y(n31) );
  INVX1 U32 ( .A(n31), .Y(n32) );
  AND2X1 U33 ( .A(n37), .B(n85), .Y(n33) );
  INVX1 U34 ( .A(n33), .Y(n34) );
  AND2X1 U35 ( .A(n31), .B(n65), .Y(n35) );
  INVX1 U36 ( .A(n35), .Y(n36) );
  AND2X1 U37 ( .A(n41), .B(n86), .Y(n37) );
  INVX1 U38 ( .A(n37), .Y(n38) );
  AND2X1 U39 ( .A(n35), .B(n64), .Y(n39) );
  INVX1 U40 ( .A(n39), .Y(n40) );
  AND2X1 U41 ( .A(n45), .B(n87), .Y(n41) );
  INVX1 U42 ( .A(n41), .Y(n42) );
  AND2X1 U43 ( .A(n39), .B(n63), .Y(n43) );
  INVX1 U44 ( .A(n43), .Y(n44) );
  AND2X1 U45 ( .A(n53), .B(n88), .Y(n45) );
  INVX1 U46 ( .A(n45), .Y(n46) );
  AND2X1 U47 ( .A(n43), .B(n62), .Y(n47) );
  INVX1 U48 ( .A(n47), .Y(n48) );
  AND2X1 U49 ( .A(n47), .B(n61), .Y(n49) );
  INVX1 U50 ( .A(n49), .Y(n50) );
  AND2X1 U51 ( .A(n49), .B(n60), .Y(n51) );
  INVX1 U52 ( .A(n51), .Y(n52) );
  AND2X1 U53 ( .A(n51), .B(n59), .Y(n53) );
  INVX1 U54 ( .A(n53), .Y(n54) );
  AND2X1 U55 ( .A(n57), .B(n68), .Y(n55) );
  INVX1 U56 ( .A(n55), .Y(n56) );
  AND2X1 U57 ( .A(n27), .B(n69), .Y(n57) );
  INVX1 U58 ( .A(n57), .Y(n58) );
  OAI21X1 U59 ( .A(n51), .B(n59), .C(n54), .Y(SUM[9]) );
  OAI21X1 U60 ( .A(n49), .B(n60), .C(n52), .Y(SUM[8]) );
  OAI21X1 U61 ( .A(n47), .B(n61), .C(n50), .Y(SUM[7]) );
  OAI21X1 U62 ( .A(n43), .B(n62), .C(n48), .Y(SUM[6]) );
  OAI21X1 U63 ( .A(n39), .B(n63), .C(n44), .Y(SUM[5]) );
  OAI21X1 U64 ( .A(n35), .B(n64), .C(n40), .Y(SUM[4]) );
  OAI21X1 U65 ( .A(n31), .B(n65), .C(n36), .Y(SUM[3]) );
  XNOR2X1 U66 ( .A(A[31]), .B(n66), .Y(SUM[31]) );
  OR2X1 U67 ( .A(n56), .B(A[30]), .Y(n66) );
  XNOR2X1 U68 ( .A(A[30]), .B(n56), .Y(SUM[30]) );
  OAI21X1 U69 ( .A(n9), .B(n67), .C(n32), .Y(SUM[2]) );
  OAI21X1 U70 ( .A(n57), .B(n68), .C(n56), .Y(SUM[29]) );
  INVX1 U71 ( .A(A[29]), .Y(n68) );
  OAI21X1 U72 ( .A(n27), .B(n69), .C(n58), .Y(SUM[28]) );
  INVX1 U73 ( .A(A[28]), .Y(n69) );
  OAI21X1 U74 ( .A(n23), .B(n70), .C(n28), .Y(SUM[27]) );
  INVX1 U75 ( .A(A[27]), .Y(n70) );
  OAI21X1 U76 ( .A(n19), .B(n71), .C(n24), .Y(SUM[26]) );
  INVX1 U77 ( .A(A[26]), .Y(n71) );
  OAI21X1 U78 ( .A(n15), .B(n72), .C(n20), .Y(SUM[25]) );
  INVX1 U79 ( .A(A[25]), .Y(n72) );
  OAI21X1 U80 ( .A(n11), .B(n73), .C(n16), .Y(SUM[24]) );
  INVX1 U81 ( .A(A[24]), .Y(n73) );
  OAI21X1 U82 ( .A(n7), .B(n74), .C(n12), .Y(SUM[23]) );
  INVX1 U83 ( .A(A[23]), .Y(n74) );
  OAI21X1 U84 ( .A(n3), .B(n75), .C(n8), .Y(SUM[22]) );
  INVX1 U85 ( .A(A[22]), .Y(n75) );
  OAI21X1 U86 ( .A(n1), .B(n76), .C(n4), .Y(SUM[21]) );
  INVX1 U87 ( .A(A[21]), .Y(n76) );
  OAI21X1 U88 ( .A(n5), .B(n77), .C(n2), .Y(SUM[20]) );
  INVX1 U89 ( .A(A[20]), .Y(n77) );
  OAI21X1 U90 ( .A(SUM[0]), .B(n78), .C(n10), .Y(SUM[1]) );
  OAI21X1 U91 ( .A(n13), .B(n79), .C(n6), .Y(SUM[19]) );
  INVX1 U92 ( .A(A[19]), .Y(n79) );
  OAI21X1 U93 ( .A(n17), .B(n80), .C(n14), .Y(SUM[18]) );
  INVX1 U94 ( .A(A[18]), .Y(n80) );
  OAI21X1 U95 ( .A(n21), .B(n81), .C(n18), .Y(SUM[17]) );
  INVX1 U96 ( .A(A[17]), .Y(n81) );
  OAI21X1 U97 ( .A(n25), .B(n82), .C(n22), .Y(SUM[16]) );
  INVX1 U98 ( .A(A[16]), .Y(n82) );
  OAI21X1 U99 ( .A(n29), .B(n83), .C(n26), .Y(SUM[15]) );
  INVX1 U100 ( .A(A[15]), .Y(n83) );
  OAI21X1 U101 ( .A(n33), .B(n84), .C(n30), .Y(SUM[14]) );
  INVX1 U102 ( .A(A[14]), .Y(n84) );
  OAI21X1 U103 ( .A(n37), .B(n85), .C(n34), .Y(SUM[13]) );
  INVX1 U104 ( .A(A[13]), .Y(n85) );
  OAI21X1 U105 ( .A(n41), .B(n86), .C(n38), .Y(SUM[12]) );
  INVX1 U106 ( .A(A[12]), .Y(n86) );
  OAI21X1 U107 ( .A(n45), .B(n87), .C(n42), .Y(SUM[11]) );
  INVX1 U108 ( .A(A[11]), .Y(n87) );
  OAI21X1 U109 ( .A(n53), .B(n88), .C(n46), .Y(SUM[10]) );
  INVX1 U110 ( .A(A[10]), .Y(n88) );
  INVX1 U111 ( .A(A[9]), .Y(n59) );
  INVX1 U112 ( .A(A[8]), .Y(n60) );
  INVX1 U113 ( .A(A[7]), .Y(n61) );
  INVX1 U114 ( .A(A[6]), .Y(n62) );
  INVX1 U115 ( .A(A[5]), .Y(n63) );
  INVX1 U116 ( .A(A[4]), .Y(n64) );
  INVX1 U117 ( .A(A[3]), .Y(n65) );
  INVX1 U118 ( .A(A[2]), .Y(n67) );
  INVX1 U119 ( .A(A[1]), .Y(n78) );
  INVX1 U120 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module HEX2LED_3 ( HEX, LED );
  input [3:0] HEX;
  output [6:0] LED;
  wire   n1, n2, n3, n4, n5, n6, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21;

  BUFX2 U1 ( .A(n15), .Y(n1) );
  BUFX2 U2 ( .A(n19), .Y(n2) );
  OR2X1 U3 ( .A(HEX[1]), .B(n13), .Y(n3) );
  INVX1 U4 ( .A(n3), .Y(n4) );
  AND2X1 U5 ( .A(HEX[2]), .B(n17), .Y(n5) );
  INVX1 U6 ( .A(n5), .Y(n6) );
  INVX1 U7 ( .A(n8), .Y(LED[0]) );
  BUFX2 U8 ( .A(n18), .Y(n8) );
  AND2X1 U9 ( .A(HEX[1]), .B(n12), .Y(n9) );
  INVX1 U10 ( .A(n9), .Y(n10) );
  MUX2X1 U11 ( .B(n4), .A(n11), .S(n12), .Y(LED[6]) );
  OR2X1 U12 ( .A(n13), .B(n5), .Y(n11) );
  XNOR2X1 U13 ( .A(HEX[1]), .B(n14), .Y(n13) );
  OAI21X1 U14 ( .A(n5), .B(n10), .C(n1), .Y(LED[5]) );
  NAND3X1 U15 ( .A(n16), .B(n14), .C(HEX[0]), .Y(n15) );
  OAI21X1 U16 ( .A(HEX[3]), .B(n17), .C(n8), .Y(LED[4]) );
  NAND2X1 U17 ( .A(n8), .B(n2), .Y(LED[3]) );
  NAND3X1 U18 ( .A(HEX[0]), .B(HEX[2]), .C(n9), .Y(n19) );
  NOR3X1 U19 ( .A(n10), .B(HEX[2]), .C(HEX[0]), .Y(LED[2]) );
  NOR3X1 U20 ( .A(n14), .B(HEX[3]), .C(n20), .Y(LED[1]) );
  XNOR2X1 U21 ( .A(HEX[0]), .B(HEX[1]), .Y(n20) );
  INVX1 U22 ( .A(HEX[2]), .Y(n14) );
  NAND3X1 U23 ( .A(n16), .B(n12), .C(n21), .Y(n18) );
  OAI21X1 U24 ( .A(HEX[2]), .B(n17), .C(n6), .Y(n21) );
  INVX1 U25 ( .A(HEX[0]), .Y(n17) );
  INVX1 U26 ( .A(HEX[3]), .Y(n12) );
  INVX1 U27 ( .A(HEX[1]), .Y(n16) );
endmodule


module HEX2LED_2 ( HEX, LED );
  input [3:0] HEX;
  output [6:0] LED;
  wire   n1, n2, n3, n4, n5, n6, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21;

  BUFX2 U1 ( .A(n15), .Y(n1) );
  BUFX2 U2 ( .A(n19), .Y(n2) );
  OR2X1 U3 ( .A(HEX[1]), .B(n13), .Y(n3) );
  INVX1 U4 ( .A(n3), .Y(n4) );
  AND2X1 U5 ( .A(HEX[2]), .B(n17), .Y(n5) );
  INVX1 U6 ( .A(n5), .Y(n6) );
  INVX1 U7 ( .A(n8), .Y(LED[0]) );
  BUFX2 U8 ( .A(n18), .Y(n8) );
  AND2X1 U9 ( .A(HEX[1]), .B(n12), .Y(n9) );
  INVX1 U10 ( .A(n9), .Y(n10) );
  MUX2X1 U11 ( .B(n4), .A(n11), .S(n12), .Y(LED[6]) );
  OR2X1 U12 ( .A(n13), .B(n5), .Y(n11) );
  XNOR2X1 U13 ( .A(HEX[1]), .B(n14), .Y(n13) );
  OAI21X1 U14 ( .A(n5), .B(n10), .C(n1), .Y(LED[5]) );
  NAND3X1 U15 ( .A(n16), .B(n14), .C(HEX[0]), .Y(n15) );
  OAI21X1 U16 ( .A(HEX[3]), .B(n17), .C(n8), .Y(LED[4]) );
  NAND2X1 U17 ( .A(n8), .B(n2), .Y(LED[3]) );
  NAND3X1 U18 ( .A(HEX[0]), .B(HEX[2]), .C(n9), .Y(n19) );
  NOR3X1 U19 ( .A(n10), .B(HEX[2]), .C(HEX[0]), .Y(LED[2]) );
  NOR3X1 U20 ( .A(n14), .B(HEX[3]), .C(n20), .Y(LED[1]) );
  XNOR2X1 U21 ( .A(HEX[0]), .B(HEX[1]), .Y(n20) );
  INVX1 U22 ( .A(HEX[2]), .Y(n14) );
  NAND3X1 U23 ( .A(n16), .B(n12), .C(n21), .Y(n18) );
  OAI21X1 U24 ( .A(HEX[2]), .B(n17), .C(n6), .Y(n21) );
  INVX1 U25 ( .A(HEX[0]), .Y(n17) );
  INVX1 U26 ( .A(HEX[3]), .Y(n12) );
  INVX1 U27 ( .A(HEX[1]), .Y(n16) );
endmodule


module HEX2LED_1 ( HEX, LED );
  input [3:0] HEX;
  output [6:0] LED;
  wire   n1, n2, n3, n4, n5, n6, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21;

  BUFX2 U1 ( .A(n15), .Y(n1) );
  BUFX2 U2 ( .A(n19), .Y(n2) );
  OR2X1 U3 ( .A(HEX[1]), .B(n13), .Y(n3) );
  INVX1 U4 ( .A(n3), .Y(n4) );
  AND2X1 U5 ( .A(HEX[2]), .B(n17), .Y(n5) );
  INVX1 U6 ( .A(n5), .Y(n6) );
  INVX1 U7 ( .A(n8), .Y(LED[0]) );
  BUFX2 U8 ( .A(n18), .Y(n8) );
  AND2X1 U9 ( .A(HEX[1]), .B(n12), .Y(n9) );
  INVX1 U10 ( .A(n9), .Y(n10) );
  MUX2X1 U11 ( .B(n4), .A(n11), .S(n12), .Y(LED[6]) );
  OR2X1 U12 ( .A(n13), .B(n5), .Y(n11) );
  XNOR2X1 U13 ( .A(HEX[1]), .B(n14), .Y(n13) );
  OAI21X1 U14 ( .A(n5), .B(n10), .C(n1), .Y(LED[5]) );
  NAND3X1 U15 ( .A(n16), .B(n14), .C(HEX[0]), .Y(n15) );
  OAI21X1 U16 ( .A(HEX[3]), .B(n17), .C(n8), .Y(LED[4]) );
  NAND2X1 U17 ( .A(n8), .B(n2), .Y(LED[3]) );
  NAND3X1 U18 ( .A(HEX[0]), .B(HEX[2]), .C(n9), .Y(n19) );
  NOR3X1 U19 ( .A(n10), .B(HEX[2]), .C(HEX[0]), .Y(LED[2]) );
  NOR3X1 U20 ( .A(n14), .B(HEX[3]), .C(n20), .Y(LED[1]) );
  XNOR2X1 U21 ( .A(HEX[0]), .B(HEX[1]), .Y(n20) );
  INVX1 U22 ( .A(HEX[2]), .Y(n14) );
  NAND3X1 U23 ( .A(n16), .B(n12), .C(n21), .Y(n18) );
  OAI21X1 U24 ( .A(HEX[2]), .B(n17), .C(n6), .Y(n21) );
  INVX1 U25 ( .A(HEX[0]), .Y(n17) );
  INVX1 U26 ( .A(HEX[3]), .Y(n12) );
  INVX1 U27 ( .A(HEX[1]), .Y(n16) );
endmodule


module HEX2LED_0 ( HEX, LED );
  input [3:0] HEX;
  output [6:0] LED;
  wire   n1, n2, n3, n4, n5, n6, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21;

  BUFX2 U1 ( .A(n15), .Y(n1) );
  BUFX2 U2 ( .A(n19), .Y(n2) );
  OR2X1 U3 ( .A(HEX[1]), .B(n13), .Y(n3) );
  INVX1 U4 ( .A(n3), .Y(n4) );
  AND2X1 U5 ( .A(HEX[2]), .B(n17), .Y(n5) );
  INVX1 U6 ( .A(n5), .Y(n6) );
  INVX1 U7 ( .A(n8), .Y(LED[0]) );
  BUFX2 U8 ( .A(n18), .Y(n8) );
  AND2X1 U9 ( .A(HEX[1]), .B(n12), .Y(n9) );
  INVX1 U10 ( .A(n9), .Y(n10) );
  MUX2X1 U11 ( .B(n4), .A(n11), .S(n12), .Y(LED[6]) );
  OR2X1 U12 ( .A(n13), .B(n5), .Y(n11) );
  XNOR2X1 U13 ( .A(HEX[1]), .B(n14), .Y(n13) );
  OAI21X1 U14 ( .A(n5), .B(n10), .C(n1), .Y(LED[5]) );
  NAND3X1 U15 ( .A(n16), .B(n14), .C(HEX[0]), .Y(n15) );
  OAI21X1 U16 ( .A(HEX[3]), .B(n17), .C(n8), .Y(LED[4]) );
  NAND2X1 U17 ( .A(n8), .B(n2), .Y(LED[3]) );
  NAND3X1 U18 ( .A(HEX[0]), .B(HEX[2]), .C(n9), .Y(n19) );
  NOR3X1 U19 ( .A(n10), .B(HEX[2]), .C(HEX[0]), .Y(LED[2]) );
  NOR3X1 U20 ( .A(n14), .B(HEX[3]), .C(n20), .Y(LED[1]) );
  XNOR2X1 U21 ( .A(HEX[0]), .B(HEX[1]), .Y(n20) );
  INVX1 U22 ( .A(HEX[2]), .Y(n14) );
  NAND3X1 U23 ( .A(n16), .B(n12), .C(n21), .Y(n18) );
  OAI21X1 U24 ( .A(HEX[2]), .B(n17), .C(n6), .Y(n21) );
  INVX1 U25 ( .A(HEX[0]), .Y(n17) );
  INVX1 U26 ( .A(HEX[3]), .Y(n12) );
  INVX1 U27 ( .A(HEX[1]), .Y(n16) );
endmodule


module BIN2BCD ( CLK, ENABLE, RESET, BIN, BCD_T, BCD_H, BCD_D, BCD_U );
  input [9:0] BIN;
  output [3:0] BCD_T;
  output [3:0] BCD_H;
  output [3:0] BCD_D;
  output [3:0] BCD_U;
  input CLK, ENABLE, RESET;
  wire   n417, n418, n419, n420, n421, n422, n423, n424, n425, n426, n427,
         n428, n429, n430, n431, n432, N126, N127, N128, N129, N130, N131,
         N132, N133, N134, N135, N136, N137, N138, N139, N140, N141, N142,
         N143, N144, N145, N146, N147, N148, N149, N150, N151, N152, N153,
         N154, N155, N156, N158, n99, n304, n305, n306, n307, n308, n309, n310,
         n311, n312, n313, n314, n315, n316, n317, n318, n319, n320, n321,
         n322, n323, n324, n325, n326, n327, n328, n329, n330, n331, n332,
         n333, n334, n335, n336, n337, n338, n339, n340, n341, n342, n343,
         n344, n345, n346, n347, n348, n349, n350, n351, n352, n353, n354,
         n355, n356, n357, n358, n359, n360, n361, n362, n363, n364, n365,
         n366, n367, n368, n369, n370, n371, n372, n373, n374, n375, n376,
         n377, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n101, n102,
         n103, n104, n105, n106, n107, n108, n109, n110, n111, n112, n113,
         n114, n115, n116, n117, n118, n119, n120, n121, n122, n123, n124,
         n125, n126, n127, n128, n129, n130, n131, n132, n133, n134, n135,
         n136, n137, n138, n139, n140, n141, n142, n143, n144, n145, n146,
         n147, n148, n149, n150, n151, n152, n153, n154, n155, n156, n157,
         n158, n159, n164, n165, n166, n167, n168, n169, n170, n171, n172,
         n173, n178, n179, n180, n181, n182, n183, n184, n185, n186, n187,
         n188, n197, n198, n199, n200, n201, n202, n203, n204, n205, n206,
         n207, n208, n209, n210, n211, n212, n213, n214, n215, n216, n217,
         n218, n219, n220, n221, n222, n223, n224, n225, n226, n227, n228,
         n229, n230, n231, n232, n233, n234, n235, n236, n237, n238, n239,
         n240, n241, n242, n243, n244, n245, n246, n247, n248, n249, n250,
         n251, n252, n253, n254, n255, n256, n257, n258, n259, n260, n261,
         n262, n263, n264, n265, n266, n267, n268, n269, n270, n271, n272,
         n273, n274, n275, n276, n277, n278, n279, n280, n281, n282, n283,
         n284, n285, n286, n287, n288, n289, n290, n291, n292, n293, n294,
         n295, n296, n297, n298, n299, n300, n301, n302, n303, n378, n379,
         n380, n381, n382, n383, n384, n385, n386, n387, n388, n389, n390,
         n391, n392, n393, n394, n395, n396, n397, n398, n399, n400, n401,
         n402, n403, n404, n405, n406, n407, n408, n409, n410, n411, n412,
         n413, n414, n415, n416;
  wire   [31:0] CNT;
  wire   [15:0] BCD;
  wire   [9:0] BIN_INPUT;

  DFFSR \CNT_reg[0]  ( .D(n377), .CLK(CLK), .R(1'b1), .S(n99), .Q(CNT[0]) );
  DFFSR \CNT_reg[31]  ( .D(n376), .CLK(CLK), .R(n99), .S(1'b1), .Q(CNT[31]) );
  DFFSR \CNT_reg[1]  ( .D(n375), .CLK(CLK), .R(1'b1), .S(n99), .Q(CNT[1]) );
  DFFSR \CNT_reg[2]  ( .D(n374), .CLK(CLK), .R(n99), .S(1'b1), .Q(CNT[2]) );
  DFFSR \CNT_reg[3]  ( .D(n373), .CLK(CLK), .R(1'b1), .S(n99), .Q(CNT[3]) );
  DFFSR \CNT_reg[4]  ( .D(n372), .CLK(CLK), .R(n99), .S(1'b1), .Q(CNT[4]) );
  DFFSR \CNT_reg[5]  ( .D(n371), .CLK(CLK), .R(n99), .S(1'b1), .Q(CNT[5]) );
  DFFSR \CNT_reg[6]  ( .D(n370), .CLK(CLK), .R(n99), .S(1'b1), .Q(CNT[6]) );
  DFFSR \CNT_reg[7]  ( .D(n369), .CLK(CLK), .R(n99), .S(1'b1), .Q(CNT[7]) );
  DFFSR \CNT_reg[8]  ( .D(n368), .CLK(CLK), .R(n99), .S(1'b1), .Q(CNT[8]) );
  DFFSR \CNT_reg[9]  ( .D(n367), .CLK(CLK), .R(n99), .S(1'b1), .Q(CNT[9]) );
  DFFSR \CNT_reg[10]  ( .D(n366), .CLK(CLK), .R(n99), .S(1'b1), .Q(CNT[10]) );
  DFFSR \CNT_reg[11]  ( .D(n365), .CLK(CLK), .R(n99), .S(1'b1), .Q(CNT[11]) );
  DFFSR \CNT_reg[12]  ( .D(n364), .CLK(CLK), .R(n99), .S(1'b1), .Q(CNT[12]) );
  DFFSR \CNT_reg[13]  ( .D(n363), .CLK(CLK), .R(n99), .S(1'b1), .Q(CNT[13]) );
  DFFSR \CNT_reg[14]  ( .D(n362), .CLK(CLK), .R(n99), .S(1'b1), .Q(CNT[14]) );
  DFFSR \CNT_reg[15]  ( .D(n361), .CLK(CLK), .R(n99), .S(1'b1), .Q(CNT[15]) );
  DFFSR \CNT_reg[16]  ( .D(n360), .CLK(CLK), .R(n99), .S(1'b1), .Q(CNT[16]) );
  DFFSR \CNT_reg[17]  ( .D(n359), .CLK(CLK), .R(n99), .S(1'b1), .Q(CNT[17]) );
  DFFSR \CNT_reg[18]  ( .D(n358), .CLK(CLK), .R(n99), .S(1'b1), .Q(CNT[18]) );
  DFFSR \CNT_reg[19]  ( .D(n357), .CLK(CLK), .R(n99), .S(1'b1), .Q(CNT[19]) );
  DFFSR \CNT_reg[20]  ( .D(n356), .CLK(CLK), .R(n99), .S(1'b1), .Q(CNT[20]) );
  DFFSR \CNT_reg[21]  ( .D(n355), .CLK(CLK), .R(n99), .S(1'b1), .Q(CNT[21]) );
  DFFSR \CNT_reg[22]  ( .D(n354), .CLK(CLK), .R(n99), .S(1'b1), .Q(CNT[22]) );
  DFFSR \CNT_reg[23]  ( .D(n353), .CLK(CLK), .R(n99), .S(1'b1), .Q(CNT[23]) );
  DFFSR \CNT_reg[24]  ( .D(n352), .CLK(CLK), .R(n99), .S(1'b1), .Q(CNT[24]) );
  DFFSR \CNT_reg[25]  ( .D(n351), .CLK(CLK), .R(n99), .S(1'b1), .Q(CNT[25]) );
  DFFSR \CNT_reg[26]  ( .D(n350), .CLK(CLK), .R(n99), .S(1'b1), .Q(CNT[26]) );
  DFFSR \CNT_reg[27]  ( .D(n349), .CLK(CLK), .R(n99), .S(1'b1), .Q(CNT[27]) );
  DFFSR \CNT_reg[28]  ( .D(n348), .CLK(CLK), .R(n99), .S(1'b1), .Q(CNT[28]) );
  DFFSR \CNT_reg[29]  ( .D(n347), .CLK(CLK), .R(n99), .S(1'b1), .Q(CNT[29]) );
  DFFSR \CNT_reg[30]  ( .D(n346), .CLK(CLK), .R(n99), .S(1'b1), .Q(CNT[30]) );
  DFFSR \BIN_INPUT_reg[0]  ( .D(n345), .CLK(CLK), .R(n99), .S(1'b1), .Q(
        BIN_INPUT[0]) );
  DFFSR \BIN_INPUT_reg[1]  ( .D(n344), .CLK(CLK), .R(n99), .S(1'b1), .Q(
        BIN_INPUT[1]) );
  DFFSR \BIN_INPUT_reg[2]  ( .D(n343), .CLK(CLK), .R(n99), .S(1'b1), .Q(
        BIN_INPUT[2]) );
  DFFSR \BIN_INPUT_reg[3]  ( .D(n342), .CLK(CLK), .R(n99), .S(1'b1), .Q(
        BIN_INPUT[3]) );
  DFFSR \BIN_INPUT_reg[4]  ( .D(n341), .CLK(CLK), .R(n99), .S(1'b1), .Q(
        BIN_INPUT[4]) );
  DFFSR \BIN_INPUT_reg[5]  ( .D(n340), .CLK(CLK), .R(n99), .S(1'b1), .Q(
        BIN_INPUT[5]) );
  DFFSR \BIN_INPUT_reg[6]  ( .D(n339), .CLK(CLK), .R(n99), .S(1'b1), .Q(
        BIN_INPUT[6]) );
  DFFSR \BIN_INPUT_reg[7]  ( .D(n338), .CLK(CLK), .R(n99), .S(1'b1), .Q(
        BIN_INPUT[7]) );
  DFFSR \BIN_INPUT_reg[8]  ( .D(n337), .CLK(CLK), .R(n99), .S(1'b1), .Q(
        BIN_INPUT[8]) );
  DFFSR \BIN_INPUT_reg[9]  ( .D(n336), .CLK(CLK), .R(n99), .S(1'b1), .Q(
        BIN_INPUT[9]) );
  DFFSR \BCD_reg[0]  ( .D(n335), .CLK(CLK), .R(n99), .S(1'b1), .Q(BCD[0]) );
  DFFSR \BCD_reg[1]  ( .D(n334), .CLK(CLK), .R(n99), .S(1'b1), .Q(BCD[1]) );
  DFFSR \BCD_reg[2]  ( .D(n333), .CLK(CLK), .R(n99), .S(1'b1), .Q(BCD[2]) );
  DFFSR \BCD_reg[3]  ( .D(n332), .CLK(CLK), .R(n99), .S(1'b1), .Q(BCD[3]) );
  DFFSR \BCD_reg[4]  ( .D(n331), .CLK(CLK), .R(n99), .S(1'b1), .Q(BCD[4]) );
  DFFSR \BCD_reg[5]  ( .D(n329), .CLK(CLK), .R(n99), .S(1'b1), .Q(BCD[5]) );
  DFFSR \BCD_reg[6]  ( .D(n327), .CLK(CLK), .R(n99), .S(1'b1), .Q(BCD[6]) );
  DFFSR \BCD_reg[7]  ( .D(n325), .CLK(CLK), .R(n99), .S(1'b1), .Q(BCD[7]) );
  DFFSR \BCD_D_I_reg[3]  ( .D(n324), .CLK(CLK), .R(n99), .S(1'b1), .Q(n425) );
  DFFSR \BCD_reg[8]  ( .D(n323), .CLK(CLK), .R(n99), .S(1'b1), .Q(BCD[8]) );
  DFFSR \BCD_reg[9]  ( .D(n321), .CLK(CLK), .R(n99), .S(1'b1), .Q(BCD[9]) );
  DFFSR \BCD_reg[10]  ( .D(n319), .CLK(CLK), .R(n99), .S(1'b1), .Q(BCD[10]) );
  DFFSR \BCD_reg[11]  ( .D(n317), .CLK(CLK), .R(n99), .S(1'b1), .Q(BCD[11]) );
  DFFSR \BCD_H_I_reg[3]  ( .D(n316), .CLK(CLK), .R(n99), .S(1'b1), .Q(n421) );
  DFFSR \BCD_reg[12]  ( .D(n315), .CLK(CLK), .R(n99), .S(1'b1), .Q(BCD[12]) );
  DFFSR \BCD_reg[13]  ( .D(n313), .CLK(CLK), .R(n99), .S(1'b1), .Q(BCD[13]) );
  DFFSR \BCD_reg[14]  ( .D(n311), .CLK(CLK), .R(n99), .S(1'b1), .Q(BCD[14]) );
  DFFSR \BCD_reg[15]  ( .D(n309), .CLK(CLK), .R(n99), .S(1'b1), .Q(BCD[15]) );
  DFFSR \BCD_T_I_reg[3]  ( .D(n308), .CLK(CLK), .R(n99), .S(1'b1), .Q(n417) );
  DFFSR \BCD_T_I_reg[2]  ( .D(n310), .CLK(CLK), .R(n99), .S(1'b1), .Q(n418) );
  DFFSR \BCD_T_I_reg[1]  ( .D(n312), .CLK(CLK), .R(n99), .S(1'b1), .Q(n419) );
  DFFSR \BCD_T_I_reg[0]  ( .D(n314), .CLK(CLK), .R(n99), .S(1'b1), .Q(n420) );
  DFFSR \BCD_H_I_reg[2]  ( .D(n318), .CLK(CLK), .R(n99), .S(1'b1), .Q(n422) );
  DFFSR \BCD_H_I_reg[1]  ( .D(n320), .CLK(CLK), .R(n99), .S(1'b1), .Q(n423) );
  DFFSR \BCD_H_I_reg[0]  ( .D(n322), .CLK(CLK), .R(n99), .S(1'b1), .Q(n424) );
  DFFSR \BCD_D_I_reg[2]  ( .D(n326), .CLK(CLK), .R(n99), .S(1'b1), .Q(n426) );
  DFFSR \BCD_D_I_reg[1]  ( .D(n328), .CLK(CLK), .R(n99), .S(1'b1), .Q(n427) );
  DFFSR \BCD_D_I_reg[0]  ( .D(n330), .CLK(CLK), .R(n99), .S(1'b1), .Q(n428) );
  DFFSR \BCD_U_I_reg[3]  ( .D(n307), .CLK(CLK), .R(n99), .S(1'b1), .Q(n429) );
  DFFSR \BCD_U_I_reg[2]  ( .D(n306), .CLK(CLK), .R(n99), .S(1'b1), .Q(n430) );
  DFFSR \BCD_U_I_reg[1]  ( .D(n305), .CLK(CLK), .R(n99), .S(1'b1), .Q(n431) );
  DFFSR \BCD_U_I_reg[0]  ( .D(n304), .CLK(CLK), .R(n99), .S(1'b1), .Q(n432) );
  BIN2BCD_DW01_dec_0 r97 ( .A({n135, n136, n111, n197, n185, n130, n126, n134, 
        n116, n122, n114, n120, n128, n124, n132, n112, n118, n113, n119, n127, 
        n125, n131, n115, n121, n129, n133, n117, n123, n159, n110, n188, n169}), .SUM({N158, N156, N155, N154, N153, N152, N151, N150, N149, N148, N147, 
        N146, N145, N144, N143, N142, N141, N140, N139, N138, N137, N136, N135, 
        N134, N133, N132, N131, N130, N129, N128, N127, N126}) );
  OR2X1 U76 ( .A(n173), .B(n167), .Y(n303) );
  OR2X1 U78 ( .A(n172), .B(n166), .Y(n287) );
  OR2X1 U79 ( .A(n171), .B(n101), .Y(n271) );
  AND2X1 U80 ( .A(n159), .B(n188), .Y(n389) );
  OR2X1 U81 ( .A(n198), .B(n143), .Y(n203) );
  OR2X1 U82 ( .A(n151), .B(n142), .Y(n201) );
  AND2X1 U83 ( .A(n299), .B(n146), .Y(n164) );
  OR2X1 U84 ( .A(n170), .B(n154), .Y(n186) );
  AND2X1 U85 ( .A(n206), .B(n151), .Y(n241) );
  BUFX2 U86 ( .A(BIN_INPUT[9]), .Y(n1) );
  BUFX2 U87 ( .A(BCD[15]), .Y(n2) );
  BUFX2 U88 ( .A(n396), .Y(n3) );
  OR2X1 U89 ( .A(n198), .B(n199), .Y(n4) );
  OR2X1 U90 ( .A(n200), .B(n4), .Y(n5) );
  BUFX2 U91 ( .A(n244), .Y(n6) );
  BUFX2 U92 ( .A(n246), .Y(n7) );
  BUFX2 U93 ( .A(n242), .Y(n8) );
  BUFX2 U94 ( .A(n248), .Y(n9) );
  BUFX2 U95 ( .A(n240), .Y(n10) );
  BUFX2 U96 ( .A(n250), .Y(n11) );
  BUFX2 U97 ( .A(n252), .Y(n12) );
  BUFX2 U98 ( .A(n254), .Y(n13) );
  BUFX2 U99 ( .A(n256), .Y(n14) );
  BUFX2 U100 ( .A(n263), .Y(n15) );
  BUFX2 U101 ( .A(n277), .Y(n16) );
  BUFX2 U102 ( .A(n293), .Y(n17) );
  BUFX2 U103 ( .A(n383), .Y(n18) );
  OR2X1 U104 ( .A(n110), .B(n111), .Y(n19) );
  INVX1 U105 ( .A(n19), .Y(n20) );
  AND2X1 U106 ( .A(n405), .B(n406), .Y(n21) );
  INVX1 U107 ( .A(n21), .Y(n22) );
  BUFX2 U108 ( .A(n400), .Y(n23) );
  AND2X1 U109 ( .A(n381), .B(n186), .Y(n24) );
  INVX1 U110 ( .A(n24), .Y(n25) );
  BUFX2 U111 ( .A(BCD[0]), .Y(n101) );
  INVX1 U112 ( .A(n103), .Y(n102) );
  BUFX2 U113 ( .A(BIN_INPUT[2]), .Y(n103) );
  AND2X1 U114 ( .A(n270), .B(n275), .Y(n104) );
  INVX1 U115 ( .A(n104), .Y(n105) );
  AND2X1 U116 ( .A(n286), .B(n291), .Y(n106) );
  INVX1 U117 ( .A(n106), .Y(n107) );
  AND2X1 U118 ( .A(n259), .B(n262), .Y(n108) );
  INVX1 U119 ( .A(n108), .Y(n109) );
  BUFX2 U120 ( .A(CNT[2]), .Y(n110) );
  BUFX2 U121 ( .A(CNT[29]), .Y(n111) );
  BUFX2 U122 ( .A(CNT[16]), .Y(n112) );
  BUFX2 U123 ( .A(CNT[14]), .Y(n113) );
  BUFX2 U124 ( .A(CNT[21]), .Y(n114) );
  BUFX2 U125 ( .A(CNT[9]), .Y(n115) );
  BUFX2 U126 ( .A(CNT[23]), .Y(n116) );
  BUFX2 U127 ( .A(CNT[5]), .Y(n117) );
  BUFX2 U128 ( .A(CNT[15]), .Y(n118) );
  BUFX2 U129 ( .A(CNT[13]), .Y(n119) );
  BUFX2 U130 ( .A(CNT[20]), .Y(n120) );
  BUFX2 U131 ( .A(CNT[8]), .Y(n121) );
  BUFX2 U132 ( .A(CNT[22]), .Y(n122) );
  BUFX2 U133 ( .A(CNT[4]), .Y(n123) );
  BUFX2 U134 ( .A(CNT[18]), .Y(n124) );
  BUFX2 U135 ( .A(CNT[11]), .Y(n125) );
  BUFX2 U136 ( .A(CNT[25]), .Y(n126) );
  BUFX2 U137 ( .A(CNT[12]), .Y(n127) );
  BUFX2 U138 ( .A(CNT[19]), .Y(n128) );
  BUFX2 U139 ( .A(CNT[7]), .Y(n129) );
  BUFX2 U140 ( .A(CNT[26]), .Y(n130) );
  BUFX2 U141 ( .A(CNT[10]), .Y(n131) );
  BUFX2 U142 ( .A(CNT[17]), .Y(n132) );
  BUFX2 U143 ( .A(CNT[6]), .Y(n133) );
  BUFX2 U144 ( .A(CNT[24]), .Y(n134) );
  BUFX2 U145 ( .A(CNT[31]), .Y(n135) );
  BUFX2 U146 ( .A(CNT[30]), .Y(n136) );
  AND2X1 U147 ( .A(n268), .B(n152), .Y(n137) );
  INVX1 U148 ( .A(n137), .Y(n138) );
  AND2X1 U149 ( .A(n283), .B(n153), .Y(n139) );
  INVX1 U150 ( .A(n139), .Y(n140) );
  AND2X1 U151 ( .A(ENABLE), .B(n143), .Y(n141) );
  INVX1 U152 ( .A(n141), .Y(n142) );
  BUFX2 U153 ( .A(n258), .Y(n143) );
  OR2X1 U154 ( .A(n159), .B(n188), .Y(n144) );
  INVX1 U155 ( .A(n144), .Y(n145) );
  BUFX2 U156 ( .A(BCD[10]), .Y(n146) );
  BUFX2 U157 ( .A(BIN_INPUT[1]), .Y(n147) );
  BUFX2 U158 ( .A(BIN_INPUT[3]), .Y(n148) );
  AND2X1 U159 ( .A(n302), .B(n381), .Y(n149) );
  INVX1 U160 ( .A(n149), .Y(n150) );
  BUFX2 U161 ( .A(n257), .Y(n151) );
  BUFX2 U162 ( .A(BCD[2]), .Y(n152) );
  BUFX2 U163 ( .A(BCD[6]), .Y(n153) );
  BUFX2 U164 ( .A(BCD[12]), .Y(n154) );
  BUFX2 U165 ( .A(BIN_INPUT[5]), .Y(n155) );
  BUFX2 U166 ( .A(BIN_INPUT[7]), .Y(n156) );
  BUFX2 U167 ( .A(BIN_INPUT[0]), .Y(n157) );
  BUFX2 U168 ( .A(BCD[14]), .Y(n158) );
  BUFX2 U169 ( .A(CNT[3]), .Y(n159) );
  BUFX2 U170 ( .A(n425), .Y(BCD_D[3]) );
  BUFX2 U171 ( .A(n421), .Y(BCD_H[3]) );
  BUFX2 U172 ( .A(n417), .Y(BCD_T[3]) );
  BUFX2 U173 ( .A(n429), .Y(BCD_U[3]) );
  INVX1 U174 ( .A(n164), .Y(n165) );
  BUFX2 U175 ( .A(BCD[4]), .Y(n166) );
  BUFX2 U176 ( .A(BCD[8]), .Y(n167) );
  BUFX2 U177 ( .A(BIN_INPUT[4]), .Y(n168) );
  BUFX2 U178 ( .A(CNT[0]), .Y(n169) );
  BUFX2 U179 ( .A(BCD[13]), .Y(n170) );
  BUFX2 U180 ( .A(BCD[1]), .Y(n171) );
  BUFX2 U181 ( .A(BCD[5]), .Y(n172) );
  BUFX2 U182 ( .A(BCD[9]), .Y(n173) );
  BUFX2 U183 ( .A(n420), .Y(BCD_T[0]) );
  BUFX2 U184 ( .A(n424), .Y(BCD_H[0]) );
  BUFX2 U185 ( .A(n428), .Y(BCD_D[0]) );
  BUFX2 U186 ( .A(n432), .Y(BCD_U[0]) );
  AND2X1 U187 ( .A(BIN[0]), .B(n202), .Y(n178) );
  INVX1 U188 ( .A(n178), .Y(n179) );
  BUFX2 U189 ( .A(BIN_INPUT[6]), .Y(n180) );
  BUFX2 U190 ( .A(BIN_INPUT[8]), .Y(n181) );
  BUFX2 U191 ( .A(BCD[3]), .Y(n182) );
  BUFX2 U192 ( .A(BCD[7]), .Y(n183) );
  BUFX2 U193 ( .A(BCD[11]), .Y(n184) );
  BUFX2 U194 ( .A(CNT[27]), .Y(n185) );
  INVX1 U195 ( .A(n186), .Y(n187) );
  BUFX2 U196 ( .A(CNT[1]), .Y(n188) );
  BUFX2 U197 ( .A(n418), .Y(BCD_T[2]) );
  BUFX2 U198 ( .A(n422), .Y(BCD_H[2]) );
  BUFX2 U199 ( .A(n426), .Y(BCD_D[2]) );
  BUFX2 U200 ( .A(n430), .Y(BCD_U[2]) );
  BUFX2 U201 ( .A(n419), .Y(BCD_T[1]) );
  BUFX2 U202 ( .A(n423), .Y(BCD_H[1]) );
  BUFX2 U203 ( .A(n427), .Y(BCD_D[1]) );
  BUFX2 U204 ( .A(n431), .Y(BCD_U[1]) );
  BUFX2 U205 ( .A(CNT[28]), .Y(n197) );
  INVX2 U206 ( .A(RESET), .Y(n99) );
  INVX1 U207 ( .A(ENABLE), .Y(n198) );
  INVX1 U208 ( .A(n143), .Y(n199) );
  INVX1 U209 ( .A(n151), .Y(n200) );
  INVX1 U210 ( .A(n201), .Y(n202) );
  INVX1 U211 ( .A(n203), .Y(n204) );
  INVX1 U212 ( .A(n205), .Y(n377) );
  MUX2X1 U213 ( .B(n169), .A(N126), .S(n206), .Y(n205) );
  INVX1 U214 ( .A(n207), .Y(n376) );
  MUX2X1 U215 ( .B(n135), .A(N158), .S(n206), .Y(n207) );
  INVX1 U216 ( .A(n208), .Y(n375) );
  MUX2X1 U217 ( .B(n188), .A(N127), .S(n206), .Y(n208) );
  INVX1 U218 ( .A(n209), .Y(n374) );
  MUX2X1 U219 ( .B(n110), .A(N128), .S(n206), .Y(n209) );
  INVX1 U220 ( .A(n210), .Y(n373) );
  MUX2X1 U221 ( .B(n159), .A(N129), .S(n206), .Y(n210) );
  INVX1 U222 ( .A(n211), .Y(n372) );
  MUX2X1 U223 ( .B(n123), .A(N130), .S(n206), .Y(n211) );
  INVX1 U224 ( .A(n212), .Y(n371) );
  MUX2X1 U225 ( .B(n117), .A(N131), .S(n206), .Y(n212) );
  INVX1 U226 ( .A(n213), .Y(n370) );
  MUX2X1 U227 ( .B(n133), .A(N132), .S(n206), .Y(n213) );
  INVX1 U228 ( .A(n214), .Y(n369) );
  MUX2X1 U229 ( .B(n129), .A(N133), .S(n206), .Y(n214) );
  INVX1 U230 ( .A(n215), .Y(n368) );
  MUX2X1 U231 ( .B(n121), .A(N134), .S(n206), .Y(n215) );
  INVX1 U232 ( .A(n216), .Y(n367) );
  MUX2X1 U233 ( .B(n115), .A(N135), .S(n206), .Y(n216) );
  INVX1 U234 ( .A(n217), .Y(n366) );
  MUX2X1 U235 ( .B(n131), .A(N136), .S(n206), .Y(n217) );
  INVX1 U236 ( .A(n218), .Y(n365) );
  MUX2X1 U237 ( .B(n125), .A(N137), .S(n206), .Y(n218) );
  INVX1 U238 ( .A(n219), .Y(n364) );
  MUX2X1 U239 ( .B(n127), .A(N138), .S(n206), .Y(n219) );
  INVX1 U240 ( .A(n220), .Y(n363) );
  MUX2X1 U241 ( .B(n119), .A(N139), .S(n206), .Y(n220) );
  INVX1 U242 ( .A(n221), .Y(n362) );
  MUX2X1 U243 ( .B(n113), .A(N140), .S(n206), .Y(n221) );
  INVX1 U244 ( .A(n222), .Y(n361) );
  MUX2X1 U245 ( .B(n118), .A(N141), .S(n206), .Y(n222) );
  INVX1 U246 ( .A(n223), .Y(n360) );
  MUX2X1 U247 ( .B(n112), .A(N142), .S(n206), .Y(n223) );
  INVX1 U248 ( .A(n224), .Y(n359) );
  MUX2X1 U249 ( .B(n132), .A(N143), .S(n206), .Y(n224) );
  INVX1 U250 ( .A(n225), .Y(n358) );
  MUX2X1 U251 ( .B(n124), .A(N144), .S(n206), .Y(n225) );
  INVX1 U252 ( .A(n226), .Y(n357) );
  MUX2X1 U253 ( .B(n128), .A(N145), .S(n206), .Y(n226) );
  INVX1 U254 ( .A(n227), .Y(n356) );
  MUX2X1 U255 ( .B(n120), .A(N146), .S(n206), .Y(n227) );
  INVX1 U256 ( .A(n228), .Y(n355) );
  MUX2X1 U257 ( .B(n114), .A(N147), .S(n206), .Y(n228) );
  INVX1 U258 ( .A(n229), .Y(n354) );
  MUX2X1 U259 ( .B(n122), .A(N148), .S(n206), .Y(n229) );
  INVX1 U260 ( .A(n230), .Y(n353) );
  MUX2X1 U261 ( .B(n116), .A(N149), .S(n206), .Y(n230) );
  INVX1 U262 ( .A(n231), .Y(n352) );
  MUX2X1 U263 ( .B(n134), .A(N150), .S(n206), .Y(n231) );
  INVX1 U264 ( .A(n232), .Y(n351) );
  MUX2X1 U265 ( .B(n126), .A(N151), .S(n206), .Y(n232) );
  INVX1 U266 ( .A(n233), .Y(n350) );
  MUX2X1 U267 ( .B(n130), .A(N152), .S(n206), .Y(n233) );
  INVX1 U268 ( .A(n234), .Y(n349) );
  MUX2X1 U269 ( .B(n185), .A(N153), .S(n206), .Y(n234) );
  INVX1 U270 ( .A(n235), .Y(n348) );
  MUX2X1 U271 ( .B(n197), .A(N154), .S(n206), .Y(n235) );
  INVX1 U272 ( .A(n236), .Y(n347) );
  MUX2X1 U273 ( .B(n111), .A(N155), .S(n206), .Y(n236) );
  INVX1 U274 ( .A(n237), .Y(n346) );
  MUX2X1 U275 ( .B(n136), .A(N156), .S(n206), .Y(n237) );
  OAI21X1 U276 ( .A(n206), .B(n238), .C(n179), .Y(n345) );
  INVX1 U277 ( .A(n157), .Y(n238) );
  OAI21X1 U278 ( .A(n206), .B(n239), .C(n10), .Y(n344) );
  AOI22X1 U279 ( .A(BIN[1]), .B(n202), .C(n241), .D(n157), .Y(n240) );
  INVX1 U280 ( .A(n147), .Y(n239) );
  OAI21X1 U281 ( .A(n206), .B(n102), .C(n8), .Y(n343) );
  AOI22X1 U282 ( .A(BIN[2]), .B(n202), .C(n147), .D(n241), .Y(n242) );
  OAI21X1 U283 ( .A(n206), .B(n243), .C(n6), .Y(n342) );
  AOI22X1 U284 ( .A(BIN[3]), .B(n202), .C(n103), .D(n241), .Y(n244) );
  INVX1 U285 ( .A(n148), .Y(n243) );
  OAI21X1 U286 ( .A(n206), .B(n245), .C(n7), .Y(n341) );
  AOI22X1 U287 ( .A(BIN[4]), .B(n202), .C(n148), .D(n241), .Y(n246) );
  INVX1 U288 ( .A(n168), .Y(n245) );
  OAI21X1 U289 ( .A(n206), .B(n247), .C(n9), .Y(n340) );
  AOI22X1 U290 ( .A(BIN[5]), .B(n202), .C(n168), .D(n241), .Y(n248) );
  INVX1 U291 ( .A(n155), .Y(n247) );
  OAI21X1 U292 ( .A(n206), .B(n249), .C(n11), .Y(n339) );
  AOI22X1 U293 ( .A(BIN[6]), .B(n202), .C(n155), .D(n241), .Y(n250) );
  INVX1 U294 ( .A(n180), .Y(n249) );
  OAI21X1 U295 ( .A(n206), .B(n251), .C(n12), .Y(n338) );
  AOI22X1 U296 ( .A(BIN[7]), .B(n202), .C(n180), .D(n241), .Y(n252) );
  INVX1 U297 ( .A(n156), .Y(n251) );
  OAI21X1 U298 ( .A(n206), .B(n253), .C(n13), .Y(n337) );
  AOI22X1 U299 ( .A(BIN[8]), .B(n202), .C(n156), .D(n241), .Y(n254) );
  INVX1 U300 ( .A(n181), .Y(n253) );
  OAI21X1 U301 ( .A(n206), .B(n255), .C(n14), .Y(n336) );
  AOI22X1 U302 ( .A(BIN[9]), .B(n202), .C(n181), .D(n241), .Y(n256) );
  INVX1 U303 ( .A(n142), .Y(n206) );
  MUX2X1 U304 ( .B(n255), .A(n259), .S(n5), .Y(n335) );
  INVX1 U305 ( .A(n1), .Y(n255) );
  INVX1 U306 ( .A(n260), .Y(n334) );
  MUX2X1 U307 ( .B(n261), .A(n171), .S(n5), .Y(n260) );
  OAI21X1 U308 ( .A(n262), .B(n259), .C(n109), .Y(n261) );
  MUX2X1 U309 ( .B(n15), .A(n264), .S(n5), .Y(n333) );
  AOI22X1 U310 ( .A(n171), .B(n109), .C(n265), .D(n262), .Y(n263) );
  MUX2X1 U311 ( .B(n266), .A(n267), .S(n5), .Y(n332) );
  XOR2X1 U312 ( .A(n268), .B(n264), .Y(n266) );
  MUX2X1 U313 ( .B(n269), .A(n270), .S(n5), .Y(n331) );
  XOR2X1 U314 ( .A(n138), .B(n182), .Y(n269) );
  AND2X1 U315 ( .A(n262), .B(n271), .Y(n268) );
  OAI21X1 U316 ( .A(n265), .B(n264), .C(n267), .Y(n262) );
  INVX1 U317 ( .A(n271), .Y(n265) );
  MUX2X1 U318 ( .B(n272), .A(n270), .S(n204), .Y(n330) );
  INVX1 U319 ( .A(BCD_D[0]), .Y(n272) );
  INVX1 U320 ( .A(n273), .Y(n329) );
  MUX2X1 U321 ( .B(n274), .A(n172), .S(n5), .Y(n273) );
  OAI21X1 U322 ( .A(n275), .B(n270), .C(n105), .Y(n274) );
  INVX1 U323 ( .A(n276), .Y(n328) );
  MUX2X1 U324 ( .B(BCD_D[1]), .A(n172), .S(n204), .Y(n276) );
  MUX2X1 U325 ( .B(n16), .A(n278), .S(n5), .Y(n327) );
  AOI22X1 U326 ( .A(n172), .B(n105), .C(n279), .D(n275), .Y(n277) );
  INVX1 U327 ( .A(n166), .Y(n270) );
  MUX2X1 U328 ( .B(n280), .A(n278), .S(n204), .Y(n326) );
  INVX1 U329 ( .A(BCD_D[2]), .Y(n280) );
  MUX2X1 U330 ( .B(n281), .A(n282), .S(n5), .Y(n325) );
  XOR2X1 U331 ( .A(n283), .B(n278), .Y(n281) );
  MUX2X1 U332 ( .B(n284), .A(n282), .S(n204), .Y(n324) );
  INVX1 U333 ( .A(BCD_D[3]), .Y(n284) );
  MUX2X1 U334 ( .B(n285), .A(n286), .S(n5), .Y(n323) );
  XOR2X1 U335 ( .A(n140), .B(n183), .Y(n285) );
  AND2X1 U336 ( .A(n275), .B(n287), .Y(n283) );
  OAI21X1 U337 ( .A(n279), .B(n278), .C(n282), .Y(n275) );
  INVX1 U338 ( .A(n183), .Y(n282) );
  INVX1 U339 ( .A(n153), .Y(n278) );
  INVX1 U340 ( .A(n287), .Y(n279) );
  MUX2X1 U341 ( .B(n288), .A(n286), .S(n204), .Y(n322) );
  INVX1 U342 ( .A(BCD_H[0]), .Y(n288) );
  INVX1 U343 ( .A(n289), .Y(n321) );
  MUX2X1 U344 ( .B(n290), .A(n173), .S(n5), .Y(n289) );
  OAI21X1 U345 ( .A(n291), .B(n286), .C(n107), .Y(n290) );
  INVX1 U346 ( .A(n292), .Y(n320) );
  MUX2X1 U347 ( .B(BCD_H[1]), .A(n173), .S(n204), .Y(n292) );
  MUX2X1 U348 ( .B(n17), .A(n294), .S(n5), .Y(n319) );
  AOI22X1 U349 ( .A(n173), .B(n107), .C(n295), .D(n291), .Y(n293) );
  INVX1 U350 ( .A(n167), .Y(n286) );
  MUX2X1 U351 ( .B(n296), .A(n294), .S(n204), .Y(n318) );
  INVX1 U352 ( .A(BCD_H[2]), .Y(n296) );
  MUX2X1 U353 ( .B(n297), .A(n298), .S(n5), .Y(n317) );
  XOR2X1 U354 ( .A(n299), .B(n294), .Y(n297) );
  MUX2X1 U355 ( .B(n300), .A(n298), .S(n204), .Y(n316) );
  INVX1 U356 ( .A(BCD_H[3]), .Y(n300) );
  MUX2X1 U357 ( .B(n301), .A(n302), .S(n5), .Y(n315) );
  XOR2X1 U358 ( .A(n165), .B(n184), .Y(n301) );
  AND2X1 U359 ( .A(n291), .B(n303), .Y(n299) );
  OAI21X1 U360 ( .A(n295), .B(n294), .C(n298), .Y(n291) );
  INVX1 U361 ( .A(n184), .Y(n298) );
  INVX1 U362 ( .A(n146), .Y(n294) );
  INVX1 U363 ( .A(n303), .Y(n295) );
  MUX2X1 U364 ( .B(n378), .A(n302), .S(n204), .Y(n314) );
  INVX1 U365 ( .A(BCD_T[0]), .Y(n378) );
  INVX1 U366 ( .A(n379), .Y(n313) );
  MUX2X1 U367 ( .B(n380), .A(n170), .S(n5), .Y(n379) );
  OAI21X1 U368 ( .A(n381), .B(n302), .C(n150), .Y(n380) );
  INVX1 U369 ( .A(n382), .Y(n312) );
  MUX2X1 U370 ( .B(BCD_T[1]), .A(n170), .S(n204), .Y(n382) );
  MUX2X1 U371 ( .B(n18), .A(n384), .S(n5), .Y(n311) );
  AOI22X1 U372 ( .A(n170), .B(n150), .C(n187), .D(n381), .Y(n383) );
  INVX1 U373 ( .A(n154), .Y(n302) );
  MUX2X1 U374 ( .B(n385), .A(n384), .S(n204), .Y(n310) );
  INVX1 U375 ( .A(BCD_T[2]), .Y(n385) );
  MUX2X1 U376 ( .B(n386), .A(n387), .S(n5), .Y(n309) );
  NAND3X1 U377 ( .A(n169), .B(n388), .C(n389), .Y(n257) );
  XOR2X1 U378 ( .A(n25), .B(n158), .Y(n386) );
  OAI21X1 U379 ( .A(n187), .B(n384), .C(n387), .Y(n381) );
  INVX1 U380 ( .A(n158), .Y(n384) );
  MUX2X1 U381 ( .B(n390), .A(n387), .S(n204), .Y(n308) );
  INVX1 U382 ( .A(n2), .Y(n387) );
  INVX1 U383 ( .A(BCD_T[3]), .Y(n390) );
  MUX2X1 U384 ( .B(n391), .A(n267), .S(n204), .Y(n307) );
  INVX1 U385 ( .A(n182), .Y(n267) );
  INVX1 U386 ( .A(BCD_U[3]), .Y(n391) );
  MUX2X1 U387 ( .B(n392), .A(n264), .S(n204), .Y(n306) );
  INVX1 U388 ( .A(n152), .Y(n264) );
  INVX1 U389 ( .A(BCD_U[2]), .Y(n392) );
  INVX1 U390 ( .A(n393), .Y(n305) );
  MUX2X1 U391 ( .B(BCD_U[1]), .A(n171), .S(n204), .Y(n393) );
  MUX2X1 U392 ( .B(n394), .A(n259), .S(n204), .Y(n304) );
  NAND3X1 U393 ( .A(n388), .B(n395), .C(n145), .Y(n258) );
  INVX1 U394 ( .A(n169), .Y(n395) );
  INVX1 U395 ( .A(n3), .Y(n388) );
  NAND3X1 U396 ( .A(n397), .B(n398), .C(n399), .Y(n396) );
  NOR3X1 U397 ( .A(n22), .B(n23), .C(n401), .Y(n399) );
  INVX1 U398 ( .A(n402), .Y(n401) );
  NOR3X1 U399 ( .A(n126), .B(n130), .C(n134), .Y(n402) );
  NAND3X1 U400 ( .A(n403), .B(n404), .C(n20), .Y(n400) );
  INVX1 U401 ( .A(n197), .Y(n404) );
  INVX1 U402 ( .A(n185), .Y(n403) );
  NOR3X1 U403 ( .A(n407), .B(n129), .C(n133), .Y(n406) );
  OR2X1 U404 ( .A(n121), .B(n115), .Y(n407) );
  NOR3X1 U405 ( .A(n408), .B(n135), .C(n136), .Y(n405) );
  OR2X1 U406 ( .A(n123), .B(n117), .Y(n408) );
  NOR3X1 U407 ( .A(n409), .B(n410), .C(n411), .Y(n398) );
  OR2X1 U408 ( .A(n120), .B(n114), .Y(n411) );
  OR2X1 U409 ( .A(n122), .B(n116), .Y(n410) );
  INVX1 U410 ( .A(n412), .Y(n409) );
  NOR3X1 U411 ( .A(n124), .B(n128), .C(n132), .Y(n412) );
  NOR3X1 U412 ( .A(n413), .B(n414), .C(n415), .Y(n397) );
  OR2X1 U413 ( .A(n119), .B(n113), .Y(n415) );
  OR2X1 U414 ( .A(n118), .B(n112), .Y(n414) );
  INVX1 U415 ( .A(n416), .Y(n413) );
  NOR3X1 U416 ( .A(n125), .B(n127), .C(n131), .Y(n416) );
  INVX1 U417 ( .A(n101), .Y(n259) );
  INVX1 U418 ( .A(BCD_U[0]), .Y(n394) );
endmodule


module CNT_10B ( CLK, ENABLE, RESET, FULL, COUNT );
  output [9:0] COUNT;
  input CLK, ENABLE, RESET;
  output FULL;
  wire   n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, N7, N8, N9,
         N10, N11, N12, N13, N14, N15, N16, n12, n42, n43, n44, n45, n46, n47,
         n48, n49, n50, n51, n52, n1, n14, n15, n16, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n41, n53, n54, n55, n56, n57,
         n58;

  DFFSR \COUNT_I_reg[0]  ( .D(n52), .CLK(CLK), .R(n12), .S(1'b1), .Q(n69) );
  DFFSR FULL_I_reg ( .D(n42), .CLK(CLK), .R(n12), .S(1'b1), .Q(n59) );
  DFFSR \COUNT_I_reg[9]  ( .D(n51), .CLK(CLK), .R(n12), .S(1'b1), .Q(n60) );
  DFFSR \COUNT_I_reg[1]  ( .D(n50), .CLK(CLK), .R(n12), .S(1'b1), .Q(n68) );
  DFFSR \COUNT_I_reg[2]  ( .D(n49), .CLK(CLK), .R(n12), .S(1'b1), .Q(n67) );
  DFFSR \COUNT_I_reg[3]  ( .D(n48), .CLK(CLK), .R(n12), .S(1'b1), .Q(n66) );
  DFFSR \COUNT_I_reg[4]  ( .D(n47), .CLK(CLK), .R(n12), .S(1'b1), .Q(n65) );
  DFFSR \COUNT_I_reg[5]  ( .D(n46), .CLK(CLK), .R(n12), .S(1'b1), .Q(n64) );
  DFFSR \COUNT_I_reg[6]  ( .D(n45), .CLK(CLK), .R(n12), .S(1'b1), .Q(n63) );
  DFFSR \COUNT_I_reg[7]  ( .D(n44), .CLK(CLK), .R(n12), .S(1'b1), .Q(n62) );
  DFFSR \COUNT_I_reg[8]  ( .D(n43), .CLK(CLK), .R(n12), .S(1'b1), .Q(n61) );
  CNT_10B_DW01_inc_0 \Always_1/add_31  ( .A(COUNT), .SUM({N16, N15, N14, N13, 
        N12, N11, N10, N9, N8, N7}) );
  AND2X1 U13 ( .A(ENABLE), .B(n39), .Y(n29) );
  BUFX2 U15 ( .A(n56), .Y(n1) );
  BUFX2 U16 ( .A(n58), .Y(n14) );
  BUFX2 U17 ( .A(n54), .Y(n15) );
  BUFX2 U18 ( .A(n53), .Y(n16) );
  BUFX2 U19 ( .A(n66), .Y(COUNT[3]) );
  BUFX2 U20 ( .A(n63), .Y(COUNT[6]) );
  BUFX2 U21 ( .A(n68), .Y(COUNT[1]) );
  BUFX2 U22 ( .A(n61), .Y(COUNT[8]) );
  BUFX2 U23 ( .A(n64), .Y(COUNT[5]) );
  BUFX2 U24 ( .A(n65), .Y(COUNT[4]) );
  BUFX2 U25 ( .A(n67), .Y(COUNT[2]) );
  BUFX2 U26 ( .A(n62), .Y(COUNT[7]) );
  BUFX2 U27 ( .A(n60), .Y(COUNT[9]) );
  BUFX2 U28 ( .A(n69), .Y(COUNT[0]) );
  BUFX2 U29 ( .A(n59), .Y(FULL) );
  INVX1 U30 ( .A(n28), .Y(n52) );
  MUX2X1 U31 ( .B(COUNT[0]), .A(N7), .S(n29), .Y(n28) );
  INVX1 U32 ( .A(n30), .Y(n51) );
  MUX2X1 U33 ( .B(COUNT[9]), .A(N16), .S(n29), .Y(n30) );
  INVX1 U34 ( .A(n31), .Y(n50) );
  MUX2X1 U35 ( .B(COUNT[1]), .A(N8), .S(n29), .Y(n31) );
  INVX1 U36 ( .A(n32), .Y(n49) );
  MUX2X1 U37 ( .B(COUNT[2]), .A(N9), .S(n29), .Y(n32) );
  INVX1 U38 ( .A(n33), .Y(n48) );
  MUX2X1 U39 ( .B(COUNT[3]), .A(N10), .S(n29), .Y(n33) );
  INVX1 U40 ( .A(n34), .Y(n47) );
  MUX2X1 U41 ( .B(COUNT[4]), .A(N11), .S(n29), .Y(n34) );
  INVX1 U42 ( .A(n35), .Y(n46) );
  MUX2X1 U43 ( .B(COUNT[5]), .A(N12), .S(n29), .Y(n35) );
  INVX1 U44 ( .A(n36), .Y(n45) );
  MUX2X1 U45 ( .B(COUNT[6]), .A(N13), .S(n29), .Y(n36) );
  INVX1 U46 ( .A(n37), .Y(n44) );
  MUX2X1 U47 ( .B(COUNT[7]), .A(N14), .S(n29), .Y(n37) );
  INVX1 U48 ( .A(n38), .Y(n43) );
  MUX2X1 U49 ( .B(COUNT[8]), .A(N15), .S(n29), .Y(n38) );
  OAI21X1 U50 ( .A(n40), .B(n39), .C(n41), .Y(n42) );
  INVX1 U51 ( .A(FULL), .Y(n41) );
  OR2X1 U52 ( .A(n16), .B(n15), .Y(n39) );
  NAND3X1 U53 ( .A(n55), .B(COUNT[3]), .C(COUNT[4]), .Y(n54) );
  INVX1 U54 ( .A(n1), .Y(n55) );
  NAND3X1 U55 ( .A(COUNT[1]), .B(COUNT[0]), .C(COUNT[2]), .Y(n56) );
  NAND3X1 U56 ( .A(n57), .B(COUNT[8]), .C(COUNT[9]), .Y(n53) );
  INVX1 U57 ( .A(n14), .Y(n57) );
  NAND3X1 U58 ( .A(COUNT[6]), .B(COUNT[5]), .C(COUNT[7]), .Y(n58) );
  INVX1 U59 ( .A(ENABLE), .Y(n40) );
  INVX1 U60 ( .A(RESET), .Y(n12) );
endmodule


module CONTROL ( CLK, ENABLE, END_MEASURE, GATE, RESET, START );
  input CLK, RESET, START;
  output ENABLE, END_MEASURE, GATE;
  wire   n33, n34, n35, n7, n24, n1, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n22, n23, n25, n26, n27, n28, n29, n30, n31, n32;
  wire   [2:0] CurrState_Sreg0;
  wire   [2:0] NextState_Sreg0;

  DFFSR \CurrState_Sreg0_reg[0]  ( .D(NextState_Sreg0[0]), .CLK(CLK), .R(n7), 
        .S(1'b1), .Q(CurrState_Sreg0[0]) );
  DFFSR \CurrState_Sreg0_reg[1]  ( .D(NextState_Sreg0[1]), .CLK(CLK), .R(n7), 
        .S(1'b1), .Q(CurrState_Sreg0[1]) );
  DFFSR \CurrState_Sreg0_reg[2]  ( .D(NextState_Sreg0[2]), .CLK(CLK), .R(n7), 
        .S(1'b1), .Q(CurrState_Sreg0[2]) );
  DFFSR END_MEASURE_reg ( .D(n10), .CLK(CLK), .R(1'b1), .S(n7), .Q(n34) );
  DFFSR ENABLE_reg ( .D(n24), .CLK(CLK), .R(n7), .S(1'b1), .Q(n33) );
  DFFSR GATE_reg ( .D(n12), .CLK(CLK), .R(n7), .S(1'b1), .Q(n35) );
  OR2X1 U8 ( .A(START), .B(n22), .Y(n32) );
  BUFX2 U10 ( .A(CurrState_Sreg0[2]), .Y(n1) );
  OR2X1 U11 ( .A(n18), .B(n14), .Y(n9) );
  INVX1 U12 ( .A(n9), .Y(n10) );
  AND2X1 U13 ( .A(n17), .B(n13), .Y(n11) );
  INVX1 U14 ( .A(n11), .Y(n12) );
  BUFX2 U15 ( .A(n29), .Y(n13) );
  BUFX2 U16 ( .A(n23), .Y(n14) );
  AND2X1 U17 ( .A(ENABLE), .B(n22), .Y(n15) );
  INVX1 U18 ( .A(n15), .Y(n16) );
  BUFX2 U19 ( .A(n28), .Y(n17) );
  BUFX2 U20 ( .A(CurrState_Sreg0[1]), .Y(n18) );
  BUFX2 U21 ( .A(n33), .Y(ENABLE) );
  BUFX2 U22 ( .A(n34), .Y(END_MEASURE) );
  BUFX2 U23 ( .A(n35), .Y(GATE) );
  BUFX2 U24 ( .A(CurrState_Sreg0[0]), .Y(n22) );
  INVX1 U25 ( .A(RESET), .Y(n7) );
  AOI22X1 U26 ( .A(n25), .B(n26), .C(END_MEASURE), .D(n22), .Y(n23) );
  OAI21X1 U27 ( .A(n25), .B(n27), .C(n16), .Y(n24) );
  NAND3X1 U28 ( .A(n22), .B(n27), .C(GATE), .Y(n29) );
  INVX1 U29 ( .A(n17), .Y(NextState_Sreg0[2]) );
  NAND3X1 U30 ( .A(START), .B(n30), .C(n31), .Y(n28) );
  AND2X1 U31 ( .A(n26), .B(n27), .Y(n31) );
  INVX1 U32 ( .A(n22), .Y(n30) );
  OAI21X1 U33 ( .A(n25), .B(n27), .C(n26), .Y(NextState_Sreg0[1]) );
  INVX1 U34 ( .A(n32), .Y(n25) );
  OAI21X1 U35 ( .A(n32), .B(n27), .C(n26), .Y(NextState_Sreg0[0]) );
  INVX1 U36 ( .A(n1), .Y(n26) );
  INVX1 U37 ( .A(n18), .Y(n27) );
endmodule


module ictest ( F_CONV, F_INPUT, F_PATTERN, RESET, START, FULL, LED_A, LED_B, 
        LED_C, LED_D );
  output [6:0] LED_A;
  output [6:0] LED_B;
  output [6:0] LED_C;
  output [6:0] LED_D;
  input F_CONV, F_INPUT, F_PATTERN, RESET, START;
  output FULL;
  wire   ENABLE_CONVERT, END_RESET, GATE;
  wire   [3:0] BCD_D;
  wire   [3:0] BCD_H;
  wire   [3:0] BCD_T;
  wire   [3:0] BCD_U;
  wire   [9:0] COUNT;

  CONTROL U0 ( .CLK(F_PATTERN), .ENABLE(ENABLE_CONVERT), .END_MEASURE(
        END_RESET), .GATE(GATE), .RESET(RESET), .START(START) );
  CNT_10B U1 ( .CLK(F_INPUT), .ENABLE(GATE), .RESET(END_RESET), .FULL(FULL), 
        .COUNT(COUNT) );
  BIN2BCD U2 ( .CLK(F_CONV), .ENABLE(ENABLE_CONVERT), .RESET(END_RESET), .BIN(
        COUNT), .BCD_T(BCD_T), .BCD_H(BCD_H), .BCD_D(BCD_D), .BCD_U(BCD_U) );
  HEX2LED_0 U3 ( .HEX(BCD_D), .LED(LED_B) );
  HEX2LED_3 U4 ( .HEX(BCD_H), .LED(LED_C) );
  HEX2LED_2 U5 ( .HEX(BCD_T), .LED(LED_D) );
  HEX2LED_1 U6 ( .HEX(BCD_U), .LED(LED_A) );
endmodule

