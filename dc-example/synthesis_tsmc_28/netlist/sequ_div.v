/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : O-2018.06-SP1
// Date      : Sat Jul 27 12:45:52 2024
/////////////////////////////////////////////////////////////


module sequ_div_DW_cmp_0 ( p_A, p_B, TC, GE_LT, GE_GT_EQ, GE_LT_GT_LE, EQ_NE
 );
  input [31:0] p_A;
  input [31:0] p_B;
  input TC, GE_LT, GE_GT_EQ;
  output GE_LT_GT_LE, EQ_NE;
  wire   n226, n227, n228, n229, n230, n231, n232, n233, n234, n235, n236,
         n237, n238, n239, n240, n241, n242, n243, n244, n245, n246, n247,
         n248, n249, n250, n251, n252, n253, n254, n255, n256, n257, n258,
         n259, n260, n261, n262, n263, n264, n265, n266, n267, n268, n269,
         n270, n271, n272, n273, n274, n275, n276, n277, n278, n279, n280,
         n281, n282, n283, n284, n285, n286, n287, n288, n289, n290, n291,
         n292, n293, n294, n295, n296, n297, n298, n299, n300, n301, n302,
         n303, n304, n305, n306, n307, n308, n309, n310, n311, n312;

  AOI32XL U157 ( .A0(n226), .A1(n227), .A2(n228), .B0(n229), .B1(n226), .Y(
        GE_LT_GT_LE) );
  OR4XL U158 ( .A(n230), .B(n231), .C(n232), .D(n233), .Y(n229) );
  NOR2BXL U159 ( .AN(p_B[24]), .B(p_A[24]), .Y(n232) );
  AOI211XL U160 ( .A0(n234), .A1(n235), .B0(n236), .C0(n237), .Y(n228) );
  OAI22XL U161 ( .A0(n238), .A1(p_B[22]), .B0(n239), .B1(p_B[23]), .Y(n237) );
  OAI2BB1XL U162 ( .A0N(n239), .A1N(p_B[23]), .B0(p_A[22]), .Y(n238) );
  INVXL U163 ( .A(p_A[23]), .Y(n239) );
  OAI32XL U164 ( .A0(n240), .A1(n241), .A2(n242), .B0(n243), .B1(n241), .Y(
        n236) );
  AOI32XL U165 ( .A0(n244), .A1(n245), .A2(p_A[18]), .B0(p_A[19]), .B1(n246), 
        .Y(n243) );
  INVXL U166 ( .A(p_B[19]), .Y(n246) );
  AOI2B1XL U167 ( .A1N(p_B[17]), .A0(p_A[17]), .B0(n247), .Y(n242) );
  NOR3XL U168 ( .A(n248), .B(p_B[16]), .C(n249), .Y(n247) );
  OAI22XL U169 ( .A0(n250), .A1(p_B[20]), .B0(n251), .B1(p_B[21]), .Y(n235) );
  OAI2BB1XL U170 ( .A0N(n251), .A1N(p_B[21]), .B0(p_A[20]), .Y(n250) );
  INVXL U171 ( .A(p_A[21]), .Y(n251) );
  NAND3BXL U172 ( .AN(n249), .B(n252), .C(n253), .Y(n227) );
  AOI211XL U173 ( .A0(p_B[16]), .A1(n248), .B0(n241), .C0(n240), .Y(n253) );
  OAI21XL U174 ( .A0(n245), .A1(p_A[18]), .B0(n244), .Y(n240) );
  NAND2BXL U175 ( .AN(p_A[19]), .B(p_B[19]), .Y(n244) );
  INVXL U176 ( .A(p_B[18]), .Y(n245) );
  OAI2B11XL U177 ( .A1N(p_B[21]), .A0(p_A[21]), .B0(n254), .C0(n234), .Y(n241)
         );
  AOI2B1XL U178 ( .A1N(p_A[22]), .A0(p_B[22]), .B0(n255), .Y(n234) );
  NOR2BXL U179 ( .AN(p_B[23]), .B(p_A[23]), .Y(n255) );
  NAND2BXL U180 ( .AN(p_A[20]), .B(p_B[20]), .Y(n254) );
  INVXL U181 ( .A(p_A[16]), .Y(n248) );
  OAI31XL U182 ( .A0(n256), .A1(n257), .A2(n258), .B0(n259), .Y(n252) );
  AOI211XL U183 ( .A0(n260), .A1(n261), .B0(n262), .C0(n263), .Y(n259) );
  OAI22XL U184 ( .A0(n264), .A1(p_B[14]), .B0(n265), .B1(p_B[15]), .Y(n263) );
  OAI2BB1XL U185 ( .A0N(n265), .A1N(p_B[15]), .B0(p_A[14]), .Y(n264) );
  INVXL U186 ( .A(p_A[15]), .Y(n265) );
  OAI32XL U187 ( .A0(n266), .A1(n256), .A2(n267), .B0(n268), .B1(n256), .Y(
        n262) );
  AOI2B1XL U188 ( .A1N(p_B[11]), .A0(p_A[11]), .B0(n269), .Y(n268) );
  NOR3BXL U189 ( .AN(p_A[10]), .B(p_B[10]), .C(n270), .Y(n269) );
  AOI32XL U190 ( .A0(n271), .A1(n272), .A2(p_A[8]), .B0(p_A[9]), .B1(n273), 
        .Y(n267) );
  INVXL U191 ( .A(p_B[9]), .Y(n273) );
  INVXL U192 ( .A(n274), .Y(n266) );
  OAI22XL U193 ( .A0(n275), .A1(p_B[12]), .B0(n276), .B1(p_B[13]), .Y(n261) );
  OAI2BB1XL U194 ( .A0N(n276), .A1N(p_B[13]), .B0(p_A[12]), .Y(n275) );
  INVXL U195 ( .A(p_A[13]), .Y(n276) );
  OAI211XL U196 ( .A0(n272), .A1(p_A[8]), .B0(n271), .C0(n274), .Y(n258) );
  AOI2B1XL U197 ( .A1N(p_A[10]), .A0(p_B[10]), .B0(n270), .Y(n274) );
  NOR2BXL U198 ( .AN(p_B[11]), .B(p_A[11]), .Y(n270) );
  NAND2BXL U199 ( .AN(p_A[9]), .B(p_B[9]), .Y(n271) );
  INVXL U200 ( .A(p_B[8]), .Y(n272) );
  OAI32XL U201 ( .A0(n277), .A1(n278), .A2(n279), .B0(n280), .B1(n278), .Y(
        n257) );
  AOI2B1XL U202 ( .A1N(p_A[6]), .A0(p_B[6]), .B0(n281), .Y(n280) );
  NOR2BXL U203 ( .AN(p_B[7]), .B(p_A[7]), .Y(n281) );
  AOI2B1XL U204 ( .A1N(p_A[4]), .A0(p_B[4]), .B0(n282), .Y(n279) );
  OAI2B2XL U205 ( .A1N(p_B[5]), .A0(p_A[5]), .B0(n283), .B1(n284), .Y(n282) );
  AOI21XL U206 ( .A0(n285), .A1(p_B[3]), .B0(n286), .Y(n284) );
  OAI2B1XL U207 ( .A1N(p_B[2]), .A0(p_A[2]), .B0(n287), .Y(n286) );
  OAI22XL U208 ( .A0(n288), .A1(p_B[0]), .B0(n289), .B1(p_B[1]), .Y(n287) );
  OAI2BB1XL U209 ( .A0N(n289), .A1N(p_B[1]), .B0(p_A[0]), .Y(n288) );
  INVXL U210 ( .A(p_A[1]), .Y(n289) );
  OAI22XL U211 ( .A0(n290), .A1(p_B[2]), .B0(n285), .B1(p_B[3]), .Y(n283) );
  OAI2BB1XL U212 ( .A0N(n285), .A1N(p_B[3]), .B0(p_A[2]), .Y(n290) );
  INVXL U213 ( .A(p_A[3]), .Y(n285) );
  OAI22XL U214 ( .A0(n291), .A1(p_B[6]), .B0(n292), .B1(p_B[7]), .Y(n278) );
  OAI2BB1XL U215 ( .A0N(n292), .A1N(p_B[7]), .B0(p_A[6]), .Y(n291) );
  INVXL U216 ( .A(p_A[7]), .Y(n292) );
  OAI22XL U217 ( .A0(n293), .A1(p_B[4]), .B0(n294), .B1(p_B[5]), .Y(n277) );
  OAI2BB1XL U218 ( .A0N(n294), .A1N(p_B[5]), .B0(p_A[4]), .Y(n293) );
  INVXL U219 ( .A(p_A[5]), .Y(n294) );
  OAI2B11XL U220 ( .A1N(p_B[13]), .A0(p_A[13]), .B0(n295), .C0(n260), .Y(n256)
         );
  AOI2B1XL U221 ( .A1N(p_A[14]), .A0(p_B[14]), .B0(n296), .Y(n260) );
  NOR2BXL U222 ( .AN(p_B[15]), .B(p_A[15]), .Y(n296) );
  NAND2BXL U223 ( .AN(p_A[12]), .B(p_B[12]), .Y(n295) );
  NOR2BXL U224 ( .AN(p_B[17]), .B(p_A[17]), .Y(n249) );
  AOI211XL U225 ( .A0(n297), .A1(n298), .B0(n299), .C0(n300), .Y(n226) );
  OAI22XL U226 ( .A0(n301), .A1(p_B[30]), .B0(n302), .B1(p_B[31]), .Y(n300) );
  OAI2BB1XL U227 ( .A0N(n302), .A1N(p_B[31]), .B0(p_A[30]), .Y(n301) );
  INVXL U228 ( .A(p_A[31]), .Y(n302) );
  OAI32XL U229 ( .A0(n231), .A1(n233), .A2(n303), .B0(n304), .B1(n233), .Y(
        n299) );
  AOI32XL U230 ( .A0(n305), .A1(n306), .A2(p_A[26]), .B0(p_A[27]), .B1(n307), 
        .Y(n304) );
  INVXL U231 ( .A(p_B[27]), .Y(n307) );
  AOI2B1XL U232 ( .A1N(p_B[25]), .A0(p_A[25]), .B0(n308), .Y(n303) );
  NOR3BXL U233 ( .AN(p_A[24]), .B(p_B[24]), .C(n230), .Y(n308) );
  NOR2BXL U234 ( .AN(p_B[25]), .B(p_A[25]), .Y(n230) );
  OAI2B11XL U235 ( .A1N(p_B[29]), .A0(p_A[29]), .B0(n309), .C0(n297), .Y(n233)
         );
  NAND2BXL U236 ( .AN(p_A[28]), .B(p_B[28]), .Y(n309) );
  OAI21XL U237 ( .A0(n306), .A1(p_A[26]), .B0(n305), .Y(n231) );
  NAND2BXL U238 ( .AN(p_A[27]), .B(p_B[27]), .Y(n305) );
  INVXL U239 ( .A(p_B[26]), .Y(n306) );
  OAI22XL U240 ( .A0(n310), .A1(p_B[28]), .B0(n311), .B1(p_B[29]), .Y(n298) );
  OAI2BB1XL U241 ( .A0N(n311), .A1N(p_B[29]), .B0(p_A[28]), .Y(n310) );
  INVXL U242 ( .A(p_A[29]), .Y(n311) );
  AOI2B1XL U243 ( .A1N(p_A[30]), .A0(p_B[30]), .B0(n312), .Y(n297) );
  NOR2BXL U244 ( .AN(p_B[31]), .B(p_A[31]), .Y(n312) );
endmodule


module sequ_div_DW01_sub_0 ( p_A, p_B, CI, p_DIFF, CO );
  input [32:0] p_A;
  input [32:0] p_B;
  output [32:0] p_DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63;

  ADDFX1 U2 ( .A(n33), .B(p_A[31]), .CI(n2), .CO(n1), .S(p_DIFF[31]) );
  ADDFX1 U3 ( .A(n34), .B(p_A[30]), .CI(n3), .CO(n2), .S(p_DIFF[30]) );
  ADDFX1 U4 ( .A(n35), .B(p_A[29]), .CI(n4), .CO(n3), .S(p_DIFF[29]) );
  ADDFX1 U5 ( .A(n36), .B(p_A[28]), .CI(n5), .CO(n4), .S(p_DIFF[28]) );
  ADDFX1 U6 ( .A(n37), .B(p_A[27]), .CI(n6), .CO(n5), .S(p_DIFF[27]) );
  ADDFX1 U7 ( .A(n38), .B(p_A[26]), .CI(n7), .CO(n6), .S(p_DIFF[26]) );
  ADDFX1 U8 ( .A(n39), .B(p_A[25]), .CI(n8), .CO(n7), .S(p_DIFF[25]) );
  ADDFX1 U9 ( .A(n40), .B(p_A[24]), .CI(n9), .CO(n8), .S(p_DIFF[24]) );
  ADDFX1 U10 ( .A(n41), .B(p_A[23]), .CI(n10), .CO(n9), .S(p_DIFF[23]) );
  ADDFX1 U11 ( .A(n42), .B(p_A[22]), .CI(n11), .CO(n10), .S(p_DIFF[22]) );
  ADDFX1 U12 ( .A(n43), .B(p_A[21]), .CI(n12), .CO(n11), .S(p_DIFF[21]) );
  ADDFX1 U13 ( .A(n44), .B(p_A[20]), .CI(n13), .CO(n12), .S(p_DIFF[20]) );
  ADDFX1 U14 ( .A(n45), .B(p_A[19]), .CI(n14), .CO(n13), .S(p_DIFF[19]) );
  ADDFX1 U16 ( .A(n47), .B(p_A[17]), .CI(n16), .CO(n15), .S(p_DIFF[17]) );
  ADDFX1 U17 ( .A(n48), .B(p_A[16]), .CI(n17), .CO(n16), .S(p_DIFF[16]) );
  ADDFX1 U18 ( .A(n49), .B(p_A[15]), .CI(n18), .CO(n17), .S(p_DIFF[15]) );
  ADDFX1 U19 ( .A(n50), .B(p_A[14]), .CI(n19), .CO(n18), .S(p_DIFF[14]) );
  ADDFX1 U20 ( .A(n51), .B(p_A[13]), .CI(n20), .CO(n19), .S(p_DIFF[13]) );
  ADDFX1 U21 ( .A(n52), .B(p_A[12]), .CI(n21), .CO(n20), .S(p_DIFF[12]) );
  ADDFX1 U22 ( .A(n53), .B(p_A[11]), .CI(n22), .CO(n21), .S(p_DIFF[11]) );
  ADDFX1 U23 ( .A(n54), .B(p_A[10]), .CI(n23), .CO(n22), .S(p_DIFF[10]) );
  ADDFX1 U24 ( .A(n55), .B(p_A[9]), .CI(n24), .CO(n23), .S(p_DIFF[9]) );
  ADDFX1 U25 ( .A(n56), .B(p_A[8]), .CI(n25), .CO(n24), .S(p_DIFF[8]) );
  ADDFX1 U26 ( .A(n57), .B(p_A[7]), .CI(n26), .CO(n25), .S(p_DIFF[7]) );
  ADDFX1 U27 ( .A(n58), .B(p_A[6]), .CI(n27), .CO(n26), .S(p_DIFF[6]) );
  ADDFX1 U28 ( .A(n59), .B(p_A[5]), .CI(n28), .CO(n27), .S(p_DIFF[5]) );
  ADDFX1 U29 ( .A(n60), .B(p_A[4]), .CI(n29), .CO(n28), .S(p_DIFF[4]) );
  ADDFX1 U31 ( .A(n62), .B(p_A[2]), .CI(n31), .CO(n30), .S(p_DIFF[2]) );
  ADDFXL U70 ( .A(n46), .B(p_A[18]), .CI(n15), .CO(n14), .S(p_DIFF[18]) );
  ADDFX1 U71 ( .A(n61), .B(p_A[3]), .CI(n30), .CO(n29), .S(p_DIFF[3]) );
  ADDFXL U72 ( .A(n63), .B(p_A[1]), .CI(n32), .CO(n31), .S(p_DIFF[1]) );
  XNOR2XL U73 ( .A(n1), .B(p_A[32]), .Y(p_DIFF[32]) );
  NAND2BXL U74 ( .AN(p_A[0]), .B(p_B[0]), .Y(n32) );
  INVXL U75 ( .A(p_B[10]), .Y(n54) );
  CLKINVX1 U76 ( .A(p_B[1]), .Y(n63) );
  CLKINVX1 U77 ( .A(p_B[2]), .Y(n62) );
  CLKINVX1 U78 ( .A(p_B[3]), .Y(n61) );
  CLKINVX1 U79 ( .A(p_B[4]), .Y(n60) );
  CLKINVX1 U80 ( .A(p_B[5]), .Y(n59) );
  CLKINVX1 U81 ( .A(p_B[6]), .Y(n58) );
  CLKINVX1 U82 ( .A(p_B[7]), .Y(n57) );
  CLKINVX1 U83 ( .A(p_B[8]), .Y(n56) );
  CLKINVX1 U84 ( .A(p_B[9]), .Y(n55) );
  CLKINVX1 U85 ( .A(p_B[11]), .Y(n53) );
  CLKINVX1 U86 ( .A(p_B[12]), .Y(n52) );
  CLKINVX1 U87 ( .A(p_B[13]), .Y(n51) );
  CLKINVX1 U88 ( .A(p_B[14]), .Y(n50) );
  CLKINVX1 U89 ( .A(p_B[15]), .Y(n49) );
  CLKINVX1 U90 ( .A(p_B[16]), .Y(n48) );
  CLKINVX1 U91 ( .A(p_B[17]), .Y(n47) );
  CLKINVX1 U92 ( .A(p_B[18]), .Y(n46) );
  INVXL U93 ( .A(p_B[19]), .Y(n45) );
  INVXL U94 ( .A(p_B[20]), .Y(n44) );
  INVXL U95 ( .A(p_B[21]), .Y(n43) );
  INVXL U96 ( .A(p_B[22]), .Y(n42) );
  INVXL U97 ( .A(p_B[23]), .Y(n41) );
  INVXL U98 ( .A(p_B[24]), .Y(n40) );
  INVXL U99 ( .A(p_B[25]), .Y(n39) );
  INVXL U100 ( .A(p_B[26]), .Y(n38) );
  INVXL U101 ( .A(p_B[27]), .Y(n37) );
  INVXL U102 ( .A(p_B[28]), .Y(n36) );
  INVXL U103 ( .A(p_B[29]), .Y(n35) );
  INVXL U104 ( .A(p_B[30]), .Y(n34) );
  INVXL U105 ( .A(p_B[31]), .Y(n33) );
  XOR2XL U106 ( .A(p_A[0]), .B(p_B[0]), .Y(p_DIFF[0]) );
endmodule


module sequ_div ( clk, rst_n, divider, dividend, start, quotient, remainder, 
        ready, illegal_divider_zero );
  input [31:0] divider;
  input [31:0] dividend;
  output [31:0] quotient;
  output [31:0] remainder;
  input clk, rst_n, start;
  output ready, illegal_divider_zero;
  wire   n611, n612, n613, n614, n615, n616, n617, n618, n619, n620, n621,
         n622, n623, n624, n625, n626, n627, n628, n629, n630, n631, n632,
         n633, n634, n635, n636, n637, n638, n639, n640, n641, n642, n643,
         n644, n645, n646, n647, n648, n649, n650, n651, n652, n653, n654,
         n655, n656, n657, n658, n659, n660, n661, n662, n663, n664, n665,
         n666, n667, n668, n669, n670, n671, n672, n673, n674, n675, n676, N22,
         N23, N24, N25, N26, N27, N28, N29, N32, N37, N38, N39, N42, N43, N44,
         N45, N47, N48, N49, N52, N57, N58, N59, N62, N63, N64, N66, N67, N68,
         N69, N72, N77, N78, N79, N82, N83, N85, N86, N87, N88, N89, N92, N97,
         N98, N99, N102, N104, N105, N106, N107, N108, N109, N124, N125,
         illegal, N131, N132, N133, N134, N135, N136, N137, N138, N139, N140,
         N141, N146, N148, N149, N152, N153, N154, N155, N156, N157, N161,
         N164, N165, N168, N169, N170, N171, N172, N173, N176, N180, N181,
         N184, N185, N186, N187, N188, N189, N202, N203, N204, N205, N206,
         N207, N208, N209, N210, N211, N212, N213, N214, N215, N216, N217,
         N218, N219, N220, N221, N222, N223, N224, N225, N226, N227, N228,
         N229, N230, N231, N232, N233, N234, N236, N269, N270, N271, N272,
         N273, N275, N276, N277, N278, N279, N280, N281, N282, N283, N284,
         N285, N286, N287, N288, N289, N290, N291, N292, N293, N294, N295,
         N296, N297, N298, N299, N300, N301, N302, N303, N304, N305, N306,
         N307, N308, N309, N310, N311, N312, N313, N314, N315, N316, N317,
         N318, N319, N320, N321, N322, N323, N324, N325, N326, N327, N328,
         N329, N330, N331, N332, N333, N334, N335, N336, N337, N338, N341,
         N342, N343, N344, N345, N412, N413, N415, N416, N417, N418, N419,
         N420, N421, N422, N423, N424, N425, N426, N427, N428, N429, N430,
         N431, N432, N433, N434, N435, N436, N437, N438, N439, N440, N441,
         N442, N443, N444, N445, N446, N447, N448, N450, N451, N452, N453,
         N454, N455, N456, N457, N458, N459, N460, N461, N462, N463, N464,
         N465, N466, N467, N468, N469, N470, N471, N472, N473, N474, N475,
         N476, N477, N478, N479, N480, N481, N482, N483, N484, N487, N488,
         N489, N490, N491, N492, N493, N494, N495, N496, N497, N498, N499,
         N500, N501, N502, N503, N504, N505, N506, N507, N508, N509, N510,
         N511, N512, N513, N514, N515, N516, N517, N520, N521, N522, N523,
         N524, N525, N526, N527, N528, N529, N530, N531, N532, N533, N534,
         N535, N536, N537, N538, N539, N540, N541, N542, N543, N544, N545,
         N546, N547, N548, N549, N197, N196, N195, N194, N193, N192, N118,
         N117, N116, N115, N114, N113, N112, n146, n147, n148, n151, n153,
         n154, n155, n156, n157, n158, n159, n160, n161, n162, n163, n164,
         n165, n166, n167, n168, n169, n170, n171, n172, n173, n174, n175,
         n176, n177, n178, n179, n180, n181, n182, n183, n184, n185, n186,
         n187, n188, n189, n190, n191, n192, n193, n194, n195, n196, n197,
         n198, n199, n200, n201, n202, n203, n204, n205, n206, n207, n208,
         n209, n210, n211, n212, n213, n214, n215, n216, n217, n218, n219,
         n220, n221, n222, n223, n224, n225, n226, n227, n260, n261, n262,
         n263, n264, n265, n266, n267, n268, n269, n270, n271, n272, n273,
         n274, n275, n276, n277, n278, n279, n280, n281, n282, n283, n284,
         n285, n286, n287, n288, n289, n290, n291, n325, n326, n327, n328,
         n329, n330, n331, n332, n333, n334, n335, n336, n337, n338, n339,
         n340, n341, n342, n343, n344, n345, n346, n347, n348, n349, n350,
         n351, n352, n353, n354, n355, n356, n357, n358, n359, n360, n361,
         n362, n363, n364, n365, n366, n367, n368, n369, n370, n371, n374,
         n375, n376, n377, n378, n379, n380, n381, n383, n385, n387, n389,
         n391, n393, n395, n397, n399, n401, n403, n405, n407, n409, n411,
         n413, n415, n417, n419, n421, n423, n425, n427, n429, n431, n433,
         n435, n437, n439, n441, n443, n445, n447, n449, n451, n453, n455,
         n457, n459, n461, n463, n465, n467, n469, n471, n473, n475, n477,
         n479, n481, n483, n485, n487, n489, n491, n493, n495, n497, n499,
         n501, n503, n505, n507, n509, n511, n521, n522, n523, n524, n525,
         n526, n527, n528, n529, n530, n531, n532, n533, n534, n535, n536,
         n537, n538, n539, n540, n541, n608, n609, n610;
  wire   [8:0] cur_state;
  wire   [8:0] next_state;
  wire   [4:0] shift_count;
  wire   [63:0] remainder_quotient;

  OR2XL C2205 ( .A(n532), .B(N196), .Y(N197) );
  OR2XL C2204 ( .A(n531), .B(N195), .Y(N196) );
  OR2XL C2203 ( .A(n533), .B(N194), .Y(N195) );
  OR2XL C2202 ( .A(n525), .B(N193), .Y(N194) );
  OR2XL C2201 ( .A(n534), .B(N192), .Y(N193) );
  OR2XL C2200 ( .A(n535), .B(N135), .Y(N192) );
  OR2XL C2155 ( .A(n538), .B(N117), .Y(N118) );
  OR2XL C2154 ( .A(n530), .B(N116), .Y(N117) );
  OR2XL C2153 ( .A(n528), .B(N115), .Y(N116) );
  OR2XL C2152 ( .A(n540), .B(N114), .Y(N115) );
  OR2XL C2151 ( .A(n539), .B(N113), .Y(N114) );
  OR2XL C2150 ( .A(n529), .B(N112), .Y(N113) );
  OR2XL C2149 ( .A(n526), .B(n537), .Y(N112) );
  INVXL I_7 ( .A(N234), .Y(N236) );
  OR2XL C215 ( .A(N132), .B(N133), .Y(N134) );
  OR2XL C1959 ( .A(dividend[1]), .B(N548), .Y(N549) );
  OR2XL C1958 ( .A(dividend[2]), .B(N547), .Y(N548) );
  OR2XL C1957 ( .A(dividend[3]), .B(N546), .Y(N547) );
  OR2XL C1956 ( .A(dividend[4]), .B(N545), .Y(N546) );
  OR2XL C1955 ( .A(dividend[5]), .B(N544), .Y(N545) );
  OR2XL C1954 ( .A(dividend[6]), .B(N543), .Y(N544) );
  OR2XL C1953 ( .A(dividend[7]), .B(N542), .Y(N543) );
  OR2XL C1952 ( .A(dividend[8]), .B(N541), .Y(N542) );
  OR2XL C1951 ( .A(dividend[9]), .B(N540), .Y(N541) );
  OR2XL C1950 ( .A(dividend[10]), .B(N539), .Y(N540) );
  OR2XL C1949 ( .A(dividend[11]), .B(N538), .Y(N539) );
  OR2XL C1948 ( .A(dividend[12]), .B(N537), .Y(N538) );
  OR2XL C1947 ( .A(dividend[13]), .B(N536), .Y(N537) );
  OR2XL C1946 ( .A(dividend[14]), .B(N535), .Y(N536) );
  OR2XL C1945 ( .A(dividend[15]), .B(N534), .Y(N535) );
  OR2XL C1944 ( .A(dividend[16]), .B(N533), .Y(N534) );
  OR2XL C1943 ( .A(dividend[17]), .B(N532), .Y(N533) );
  OR2XL C1942 ( .A(dividend[18]), .B(N531), .Y(N532) );
  OR2XL C1941 ( .A(dividend[19]), .B(N530), .Y(N531) );
  OR2XL C1940 ( .A(dividend[20]), .B(N529), .Y(N530) );
  OR2XL C1939 ( .A(dividend[21]), .B(N528), .Y(N529) );
  OR2XL C1938 ( .A(dividend[22]), .B(N527), .Y(N528) );
  OR2XL C1937 ( .A(dividend[23]), .B(N526), .Y(N527) );
  OR2XL C1936 ( .A(dividend[24]), .B(N525), .Y(N526) );
  OR2XL C1935 ( .A(dividend[25]), .B(N524), .Y(N525) );
  OR2XL C1934 ( .A(dividend[26]), .B(N523), .Y(N524) );
  OR2XL C1933 ( .A(dividend[27]), .B(N522), .Y(N523) );
  OR2XL C1932 ( .A(dividend[28]), .B(N521), .Y(N522) );
  OR2XL C1931 ( .A(dividend[29]), .B(N520), .Y(N521) );
  OR2XL C1930 ( .A(dividend[30]), .B(dividend[31]), .Y(N520) );
  OR2XL C1908 ( .A(divider[20]), .B(N497), .Y(N498) );
  OR2XL C1907 ( .A(divider[21]), .B(N496), .Y(N497) );
  OR2XL C1906 ( .A(divider[22]), .B(N495), .Y(N496) );
  OR2XL C1905 ( .A(divider[23]), .B(N494), .Y(N495) );
  OR2XL C1904 ( .A(divider[24]), .B(N493), .Y(N494) );
  OR2XL C1903 ( .A(divider[25]), .B(N492), .Y(N493) );
  OR2XL C1902 ( .A(divider[26]), .B(N491), .Y(N492) );
  OR2XL C1901 ( .A(divider[27]), .B(N490), .Y(N491) );
  OR2XL C1900 ( .A(divider[28]), .B(N489), .Y(N490) );
  OR2XL C1899 ( .A(divider[29]), .B(N488), .Y(N489) );
  OR2XL C1898 ( .A(divider[30]), .B(divider[31]), .Y(N488) );
  INVXL I_1 ( .A(divider[0]), .Y(N487) );
  OR2XL C1894 ( .A(shift_count[1]), .B(N483), .Y(N484) );
  OR2XL C1893 ( .A(shift_count[2]), .B(N482), .Y(N483) );
  OR2XL C1892 ( .A(shift_count[3]), .B(shift_count[4]), .Y(N482) );
  OR2XL C277 ( .A(N186), .B(N187), .Y(N189) );
  OR2XL C276 ( .A(N184), .B(N185), .Y(N188) );
  OR2XL C275 ( .A(cur_state[2]), .B(cur_state[1]), .Y(N187) );
  OR2XL C274 ( .A(cur_state[4]), .B(cur_state[3]), .Y(N186) );
  OR2XL C273 ( .A(cur_state[6]), .B(cur_state[5]), .Y(N185) );
  OR2XL C272 ( .A(N102), .B(cur_state[7]), .Y(N184) );
  OR2XL C268 ( .A(N186), .B(N187), .Y(N181) );
  OR2XL C267 ( .A(N176), .B(N185), .Y(N180) );
  OR2XL C263 ( .A(cur_state[8]), .B(N92), .Y(N176) );
  OR2XL C259 ( .A(N170), .B(N171), .Y(N173) );
  OR2XL C258 ( .A(N168), .B(N169), .Y(N172) );
  OR2XL C257 ( .A(cur_state[2]), .B(cur_state[1]), .Y(N171) );
  OR2XL C256 ( .A(cur_state[4]), .B(cur_state[3]), .Y(N170) );
  OR2XL C255 ( .A(N82), .B(cur_state[5]), .Y(N169) );
  OR2XL C254 ( .A(cur_state[8]), .B(cur_state[7]), .Y(N168) );
  OR2XL C250 ( .A(N170), .B(N171), .Y(N165) );
  OR2XL C249 ( .A(N168), .B(N161), .Y(N164) );
  OR2XL C246 ( .A(cur_state[6]), .B(N72), .Y(N161) );
  OR2XL C241 ( .A(N154), .B(N155), .Y(N157) );
  OR2XL C240 ( .A(N152), .B(N153), .Y(N156) );
  OR2XL C239 ( .A(cur_state[2]), .B(cur_state[1]), .Y(N155) );
  OR2XL C238 ( .A(N62), .B(cur_state[3]), .Y(N154) );
  OR2XL C237 ( .A(cur_state[6]), .B(cur_state[5]), .Y(N153) );
  OR2XL C236 ( .A(cur_state[8]), .B(cur_state[7]), .Y(N152) );
  OR2XL C232 ( .A(N146), .B(N155), .Y(N149) );
  OR2XL C231 ( .A(N152), .B(N153), .Y(N148) );
  OR2XL C229 ( .A(cur_state[4]), .B(N52), .Y(N146) );
  OR2XL C223 ( .A(N138), .B(N139), .Y(N141) );
  OR2XL C222 ( .A(N136), .B(N137), .Y(N140) );
  OR2XL C221 ( .A(N42), .B(cur_state[1]), .Y(N139) );
  OR2XL C220 ( .A(cur_state[4]), .B(cur_state[3]), .Y(N138) );
  OR2XL C219 ( .A(cur_state[6]), .B(cur_state[5]), .Y(N137) );
  OR2XL C218 ( .A(cur_state[8]), .B(cur_state[7]), .Y(N136) );
  OR2XL C214 ( .A(N138), .B(N131), .Y(N133) );
  OR2XL C213 ( .A(N136), .B(N137), .Y(N132) );
  OR2XL C212 ( .A(cur_state[2]), .B(N32), .Y(N131) );
  OR2XL C114 ( .A(N107), .B(N108), .Y(N109) );
  OR2XL C113 ( .A(N105), .B(N106), .Y(N108) );
  OR2XL C112 ( .A(N184), .B(N104), .Y(N107) );
  OR2XL C111 ( .A(cur_state[2]), .B(cur_state[1]), .Y(N106) );
  OR2XL C110 ( .A(cur_state[4]), .B(cur_state[3]), .Y(N105) );
  OR2XL C109 ( .A(cur_state[6]), .B(cur_state[5]), .Y(N104) );
  OR2XL C104 ( .A(N97), .B(N98), .Y(N99) );
  OR2XL C103 ( .A(N105), .B(N106), .Y(N98) );
  OR2XL C102 ( .A(N176), .B(N104), .Y(N97) );
  OR2XL C94 ( .A(N87), .B(N88), .Y(N89) );
  OR2XL C93 ( .A(N85), .B(N86), .Y(N88) );
  OR2XL C92 ( .A(N83), .B(N169), .Y(N87) );
  OR2XL C91 ( .A(cur_state[2]), .B(cur_state[1]), .Y(N86) );
  OR2XL C90 ( .A(cur_state[4]), .B(cur_state[3]), .Y(N85) );
  OR2XL C88 ( .A(cur_state[8]), .B(cur_state[7]), .Y(N83) );
  OR2XL C84 ( .A(N77), .B(N78), .Y(N79) );
  OR2XL C83 ( .A(N85), .B(N86), .Y(N78) );
  OR2XL C82 ( .A(N83), .B(N161), .Y(N77) );
  OR2XL C74 ( .A(N67), .B(N68), .Y(N69) );
  OR2XL C73 ( .A(N154), .B(N66), .Y(N68) );
  OR2XL C72 ( .A(N63), .B(N64), .Y(N67) );
  OR2XL C71 ( .A(cur_state[2]), .B(cur_state[1]), .Y(N66) );
  OR2XL C69 ( .A(cur_state[6]), .B(cur_state[5]), .Y(N64) );
  OR2XL C68 ( .A(cur_state[8]), .B(cur_state[7]), .Y(N63) );
  OR2XL C64 ( .A(N57), .B(N58), .Y(N59) );
  OR2XL C63 ( .A(N146), .B(N66), .Y(N58) );
  OR2XL C62 ( .A(N63), .B(N64), .Y(N57) );
  OR2XL C54 ( .A(N47), .B(N48), .Y(N49) );
  OR2XL C53 ( .A(N45), .B(N139), .Y(N48) );
  OR2XL C52 ( .A(N43), .B(N44), .Y(N47) );
  OR2XL C50 ( .A(cur_state[4]), .B(cur_state[3]), .Y(N45) );
  OR2XL C49 ( .A(cur_state[6]), .B(cur_state[5]), .Y(N44) );
  OR2XL C48 ( .A(cur_state[8]), .B(cur_state[7]), .Y(N43) );
  OR2XL C44 ( .A(N37), .B(N38), .Y(N39) );
  OR2XL C43 ( .A(N45), .B(N131), .Y(N38) );
  OR2XL C42 ( .A(N43), .B(N44), .Y(N37) );
  OR2XL C34 ( .A(N27), .B(N28), .Y(N29) );
  OR2XL C33 ( .A(N25), .B(N26), .Y(N28) );
  OR2XL C32 ( .A(N23), .B(N24), .Y(N27) );
  OR2XL C31 ( .A(cur_state[2]), .B(cur_state[1]), .Y(N26) );
  OR2XL C30 ( .A(cur_state[4]), .B(cur_state[3]), .Y(N25) );
  OR2XL C29 ( .A(cur_state[6]), .B(cur_state[5]), .Y(N24) );
  OR2XL C28 ( .A(cur_state[8]), .B(cur_state[7]), .Y(N23) );
  NAND3XL U148 ( .A(n146), .B(n147), .C(n148), .Y(next_state[8]) );
  AOI22XL U149 ( .A0(n523), .A1(n529), .B0(n377), .B1(n540), .Y(n148) );
  AOI22XL U150 ( .A0(n521), .A1(n539), .B0(n530), .B1(N124), .Y(n147) );
  AOI22XL U152 ( .A0(n538), .A1(n541), .B0(n528), .B1(n522), .Y(n146) );
  AO2B2XL U153 ( .B0(N125), .B1(n530), .A0(n538), .A1N(n541), .Y(next_state[7]) );
  NOR2BXL U154 ( .AN(n528), .B(n522), .Y(next_state[6]) );
  NOR2BXL U155 ( .AN(n540), .B(n377), .Y(next_state[5]) );
  NOR2BXL U156 ( .AN(n539), .B(n521), .Y(next_state[4]) );
  NOR2BXL U157 ( .AN(n529), .B(n523), .Y(next_state[3]) );
  AND2XL U158 ( .A(n537), .B(start), .Y(next_state[1]) );
  OAI2B1XL U159 ( .A1N(n537), .A0(start), .B0(n151), .Y(next_state[0]) );
  NOR2XL U160 ( .A(n527), .B(n524), .Y(n151) );
  AND2XL U161 ( .A(remainder_quotient[31]), .B(n379), .Y(N481) );
  AND2XL U162 ( .A(remainder_quotient[30]), .B(n379), .Y(N480) );
  AND2XL U163 ( .A(remainder_quotient[29]), .B(n379), .Y(N479) );
  AND2XL U164 ( .A(remainder_quotient[28]), .B(n379), .Y(N478) );
  AND2XL U165 ( .A(remainder_quotient[27]), .B(n379), .Y(N477) );
  AND2XL U166 ( .A(remainder_quotient[26]), .B(n379), .Y(N476) );
  AND2XL U167 ( .A(remainder_quotient[25]), .B(n379), .Y(N475) );
  AND2XL U168 ( .A(remainder_quotient[24]), .B(n379), .Y(N474) );
  AND2XL U169 ( .A(remainder_quotient[23]), .B(n379), .Y(N473) );
  AND2XL U170 ( .A(remainder_quotient[22]), .B(n379), .Y(N472) );
  AND2XL U171 ( .A(remainder_quotient[21]), .B(n379), .Y(N471) );
  AND2XL U172 ( .A(remainder_quotient[20]), .B(n379), .Y(N470) );
  AND2XL U173 ( .A(remainder_quotient[19]), .B(n379), .Y(N469) );
  AND2XL U174 ( .A(remainder_quotient[18]), .B(n379), .Y(N468) );
  AND2XL U175 ( .A(remainder_quotient[17]), .B(n379), .Y(N467) );
  AND2XL U176 ( .A(remainder_quotient[16]), .B(n379), .Y(N466) );
  AND2XL U177 ( .A(remainder_quotient[15]), .B(n379), .Y(N465) );
  AND2XL U178 ( .A(remainder_quotient[14]), .B(n379), .Y(N464) );
  AND2XL U179 ( .A(remainder_quotient[13]), .B(n379), .Y(N463) );
  AND2XL U180 ( .A(remainder_quotient[12]), .B(n379), .Y(N462) );
  AND2XL U181 ( .A(remainder_quotient[11]), .B(n379), .Y(N461) );
  AND2XL U182 ( .A(remainder_quotient[10]), .B(n379), .Y(N460) );
  AND2XL U183 ( .A(remainder_quotient[9]), .B(n379), .Y(N459) );
  AND2XL U184 ( .A(remainder_quotient[8]), .B(n379), .Y(N458) );
  AND2XL U185 ( .A(remainder_quotient[7]), .B(n379), .Y(N457) );
  AND2XL U186 ( .A(remainder_quotient[6]), .B(n379), .Y(N456) );
  AND2XL U187 ( .A(remainder_quotient[5]), .B(n379), .Y(N455) );
  AND2XL U188 ( .A(remainder_quotient[4]), .B(n379), .Y(N454) );
  AND2XL U189 ( .A(remainder_quotient[3]), .B(n379), .Y(N453) );
  AND2XL U190 ( .A(remainder_quotient[2]), .B(n379), .Y(N452) );
  AND2XL U191 ( .A(remainder_quotient[1]), .B(n379), .Y(N451) );
  AND2XL U192 ( .A(remainder_quotient[0]), .B(n379), .Y(N450) );
  AND2XL U194 ( .A(n379), .B(remainder_quotient[63]), .Y(N448) );
  AND2XL U195 ( .A(remainder_quotient[62]), .B(n379), .Y(N447) );
  AND2XL U196 ( .A(remainder_quotient[61]), .B(n379), .Y(N446) );
  AND2XL U197 ( .A(remainder_quotient[60]), .B(n379), .Y(N445) );
  AND2XL U198 ( .A(remainder_quotient[59]), .B(n379), .Y(N444) );
  AND2XL U199 ( .A(remainder_quotient[58]), .B(n379), .Y(N443) );
  AND2XL U200 ( .A(remainder_quotient[57]), .B(n379), .Y(N442) );
  AND2XL U201 ( .A(remainder_quotient[56]), .B(n379), .Y(N441) );
  AND2XL U202 ( .A(remainder_quotient[55]), .B(n379), .Y(N440) );
  AND2XL U203 ( .A(remainder_quotient[54]), .B(n379), .Y(N439) );
  AND2XL U204 ( .A(remainder_quotient[53]), .B(n379), .Y(N438) );
  AND2XL U205 ( .A(remainder_quotient[52]), .B(n379), .Y(N437) );
  AND2XL U206 ( .A(remainder_quotient[51]), .B(n379), .Y(N436) );
  AND2XL U207 ( .A(remainder_quotient[50]), .B(n379), .Y(N435) );
  AND2XL U208 ( .A(remainder_quotient[49]), .B(n379), .Y(N434) );
  AND2XL U209 ( .A(remainder_quotient[48]), .B(n379), .Y(N433) );
  AND2XL U210 ( .A(remainder_quotient[47]), .B(n379), .Y(N432) );
  AND2XL U211 ( .A(remainder_quotient[46]), .B(n379), .Y(N431) );
  AND2XL U212 ( .A(remainder_quotient[45]), .B(n379), .Y(N430) );
  AND2XL U213 ( .A(remainder_quotient[44]), .B(n379), .Y(N429) );
  AND2XL U214 ( .A(remainder_quotient[43]), .B(n379), .Y(N428) );
  AND2XL U215 ( .A(remainder_quotient[42]), .B(n379), .Y(N427) );
  AND2XL U216 ( .A(remainder_quotient[41]), .B(n379), .Y(N426) );
  AND2XL U217 ( .A(remainder_quotient[40]), .B(n379), .Y(N425) );
  AND2XL U218 ( .A(remainder_quotient[39]), .B(n379), .Y(N424) );
  AND2XL U219 ( .A(remainder_quotient[38]), .B(n379), .Y(N423) );
  AND2XL U220 ( .A(remainder_quotient[37]), .B(n379), .Y(N422) );
  AND2XL U221 ( .A(remainder_quotient[36]), .B(n379), .Y(N421) );
  AND2XL U222 ( .A(remainder_quotient[35]), .B(n379), .Y(N420) );
  AND2XL U223 ( .A(remainder_quotient[34]), .B(n379), .Y(N419) );
  AND2XL U224 ( .A(remainder_quotient[33]), .B(n379), .Y(N418) );
  AND2XL U225 ( .A(remainder_quotient[32]), .B(n379), .Y(N417) );
  AOI21XL U226 ( .A0(N134), .A1(n153), .B0(cur_state[0]), .Y(N416) );
  NOR2XL U228 ( .A(cur_state[0]), .B(n155), .Y(N415) );
  AOI21XL U229 ( .A0(n535), .A1(n523), .B0(N135), .Y(n155) );
  AOI21XL U230 ( .A0(n533), .A1(n522), .B0(n156), .Y(n154) );
  OAI2B11XL U231 ( .A1N(n531), .A0(N125), .B0(n153), .C0(n157), .Y(n156) );
  AOI22XL U232 ( .A0(n521), .A1(n534), .B0(n377), .B1(n525), .Y(n157) );
  AND2XL U234 ( .A(n379), .B(illegal), .Y(N412) );
  OAI2BB1XL U236 ( .A0N(n532), .A1N(N273), .B0(N134), .Y(N345) );
  OAI2BB1XL U237 ( .A0N(n532), .A1N(N272), .B0(N134), .Y(N344) );
  OAI2BB1XL U238 ( .A0N(n532), .A1N(N271), .B0(N134), .Y(N343) );
  OAI2BB1XL U239 ( .A0N(n532), .A1N(N270), .B0(N134), .Y(N342) );
  OAI2BB1XL U240 ( .A0N(n532), .A1N(N269), .B0(N134), .Y(N341) );
  CLKINVX1 U241 ( .A(n158), .Y(N338) );
  AOI222XL U242 ( .A0(n531), .A1(dividend[31]), .B0(n159), .B1(N233), .C0(n160), .C1(remainder_quotient[62]), .Y(n158) );
  CLKINVX1 U243 ( .A(n161), .Y(N337) );
  AOI222XL U244 ( .A0(n531), .A1(dividend[30]), .B0(n159), .B1(N232), .C0(n160), .C1(remainder_quotient[61]), .Y(n161) );
  CLKINVX1 U245 ( .A(n162), .Y(N336) );
  AOI222XL U246 ( .A0(n531), .A1(dividend[29]), .B0(n159), .B1(N231), .C0(n160), .C1(remainder_quotient[60]), .Y(n162) );
  CLKINVX1 U247 ( .A(n163), .Y(N335) );
  AOI222XL U248 ( .A0(n531), .A1(dividend[28]), .B0(n159), .B1(N230), .C0(n160), .C1(remainder_quotient[59]), .Y(n163) );
  CLKINVX1 U249 ( .A(n164), .Y(N334) );
  AOI222XL U250 ( .A0(n531), .A1(dividend[27]), .B0(n159), .B1(N229), .C0(n160), .C1(remainder_quotient[58]), .Y(n164) );
  CLKINVX1 U251 ( .A(n165), .Y(N333) );
  AOI222XL U252 ( .A0(n531), .A1(dividend[26]), .B0(n159), .B1(N228), .C0(n160), .C1(remainder_quotient[57]), .Y(n165) );
  CLKINVX1 U253 ( .A(n166), .Y(N332) );
  AOI222XL U254 ( .A0(n531), .A1(dividend[25]), .B0(n159), .B1(N227), .C0(n160), .C1(remainder_quotient[56]), .Y(n166) );
  AOI222XL U256 ( .A0(n531), .A1(dividend[24]), .B0(n159), .B1(N226), .C0(n160), .C1(remainder_quotient[55]), .Y(n167) );
  CLKINVX1 U257 ( .A(n168), .Y(N330) );
  AOI222XL U258 ( .A0(n531), .A1(dividend[23]), .B0(n159), .B1(N225), .C0(n160), .C1(remainder_quotient[54]), .Y(n168) );
  CLKINVX1 U259 ( .A(n169), .Y(N329) );
  AOI222XL U260 ( .A0(n531), .A1(dividend[22]), .B0(n159), .B1(N224), .C0(n160), .C1(remainder_quotient[53]), .Y(n169) );
  CLKINVX1 U261 ( .A(n170), .Y(N328) );
  AOI222XL U262 ( .A0(n531), .A1(dividend[21]), .B0(n159), .B1(N223), .C0(n160), .C1(remainder_quotient[52]), .Y(n170) );
  CLKINVX1 U263 ( .A(n171), .Y(N327) );
  AOI222XL U264 ( .A0(n531), .A1(dividend[20]), .B0(n159), .B1(N222), .C0(n160), .C1(remainder_quotient[51]), .Y(n171) );
  CLKINVX1 U265 ( .A(n172), .Y(N326) );
  AOI222XL U266 ( .A0(n531), .A1(dividend[19]), .B0(n159), .B1(N221), .C0(n160), .C1(remainder_quotient[50]), .Y(n172) );
  CLKINVX1 U267 ( .A(n173), .Y(N325) );
  AOI222XL U268 ( .A0(n531), .A1(dividend[18]), .B0(n159), .B1(N220), .C0(n160), .C1(remainder_quotient[49]), .Y(n173) );
  CLKINVX1 U269 ( .A(n174), .Y(N324) );
  AOI222XL U270 ( .A0(n531), .A1(dividend[17]), .B0(n159), .B1(N219), .C0(n160), .C1(remainder_quotient[48]), .Y(n174) );
  CLKINVX1 U271 ( .A(n175), .Y(N323) );
  AOI222XL U272 ( .A0(n531), .A1(dividend[16]), .B0(n159), .B1(N218), .C0(n160), .C1(remainder_quotient[47]), .Y(n175) );
  CLKINVX1 U273 ( .A(n176), .Y(N322) );
  AOI222XL U274 ( .A0(n531), .A1(dividend[15]), .B0(n159), .B1(N217), .C0(n160), .C1(remainder_quotient[46]), .Y(n176) );
  CLKINVX1 U275 ( .A(n177), .Y(N321) );
  AOI222XL U276 ( .A0(n531), .A1(dividend[14]), .B0(n159), .B1(N216), .C0(n160), .C1(remainder_quotient[45]), .Y(n177) );
  CLKINVX1 U277 ( .A(n178), .Y(N320) );
  AOI222XL U278 ( .A0(n531), .A1(dividend[13]), .B0(n159), .B1(N215), .C0(n160), .C1(remainder_quotient[44]), .Y(n178) );
  CLKINVX1 U279 ( .A(n179), .Y(N319) );
  AOI222XL U280 ( .A0(n531), .A1(dividend[12]), .B0(n159), .B1(N214), .C0(n160), .C1(remainder_quotient[43]), .Y(n179) );
  CLKINVX1 U281 ( .A(n180), .Y(N318) );
  AOI222XL U282 ( .A0(n531), .A1(dividend[11]), .B0(n159), .B1(N213), .C0(n160), .C1(remainder_quotient[42]), .Y(n180) );
  CLKINVX1 U283 ( .A(n181), .Y(N317) );
  AOI222XL U284 ( .A0(n531), .A1(dividend[10]), .B0(n159), .B1(N212), .C0(n160), .C1(remainder_quotient[41]), .Y(n181) );
  AOI222XL U286 ( .A0(n531), .A1(dividend[9]), .B0(n159), .B1(N211), .C0(n160), 
        .C1(remainder_quotient[40]), .Y(n182) );
  CLKINVX1 U287 ( .A(n183), .Y(N315) );
  AOI222XL U288 ( .A0(n531), .A1(dividend[8]), .B0(n159), .B1(N210), .C0(n160), 
        .C1(remainder_quotient[39]), .Y(n183) );
  CLKINVX1 U289 ( .A(n184), .Y(N314) );
  AOI222XL U290 ( .A0(n531), .A1(dividend[7]), .B0(n159), .B1(N209), .C0(n160), 
        .C1(remainder_quotient[38]), .Y(n184) );
  CLKINVX1 U291 ( .A(n185), .Y(N313) );
  AOI222XL U292 ( .A0(n531), .A1(dividend[6]), .B0(n159), .B1(N208), .C0(n160), 
        .C1(remainder_quotient[37]), .Y(n185) );
  CLKINVX1 U293 ( .A(n186), .Y(N312) );
  AOI222XL U294 ( .A0(n531), .A1(dividend[5]), .B0(n159), .B1(N207), .C0(n160), 
        .C1(remainder_quotient[36]), .Y(n186) );
  CLKINVX1 U295 ( .A(n187), .Y(N311) );
  AOI222XL U296 ( .A0(n531), .A1(dividend[4]), .B0(n159), .B1(N206), .C0(n160), 
        .C1(remainder_quotient[35]), .Y(n187) );
  CLKINVX1 U297 ( .A(n188), .Y(N310) );
  AOI222XL U298 ( .A0(n531), .A1(dividend[3]), .B0(n159), .B1(N205), .C0(n160), 
        .C1(remainder_quotient[34]), .Y(n188) );
  CLKINVX1 U299 ( .A(n189), .Y(N309) );
  AOI222XL U300 ( .A0(n531), .A1(dividend[2]), .B0(n159), .B1(N204), .C0(n160), 
        .C1(remainder_quotient[33]), .Y(n189) );
  CLKINVX1 U301 ( .A(n190), .Y(N308) );
  AOI222XL U302 ( .A0(n531), .A1(dividend[1]), .B0(n159), .B1(N203), .C0(n160), 
        .C1(remainder_quotient[32]), .Y(n190) );
  AOI222XL U304 ( .A0(n531), .A1(dividend[0]), .B0(n159), .B1(N202), .C0(
        remainder_quotient[31]), .C1(n160), .Y(n191) );
  NOR2X1 U305 ( .A(N236), .B(n153), .Y(n160) );
  AO22XL U306 ( .A0(n532), .A1(remainder_quotient[30]), .B0(dividend[31]), 
        .B1(n192), .Y(N306) );
  AO22XL U307 ( .A0(n532), .A1(remainder_quotient[29]), .B0(dividend[30]), 
        .B1(n192), .Y(N305) );
  AO22XL U308 ( .A0(n532), .A1(remainder_quotient[28]), .B0(dividend[29]), 
        .B1(n192), .Y(N304) );
  AO22XL U309 ( .A0(n532), .A1(remainder_quotient[27]), .B0(dividend[28]), 
        .B1(n192), .Y(N303) );
  AO22XL U310 ( .A0(n532), .A1(remainder_quotient[26]), .B0(dividend[27]), 
        .B1(n192), .Y(N302) );
  AO22XL U311 ( .A0(n532), .A1(remainder_quotient[25]), .B0(dividend[26]), 
        .B1(n192), .Y(N301) );
  AO22XL U312 ( .A0(n532), .A1(remainder_quotient[24]), .B0(dividend[25]), 
        .B1(n192), .Y(N300) );
  AO22XL U313 ( .A0(n532), .A1(remainder_quotient[23]), .B0(dividend[24]), 
        .B1(n192), .Y(N299) );
  AO22XL U314 ( .A0(n532), .A1(remainder_quotient[22]), .B0(dividend[23]), 
        .B1(n192), .Y(N298) );
  AO22XL U315 ( .A0(n532), .A1(remainder_quotient[21]), .B0(dividend[22]), 
        .B1(n192), .Y(N297) );
  AO22XL U316 ( .A0(n532), .A1(remainder_quotient[20]), .B0(dividend[21]), 
        .B1(n192), .Y(N296) );
  AO22XL U317 ( .A0(n532), .A1(remainder_quotient[19]), .B0(dividend[20]), 
        .B1(n192), .Y(N295) );
  AO22XL U318 ( .A0(n532), .A1(remainder_quotient[18]), .B0(dividend[19]), 
        .B1(n192), .Y(N294) );
  AO22XL U319 ( .A0(n532), .A1(remainder_quotient[17]), .B0(dividend[18]), 
        .B1(n192), .Y(N293) );
  AO22XL U320 ( .A0(n532), .A1(remainder_quotient[16]), .B0(dividend[17]), 
        .B1(n192), .Y(N292) );
  AO22XL U321 ( .A0(n532), .A1(remainder_quotient[15]), .B0(dividend[16]), 
        .B1(n192), .Y(N291) );
  AO22XL U322 ( .A0(n532), .A1(remainder_quotient[14]), .B0(dividend[15]), 
        .B1(n192), .Y(N290) );
  AO22XL U323 ( .A0(n532), .A1(remainder_quotient[13]), .B0(dividend[14]), 
        .B1(n192), .Y(N289) );
  AO22XL U324 ( .A0(n532), .A1(remainder_quotient[12]), .B0(dividend[13]), 
        .B1(n192), .Y(N288) );
  AO22XL U325 ( .A0(n532), .A1(remainder_quotient[11]), .B0(dividend[12]), 
        .B1(n192), .Y(N287) );
  AO22XL U326 ( .A0(n532), .A1(remainder_quotient[10]), .B0(dividend[11]), 
        .B1(n192), .Y(N286) );
  AO22XL U327 ( .A0(n532), .A1(remainder_quotient[9]), .B0(dividend[10]), .B1(
        n192), .Y(N285) );
  AO22XL U328 ( .A0(n532), .A1(remainder_quotient[8]), .B0(dividend[9]), .B1(
        n192), .Y(N284) );
  AO22XL U329 ( .A0(n532), .A1(remainder_quotient[7]), .B0(dividend[8]), .B1(
        n192), .Y(N283) );
  AO22XL U330 ( .A0(n532), .A1(remainder_quotient[6]), .B0(dividend[7]), .B1(
        n192), .Y(N282) );
  AO22XL U331 ( .A0(n532), .A1(remainder_quotient[5]), .B0(dividend[6]), .B1(
        n192), .Y(N281) );
  AO22XL U332 ( .A0(n532), .A1(remainder_quotient[4]), .B0(dividend[5]), .B1(
        n192), .Y(N280) );
  AO22XL U333 ( .A0(n532), .A1(remainder_quotient[3]), .B0(dividend[4]), .B1(
        n192), .Y(N279) );
  AO22XL U334 ( .A0(n532), .A1(remainder_quotient[2]), .B0(dividend[3]), .B1(
        n192), .Y(N278) );
  AO22XL U335 ( .A0(n532), .A1(remainder_quotient[1]), .B0(dividend[2]), .B1(
        n192), .Y(N277) );
  AO22XL U336 ( .A0(n532), .A1(remainder_quotient[0]), .B0(dividend[1]), .B1(
        n192), .Y(N276) );
  CLKINVX1 U337 ( .A(n193), .Y(N275) );
  NOR2BX1 U339 ( .AN(N236), .B(n153), .Y(n159) );
  INVXL U340 ( .A(n532), .Y(n153) );
  NAND2BX1 U341 ( .AN(n525), .B(N134), .Y(n192) );
  MX2XL U343 ( .A(shift_count[0]), .B(N341), .S0(N416), .Y(n329) );
  MX2XL U344 ( .A(shift_count[4]), .B(N345), .S0(N416), .Y(n328) );
  MX2XL U345 ( .A(shift_count[1]), .B(N342), .S0(N416), .Y(n327) );
  MX2XL U346 ( .A(shift_count[2]), .B(N343), .S0(N416), .Y(n326) );
  MX2XL U347 ( .A(shift_count[3]), .B(N344), .S0(N416), .Y(n325) );
  MX2XL U348 ( .A(illegal), .B(n535), .S0(N415), .Y(n511) );
  MX2XL U349 ( .A(remainder_quotient[0]), .B(N275), .S0(n380), .Y(n447) );
  MX2XL U350 ( .A(remainder_quotient[1]), .B(N276), .S0(n380), .Y(n449) );
  MX2XL U351 ( .A(remainder_quotient[2]), .B(N277), .S0(n380), .Y(n451) );
  MX2XL U352 ( .A(remainder_quotient[3]), .B(N278), .S0(n380), .Y(n453) );
  MX2XL U353 ( .A(remainder_quotient[4]), .B(N279), .S0(n380), .Y(n455) );
  MX2XL U354 ( .A(remainder_quotient[5]), .B(N280), .S0(n380), .Y(n457) );
  MX2XL U355 ( .A(remainder_quotient[6]), .B(N281), .S0(n380), .Y(n459) );
  MX2XL U356 ( .A(remainder_quotient[7]), .B(N282), .S0(n380), .Y(n461) );
  MX2XL U357 ( .A(remainder_quotient[8]), .B(N283), .S0(n380), .Y(n463) );
  MX2XL U358 ( .A(remainder_quotient[9]), .B(N284), .S0(n380), .Y(n465) );
  MX2XL U359 ( .A(remainder_quotient[10]), .B(N285), .S0(n380), .Y(n467) );
  MX2XL U360 ( .A(remainder_quotient[11]), .B(N286), .S0(n380), .Y(n469) );
  MX2XL U361 ( .A(remainder_quotient[12]), .B(N287), .S0(n380), .Y(n471) );
  MX2XL U362 ( .A(remainder_quotient[13]), .B(N288), .S0(n380), .Y(n473) );
  MX2XL U363 ( .A(remainder_quotient[14]), .B(N289), .S0(n380), .Y(n475) );
  MX2XL U364 ( .A(remainder_quotient[15]), .B(N290), .S0(n380), .Y(n477) );
  MX2XL U365 ( .A(remainder_quotient[16]), .B(N291), .S0(n380), .Y(n479) );
  MX2XL U366 ( .A(remainder_quotient[17]), .B(N292), .S0(n380), .Y(n481) );
  MX2XL U367 ( .A(remainder_quotient[18]), .B(N293), .S0(n380), .Y(n483) );
  MX2XL U368 ( .A(remainder_quotient[19]), .B(N294), .S0(n380), .Y(n485) );
  MX2XL U369 ( .A(remainder_quotient[20]), .B(N295), .S0(n380), .Y(n487) );
  MX2XL U370 ( .A(remainder_quotient[21]), .B(N296), .S0(n380), .Y(n489) );
  MX2XL U371 ( .A(remainder_quotient[22]), .B(N297), .S0(n380), .Y(n491) );
  MX2XL U372 ( .A(remainder_quotient[23]), .B(N298), .S0(n380), .Y(n493) );
  MX2XL U373 ( .A(remainder_quotient[24]), .B(N299), .S0(n380), .Y(n495) );
  MX2XL U374 ( .A(remainder_quotient[25]), .B(N300), .S0(n380), .Y(n497) );
  MX2XL U375 ( .A(remainder_quotient[26]), .B(N301), .S0(n380), .Y(n499) );
  MX2XL U376 ( .A(remainder_quotient[27]), .B(N302), .S0(n380), .Y(n501) );
  MX2XL U377 ( .A(remainder_quotient[28]), .B(N303), .S0(n380), .Y(n503) );
  MX2XL U378 ( .A(remainder_quotient[29]), .B(N304), .S0(n380), .Y(n505) );
  MX2XL U379 ( .A(remainder_quotient[30]), .B(N305), .S0(n380), .Y(n507) );
  MX2XL U380 ( .A(remainder_quotient[31]), .B(N306), .S0(n380), .Y(n509) );
  MX2XL U381 ( .A(n642), .B(N450), .S0(n381), .Y(n291) );
  MX2XL U382 ( .A(n641), .B(N451), .S0(n381), .Y(n290) );
  MX2XL U383 ( .A(n640), .B(N452), .S0(n381), .Y(n289) );
  MX2XL U384 ( .A(n639), .B(N453), .S0(n381), .Y(n288) );
  MX2XL U385 ( .A(n638), .B(N454), .S0(n381), .Y(n287) );
  MX2XL U386 ( .A(n637), .B(N455), .S0(n381), .Y(n286) );
  MX2XL U387 ( .A(n636), .B(N456), .S0(n381), .Y(n285) );
  MX2XL U388 ( .A(n635), .B(N457), .S0(n381), .Y(n284) );
  MX2XL U389 ( .A(n634), .B(N458), .S0(n381), .Y(n283) );
  MX2XL U390 ( .A(n633), .B(N459), .S0(n381), .Y(n282) );
  MX2XL U391 ( .A(n632), .B(N460), .S0(n381), .Y(n281) );
  MX2XL U392 ( .A(n631), .B(N461), .S0(n381), .Y(n280) );
  MX2XL U393 ( .A(n630), .B(N462), .S0(n381), .Y(n279) );
  MX2XL U394 ( .A(n629), .B(N463), .S0(n381), .Y(n278) );
  MX2XL U395 ( .A(n628), .B(N464), .S0(n381), .Y(n277) );
  MX2XL U396 ( .A(n627), .B(N465), .S0(n381), .Y(n276) );
  MX2XL U397 ( .A(n626), .B(N466), .S0(n381), .Y(n275) );
  MX2XL U398 ( .A(n625), .B(N467), .S0(n381), .Y(n274) );
  MX2XL U399 ( .A(n624), .B(N468), .S0(n381), .Y(n273) );
  MX2XL U400 ( .A(n623), .B(N469), .S0(n381), .Y(n272) );
  MX2XL U401 ( .A(n622), .B(N470), .S0(n381), .Y(n271) );
  MX2XL U402 ( .A(n621), .B(N471), .S0(n381), .Y(n270) );
  MX2XL U403 ( .A(n620), .B(N472), .S0(n381), .Y(n269) );
  MX2XL U404 ( .A(n619), .B(N473), .S0(n381), .Y(n268) );
  MX2XL U405 ( .A(n618), .B(N474), .S0(n381), .Y(n267) );
  MX2XL U406 ( .A(n617), .B(N475), .S0(n381), .Y(n266) );
  MX2XL U407 ( .A(n616), .B(N476), .S0(n381), .Y(n265) );
  MX2XL U408 ( .A(n615), .B(N477), .S0(n381), .Y(n264) );
  MX2XL U409 ( .A(n614), .B(N478), .S0(n381), .Y(n263) );
  MX2XL U410 ( .A(n613), .B(N479), .S0(n381), .Y(n262) );
  MX2XL U411 ( .A(n612), .B(N480), .S0(n381), .Y(n261) );
  MX2XL U412 ( .A(n611), .B(N481), .S0(n381), .Y(n260) );
  MX2XL U413 ( .A(remainder_quotient[32]), .B(N307), .S0(n380), .Y(n383) );
  MX2XL U414 ( .A(remainder_quotient[33]), .B(N308), .S0(n380), .Y(n385) );
  MX2XL U415 ( .A(remainder_quotient[34]), .B(N309), .S0(n380), .Y(n387) );
  MX2XL U416 ( .A(remainder_quotient[35]), .B(N310), .S0(n380), .Y(n389) );
  MX2XL U417 ( .A(remainder_quotient[36]), .B(N311), .S0(n380), .Y(n391) );
  MX2XL U418 ( .A(remainder_quotient[37]), .B(N312), .S0(n380), .Y(n393) );
  MX2XL U419 ( .A(remainder_quotient[38]), .B(N313), .S0(n380), .Y(n395) );
  MX2XL U420 ( .A(remainder_quotient[39]), .B(N314), .S0(n380), .Y(n397) );
  MX2XL U421 ( .A(remainder_quotient[40]), .B(N315), .S0(n380), .Y(n399) );
  MX2XL U422 ( .A(remainder_quotient[41]), .B(N316), .S0(n380), .Y(n401) );
  MX2XL U423 ( .A(remainder_quotient[42]), .B(N317), .S0(n380), .Y(n403) );
  MX2XL U424 ( .A(remainder_quotient[43]), .B(N318), .S0(n380), .Y(n405) );
  MX2XL U425 ( .A(remainder_quotient[44]), .B(N319), .S0(n380), .Y(n407) );
  MX2XL U426 ( .A(remainder_quotient[45]), .B(N320), .S0(n380), .Y(n409) );
  MX2XL U427 ( .A(remainder_quotient[46]), .B(N321), .S0(n380), .Y(n411) );
  MX2XL U428 ( .A(remainder_quotient[47]), .B(N322), .S0(n380), .Y(n413) );
  MX2XL U429 ( .A(remainder_quotient[48]), .B(N323), .S0(n380), .Y(n415) );
  MX2XL U430 ( .A(remainder_quotient[49]), .B(N324), .S0(n380), .Y(n417) );
  MX2XL U431 ( .A(remainder_quotient[50]), .B(N325), .S0(n380), .Y(n419) );
  MX2XL U432 ( .A(remainder_quotient[51]), .B(N326), .S0(n380), .Y(n421) );
  MX2XL U433 ( .A(remainder_quotient[52]), .B(N327), .S0(n380), .Y(n423) );
  MX2XL U434 ( .A(remainder_quotient[53]), .B(N328), .S0(n380), .Y(n425) );
  MX2XL U435 ( .A(remainder_quotient[54]), .B(N329), .S0(n380), .Y(n427) );
  MX2XL U436 ( .A(remainder_quotient[55]), .B(N330), .S0(n380), .Y(n429) );
  MX2XL U437 ( .A(remainder_quotient[56]), .B(N331), .S0(n380), .Y(n431) );
  MX2XL U438 ( .A(remainder_quotient[57]), .B(N332), .S0(n380), .Y(n433) );
  MX2XL U439 ( .A(remainder_quotient[58]), .B(N333), .S0(n380), .Y(n435) );
  MX2XL U440 ( .A(remainder_quotient[59]), .B(N334), .S0(n380), .Y(n437) );
  MX2XL U441 ( .A(remainder_quotient[60]), .B(N335), .S0(n380), .Y(n439) );
  MX2XL U442 ( .A(remainder_quotient[61]), .B(N336), .S0(n380), .Y(n441) );
  MX2XL U443 ( .A(remainder_quotient[62]), .B(N337), .S0(n380), .Y(n443) );
  MX2XL U444 ( .A(remainder_quotient[63]), .B(N338), .S0(n380), .Y(n445) );
  MX2XL U445 ( .A(n674), .B(N417), .S0(n381), .Y(n227) );
  MX2XL U446 ( .A(n673), .B(N418), .S0(n381), .Y(n226) );
  MX2XL U447 ( .A(n672), .B(N419), .S0(n381), .Y(n225) );
  MX2XL U448 ( .A(n671), .B(N420), .S0(n381), .Y(n224) );
  MX2XL U449 ( .A(n670), .B(N421), .S0(n381), .Y(n223) );
  MX2XL U450 ( .A(n669), .B(N422), .S0(n381), .Y(n222) );
  MX2XL U451 ( .A(n668), .B(N423), .S0(n381), .Y(n221) );
  MX2XL U452 ( .A(n667), .B(N424), .S0(n381), .Y(n220) );
  MX2XL U453 ( .A(n666), .B(N425), .S0(n381), .Y(n219) );
  MX2XL U454 ( .A(n665), .B(N426), .S0(n381), .Y(n218) );
  MX2XL U455 ( .A(n664), .B(N427), .S0(n381), .Y(n217) );
  MX2XL U456 ( .A(n663), .B(N428), .S0(n381), .Y(n216) );
  MX2XL U457 ( .A(n662), .B(N429), .S0(n381), .Y(n215) );
  MX2XL U458 ( .A(n661), .B(N430), .S0(n381), .Y(n214) );
  MX2XL U459 ( .A(n660), .B(N431), .S0(n381), .Y(n213) );
  MX2XL U460 ( .A(n659), .B(N432), .S0(n381), .Y(n212) );
  MX2XL U461 ( .A(n658), .B(N433), .S0(n381), .Y(n211) );
  MX2XL U462 ( .A(n657), .B(N434), .S0(n381), .Y(n210) );
  MX2XL U463 ( .A(n656), .B(N435), .S0(n381), .Y(n209) );
  MX2XL U464 ( .A(n655), .B(N436), .S0(n381), .Y(n208) );
  MX2XL U465 ( .A(n654), .B(N437), .S0(n381), .Y(n207) );
  MX2XL U466 ( .A(n653), .B(N438), .S0(n381), .Y(n206) );
  MX2XL U467 ( .A(n652), .B(N439), .S0(n381), .Y(n205) );
  MX2XL U468 ( .A(n651), .B(N440), .S0(n381), .Y(n204) );
  MX2XL U469 ( .A(n650), .B(N441), .S0(n381), .Y(n203) );
  MX2XL U470 ( .A(n649), .B(N442), .S0(n381), .Y(n202) );
  MX2XL U471 ( .A(n648), .B(N443), .S0(n381), .Y(n201) );
  MX2XL U472 ( .A(n647), .B(N444), .S0(n381), .Y(n200) );
  MX2XL U473 ( .A(n646), .B(N445), .S0(n381), .Y(n199) );
  MX2XL U474 ( .A(n645), .B(N446), .S0(n381), .Y(n198) );
  MX2XL U475 ( .A(n644), .B(N447), .S0(n381), .Y(n197) );
  MX2XL U476 ( .A(n643), .B(N448), .S0(n381), .Y(n196) );
  MX2XL U477 ( .A(n676), .B(N412), .S0(n381), .Y(n195) );
  MX2XL U478 ( .A(n675), .B(n379), .S0(n381), .Y(n194) );
  XOR2XL U479 ( .A(dividend[4]), .B(divider[4]), .Y(n333) );
  XOR2XL U480 ( .A(dividend[5]), .B(divider[5]), .Y(n332) );
  XOR2XL U481 ( .A(dividend[6]), .B(divider[6]), .Y(n331) );
  XOR2XL U482 ( .A(dividend[7]), .B(divider[7]), .Y(n330) );
  NOR4XL U483 ( .A(n333), .B(n332), .C(n331), .D(n330), .Y(n371) );
  XOR2XL U484 ( .A(dividend[0]), .B(divider[0]), .Y(n337) );
  XOR2XL U485 ( .A(dividend[1]), .B(divider[1]), .Y(n336) );
  XOR2XL U486 ( .A(dividend[2]), .B(divider[2]), .Y(n335) );
  XOR2XL U487 ( .A(dividend[3]), .B(divider[3]), .Y(n334) );
  NOR4XL U488 ( .A(n337), .B(n336), .C(n335), .D(n334), .Y(n370) );
  XOR2XL U489 ( .A(dividend[8]), .B(divider[8]), .Y(n368) );
  XOR2XL U490 ( .A(dividend[9]), .B(divider[9]), .Y(n367) );
  XNOR2XL U491 ( .A(divider[10]), .B(dividend[10]), .Y(n344) );
  XOR2XL U492 ( .A(dividend[12]), .B(divider[12]), .Y(n341) );
  XOR2XL U493 ( .A(dividend[13]), .B(divider[13]), .Y(n340) );
  XOR2XL U494 ( .A(dividend[14]), .B(divider[14]), .Y(n339) );
  XOR2XL U495 ( .A(dividend[15]), .B(divider[15]), .Y(n338) );
  NOR4XL U496 ( .A(n341), .B(n340), .C(n339), .D(n338), .Y(n343) );
  XNOR2XL U497 ( .A(dividend[11]), .B(divider[11]), .Y(n342) );
  NAND3XL U498 ( .A(n344), .B(n343), .C(n342), .Y(n366) );
  XOR2XL U499 ( .A(dividend[20]), .B(divider[20]), .Y(n348) );
  XOR2XL U500 ( .A(dividend[21]), .B(divider[21]), .Y(n347) );
  XOR2XL U501 ( .A(dividend[22]), .B(divider[22]), .Y(n346) );
  XOR2XL U502 ( .A(dividend[23]), .B(divider[23]), .Y(n345) );
  NOR4XL U503 ( .A(n348), .B(n347), .C(n346), .D(n345), .Y(n364) );
  XOR2XL U504 ( .A(dividend[16]), .B(divider[16]), .Y(n352) );
  XOR2XL U505 ( .A(dividend[17]), .B(divider[17]), .Y(n351) );
  XOR2XL U506 ( .A(dividend[18]), .B(divider[18]), .Y(n350) );
  XOR2XL U507 ( .A(dividend[19]), .B(divider[19]), .Y(n349) );
  NOR4XL U508 ( .A(n352), .B(n351), .C(n350), .D(n349), .Y(n363) );
  XOR2XL U509 ( .A(dividend[28]), .B(divider[28]), .Y(n356) );
  XOR2XL U510 ( .A(dividend[29]), .B(divider[29]), .Y(n355) );
  XOR2XL U511 ( .A(dividend[30]), .B(divider[30]), .Y(n354) );
  XOR2XL U512 ( .A(dividend[31]), .B(divider[31]), .Y(n353) );
  NOR4XL U513 ( .A(n356), .B(n355), .C(n354), .D(n353), .Y(n362) );
  XOR2XL U514 ( .A(dividend[24]), .B(divider[24]), .Y(n360) );
  XOR2XL U515 ( .A(dividend[25]), .B(divider[25]), .Y(n359) );
  XOR2XL U516 ( .A(dividend[26]), .B(divider[26]), .Y(n358) );
  XOR2XL U517 ( .A(dividend[27]), .B(divider[27]), .Y(n357) );
  NOR4XL U518 ( .A(n360), .B(n359), .C(n358), .D(n357), .Y(n361) );
  NAND4XL U519 ( .A(n364), .B(n363), .C(n362), .D(n361), .Y(n365) );
  NOR4XL U520 ( .A(n368), .B(n367), .C(n366), .D(n365), .Y(n369) );
  sequ_div_DW_cmp_0 gt_x_24 ( .p_A(divider), .p_B(dividend), .TC(1'b0), 
        .GE_LT(1'b0), .GE_GT_EQ(1'b1), .GE_LT_GT_LE(N124), .EQ_NE() );
  sequ_div_DW01_sub_0 sub_x_2 ( .p_A(remainder_quotient[63:31]), .p_B({1'b0, 
        divider}), .CI(1'b0), .p_DIFF({N234, N233, N232, N231, N230, N229, 
        N228, N227, N226, N225, N224, N223, N222, N221, N220, N219, N218, N217, 
        N216, N215, N214, N213, N212, N211, N210, N209, N208, N207, N206, N205, 
        N204, N203, N202}), .CO() );
  SDFFRQXL quotient_reg_31_ ( .D(n260), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n611) );
  SDFFRQXL quotient_reg_30_ ( .D(n261), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n612) );
  SDFFRQXL quotient_reg_29_ ( .D(n262), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n613) );
  SDFFRQXL quotient_reg_28_ ( .D(n263), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n614) );
  SDFFRQXL quotient_reg_27_ ( .D(n264), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n615) );
  SDFFRQXL quotient_reg_26_ ( .D(n265), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n616) );
  SDFFRQXL quotient_reg_25_ ( .D(n266), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n617) );
  SDFFRQXL quotient_reg_24_ ( .D(n267), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n618) );
  SDFFRQXL quotient_reg_23_ ( .D(n268), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n619) );
  SDFFRQXL quotient_reg_22_ ( .D(n269), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n620) );
  SDFFRQXL quotient_reg_21_ ( .D(n270), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n621) );
  SDFFRQXL quotient_reg_20_ ( .D(n271), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n622) );
  SDFFRQXL quotient_reg_19_ ( .D(n272), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n623) );
  SDFFRQXL quotient_reg_18_ ( .D(n273), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n624) );
  SDFFRQXL quotient_reg_17_ ( .D(n274), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n625) );
  SDFFRQXL quotient_reg_16_ ( .D(n275), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n626) );
  SDFFRQXL quotient_reg_15_ ( .D(n276), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n627) );
  SDFFRQXL quotient_reg_14_ ( .D(n277), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n628) );
  SDFFRQXL quotient_reg_13_ ( .D(n278), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n629) );
  SDFFRQXL quotient_reg_12_ ( .D(n279), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n630) );
  SDFFRQXL quotient_reg_11_ ( .D(n280), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n631) );
  SDFFRQXL quotient_reg_10_ ( .D(n281), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n632) );
  SDFFRQXL quotient_reg_9_ ( .D(n282), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n633) );
  SDFFRQXL quotient_reg_8_ ( .D(n283), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n634) );
  SDFFRQXL quotient_reg_7_ ( .D(n284), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n635) );
  SDFFRQXL quotient_reg_6_ ( .D(n285), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n636) );
  SDFFRQXL quotient_reg_5_ ( .D(n286), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n637) );
  SDFFRQXL quotient_reg_4_ ( .D(n287), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n638) );
  SDFFRQXL quotient_reg_3_ ( .D(n288), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n639) );
  SDFFRQXL quotient_reg_2_ ( .D(n289), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n640) );
  SDFFRQXL quotient_reg_1_ ( .D(n290), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n641) );
  SDFFRQXL quotient_reg_0_ ( .D(n291), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n642) );
  SDFFRQXL remainder_reg_31_ ( .D(n196), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n643) );
  SDFFRQXL remainder_reg_30_ ( .D(n197), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n644) );
  SDFFRQXL remainder_reg_29_ ( .D(n198), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n645) );
  SDFFRQXL remainder_reg_28_ ( .D(n199), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n646) );
  SDFFRQXL remainder_reg_27_ ( .D(n200), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n647) );
  SDFFRQXL remainder_reg_26_ ( .D(n201), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n648) );
  SDFFRQXL remainder_reg_25_ ( .D(n202), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n649) );
  SDFFRQXL remainder_reg_24_ ( .D(n203), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n650) );
  SDFFRQXL remainder_reg_23_ ( .D(n204), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n651) );
  SDFFRQXL remainder_reg_22_ ( .D(n205), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n652) );
  SDFFRQXL remainder_reg_21_ ( .D(n206), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n653) );
  SDFFRQXL remainder_reg_20_ ( .D(n207), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n654) );
  SDFFRQXL remainder_reg_19_ ( .D(n208), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n655) );
  SDFFRQXL remainder_reg_18_ ( .D(n209), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n656) );
  SDFFRQXL remainder_reg_17_ ( .D(n210), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n657) );
  SDFFRQXL remainder_reg_16_ ( .D(n211), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n658) );
  SDFFRQXL remainder_reg_15_ ( .D(n212), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n659) );
  SDFFRQXL remainder_reg_14_ ( .D(n213), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n660) );
  SDFFRQXL remainder_reg_13_ ( .D(n214), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n661) );
  SDFFRQXL remainder_reg_12_ ( .D(n215), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n662) );
  SDFFRQXL remainder_reg_11_ ( .D(n216), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n663) );
  SDFFRQXL remainder_reg_10_ ( .D(n217), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n664) );
  SDFFRQXL remainder_reg_9_ ( .D(n218), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n665) );
  SDFFRQXL remainder_reg_8_ ( .D(n219), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n666) );
  SDFFRQXL remainder_reg_7_ ( .D(n220), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n667) );
  SDFFRQXL remainder_reg_6_ ( .D(n221), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n668) );
  SDFFRQXL remainder_reg_5_ ( .D(n222), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n669) );
  SDFFRQXL remainder_reg_4_ ( .D(n223), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n670) );
  SDFFRQXL remainder_reg_3_ ( .D(n224), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n671) );
  SDFFRQXL remainder_reg_2_ ( .D(n225), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n672) );
  SDFFRQXL remainder_reg_1_ ( .D(n226), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n673) );
  SDFFRQXL remainder_reg_0_ ( .D(n227), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(n674) );
  SDFFRQXL ready_reg ( .D(n194), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(rst_n), 
        .Q(n675) );
  SDFFRQXL illegal_divider_zero_reg ( .D(n195), .SI(1'b0), .SE(1'b0), .CK(clk), 
        .RN(rst_n), .Q(n676) );
  SDFFSXL cur_state_reg_0_ ( .D(next_state[0]), .SI(1'b0), .SE(1'b0), .CK(clk), 
        .SN(rst_n), .Q(cur_state[0]), .QN(N22) );
  SDFFRXL cur_state_reg_2_ ( .D(n526), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(cur_state[2]), .QN(N42) );
  SDFFRXL cur_state_reg_1_ ( .D(next_state[1]), .SI(1'b0), .SE(1'b0), .CK(clk), 
        .RN(rst_n), .Q(cur_state[1]), .QN(N32) );
  SDFFRXL cur_state_reg_6_ ( .D(next_state[6]), .SI(1'b0), .SE(1'b0), .CK(clk), 
        .RN(rst_n), .Q(cur_state[6]), .QN(N82) );
  SDFFRXL cur_state_reg_7_ ( .D(next_state[7]), .SI(1'b0), .SE(1'b0), .CK(clk), 
        .RN(rst_n), .Q(cur_state[7]), .QN(N92) );
  SDFFRXL cur_state_reg_5_ ( .D(next_state[5]), .SI(1'b0), .SE(1'b0), .CK(clk), 
        .RN(rst_n), .Q(cur_state[5]), .QN(N72) );
  SDFFRXL cur_state_reg_4_ ( .D(next_state[4]), .SI(1'b0), .SE(1'b0), .CK(clk), 
        .RN(rst_n), .Q(cur_state[4]), .QN(N62) );
  SDFFRXL cur_state_reg_3_ ( .D(next_state[3]), .SI(1'b0), .SE(1'b0), .CK(clk), 
        .RN(rst_n), .Q(cur_state[3]), .QN(N52) );
  SDFFRXL cur_state_reg_8_ ( .D(next_state[8]), .SI(1'b0), .SE(1'b0), .CK(clk), 
        .RN(rst_n), .Q(cur_state[8]), .QN(N102) );
  SDFFRXL illegal_reg ( .D(n511), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(rst_n), 
        .Q(illegal), .QN() );
  SDFFRXL remainder_quotient_reg_31_ ( .D(n509), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(rst_n), .Q(remainder_quotient[31]), .QN() );
  SDFFRXL remainder_quotient_reg_30_ ( .D(n507), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(rst_n), .Q(remainder_quotient[30]), .QN() );
  SDFFRXL remainder_quotient_reg_29_ ( .D(n505), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(rst_n), .Q(remainder_quotient[29]), .QN() );
  SDFFRXL remainder_quotient_reg_28_ ( .D(n503), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(rst_n), .Q(remainder_quotient[28]), .QN() );
  SDFFRXL remainder_quotient_reg_27_ ( .D(n501), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(rst_n), .Q(remainder_quotient[27]), .QN() );
  SDFFRXL remainder_quotient_reg_26_ ( .D(n499), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(rst_n), .Q(remainder_quotient[26]), .QN() );
  SDFFRXL remainder_quotient_reg_25_ ( .D(n497), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(rst_n), .Q(remainder_quotient[25]), .QN() );
  SDFFRXL remainder_quotient_reg_24_ ( .D(n495), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(rst_n), .Q(remainder_quotient[24]), .QN() );
  SDFFRXL remainder_quotient_reg_23_ ( .D(n493), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(rst_n), .Q(remainder_quotient[23]), .QN() );
  SDFFRXL remainder_quotient_reg_22_ ( .D(n491), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(rst_n), .Q(remainder_quotient[22]), .QN() );
  SDFFRXL remainder_quotient_reg_21_ ( .D(n489), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(rst_n), .Q(remainder_quotient[21]), .QN() );
  SDFFRXL remainder_quotient_reg_20_ ( .D(n487), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(rst_n), .Q(remainder_quotient[20]), .QN() );
  SDFFRXL remainder_quotient_reg_19_ ( .D(n485), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(rst_n), .Q(remainder_quotient[19]), .QN() );
  SDFFRXL remainder_quotient_reg_18_ ( .D(n483), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(rst_n), .Q(remainder_quotient[18]), .QN() );
  SDFFRXL remainder_quotient_reg_17_ ( .D(n481), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(rst_n), .Q(remainder_quotient[17]), .QN() );
  SDFFRXL remainder_quotient_reg_16_ ( .D(n479), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(rst_n), .Q(remainder_quotient[16]), .QN() );
  SDFFRXL remainder_quotient_reg_15_ ( .D(n477), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(rst_n), .Q(remainder_quotient[15]), .QN() );
  SDFFRXL remainder_quotient_reg_14_ ( .D(n475), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(rst_n), .Q(remainder_quotient[14]), .QN() );
  SDFFRXL remainder_quotient_reg_13_ ( .D(n473), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(rst_n), .Q(remainder_quotient[13]), .QN() );
  SDFFRXL remainder_quotient_reg_12_ ( .D(n471), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(rst_n), .Q(remainder_quotient[12]), .QN() );
  SDFFRXL remainder_quotient_reg_11_ ( .D(n469), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(rst_n), .Q(remainder_quotient[11]), .QN() );
  SDFFRXL remainder_quotient_reg_10_ ( .D(n467), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(rst_n), .Q(remainder_quotient[10]), .QN() );
  SDFFRXL remainder_quotient_reg_9_ ( .D(n465), .SI(1'b0), .SE(1'b0), .CK(clk), 
        .RN(rst_n), .Q(remainder_quotient[9]), .QN() );
  SDFFRXL remainder_quotient_reg_8_ ( .D(n463), .SI(1'b0), .SE(1'b0), .CK(clk), 
        .RN(rst_n), .Q(remainder_quotient[8]), .QN() );
  SDFFRXL remainder_quotient_reg_7_ ( .D(n461), .SI(1'b0), .SE(1'b0), .CK(clk), 
        .RN(rst_n), .Q(remainder_quotient[7]), .QN() );
  SDFFRXL remainder_quotient_reg_6_ ( .D(n459), .SI(1'b0), .SE(1'b0), .CK(clk), 
        .RN(rst_n), .Q(remainder_quotient[6]), .QN() );
  SDFFRXL remainder_quotient_reg_5_ ( .D(n457), .SI(1'b0), .SE(1'b0), .CK(clk), 
        .RN(rst_n), .Q(remainder_quotient[5]), .QN() );
  SDFFRXL remainder_quotient_reg_4_ ( .D(n455), .SI(1'b0), .SE(1'b0), .CK(clk), 
        .RN(rst_n), .Q(remainder_quotient[4]), .QN() );
  SDFFRXL remainder_quotient_reg_3_ ( .D(n453), .SI(1'b0), .SE(1'b0), .CK(clk), 
        .RN(rst_n), .Q(remainder_quotient[3]), .QN() );
  SDFFRXL remainder_quotient_reg_2_ ( .D(n451), .SI(1'b0), .SE(1'b0), .CK(clk), 
        .RN(rst_n), .Q(remainder_quotient[2]), .QN() );
  SDFFRXL remainder_quotient_reg_1_ ( .D(n449), .SI(1'b0), .SE(1'b0), .CK(clk), 
        .RN(rst_n), .Q(remainder_quotient[1]), .QN() );
  SDFFRXL remainder_quotient_reg_0_ ( .D(n447), .SI(1'b0), .SE(1'b0), .CK(clk), 
        .RN(rst_n), .Q(remainder_quotient[0]), .QN() );
  SDFFRXL remainder_quotient_reg_63_ ( .D(n445), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(rst_n), .Q(remainder_quotient[63]), .QN() );
  SDFFRXL remainder_quotient_reg_62_ ( .D(n443), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(rst_n), .Q(remainder_quotient[62]), .QN() );
  SDFFRXL remainder_quotient_reg_61_ ( .D(n441), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(rst_n), .Q(remainder_quotient[61]), .QN() );
  SDFFRXL remainder_quotient_reg_60_ ( .D(n439), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(rst_n), .Q(remainder_quotient[60]), .QN() );
  SDFFRXL remainder_quotient_reg_59_ ( .D(n437), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(rst_n), .Q(remainder_quotient[59]), .QN() );
  SDFFRXL remainder_quotient_reg_58_ ( .D(n435), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(rst_n), .Q(remainder_quotient[58]), .QN() );
  SDFFRXL remainder_quotient_reg_57_ ( .D(n433), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(rst_n), .Q(remainder_quotient[57]), .QN() );
  SDFFRXL remainder_quotient_reg_56_ ( .D(n431), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(rst_n), .Q(remainder_quotient[56]), .QN() );
  SDFFRXL remainder_quotient_reg_55_ ( .D(n429), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(rst_n), .Q(remainder_quotient[55]), .QN() );
  SDFFRXL remainder_quotient_reg_54_ ( .D(n427), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(rst_n), .Q(remainder_quotient[54]), .QN() );
  SDFFRXL remainder_quotient_reg_53_ ( .D(n425), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(rst_n), .Q(remainder_quotient[53]), .QN() );
  SDFFRXL remainder_quotient_reg_52_ ( .D(n423), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(rst_n), .Q(remainder_quotient[52]), .QN() );
  SDFFRXL remainder_quotient_reg_51_ ( .D(n421), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(rst_n), .Q(remainder_quotient[51]), .QN() );
  SDFFRXL remainder_quotient_reg_50_ ( .D(n419), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(rst_n), .Q(remainder_quotient[50]), .QN() );
  SDFFRXL remainder_quotient_reg_49_ ( .D(n417), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(rst_n), .Q(remainder_quotient[49]), .QN() );
  SDFFRXL remainder_quotient_reg_48_ ( .D(n415), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(rst_n), .Q(remainder_quotient[48]), .QN() );
  SDFFRXL remainder_quotient_reg_47_ ( .D(n413), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(rst_n), .Q(remainder_quotient[47]), .QN() );
  SDFFRXL remainder_quotient_reg_46_ ( .D(n411), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(rst_n), .Q(remainder_quotient[46]), .QN() );
  SDFFRXL remainder_quotient_reg_45_ ( .D(n409), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(rst_n), .Q(remainder_quotient[45]), .QN() );
  SDFFRXL remainder_quotient_reg_44_ ( .D(n407), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(rst_n), .Q(remainder_quotient[44]), .QN() );
  SDFFRXL remainder_quotient_reg_43_ ( .D(n405), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(rst_n), .Q(remainder_quotient[43]), .QN() );
  SDFFRXL remainder_quotient_reg_42_ ( .D(n403), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(rst_n), .Q(remainder_quotient[42]), .QN() );
  SDFFRXL remainder_quotient_reg_41_ ( .D(n401), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(rst_n), .Q(remainder_quotient[41]), .QN() );
  SDFFRXL remainder_quotient_reg_40_ ( .D(n399), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(rst_n), .Q(remainder_quotient[40]), .QN() );
  SDFFRXL remainder_quotient_reg_39_ ( .D(n397), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(rst_n), .Q(remainder_quotient[39]), .QN() );
  SDFFRXL remainder_quotient_reg_38_ ( .D(n395), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(rst_n), .Q(remainder_quotient[38]), .QN() );
  SDFFRXL remainder_quotient_reg_37_ ( .D(n393), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(rst_n), .Q(remainder_quotient[37]), .QN() );
  SDFFRXL remainder_quotient_reg_36_ ( .D(n391), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(rst_n), .Q(remainder_quotient[36]), .QN() );
  SDFFRXL remainder_quotient_reg_35_ ( .D(n389), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(rst_n), .Q(remainder_quotient[35]), .QN() );
  SDFFRXL remainder_quotient_reg_34_ ( .D(n387), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(rst_n), .Q(remainder_quotient[34]), .QN() );
  SDFFRXL remainder_quotient_reg_33_ ( .D(n385), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(rst_n), .Q(remainder_quotient[33]), .QN() );
  SDFFRXL remainder_quotient_reg_32_ ( .D(n383), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(rst_n), .Q(remainder_quotient[32]), .QN() );
  SDFFRQXL shift_count_reg_3_ ( .D(n325), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(shift_count[3]) );
  SDFFRQX2 shift_count_reg_4_ ( .D(n328), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(shift_count[4]) );
  SDFFRQX2 shift_count_reg_1_ ( .D(n327), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(shift_count[1]) );
  SDFFRQX2 shift_count_reg_0_ ( .D(n329), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(shift_count[0]) );
  SDFFRQX2 shift_count_reg_2_ ( .D(n326), .SI(1'b0), .SE(1'b0), .CK(clk), .RN(
        rst_n), .Q(shift_count[2]) );
  OR2XL U524 ( .A(divider[19]), .B(N498), .Y(N499) );
  OR2XL U525 ( .A(divider[18]), .B(N499), .Y(N500) );
  OR2XL U526 ( .A(divider[17]), .B(N500), .Y(N501) );
  OR2XL U527 ( .A(divider[16]), .B(N501), .Y(N502) );
  OR2XL U528 ( .A(divider[15]), .B(N502), .Y(N503) );
  OR2XL U529 ( .A(divider[14]), .B(N503), .Y(N504) );
  OR2XL U530 ( .A(divider[13]), .B(N504), .Y(N505) );
  OR2XL U531 ( .A(divider[12]), .B(N505), .Y(N506) );
  OR2XL U532 ( .A(divider[11]), .B(N506), .Y(N507) );
  OR2XL U533 ( .A(divider[10]), .B(N507), .Y(N508) );
  OR2XL U534 ( .A(divider[9]), .B(N508), .Y(N509) );
  OR2XL U535 ( .A(divider[8]), .B(N509), .Y(N510) );
  OR2XL U536 ( .A(divider[7]), .B(N510), .Y(N511) );
  OR2XL U537 ( .A(divider[6]), .B(N511), .Y(N512) );
  OR2XL U538 ( .A(divider[5]), .B(N512), .Y(N513) );
  OR2XL U539 ( .A(divider[4]), .B(N513), .Y(N514) );
  OR2XL U540 ( .A(divider[3]), .B(N514), .Y(N515) );
  OR2XL U541 ( .A(divider[2]), .B(N515), .Y(N516) );
  AOI211XL U542 ( .A0(dividend[0]), .A1(n192), .B0(n533), .C0(n159), .Y(n193)
         );
  OR2XL U543 ( .A(divider[1]), .B(N516), .Y(N517) );
  INVXL U544 ( .A(n191), .Y(N307) );
  INVXL U545 ( .A(n182), .Y(N316) );
  INVXL U546 ( .A(n167), .Y(N331) );
  NOR2XL U547 ( .A(n536), .B(N197), .Y(n374) );
  NOR3XL U548 ( .A(cur_state[0]), .B(n536), .C(n374), .Y(n375) );
  AOI2BB1XL U549 ( .A0N(cur_state[0]), .A1N(n154), .B0(N415), .Y(n376) );
  NOR2XL U550 ( .A(N487), .B(N517), .Y(n377) );
  INVXL U551 ( .A(N413), .Y(n378) );
  CLKINVX2 U552 ( .A(n378), .Y(n379) );
  NOR2BXL U553 ( .AN(n536), .B(cur_state[0]), .Y(N413) );
  CLKINVX3 U554 ( .A(n376), .Y(n380) );
  CLKINVX3 U555 ( .A(n375), .Y(n381) );
  NOR2XL U630 ( .A(dividend[0]), .B(N549), .Y(n521) );
  AND3XL U631 ( .A(n371), .B(n370), .C(n369), .Y(n522) );
  NOR2XL U632 ( .A(divider[0]), .B(N517), .Y(n523) );
  INVXL U633 ( .A(N124), .Y(N125) );
  NOR2XL U634 ( .A(n527), .B(N118), .Y(n524) );
  NOR2XL U635 ( .A(N156), .B(N157), .Y(n525) );
  NOR2XL U636 ( .A(N39), .B(cur_state[0]), .Y(n526) );
  NOR2XL U637 ( .A(N109), .B(cur_state[0]), .Y(n527) );
  NOR2XL U638 ( .A(N79), .B(cur_state[0]), .Y(n528) );
  NOR2XL U639 ( .A(N49), .B(cur_state[0]), .Y(n529) );
  NOR2XL U640 ( .A(N89), .B(cur_state[0]), .Y(n530) );
  NOR2X1 U641 ( .A(N172), .B(N173), .Y(n531) );
  NOR2X1 U642 ( .A(N180), .B(N181), .Y(n532) );
  NOR2XL U643 ( .A(N164), .B(N165), .Y(n533) );
  NOR2XL U644 ( .A(N148), .B(N149), .Y(n534) );
  NOR2XL U645 ( .A(N140), .B(N141), .Y(n535) );
  NOR2XL U646 ( .A(N188), .B(N189), .Y(n536) );
  INVXL U647 ( .A(N134), .Y(N135) );
  NOR2XL U648 ( .A(N29), .B(N22), .Y(n537) );
  NOR2XL U649 ( .A(N99), .B(cur_state[0]), .Y(n538) );
  NOR2XL U650 ( .A(N59), .B(cur_state[0]), .Y(n539) );
  NOR2XL U651 ( .A(N69), .B(cur_state[0]), .Y(n540) );
  NOR2XL U652 ( .A(shift_count[0]), .B(N484), .Y(n541) );
  CLKBUFX1 U653 ( .A(n676), .Y(illegal_divider_zero) );
  CLKBUFX1 U654 ( .A(n675), .Y(ready) );
  CLKBUFX1 U655 ( .A(n674), .Y(remainder[0]) );
  CLKBUFX1 U656 ( .A(n673), .Y(remainder[1]) );
  CLKBUFX1 U657 ( .A(n672), .Y(remainder[2]) );
  CLKBUFX1 U658 ( .A(n671), .Y(remainder[3]) );
  CLKBUFX1 U659 ( .A(n670), .Y(remainder[4]) );
  CLKBUFX1 U660 ( .A(n669), .Y(remainder[5]) );
  CLKBUFX1 U661 ( .A(n668), .Y(remainder[6]) );
  CLKBUFX1 U662 ( .A(n667), .Y(remainder[7]) );
  CLKBUFX1 U663 ( .A(n666), .Y(remainder[8]) );
  CLKBUFX1 U664 ( .A(n665), .Y(remainder[9]) );
  CLKBUFX1 U665 ( .A(n664), .Y(remainder[10]) );
  CLKBUFX1 U666 ( .A(n663), .Y(remainder[11]) );
  CLKBUFX1 U667 ( .A(n662), .Y(remainder[12]) );
  CLKBUFX1 U668 ( .A(n661), .Y(remainder[13]) );
  CLKBUFX1 U669 ( .A(n660), .Y(remainder[14]) );
  CLKBUFX1 U670 ( .A(n659), .Y(remainder[15]) );
  CLKBUFX1 U671 ( .A(n658), .Y(remainder[16]) );
  CLKBUFX1 U672 ( .A(n657), .Y(remainder[17]) );
  CLKBUFX1 U673 ( .A(n656), .Y(remainder[18]) );
  CLKBUFX1 U674 ( .A(n655), .Y(remainder[19]) );
  CLKBUFX1 U675 ( .A(n654), .Y(remainder[20]) );
  CLKBUFX1 U676 ( .A(n653), .Y(remainder[21]) );
  CLKBUFX1 U677 ( .A(n652), .Y(remainder[22]) );
  CLKBUFX1 U678 ( .A(n651), .Y(remainder[23]) );
  CLKBUFX1 U679 ( .A(n650), .Y(remainder[24]) );
  CLKBUFX1 U680 ( .A(n649), .Y(remainder[25]) );
  CLKBUFX1 U681 ( .A(n648), .Y(remainder[26]) );
  CLKBUFX1 U682 ( .A(n647), .Y(remainder[27]) );
  CLKBUFX1 U683 ( .A(n646), .Y(remainder[28]) );
  CLKBUFX1 U684 ( .A(n645), .Y(remainder[29]) );
  CLKBUFX1 U685 ( .A(n644), .Y(remainder[30]) );
  CLKBUFX1 U686 ( .A(n643), .Y(remainder[31]) );
  CLKBUFX1 U687 ( .A(n642), .Y(quotient[0]) );
  CLKBUFX1 U688 ( .A(n641), .Y(quotient[1]) );
  CLKBUFX1 U689 ( .A(n640), .Y(quotient[2]) );
  CLKBUFX1 U690 ( .A(n639), .Y(quotient[3]) );
  CLKBUFX1 U691 ( .A(n638), .Y(quotient[4]) );
  CLKBUFX1 U692 ( .A(n637), .Y(quotient[5]) );
  CLKBUFX1 U693 ( .A(n636), .Y(quotient[6]) );
  CLKBUFX1 U694 ( .A(n635), .Y(quotient[7]) );
  CLKBUFX1 U695 ( .A(n634), .Y(quotient[8]) );
  CLKBUFX1 U696 ( .A(n633), .Y(quotient[9]) );
  CLKBUFX1 U697 ( .A(n632), .Y(quotient[10]) );
  CLKBUFX1 U698 ( .A(n631), .Y(quotient[11]) );
  CLKBUFX1 U699 ( .A(n630), .Y(quotient[12]) );
  CLKBUFX1 U700 ( .A(n629), .Y(quotient[13]) );
  CLKBUFX1 U701 ( .A(n628), .Y(quotient[14]) );
  CLKBUFX1 U702 ( .A(n627), .Y(quotient[15]) );
  CLKBUFX1 U703 ( .A(n626), .Y(quotient[16]) );
  CLKBUFX1 U704 ( .A(n625), .Y(quotient[17]) );
  CLKBUFX1 U705 ( .A(n624), .Y(quotient[18]) );
  CLKBUFX1 U706 ( .A(n623), .Y(quotient[19]) );
  CLKBUFX1 U707 ( .A(n622), .Y(quotient[20]) );
  CLKBUFX1 U708 ( .A(n621), .Y(quotient[21]) );
  CLKBUFX1 U709 ( .A(n620), .Y(quotient[22]) );
  CLKBUFX1 U710 ( .A(n619), .Y(quotient[23]) );
  CLKBUFX1 U711 ( .A(n618), .Y(quotient[24]) );
  CLKBUFX1 U712 ( .A(n617), .Y(quotient[25]) );
  CLKBUFX1 U713 ( .A(n616), .Y(quotient[26]) );
  CLKBUFX1 U714 ( .A(n615), .Y(quotient[27]) );
  CLKBUFX1 U715 ( .A(n614), .Y(quotient[28]) );
  CLKBUFX1 U716 ( .A(n613), .Y(quotient[29]) );
  CLKBUFX1 U717 ( .A(n612), .Y(quotient[30]) );
  CLKBUFX1 U718 ( .A(n611), .Y(quotient[31]) );
  INVXL U719 ( .A(shift_count[0]), .Y(N269) );
  AOI2BB2XL U720 ( .B0(shift_count[1]), .B1(N269), .A0N(N269), .A1N(
        shift_count[1]), .Y(N270) );
  NOR2XL U721 ( .A(shift_count[1]), .B(shift_count[0]), .Y(n608) );
  XOR2XL U722 ( .A(shift_count[2]), .B(n608), .Y(N271) );
  OR3XL U723 ( .A(shift_count[2]), .B(shift_count[1]), .C(shift_count[0]), .Y(
        n610) );
  XNOR2XL U724 ( .A(shift_count[3]), .B(n610), .Y(N272) );
  OAI21XL U725 ( .A0(shift_count[3]), .A1(n610), .B0(shift_count[4]), .Y(n609)
         );
  OAI31XL U726 ( .A0(shift_count[3]), .A1(shift_count[4]), .A2(n610), .B0(n609), .Y(N273) );
endmodule

