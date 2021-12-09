//
// Verilog description for cell alu, 
// 02/06/14 10:51:16
//
// Precision RTL Synthesis, 2013a.9//


module alu ( instruction, result ) ;

    input [67:0]instruction ;
    output [63:0]result ;

    wire [63:30]result_dup_0;
    wire nx32149z2, nx32148z2, nx32147z2, nx32146z2, nx32145z2, nx32144z2, 
         nx32143z2, nx32142z2, nx32141z2, nx5401z2, nx5400z2, nx5399z2, nx5398z2, 
         nx5397z2, nx5396z2, nx5395z2, nx5394z2, nx5393z2, nx5392z2, nx4404z2, 
         nx4403z2, nx4402z2, nx4401z2, nx4400z2, nx4399z2, nx4398z2, nx4397z2, 
         nx4396z2, nx4395z2, nx3407z2, nx3406z2, nx18482z1;
    wire [67:3]instruction_int;
    wire nx32150z1, nx32149z1, nx32148z1, nx32147z1, nx32146z1, nx32145z1, 
         nx32144z1, nx32143z1, nx32142z1, nx32141z1, nx5401z1, nx5400z1, 
         nx5399z1, nx5398z1, nx5397z1, nx5396z1, nx5395z1, nx5394z1, nx5393z1, 
         nx5392z1, nx4404z1, nx4403z1, nx4402z1, nx4401z1, nx4400z1, nx4399z1, 
         nx4398z1, nx4397z1, nx4396z1, nx4395z1, nx3407z1, nx3406z1;



    XORCY result_addsub33_0_xorcy_0 (.O (result_dup_0[30]), .LI (nx32150z1), .CI (
          instruction_int[3])) ;
    MUXCY_L result_addsub33_0_muxcy_0 (.LO (nx32149z2), .S (nx32150z1), .DI (
            instruction_int[36]), .CI (instruction_int[3])) ;
    XORCY result_addsub33_0_xorcy_1 (.O (result_dup_0[31]), .LI (nx32149z1), .CI (
          nx32149z2)) ;
    MUXCY_L result_addsub33_0_muxcy_1 (.LO (nx32148z2), .S (nx32149z1), .DI (
            instruction_int[37]), .CI (nx32149z2)) ;
    XORCY result_addsub33_0_xorcy_2 (.O (result_dup_0[32]), .LI (nx32148z1), .CI (
          nx32148z2)) ;
    MUXCY_L result_addsub33_0_muxcy_2 (.LO (nx32147z2), .S (nx32148z1), .DI (
            instruction_int[38]), .CI (nx32148z2)) ;
    XORCY result_addsub33_0_xorcy_3 (.O (result_dup_0[33]), .LI (nx32147z1), .CI (
          nx32147z2)) ;
    MUXCY_L result_addsub33_0_muxcy_3 (.LO (nx32146z2), .S (nx32147z1), .DI (
            instruction_int[39]), .CI (nx32147z2)) ;
    XORCY result_addsub33_0_xorcy_4 (.O (result_dup_0[34]), .LI (nx32146z1), .CI (
          nx32146z2)) ;
    MUXCY_L result_addsub33_0_muxcy_4 (.LO (nx32145z2), .S (nx32146z1), .DI (
            instruction_int[40]), .CI (nx32146z2)) ;
    XORCY result_addsub33_0_xorcy_5 (.O (result_dup_0[35]), .LI (nx32145z1), .CI (
          nx32145z2)) ;
    MUXCY_L result_addsub33_0_muxcy_5 (.LO (nx32144z2), .S (nx32145z1), .DI (
            instruction_int[41]), .CI (nx32145z2)) ;
    XORCY result_addsub33_0_xorcy_6 (.O (result_dup_0[36]), .LI (nx32144z1), .CI (
          nx32144z2)) ;
    MUXCY_L result_addsub33_0_muxcy_6 (.LO (nx32143z2), .S (nx32144z1), .DI (
            instruction_int[42]), .CI (nx32144z2)) ;
    XORCY result_addsub33_0_xorcy_7 (.O (result_dup_0[37]), .LI (nx32143z1), .CI (
          nx32143z2)) ;
    MUXCY_L result_addsub33_0_muxcy_7 (.LO (nx32142z2), .S (nx32143z1), .DI (
            instruction_int[43]), .CI (nx32143z2)) ;
    XORCY result_addsub33_0_xorcy_8 (.O (result_dup_0[38]), .LI (nx32142z1), .CI (
          nx32142z2)) ;
    MUXCY_L result_addsub33_0_muxcy_8 (.LO (nx32141z2), .S (nx32142z1), .DI (
            instruction_int[44]), .CI (nx32142z2)) ;
    XORCY result_addsub33_0_xorcy_9 (.O (result_dup_0[39]), .LI (nx32141z1), .CI (
          nx32141z2)) ;
    MUXCY_L result_addsub33_0_muxcy_9 (.LO (nx5401z2), .S (nx32141z1), .DI (
            instruction_int[45]), .CI (nx32141z2)) ;
    XORCY result_addsub33_0_xorcy_10 (.O (result_dup_0[40]), .LI (nx5401z1), .CI (
          nx5401z2)) ;
    MUXCY_L result_addsub33_0_muxcy_10 (.LO (nx5400z2), .S (nx5401z1), .DI (
            instruction_int[46]), .CI (nx5401z2)) ;
    XORCY result_addsub33_0_xorcy_11 (.O (result_dup_0[41]), .LI (nx5400z1), .CI (
          nx5400z2)) ;
    MUXCY_L result_addsub33_0_muxcy_11 (.LO (nx5399z2), .S (nx5400z1), .DI (
            instruction_int[47]), .CI (nx5400z2)) ;
    XORCY result_addsub33_0_xorcy_12 (.O (result_dup_0[42]), .LI (nx5399z1), .CI (
          nx5399z2)) ;
    MUXCY_L result_addsub33_0_muxcy_12 (.LO (nx5398z2), .S (nx5399z1), .DI (
            instruction_int[48]), .CI (nx5399z2)) ;
    XORCY result_addsub33_0_xorcy_13 (.O (result_dup_0[43]), .LI (nx5398z1), .CI (
          nx5398z2)) ;
    MUXCY_L result_addsub33_0_muxcy_13 (.LO (nx5397z2), .S (nx5398z1), .DI (
            instruction_int[49]), .CI (nx5398z2)) ;
    XORCY result_addsub33_0_xorcy_14 (.O (result_dup_0[44]), .LI (nx5397z1), .CI (
          nx5397z2)) ;
    MUXCY_L result_addsub33_0_muxcy_14 (.LO (nx5396z2), .S (nx5397z1), .DI (
            instruction_int[50]), .CI (nx5397z2)) ;
    XORCY result_addsub33_0_xorcy_15 (.O (result_dup_0[45]), .LI (nx5396z1), .CI (
          nx5396z2)) ;
    MUXCY_L result_addsub33_0_muxcy_15 (.LO (nx5395z2), .S (nx5396z1), .DI (
            instruction_int[51]), .CI (nx5396z2)) ;
    XORCY result_addsub33_0_xorcy_16 (.O (result_dup_0[46]), .LI (nx5395z1), .CI (
          nx5395z2)) ;
    MUXCY_L result_addsub33_0_muxcy_16 (.LO (nx5394z2), .S (nx5395z1), .DI (
            instruction_int[52]), .CI (nx5395z2)) ;
    XORCY result_addsub33_0_xorcy_17 (.O (result_dup_0[47]), .LI (nx5394z1), .CI (
          nx5394z2)) ;
    MUXCY_L result_addsub33_0_muxcy_17 (.LO (nx5393z2), .S (nx5394z1), .DI (
            instruction_int[53]), .CI (nx5394z2)) ;
    XORCY result_addsub33_0_xorcy_18 (.O (result_dup_0[48]), .LI (nx5393z1), .CI (
          nx5393z2)) ;
    MUXCY_L result_addsub33_0_muxcy_18 (.LO (nx5392z2), .S (nx5393z1), .DI (
            instruction_int[54]), .CI (nx5393z2)) ;
    XORCY result_addsub33_0_xorcy_19 (.O (result_dup_0[49]), .LI (nx5392z1), .CI (
          nx5392z2)) ;
    MUXCY_L result_addsub33_0_muxcy_19 (.LO (nx4404z2), .S (nx5392z1), .DI (
            instruction_int[55]), .CI (nx5392z2)) ;
    XORCY result_addsub33_0_xorcy_20 (.O (result_dup_0[50]), .LI (nx4404z1), .CI (
          nx4404z2)) ;
    MUXCY_L result_addsub33_0_muxcy_20 (.LO (nx4403z2), .S (nx4404z1), .DI (
            instruction_int[56]), .CI (nx4404z2)) ;
    XORCY result_addsub33_0_xorcy_21 (.O (result_dup_0[51]), .LI (nx4403z1), .CI (
          nx4403z2)) ;
    MUXCY_L result_addsub33_0_muxcy_21 (.LO (nx4402z2), .S (nx4403z1), .DI (
            instruction_int[57]), .CI (nx4403z2)) ;
    XORCY result_addsub33_0_xorcy_22 (.O (result_dup_0[52]), .LI (nx4402z1), .CI (
          nx4402z2)) ;
    MUXCY_L result_addsub33_0_muxcy_22 (.LO (nx4401z2), .S (nx4402z1), .DI (
            instruction_int[58]), .CI (nx4402z2)) ;
    XORCY result_addsub33_0_xorcy_23 (.O (result_dup_0[53]), .LI (nx4401z1), .CI (
          nx4401z2)) ;
    MUXCY_L result_addsub33_0_muxcy_23 (.LO (nx4400z2), .S (nx4401z1), .DI (
            instruction_int[59]), .CI (nx4401z2)) ;
    XORCY result_addsub33_0_xorcy_24 (.O (result_dup_0[54]), .LI (nx4400z1), .CI (
          nx4400z2)) ;
    MUXCY_L result_addsub33_0_muxcy_24 (.LO (nx4399z2), .S (nx4400z1), .DI (
            instruction_int[60]), .CI (nx4400z2)) ;
    XORCY result_addsub33_0_xorcy_25 (.O (result_dup_0[55]), .LI (nx4399z1), .CI (
          nx4399z2)) ;
    MUXCY_L result_addsub33_0_muxcy_25 (.LO (nx4398z2), .S (nx4399z1), .DI (
            instruction_int[61]), .CI (nx4399z2)) ;
    XORCY result_addsub33_0_xorcy_26 (.O (result_dup_0[56]), .LI (nx4398z1), .CI (
          nx4398z2)) ;
    MUXCY_L result_addsub33_0_muxcy_26 (.LO (nx4397z2), .S (nx4398z1), .DI (
            instruction_int[62]), .CI (nx4398z2)) ;
    XORCY result_addsub33_0_xorcy_27 (.O (result_dup_0[57]), .LI (nx4397z1), .CI (
          nx4397z2)) ;
    MUXCY_L result_addsub33_0_muxcy_27 (.LO (nx4396z2), .S (nx4397z1), .DI (
            instruction_int[63]), .CI (nx4397z2)) ;
    XORCY result_addsub33_0_xorcy_28 (.O (result_dup_0[58]), .LI (nx4396z1), .CI (
          nx4396z2)) ;
    MUXCY_L result_addsub33_0_muxcy_28 (.LO (nx4395z2), .S (nx4396z1), .DI (
            instruction_int[64]), .CI (nx4396z2)) ;
    XORCY result_addsub33_0_xorcy_29 (.O (result_dup_0[59]), .LI (nx4395z1), .CI (
          nx4395z2)) ;
    MUXCY_L result_addsub33_0_muxcy_29 (.LO (nx3407z2), .S (nx4395z1), .DI (
            instruction_int[65]), .CI (nx4395z2)) ;
    XORCY result_addsub33_0_xorcy_30 (.O (result_dup_0[60]), .LI (nx3407z1), .CI (
          nx3407z2)) ;
    MUXCY_L result_addsub33_0_muxcy_30 (.LO (nx3406z2), .S (nx3407z1), .DI (
            instruction_int[66]), .CI (nx3407z2)) ;
    XORCY result_addsub33_0_xorcy_31 (.O (result_dup_0[61]), .LI (nx3406z1), .CI (
          nx3406z2)) ;
    MUXCY_L result_addsub33_0_muxcy_31 (.LO (nx18482z1), .S (nx3406z1), .DI (
            instruction_int[67]), .CI (nx3406z2)) ;
    XORCY result_addsub33_0_xorcy_32 (.O (result_dup_0[62]), .LI (
          instruction_int[3]), .CI (nx18482z1)) ;
    OBUF \result_obuf(0)  (.O (result[0]), .I (result_dup_0[30])) ;
    OBUF \result_obuf(1)  (.O (result[1]), .I (result_dup_0[31])) ;
    OBUF \result_obuf(2)  (.O (result[2]), .I (result_dup_0[32])) ;
    OBUF \result_obuf(3)  (.O (result[3]), .I (result_dup_0[33])) ;
    OBUF \result_obuf(4)  (.O (result[4]), .I (result_dup_0[34])) ;
    OBUF \result_obuf(5)  (.O (result[5]), .I (result_dup_0[35])) ;
    OBUF \result_obuf(6)  (.O (result[6]), .I (result_dup_0[36])) ;
    OBUF \result_obuf(7)  (.O (result[7]), .I (result_dup_0[37])) ;
    OBUF \result_obuf(8)  (.O (result[8]), .I (result_dup_0[38])) ;
    OBUF \result_obuf(9)  (.O (result[9]), .I (result_dup_0[39])) ;
    OBUF \result_obuf(10)  (.O (result[10]), .I (result_dup_0[40])) ;
    OBUF \result_obuf(11)  (.O (result[11]), .I (result_dup_0[41])) ;
    OBUF \result_obuf(12)  (.O (result[12]), .I (result_dup_0[42])) ;
    OBUF \result_obuf(13)  (.O (result[13]), .I (result_dup_0[43])) ;
    OBUF \result_obuf(14)  (.O (result[14]), .I (result_dup_0[44])) ;
    OBUF \result_obuf(15)  (.O (result[15]), .I (result_dup_0[45])) ;
    OBUF \result_obuf(16)  (.O (result[16]), .I (result_dup_0[46])) ;
    OBUF \result_obuf(17)  (.O (result[17]), .I (result_dup_0[47])) ;
    OBUF \result_obuf(18)  (.O (result[18]), .I (result_dup_0[48])) ;
    OBUF \result_obuf(19)  (.O (result[19]), .I (result_dup_0[49])) ;
    OBUF \result_obuf(20)  (.O (result[20]), .I (result_dup_0[50])) ;
    OBUF \result_obuf(21)  (.O (result[21]), .I (result_dup_0[51])) ;
    OBUF \result_obuf(22)  (.O (result[22]), .I (result_dup_0[52])) ;
    OBUF \result_obuf(23)  (.O (result[23]), .I (result_dup_0[53])) ;
    OBUF \result_obuf(24)  (.O (result[24]), .I (result_dup_0[54])) ;
    OBUF \result_obuf(25)  (.O (result[25]), .I (result_dup_0[55])) ;
    OBUF \result_obuf(26)  (.O (result[26]), .I (result_dup_0[56])) ;
    OBUF \result_obuf(27)  (.O (result[27]), .I (result_dup_0[57])) ;
    OBUF \result_obuf(28)  (.O (result[28]), .I (result_dup_0[58])) ;
    OBUF \result_obuf(29)  (.O (result[29]), .I (result_dup_0[59])) ;
    OBUF \result_obuf(30)  (.O (result[30]), .I (result_dup_0[60])) ;
    OBUF \result_obuf(31)  (.O (result[31]), .I (result_dup_0[61])) ;
    OBUF \result_obuf(32)  (.O (result[32]), .I (result_dup_0[62])) ;
    OBUF \result_obuf(33)  (.O (result[33]), .I (result_dup_0[63])) ;
    OBUF \result_obuf(34)  (.O (result[34]), .I (result_dup_0[63])) ;
    OBUF \result_obuf(35)  (.O (result[35]), .I (result_dup_0[63])) ;
    OBUF \result_obuf(36)  (.O (result[36]), .I (result_dup_0[63])) ;
    OBUF \result_obuf(37)  (.O (result[37]), .I (result_dup_0[63])) ;
    OBUF \result_obuf(38)  (.O (result[38]), .I (result_dup_0[63])) ;
    OBUF \result_obuf(39)  (.O (result[39]), .I (result_dup_0[63])) ;
    OBUF \result_obuf(40)  (.O (result[40]), .I (result_dup_0[63])) ;
    OBUF \result_obuf(41)  (.O (result[41]), .I (result_dup_0[63])) ;
    OBUF \result_obuf(42)  (.O (result[42]), .I (result_dup_0[63])) ;
    OBUF \result_obuf(43)  (.O (result[43]), .I (result_dup_0[63])) ;
    OBUF \result_obuf(44)  (.O (result[44]), .I (result_dup_0[63])) ;
    OBUF \result_obuf(45)  (.O (result[45]), .I (result_dup_0[63])) ;
    OBUF \result_obuf(46)  (.O (result[46]), .I (result_dup_0[63])) ;
    OBUF \result_obuf(47)  (.O (result[47]), .I (result_dup_0[63])) ;
    OBUF \result_obuf(48)  (.O (result[48]), .I (result_dup_0[63])) ;
    OBUF \result_obuf(49)  (.O (result[49]), .I (result_dup_0[63])) ;
    OBUF \result_obuf(50)  (.O (result[50]), .I (result_dup_0[63])) ;
    OBUF \result_obuf(51)  (.O (result[51]), .I (result_dup_0[63])) ;
    OBUF \result_obuf(52)  (.O (result[52]), .I (result_dup_0[63])) ;
    OBUF \result_obuf(53)  (.O (result[53]), .I (result_dup_0[63])) ;
    OBUF \result_obuf(54)  (.O (result[54]), .I (result_dup_0[63])) ;
    OBUF \result_obuf(55)  (.O (result[55]), .I (result_dup_0[63])) ;
    OBUF \result_obuf(56)  (.O (result[56]), .I (result_dup_0[63])) ;
    OBUF \result_obuf(57)  (.O (result[57]), .I (result_dup_0[63])) ;
    OBUF \result_obuf(58)  (.O (result[58]), .I (result_dup_0[63])) ;
    OBUF \result_obuf(59)  (.O (result[59]), .I (result_dup_0[63])) ;
    OBUF \result_obuf(60)  (.O (result[60]), .I (result_dup_0[63])) ;
    OBUF \result_obuf(61)  (.O (result[61]), .I (result_dup_0[63])) ;
    OBUF \result_obuf(62)  (.O (result[62]), .I (result_dup_0[63])) ;
    OBUF \result_obuf(63)  (.O (result[63]), .I (result_dup_0[63])) ;
    IBUF \instruction_ibuf(0)  (.O (instruction_int[3]), .I (instruction[0])) ;
    IBUF \instruction_ibuf(4)  (.O (instruction_int[4]), .I (instruction[4])) ;
    IBUF \instruction_ibuf(5)  (.O (instruction_int[5]), .I (instruction[5])) ;
    IBUF \instruction_ibuf(6)  (.O (instruction_int[6]), .I (instruction[6])) ;
    IBUF \instruction_ibuf(7)  (.O (instruction_int[7]), .I (instruction[7])) ;
    IBUF \instruction_ibuf(8)  (.O (instruction_int[8]), .I (instruction[8])) ;
    IBUF \instruction_ibuf(9)  (.O (instruction_int[9]), .I (instruction[9])) ;
    IBUF \instruction_ibuf(10)  (.O (instruction_int[10]), .I (instruction[10])
         ) ;
    IBUF \instruction_ibuf(11)  (.O (instruction_int[11]), .I (instruction[11])
         ) ;
    IBUF \instruction_ibuf(12)  (.O (instruction_int[12]), .I (instruction[12])
         ) ;
    IBUF \instruction_ibuf(13)  (.O (instruction_int[13]), .I (instruction[13])
         ) ;
    IBUF \instruction_ibuf(14)  (.O (instruction_int[14]), .I (instruction[14])
         ) ;
    IBUF \instruction_ibuf(15)  (.O (instruction_int[15]), .I (instruction[15])
         ) ;
    IBUF \instruction_ibuf(16)  (.O (instruction_int[16]), .I (instruction[16])
         ) ;
    IBUF \instruction_ibuf(17)  (.O (instruction_int[17]), .I (instruction[17])
         ) ;
    IBUF \instruction_ibuf(18)  (.O (instruction_int[18]), .I (instruction[18])
         ) ;
    IBUF \instruction_ibuf(19)  (.O (instruction_int[19]), .I (instruction[19])
         ) ;
    IBUF \instruction_ibuf(20)  (.O (instruction_int[20]), .I (instruction[20])
         ) ;
    IBUF \instruction_ibuf(21)  (.O (instruction_int[21]), .I (instruction[21])
         ) ;
    IBUF \instruction_ibuf(22)  (.O (instruction_int[22]), .I (instruction[22])
         ) ;
    IBUF \instruction_ibuf(23)  (.O (instruction_int[23]), .I (instruction[23])
         ) ;
    IBUF \instruction_ibuf(24)  (.O (instruction_int[24]), .I (instruction[24])
         ) ;
    IBUF \instruction_ibuf(25)  (.O (instruction_int[25]), .I (instruction[25])
         ) ;
    IBUF \instruction_ibuf(26)  (.O (instruction_int[26]), .I (instruction[26])
         ) ;
    IBUF \instruction_ibuf(27)  (.O (instruction_int[27]), .I (instruction[27])
         ) ;
    IBUF \instruction_ibuf(28)  (.O (instruction_int[28]), .I (instruction[28])
         ) ;
    IBUF \instruction_ibuf(29)  (.O (instruction_int[29]), .I (instruction[29])
         ) ;
    IBUF \instruction_ibuf(30)  (.O (instruction_int[30]), .I (instruction[30])
         ) ;
    IBUF \instruction_ibuf(31)  (.O (instruction_int[31]), .I (instruction[31])
         ) ;
    IBUF \instruction_ibuf(32)  (.O (instruction_int[32]), .I (instruction[32])
         ) ;
    IBUF \instruction_ibuf(33)  (.O (instruction_int[33]), .I (instruction[33])
         ) ;
    IBUF \instruction_ibuf(34)  (.O (instruction_int[34]), .I (instruction[34])
         ) ;
    IBUF \instruction_ibuf(35)  (.O (instruction_int[35]), .I (instruction[35])
         ) ;
    IBUF \instruction_ibuf(36)  (.O (instruction_int[36]), .I (instruction[36])
         ) ;
    IBUF \instruction_ibuf(37)  (.O (instruction_int[37]), .I (instruction[37])
         ) ;
    IBUF \instruction_ibuf(38)  (.O (instruction_int[38]), .I (instruction[38])
         ) ;
    IBUF \instruction_ibuf(39)  (.O (instruction_int[39]), .I (instruction[39])
         ) ;
    IBUF \instruction_ibuf(40)  (.O (instruction_int[40]), .I (instruction[40])
         ) ;
    IBUF \instruction_ibuf(41)  (.O (instruction_int[41]), .I (instruction[41])
         ) ;
    IBUF \instruction_ibuf(42)  (.O (instruction_int[42]), .I (instruction[42])
         ) ;
    IBUF \instruction_ibuf(43)  (.O (instruction_int[43]), .I (instruction[43])
         ) ;
    IBUF \instruction_ibuf(44)  (.O (instruction_int[44]), .I (instruction[44])
         ) ;
    IBUF \instruction_ibuf(45)  (.O (instruction_int[45]), .I (instruction[45])
         ) ;
    IBUF \instruction_ibuf(46)  (.O (instruction_int[46]), .I (instruction[46])
         ) ;
    IBUF \instruction_ibuf(47)  (.O (instruction_int[47]), .I (instruction[47])
         ) ;
    IBUF \instruction_ibuf(48)  (.O (instruction_int[48]), .I (instruction[48])
         ) ;
    IBUF \instruction_ibuf(49)  (.O (instruction_int[49]), .I (instruction[49])
         ) ;
    IBUF \instruction_ibuf(50)  (.O (instruction_int[50]), .I (instruction[50])
         ) ;
    IBUF \instruction_ibuf(51)  (.O (instruction_int[51]), .I (instruction[51])
         ) ;
    IBUF \instruction_ibuf(52)  (.O (instruction_int[52]), .I (instruction[52])
         ) ;
    IBUF \instruction_ibuf(53)  (.O (instruction_int[53]), .I (instruction[53])
         ) ;
    IBUF \instruction_ibuf(54)  (.O (instruction_int[54]), .I (instruction[54])
         ) ;
    IBUF \instruction_ibuf(55)  (.O (instruction_int[55]), .I (instruction[55])
         ) ;
    IBUF \instruction_ibuf(56)  (.O (instruction_int[56]), .I (instruction[56])
         ) ;
    IBUF \instruction_ibuf(57)  (.O (instruction_int[57]), .I (instruction[57])
         ) ;
    IBUF \instruction_ibuf(58)  (.O (instruction_int[58]), .I (instruction[58])
         ) ;
    IBUF \instruction_ibuf(59)  (.O (instruction_int[59]), .I (instruction[59])
         ) ;
    IBUF \instruction_ibuf(60)  (.O (instruction_int[60]), .I (instruction[60])
         ) ;
    IBUF \instruction_ibuf(61)  (.O (instruction_int[61]), .I (instruction[61])
         ) ;
    IBUF \instruction_ibuf(62)  (.O (instruction_int[62]), .I (instruction[62])
         ) ;
    IBUF \instruction_ibuf(63)  (.O (instruction_int[63]), .I (instruction[63])
         ) ;
    IBUF \instruction_ibuf(64)  (.O (instruction_int[64]), .I (instruction[64])
         ) ;
    IBUF \instruction_ibuf(65)  (.O (instruction_int[65]), .I (instruction[65])
         ) ;
    IBUF \instruction_ibuf(66)  (.O (instruction_int[66]), .I (instruction[66])
         ) ;
    IBUF \instruction_ibuf(67)  (.O (instruction_int[67]), .I (instruction[67])
         ) ;
    LUT2 ix29624z1322 (.O (result_dup_0[63]), .I0 (result_dup_0[62]), .I1 (
         instruction_int[3])) ;
         defparam ix29624z1322.INIT = 4'h8;
    LUT3 ix32150z1464 (.O (nx32150z1), .I0 (instruction_int[36]), .I1 (
         instruction_int[4]), .I2 (instruction_int[3])) ;
         defparam ix32150z1464.INIT = 8'h96;
    LUT3 ix32149z1464 (.O (nx32149z1), .I0 (instruction_int[37]), .I1 (
         instruction_int[5]), .I2 (instruction_int[3])) ;
         defparam ix32149z1464.INIT = 8'h96;
    LUT3 ix32148z1464 (.O (nx32148z1), .I0 (instruction_int[38]), .I1 (
         instruction_int[6]), .I2 (instruction_int[3])) ;
         defparam ix32148z1464.INIT = 8'h96;
    LUT3 ix32147z1464 (.O (nx32147z1), .I0 (instruction_int[39]), .I1 (
         instruction_int[7]), .I2 (instruction_int[3])) ;
         defparam ix32147z1464.INIT = 8'h96;
    LUT3 ix32146z1464 (.O (nx32146z1), .I0 (instruction_int[40]), .I1 (
         instruction_int[8]), .I2 (instruction_int[3])) ;
         defparam ix32146z1464.INIT = 8'h96;
    LUT3 ix32145z1464 (.O (nx32145z1), .I0 (instruction_int[41]), .I1 (
         instruction_int[9]), .I2 (instruction_int[3])) ;
         defparam ix32145z1464.INIT = 8'h96;
    LUT3 ix32144z1464 (.O (nx32144z1), .I0 (instruction_int[42]), .I1 (
         instruction_int[10]), .I2 (instruction_int[3])) ;
         defparam ix32144z1464.INIT = 8'h96;
    LUT3 ix32143z1464 (.O (nx32143z1), .I0 (instruction_int[43]), .I1 (
         instruction_int[11]), .I2 (instruction_int[3])) ;
         defparam ix32143z1464.INIT = 8'h96;
    LUT3 ix32142z1464 (.O (nx32142z1), .I0 (instruction_int[44]), .I1 (
         instruction_int[12]), .I2 (instruction_int[3])) ;
         defparam ix32142z1464.INIT = 8'h96;
    LUT3 ix32141z1464 (.O (nx32141z1), .I0 (instruction_int[45]), .I1 (
         instruction_int[13]), .I2 (instruction_int[3])) ;
         defparam ix32141z1464.INIT = 8'h96;
    LUT3 ix5401z1464 (.O (nx5401z1), .I0 (instruction_int[46]), .I1 (
         instruction_int[14]), .I2 (instruction_int[3])) ;
         defparam ix5401z1464.INIT = 8'h96;
    LUT3 ix5400z1464 (.O (nx5400z1), .I0 (instruction_int[47]), .I1 (
         instruction_int[15]), .I2 (instruction_int[3])) ;
         defparam ix5400z1464.INIT = 8'h96;
    LUT3 ix5399z1464 (.O (nx5399z1), .I0 (instruction_int[48]), .I1 (
         instruction_int[16]), .I2 (instruction_int[3])) ;
         defparam ix5399z1464.INIT = 8'h96;
    LUT3 ix5398z1464 (.O (nx5398z1), .I0 (instruction_int[49]), .I1 (
         instruction_int[17]), .I2 (instruction_int[3])) ;
         defparam ix5398z1464.INIT = 8'h96;
    LUT3 ix5397z1464 (.O (nx5397z1), .I0 (instruction_int[50]), .I1 (
         instruction_int[18]), .I2 (instruction_int[3])) ;
         defparam ix5397z1464.INIT = 8'h96;
    LUT3 ix5396z1464 (.O (nx5396z1), .I0 (instruction_int[51]), .I1 (
         instruction_int[19]), .I2 (instruction_int[3])) ;
         defparam ix5396z1464.INIT = 8'h96;
    LUT3 ix5395z1464 (.O (nx5395z1), .I0 (instruction_int[52]), .I1 (
         instruction_int[20]), .I2 (instruction_int[3])) ;
         defparam ix5395z1464.INIT = 8'h96;
    LUT3 ix5394z1464 (.O (nx5394z1), .I0 (instruction_int[53]), .I1 (
         instruction_int[21]), .I2 (instruction_int[3])) ;
         defparam ix5394z1464.INIT = 8'h96;
    LUT3 ix5393z1464 (.O (nx5393z1), .I0 (instruction_int[54]), .I1 (
         instruction_int[22]), .I2 (instruction_int[3])) ;
         defparam ix5393z1464.INIT = 8'h96;
    LUT3 ix5392z1464 (.O (nx5392z1), .I0 (instruction_int[55]), .I1 (
         instruction_int[23]), .I2 (instruction_int[3])) ;
         defparam ix5392z1464.INIT = 8'h96;
    LUT3 ix4404z1464 (.O (nx4404z1), .I0 (instruction_int[56]), .I1 (
         instruction_int[24]), .I2 (instruction_int[3])) ;
         defparam ix4404z1464.INIT = 8'h96;
    LUT3 ix4403z1464 (.O (nx4403z1), .I0 (instruction_int[57]), .I1 (
         instruction_int[25]), .I2 (instruction_int[3])) ;
         defparam ix4403z1464.INIT = 8'h96;
    LUT3 ix4402z1464 (.O (nx4402z1), .I0 (instruction_int[58]), .I1 (
         instruction_int[26]), .I2 (instruction_int[3])) ;
         defparam ix4402z1464.INIT = 8'h96;
    LUT3 ix4401z1464 (.O (nx4401z1), .I0 (instruction_int[59]), .I1 (
         instruction_int[27]), .I2 (instruction_int[3])) ;
         defparam ix4401z1464.INIT = 8'h96;
    LUT3 ix4400z1464 (.O (nx4400z1), .I0 (instruction_int[60]), .I1 (
         instruction_int[28]), .I2 (instruction_int[3])) ;
         defparam ix4400z1464.INIT = 8'h96;
    LUT3 ix4399z1464 (.O (nx4399z1), .I0 (instruction_int[61]), .I1 (
         instruction_int[29]), .I2 (instruction_int[3])) ;
         defparam ix4399z1464.INIT = 8'h96;
    LUT3 ix4398z1464 (.O (nx4398z1), .I0 (instruction_int[62]), .I1 (
         instruction_int[30]), .I2 (instruction_int[3])) ;
         defparam ix4398z1464.INIT = 8'h96;
    LUT3 ix4397z1464 (.O (nx4397z1), .I0 (instruction_int[63]), .I1 (
         instruction_int[31]), .I2 (instruction_int[3])) ;
         defparam ix4397z1464.INIT = 8'h96;
    LUT3 ix4396z1464 (.O (nx4396z1), .I0 (instruction_int[64]), .I1 (
         instruction_int[32]), .I2 (instruction_int[3])) ;
         defparam ix4396z1464.INIT = 8'h96;
    LUT3 ix4395z1464 (.O (nx4395z1), .I0 (instruction_int[65]), .I1 (
         instruction_int[33]), .I2 (instruction_int[3])) ;
         defparam ix4395z1464.INIT = 8'h96;
    LUT3 ix3407z1464 (.O (nx3407z1), .I0 (instruction_int[66]), .I1 (
         instruction_int[34]), .I2 (instruction_int[3])) ;
         defparam ix3407z1464.INIT = 8'h96;
    LUT3 ix3406z1464 (.O (nx3406z1), .I0 (instruction_int[67]), .I1 (
         instruction_int[35]), .I2 (instruction_int[3])) ;
         defparam ix3406z1464.INIT = 8'h96;
endmodule

