//
// Verilog description for cell dffN, 
// 02/08/14 01:16:04
//
// Precision RTL Synthesis, 2013a.9//


module dffN ( clk, setN, d, q ) ;

    input clk ;
    input setN ;
    input [63:0]d ;
    output [63:0]q ;

    wire [63:0]q_dup_0;
    wire clk_int, setN_int;
    wire [63:0]d_int;
    wire not_setN;



    OBUF \q_obuf(0)  (.O (q[0]), .I (q_dup_0[0])) ;
    OBUF \q_obuf(1)  (.O (q[1]), .I (q_dup_0[1])) ;
    OBUF \q_obuf(2)  (.O (q[2]), .I (q_dup_0[2])) ;
    OBUF \q_obuf(3)  (.O (q[3]), .I (q_dup_0[3])) ;
    OBUF \q_obuf(4)  (.O (q[4]), .I (q_dup_0[4])) ;
    OBUF \q_obuf(5)  (.O (q[5]), .I (q_dup_0[5])) ;
    OBUF \q_obuf(6)  (.O (q[6]), .I (q_dup_0[6])) ;
    OBUF \q_obuf(7)  (.O (q[7]), .I (q_dup_0[7])) ;
    OBUF \q_obuf(8)  (.O (q[8]), .I (q_dup_0[8])) ;
    OBUF \q_obuf(9)  (.O (q[9]), .I (q_dup_0[9])) ;
    OBUF \q_obuf(10)  (.O (q[10]), .I (q_dup_0[10])) ;
    OBUF \q_obuf(11)  (.O (q[11]), .I (q_dup_0[11])) ;
    OBUF \q_obuf(12)  (.O (q[12]), .I (q_dup_0[12])) ;
    OBUF \q_obuf(13)  (.O (q[13]), .I (q_dup_0[13])) ;
    OBUF \q_obuf(14)  (.O (q[14]), .I (q_dup_0[14])) ;
    OBUF \q_obuf(15)  (.O (q[15]), .I (q_dup_0[15])) ;
    OBUF \q_obuf(16)  (.O (q[16]), .I (q_dup_0[16])) ;
    OBUF \q_obuf(17)  (.O (q[17]), .I (q_dup_0[17])) ;
    OBUF \q_obuf(18)  (.O (q[18]), .I (q_dup_0[18])) ;
    OBUF \q_obuf(19)  (.O (q[19]), .I (q_dup_0[19])) ;
    OBUF \q_obuf(20)  (.O (q[20]), .I (q_dup_0[20])) ;
    OBUF \q_obuf(21)  (.O (q[21]), .I (q_dup_0[21])) ;
    OBUF \q_obuf(22)  (.O (q[22]), .I (q_dup_0[22])) ;
    OBUF \q_obuf(23)  (.O (q[23]), .I (q_dup_0[23])) ;
    OBUF \q_obuf(24)  (.O (q[24]), .I (q_dup_0[24])) ;
    OBUF \q_obuf(25)  (.O (q[25]), .I (q_dup_0[25])) ;
    OBUF \q_obuf(26)  (.O (q[26]), .I (q_dup_0[26])) ;
    OBUF \q_obuf(27)  (.O (q[27]), .I (q_dup_0[27])) ;
    OBUF \q_obuf(28)  (.O (q[28]), .I (q_dup_0[28])) ;
    OBUF \q_obuf(29)  (.O (q[29]), .I (q_dup_0[29])) ;
    OBUF \q_obuf(30)  (.O (q[30]), .I (q_dup_0[30])) ;
    OBUF \q_obuf(31)  (.O (q[31]), .I (q_dup_0[31])) ;
    OBUF \q_obuf(32)  (.O (q[32]), .I (q_dup_0[32])) ;
    OBUF \q_obuf(33)  (.O (q[33]), .I (q_dup_0[33])) ;
    OBUF \q_obuf(34)  (.O (q[34]), .I (q_dup_0[34])) ;
    OBUF \q_obuf(35)  (.O (q[35]), .I (q_dup_0[35])) ;
    OBUF \q_obuf(36)  (.O (q[36]), .I (q_dup_0[36])) ;
    OBUF \q_obuf(37)  (.O (q[37]), .I (q_dup_0[37])) ;
    OBUF \q_obuf(38)  (.O (q[38]), .I (q_dup_0[38])) ;
    OBUF \q_obuf(39)  (.O (q[39]), .I (q_dup_0[39])) ;
    OBUF \q_obuf(40)  (.O (q[40]), .I (q_dup_0[40])) ;
    OBUF \q_obuf(41)  (.O (q[41]), .I (q_dup_0[41])) ;
    OBUF \q_obuf(42)  (.O (q[42]), .I (q_dup_0[42])) ;
    OBUF \q_obuf(43)  (.O (q[43]), .I (q_dup_0[43])) ;
    OBUF \q_obuf(44)  (.O (q[44]), .I (q_dup_0[44])) ;
    OBUF \q_obuf(45)  (.O (q[45]), .I (q_dup_0[45])) ;
    OBUF \q_obuf(46)  (.O (q[46]), .I (q_dup_0[46])) ;
    OBUF \q_obuf(47)  (.O (q[47]), .I (q_dup_0[47])) ;
    OBUF \q_obuf(48)  (.O (q[48]), .I (q_dup_0[48])) ;
    OBUF \q_obuf(49)  (.O (q[49]), .I (q_dup_0[49])) ;
    OBUF \q_obuf(50)  (.O (q[50]), .I (q_dup_0[50])) ;
    OBUF \q_obuf(51)  (.O (q[51]), .I (q_dup_0[51])) ;
    OBUF \q_obuf(52)  (.O (q[52]), .I (q_dup_0[52])) ;
    OBUF \q_obuf(53)  (.O (q[53]), .I (q_dup_0[53])) ;
    OBUF \q_obuf(54)  (.O (q[54]), .I (q_dup_0[54])) ;
    OBUF \q_obuf(55)  (.O (q[55]), .I (q_dup_0[55])) ;
    OBUF \q_obuf(56)  (.O (q[56]), .I (q_dup_0[56])) ;
    OBUF \q_obuf(57)  (.O (q[57]), .I (q_dup_0[57])) ;
    OBUF \q_obuf(58)  (.O (q[58]), .I (q_dup_0[58])) ;
    OBUF \q_obuf(59)  (.O (q[59]), .I (q_dup_0[59])) ;
    OBUF \q_obuf(60)  (.O (q[60]), .I (q_dup_0[60])) ;
    OBUF \q_obuf(61)  (.O (q[61]), .I (q_dup_0[61])) ;
    OBUF \q_obuf(62)  (.O (q[62]), .I (q_dup_0[62])) ;
    OBUF \q_obuf(63)  (.O (q[63]), .I (q_dup_0[63])) ;
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
    IBUF \d_ibuf(16)  (.O (d_int[16]), .I (d[16])) ;
    IBUF \d_ibuf(17)  (.O (d_int[17]), .I (d[17])) ;
    IBUF \d_ibuf(18)  (.O (d_int[18]), .I (d[18])) ;
    IBUF \d_ibuf(19)  (.O (d_int[19]), .I (d[19])) ;
    IBUF \d_ibuf(20)  (.O (d_int[20]), .I (d[20])) ;
    IBUF \d_ibuf(21)  (.O (d_int[21]), .I (d[21])) ;
    IBUF \d_ibuf(22)  (.O (d_int[22]), .I (d[22])) ;
    IBUF \d_ibuf(23)  (.O (d_int[23]), .I (d[23])) ;
    IBUF \d_ibuf(24)  (.O (d_int[24]), .I (d[24])) ;
    IBUF \d_ibuf(25)  (.O (d_int[25]), .I (d[25])) ;
    IBUF \d_ibuf(26)  (.O (d_int[26]), .I (d[26])) ;
    IBUF \d_ibuf(27)  (.O (d_int[27]), .I (d[27])) ;
    IBUF \d_ibuf(28)  (.O (d_int[28]), .I (d[28])) ;
    IBUF \d_ibuf(29)  (.O (d_int[29]), .I (d[29])) ;
    IBUF \d_ibuf(30)  (.O (d_int[30]), .I (d[30])) ;
    IBUF \d_ibuf(31)  (.O (d_int[31]), .I (d[31])) ;
    IBUF \d_ibuf(32)  (.O (d_int[32]), .I (d[32])) ;
    IBUF \d_ibuf(33)  (.O (d_int[33]), .I (d[33])) ;
    IBUF \d_ibuf(34)  (.O (d_int[34]), .I (d[34])) ;
    IBUF \d_ibuf(35)  (.O (d_int[35]), .I (d[35])) ;
    IBUF \d_ibuf(36)  (.O (d_int[36]), .I (d[36])) ;
    IBUF \d_ibuf(37)  (.O (d_int[37]), .I (d[37])) ;
    IBUF \d_ibuf(38)  (.O (d_int[38]), .I (d[38])) ;
    IBUF \d_ibuf(39)  (.O (d_int[39]), .I (d[39])) ;
    IBUF \d_ibuf(40)  (.O (d_int[40]), .I (d[40])) ;
    IBUF \d_ibuf(41)  (.O (d_int[41]), .I (d[41])) ;
    IBUF \d_ibuf(42)  (.O (d_int[42]), .I (d[42])) ;
    IBUF \d_ibuf(43)  (.O (d_int[43]), .I (d[43])) ;
    IBUF \d_ibuf(44)  (.O (d_int[44]), .I (d[44])) ;
    IBUF \d_ibuf(45)  (.O (d_int[45]), .I (d[45])) ;
    IBUF \d_ibuf(46)  (.O (d_int[46]), .I (d[46])) ;
    IBUF \d_ibuf(47)  (.O (d_int[47]), .I (d[47])) ;
    IBUF \d_ibuf(48)  (.O (d_int[48]), .I (d[48])) ;
    IBUF \d_ibuf(49)  (.O (d_int[49]), .I (d[49])) ;
    IBUF \d_ibuf(50)  (.O (d_int[50]), .I (d[50])) ;
    IBUF \d_ibuf(51)  (.O (d_int[51]), .I (d[51])) ;
    IBUF \d_ibuf(52)  (.O (d_int[52]), .I (d[52])) ;
    IBUF \d_ibuf(53)  (.O (d_int[53]), .I (d[53])) ;
    IBUF \d_ibuf(54)  (.O (d_int[54]), .I (d[54])) ;
    IBUF \d_ibuf(55)  (.O (d_int[55]), .I (d[55])) ;
    IBUF \d_ibuf(56)  (.O (d_int[56]), .I (d[56])) ;
    IBUF \d_ibuf(57)  (.O (d_int[57]), .I (d[57])) ;
    IBUF \d_ibuf(58)  (.O (d_int[58]), .I (d[58])) ;
    IBUF \d_ibuf(59)  (.O (d_int[59]), .I (d[59])) ;
    IBUF \d_ibuf(60)  (.O (d_int[60]), .I (d[60])) ;
    IBUF \d_ibuf(61)  (.O (d_int[61]), .I (d[61])) ;
    IBUF \d_ibuf(62)  (.O (d_int[62]), .I (d[62])) ;
    IBUF \d_ibuf(63)  (.O (d_int[63]), .I (d[63])) ;
    IBUF setN_ibuf (.O (setN_int), .I (setN)) ;
    FDP \reg_q(63)  (.Q (q_dup_0[63]), .D (d_int[63]), .C (clk_int), .PRE (
        not_setN)) ;
    FDP \reg_q(62)  (.Q (q_dup_0[62]), .D (d_int[62]), .C (clk_int), .PRE (
        not_setN)) ;
    FDP \reg_q(61)  (.Q (q_dup_0[61]), .D (d_int[61]), .C (clk_int), .PRE (
        not_setN)) ;
    FDP \reg_q(60)  (.Q (q_dup_0[60]), .D (d_int[60]), .C (clk_int), .PRE (
        not_setN)) ;
    FDP \reg_q(59)  (.Q (q_dup_0[59]), .D (d_int[59]), .C (clk_int), .PRE (
        not_setN)) ;
    FDP \reg_q(58)  (.Q (q_dup_0[58]), .D (d_int[58]), .C (clk_int), .PRE (
        not_setN)) ;
    FDP \reg_q(57)  (.Q (q_dup_0[57]), .D (d_int[57]), .C (clk_int), .PRE (
        not_setN)) ;
    FDP \reg_q(56)  (.Q (q_dup_0[56]), .D (d_int[56]), .C (clk_int), .PRE (
        not_setN)) ;
    FDP \reg_q(55)  (.Q (q_dup_0[55]), .D (d_int[55]), .C (clk_int), .PRE (
        not_setN)) ;
    FDP \reg_q(54)  (.Q (q_dup_0[54]), .D (d_int[54]), .C (clk_int), .PRE (
        not_setN)) ;
    FDP \reg_q(53)  (.Q (q_dup_0[53]), .D (d_int[53]), .C (clk_int), .PRE (
        not_setN)) ;
    FDP \reg_q(52)  (.Q (q_dup_0[52]), .D (d_int[52]), .C (clk_int), .PRE (
        not_setN)) ;
    FDP \reg_q(51)  (.Q (q_dup_0[51]), .D (d_int[51]), .C (clk_int), .PRE (
        not_setN)) ;
    FDP \reg_q(50)  (.Q (q_dup_0[50]), .D (d_int[50]), .C (clk_int), .PRE (
        not_setN)) ;
    FDP \reg_q(49)  (.Q (q_dup_0[49]), .D (d_int[49]), .C (clk_int), .PRE (
        not_setN)) ;
    FDP \reg_q(48)  (.Q (q_dup_0[48]), .D (d_int[48]), .C (clk_int), .PRE (
        not_setN)) ;
    FDP \reg_q(47)  (.Q (q_dup_0[47]), .D (d_int[47]), .C (clk_int), .PRE (
        not_setN)) ;
    FDP \reg_q(46)  (.Q (q_dup_0[46]), .D (d_int[46]), .C (clk_int), .PRE (
        not_setN)) ;
    FDP \reg_q(45)  (.Q (q_dup_0[45]), .D (d_int[45]), .C (clk_int), .PRE (
        not_setN)) ;
    FDP \reg_q(44)  (.Q (q_dup_0[44]), .D (d_int[44]), .C (clk_int), .PRE (
        not_setN)) ;
    FDP \reg_q(43)  (.Q (q_dup_0[43]), .D (d_int[43]), .C (clk_int), .PRE (
        not_setN)) ;
    FDP \reg_q(42)  (.Q (q_dup_0[42]), .D (d_int[42]), .C (clk_int), .PRE (
        not_setN)) ;
    FDP \reg_q(41)  (.Q (q_dup_0[41]), .D (d_int[41]), .C (clk_int), .PRE (
        not_setN)) ;
    FDP \reg_q(40)  (.Q (q_dup_0[40]), .D (d_int[40]), .C (clk_int), .PRE (
        not_setN)) ;
    FDP \reg_q(39)  (.Q (q_dup_0[39]), .D (d_int[39]), .C (clk_int), .PRE (
        not_setN)) ;
    FDP \reg_q(38)  (.Q (q_dup_0[38]), .D (d_int[38]), .C (clk_int), .PRE (
        not_setN)) ;
    FDP \reg_q(37)  (.Q (q_dup_0[37]), .D (d_int[37]), .C (clk_int), .PRE (
        not_setN)) ;
    FDP \reg_q(36)  (.Q (q_dup_0[36]), .D (d_int[36]), .C (clk_int), .PRE (
        not_setN)) ;
    FDP \reg_q(35)  (.Q (q_dup_0[35]), .D (d_int[35]), .C (clk_int), .PRE (
        not_setN)) ;
    FDP \reg_q(34)  (.Q (q_dup_0[34]), .D (d_int[34]), .C (clk_int), .PRE (
        not_setN)) ;
    FDP \reg_q(33)  (.Q (q_dup_0[33]), .D (d_int[33]), .C (clk_int), .PRE (
        not_setN)) ;
    FDP \reg_q(32)  (.Q (q_dup_0[32]), .D (d_int[32]), .C (clk_int), .PRE (
        not_setN)) ;
    FDP \reg_q(31)  (.Q (q_dup_0[31]), .D (d_int[31]), .C (clk_int), .PRE (
        not_setN)) ;
    FDP \reg_q(30)  (.Q (q_dup_0[30]), .D (d_int[30]), .C (clk_int), .PRE (
        not_setN)) ;
    FDP \reg_q(29)  (.Q (q_dup_0[29]), .D (d_int[29]), .C (clk_int), .PRE (
        not_setN)) ;
    FDP \reg_q(28)  (.Q (q_dup_0[28]), .D (d_int[28]), .C (clk_int), .PRE (
        not_setN)) ;
    FDP \reg_q(27)  (.Q (q_dup_0[27]), .D (d_int[27]), .C (clk_int), .PRE (
        not_setN)) ;
    FDP \reg_q(26)  (.Q (q_dup_0[26]), .D (d_int[26]), .C (clk_int), .PRE (
        not_setN)) ;
    FDP \reg_q(25)  (.Q (q_dup_0[25]), .D (d_int[25]), .C (clk_int), .PRE (
        not_setN)) ;
    FDP \reg_q(24)  (.Q (q_dup_0[24]), .D (d_int[24]), .C (clk_int), .PRE (
        not_setN)) ;
    FDP \reg_q(23)  (.Q (q_dup_0[23]), .D (d_int[23]), .C (clk_int), .PRE (
        not_setN)) ;
    FDP \reg_q(22)  (.Q (q_dup_0[22]), .D (d_int[22]), .C (clk_int), .PRE (
        not_setN)) ;
    FDP \reg_q(21)  (.Q (q_dup_0[21]), .D (d_int[21]), .C (clk_int), .PRE (
        not_setN)) ;
    FDP \reg_q(20)  (.Q (q_dup_0[20]), .D (d_int[20]), .C (clk_int), .PRE (
        not_setN)) ;
    FDP \reg_q(19)  (.Q (q_dup_0[19]), .D (d_int[19]), .C (clk_int), .PRE (
        not_setN)) ;
    FDP \reg_q(18)  (.Q (q_dup_0[18]), .D (d_int[18]), .C (clk_int), .PRE (
        not_setN)) ;
    FDP \reg_q(17)  (.Q (q_dup_0[17]), .D (d_int[17]), .C (clk_int), .PRE (
        not_setN)) ;
    FDP \reg_q(16)  (.Q (q_dup_0[16]), .D (d_int[16]), .C (clk_int), .PRE (
        not_setN)) ;
    FDP \reg_q(15)  (.Q (q_dup_0[15]), .D (d_int[15]), .C (clk_int), .PRE (
        not_setN)) ;
    FDP \reg_q(14)  (.Q (q_dup_0[14]), .D (d_int[14]), .C (clk_int), .PRE (
        not_setN)) ;
    FDP \reg_q(13)  (.Q (q_dup_0[13]), .D (d_int[13]), .C (clk_int), .PRE (
        not_setN)) ;
    FDP \reg_q(12)  (.Q (q_dup_0[12]), .D (d_int[12]), .C (clk_int), .PRE (
        not_setN)) ;
    FDP \reg_q(11)  (.Q (q_dup_0[11]), .D (d_int[11]), .C (clk_int), .PRE (
        not_setN)) ;
    FDP \reg_q(10)  (.Q (q_dup_0[10]), .D (d_int[10]), .C (clk_int), .PRE (
        not_setN)) ;
    FDP \reg_q(9)  (.Q (q_dup_0[9]), .D (d_int[9]), .C (clk_int), .PRE (not_setN
        )) ;
    FDP \reg_q(8)  (.Q (q_dup_0[8]), .D (d_int[8]), .C (clk_int), .PRE (not_setN
        )) ;
    FDP \reg_q(7)  (.Q (q_dup_0[7]), .D (d_int[7]), .C (clk_int), .PRE (not_setN
        )) ;
    FDP \reg_q(6)  (.Q (q_dup_0[6]), .D (d_int[6]), .C (clk_int), .PRE (not_setN
        )) ;
    FDP \reg_q(5)  (.Q (q_dup_0[5]), .D (d_int[5]), .C (clk_int), .PRE (not_setN
        )) ;
    FDP \reg_q(4)  (.Q (q_dup_0[4]), .D (d_int[4]), .C (clk_int), .PRE (not_setN
        )) ;
    FDP \reg_q(3)  (.Q (q_dup_0[3]), .D (d_int[3]), .C (clk_int), .PRE (not_setN
        )) ;
    FDP \reg_q(2)  (.Q (q_dup_0[2]), .D (d_int[2]), .C (clk_int), .PRE (not_setN
        )) ;
    FDP \reg_q(1)  (.Q (q_dup_0[1]), .D (d_int[1]), .C (clk_int), .PRE (not_setN
        )) ;
    FDP \reg_q(0)  (.Q (q_dup_0[0]), .D (d_int[0]), .C (clk_int), .PRE (not_setN
        )) ;
    LUT1 ix9396z1315 (.O (not_setN), .I0 (setN_int)) ;
         defparam ix9396z1315.INIT = 4'h1;
    BUFGP clk_ibuf (.O (clk_int), .I (clk)) ;
endmodule

