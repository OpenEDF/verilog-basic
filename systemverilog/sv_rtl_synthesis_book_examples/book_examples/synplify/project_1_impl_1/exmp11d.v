//
// Verilog description for cell exmp11d, 
// 02/06/14 23:32:42
//
// Precision RTL Synthesis, 2013a.9//


module exmp11d ( data_in, clock, swap_bytes, data ) ;

    input [63:0]data_in ;
    input clock ;
    input swap_bytes ;
    output [63:0]data ;

    wire [63:0]data_dup_0;
    wire [63:0]data_in_int;
    wire clock_int, swap_bytes_int;
    wire [63:0]data_0n1ss1;



    OBUF \data_obuf(0)  (.O (data[0]), .I (data_dup_0[0])) ;
    OBUF \data_obuf(1)  (.O (data[1]), .I (data_dup_0[1])) ;
    OBUF \data_obuf(2)  (.O (data[2]), .I (data_dup_0[2])) ;
    OBUF \data_obuf(3)  (.O (data[3]), .I (data_dup_0[3])) ;
    OBUF \data_obuf(4)  (.O (data[4]), .I (data_dup_0[4])) ;
    OBUF \data_obuf(5)  (.O (data[5]), .I (data_dup_0[5])) ;
    OBUF \data_obuf(6)  (.O (data[6]), .I (data_dup_0[6])) ;
    OBUF \data_obuf(7)  (.O (data[7]), .I (data_dup_0[7])) ;
    OBUF \data_obuf(8)  (.O (data[8]), .I (data_dup_0[8])) ;
    OBUF \data_obuf(9)  (.O (data[9]), .I (data_dup_0[9])) ;
    OBUF \data_obuf(10)  (.O (data[10]), .I (data_dup_0[10])) ;
    OBUF \data_obuf(11)  (.O (data[11]), .I (data_dup_0[11])) ;
    OBUF \data_obuf(12)  (.O (data[12]), .I (data_dup_0[12])) ;
    OBUF \data_obuf(13)  (.O (data[13]), .I (data_dup_0[13])) ;
    OBUF \data_obuf(14)  (.O (data[14]), .I (data_dup_0[14])) ;
    OBUF \data_obuf(15)  (.O (data[15]), .I (data_dup_0[15])) ;
    OBUF \data_obuf(16)  (.O (data[16]), .I (data_dup_0[16])) ;
    OBUF \data_obuf(17)  (.O (data[17]), .I (data_dup_0[17])) ;
    OBUF \data_obuf(18)  (.O (data[18]), .I (data_dup_0[18])) ;
    OBUF \data_obuf(19)  (.O (data[19]), .I (data_dup_0[19])) ;
    OBUF \data_obuf(20)  (.O (data[20]), .I (data_dup_0[20])) ;
    OBUF \data_obuf(21)  (.O (data[21]), .I (data_dup_0[21])) ;
    OBUF \data_obuf(22)  (.O (data[22]), .I (data_dup_0[22])) ;
    OBUF \data_obuf(23)  (.O (data[23]), .I (data_dup_0[23])) ;
    OBUF \data_obuf(24)  (.O (data[24]), .I (data_dup_0[24])) ;
    OBUF \data_obuf(25)  (.O (data[25]), .I (data_dup_0[25])) ;
    OBUF \data_obuf(26)  (.O (data[26]), .I (data_dup_0[26])) ;
    OBUF \data_obuf(27)  (.O (data[27]), .I (data_dup_0[27])) ;
    OBUF \data_obuf(28)  (.O (data[28]), .I (data_dup_0[28])) ;
    OBUF \data_obuf(29)  (.O (data[29]), .I (data_dup_0[29])) ;
    OBUF \data_obuf(30)  (.O (data[30]), .I (data_dup_0[30])) ;
    OBUF \data_obuf(31)  (.O (data[31]), .I (data_dup_0[31])) ;
    OBUF \data_obuf(32)  (.O (data[32]), .I (data_dup_0[32])) ;
    OBUF \data_obuf(33)  (.O (data[33]), .I (data_dup_0[33])) ;
    OBUF \data_obuf(34)  (.O (data[34]), .I (data_dup_0[34])) ;
    OBUF \data_obuf(35)  (.O (data[35]), .I (data_dup_0[35])) ;
    OBUF \data_obuf(36)  (.O (data[36]), .I (data_dup_0[36])) ;
    OBUF \data_obuf(37)  (.O (data[37]), .I (data_dup_0[37])) ;
    OBUF \data_obuf(38)  (.O (data[38]), .I (data_dup_0[38])) ;
    OBUF \data_obuf(39)  (.O (data[39]), .I (data_dup_0[39])) ;
    OBUF \data_obuf(40)  (.O (data[40]), .I (data_dup_0[40])) ;
    OBUF \data_obuf(41)  (.O (data[41]), .I (data_dup_0[41])) ;
    OBUF \data_obuf(42)  (.O (data[42]), .I (data_dup_0[42])) ;
    OBUF \data_obuf(43)  (.O (data[43]), .I (data_dup_0[43])) ;
    OBUF \data_obuf(44)  (.O (data[44]), .I (data_dup_0[44])) ;
    OBUF \data_obuf(45)  (.O (data[45]), .I (data_dup_0[45])) ;
    OBUF \data_obuf(46)  (.O (data[46]), .I (data_dup_0[46])) ;
    OBUF \data_obuf(47)  (.O (data[47]), .I (data_dup_0[47])) ;
    OBUF \data_obuf(48)  (.O (data[48]), .I (data_dup_0[48])) ;
    OBUF \data_obuf(49)  (.O (data[49]), .I (data_dup_0[49])) ;
    OBUF \data_obuf(50)  (.O (data[50]), .I (data_dup_0[50])) ;
    OBUF \data_obuf(51)  (.O (data[51]), .I (data_dup_0[51])) ;
    OBUF \data_obuf(52)  (.O (data[52]), .I (data_dup_0[52])) ;
    OBUF \data_obuf(53)  (.O (data[53]), .I (data_dup_0[53])) ;
    OBUF \data_obuf(54)  (.O (data[54]), .I (data_dup_0[54])) ;
    OBUF \data_obuf(55)  (.O (data[55]), .I (data_dup_0[55])) ;
    OBUF \data_obuf(56)  (.O (data[56]), .I (data_dup_0[56])) ;
    OBUF \data_obuf(57)  (.O (data[57]), .I (data_dup_0[57])) ;
    OBUF \data_obuf(58)  (.O (data[58]), .I (data_dup_0[58])) ;
    OBUF \data_obuf(59)  (.O (data[59]), .I (data_dup_0[59])) ;
    OBUF \data_obuf(60)  (.O (data[60]), .I (data_dup_0[60])) ;
    OBUF \data_obuf(61)  (.O (data[61]), .I (data_dup_0[61])) ;
    OBUF \data_obuf(62)  (.O (data[62]), .I (data_dup_0[62])) ;
    OBUF \data_obuf(63)  (.O (data[63]), .I (data_dup_0[63])) ;
    IBUF swap_bytes_ibuf (.O (swap_bytes_int), .I (swap_bytes)) ;
    IBUF \data_in_ibuf(0)  (.O (data_in_int[0]), .I (data_in[0])) ;
    IBUF \data_in_ibuf(1)  (.O (data_in_int[1]), .I (data_in[1])) ;
    IBUF \data_in_ibuf(2)  (.O (data_in_int[2]), .I (data_in[2])) ;
    IBUF \data_in_ibuf(3)  (.O (data_in_int[3]), .I (data_in[3])) ;
    IBUF \data_in_ibuf(4)  (.O (data_in_int[4]), .I (data_in[4])) ;
    IBUF \data_in_ibuf(5)  (.O (data_in_int[5]), .I (data_in[5])) ;
    IBUF \data_in_ibuf(6)  (.O (data_in_int[6]), .I (data_in[6])) ;
    IBUF \data_in_ibuf(7)  (.O (data_in_int[7]), .I (data_in[7])) ;
    IBUF \data_in_ibuf(8)  (.O (data_in_int[8]), .I (data_in[8])) ;
    IBUF \data_in_ibuf(9)  (.O (data_in_int[9]), .I (data_in[9])) ;
    IBUF \data_in_ibuf(10)  (.O (data_in_int[10]), .I (data_in[10])) ;
    IBUF \data_in_ibuf(11)  (.O (data_in_int[11]), .I (data_in[11])) ;
    IBUF \data_in_ibuf(12)  (.O (data_in_int[12]), .I (data_in[12])) ;
    IBUF \data_in_ibuf(13)  (.O (data_in_int[13]), .I (data_in[13])) ;
    IBUF \data_in_ibuf(14)  (.O (data_in_int[14]), .I (data_in[14])) ;
    IBUF \data_in_ibuf(15)  (.O (data_in_int[15]), .I (data_in[15])) ;
    IBUF \data_in_ibuf(16)  (.O (data_in_int[16]), .I (data_in[16])) ;
    IBUF \data_in_ibuf(17)  (.O (data_in_int[17]), .I (data_in[17])) ;
    IBUF \data_in_ibuf(18)  (.O (data_in_int[18]), .I (data_in[18])) ;
    IBUF \data_in_ibuf(19)  (.O (data_in_int[19]), .I (data_in[19])) ;
    IBUF \data_in_ibuf(20)  (.O (data_in_int[20]), .I (data_in[20])) ;
    IBUF \data_in_ibuf(21)  (.O (data_in_int[21]), .I (data_in[21])) ;
    IBUF \data_in_ibuf(22)  (.O (data_in_int[22]), .I (data_in[22])) ;
    IBUF \data_in_ibuf(23)  (.O (data_in_int[23]), .I (data_in[23])) ;
    IBUF \data_in_ibuf(24)  (.O (data_in_int[24]), .I (data_in[24])) ;
    IBUF \data_in_ibuf(25)  (.O (data_in_int[25]), .I (data_in[25])) ;
    IBUF \data_in_ibuf(26)  (.O (data_in_int[26]), .I (data_in[26])) ;
    IBUF \data_in_ibuf(27)  (.O (data_in_int[27]), .I (data_in[27])) ;
    IBUF \data_in_ibuf(28)  (.O (data_in_int[28]), .I (data_in[28])) ;
    IBUF \data_in_ibuf(29)  (.O (data_in_int[29]), .I (data_in[29])) ;
    IBUF \data_in_ibuf(30)  (.O (data_in_int[30]), .I (data_in[30])) ;
    IBUF \data_in_ibuf(31)  (.O (data_in_int[31]), .I (data_in[31])) ;
    IBUF \data_in_ibuf(32)  (.O (data_in_int[32]), .I (data_in[32])) ;
    IBUF \data_in_ibuf(33)  (.O (data_in_int[33]), .I (data_in[33])) ;
    IBUF \data_in_ibuf(34)  (.O (data_in_int[34]), .I (data_in[34])) ;
    IBUF \data_in_ibuf(35)  (.O (data_in_int[35]), .I (data_in[35])) ;
    IBUF \data_in_ibuf(36)  (.O (data_in_int[36]), .I (data_in[36])) ;
    IBUF \data_in_ibuf(37)  (.O (data_in_int[37]), .I (data_in[37])) ;
    IBUF \data_in_ibuf(38)  (.O (data_in_int[38]), .I (data_in[38])) ;
    IBUF \data_in_ibuf(39)  (.O (data_in_int[39]), .I (data_in[39])) ;
    IBUF \data_in_ibuf(40)  (.O (data_in_int[40]), .I (data_in[40])) ;
    IBUF \data_in_ibuf(41)  (.O (data_in_int[41]), .I (data_in[41])) ;
    IBUF \data_in_ibuf(42)  (.O (data_in_int[42]), .I (data_in[42])) ;
    IBUF \data_in_ibuf(43)  (.O (data_in_int[43]), .I (data_in[43])) ;
    IBUF \data_in_ibuf(44)  (.O (data_in_int[44]), .I (data_in[44])) ;
    IBUF \data_in_ibuf(45)  (.O (data_in_int[45]), .I (data_in[45])) ;
    IBUF \data_in_ibuf(46)  (.O (data_in_int[46]), .I (data_in[46])) ;
    IBUF \data_in_ibuf(47)  (.O (data_in_int[47]), .I (data_in[47])) ;
    IBUF \data_in_ibuf(48)  (.O (data_in_int[48]), .I (data_in[48])) ;
    IBUF \data_in_ibuf(49)  (.O (data_in_int[49]), .I (data_in[49])) ;
    IBUF \data_in_ibuf(50)  (.O (data_in_int[50]), .I (data_in[50])) ;
    IBUF \data_in_ibuf(51)  (.O (data_in_int[51]), .I (data_in[51])) ;
    IBUF \data_in_ibuf(52)  (.O (data_in_int[52]), .I (data_in[52])) ;
    IBUF \data_in_ibuf(53)  (.O (data_in_int[53]), .I (data_in[53])) ;
    IBUF \data_in_ibuf(54)  (.O (data_in_int[54]), .I (data_in[54])) ;
    IBUF \data_in_ibuf(55)  (.O (data_in_int[55]), .I (data_in[55])) ;
    IBUF \data_in_ibuf(56)  (.O (data_in_int[56]), .I (data_in[56])) ;
    IBUF \data_in_ibuf(57)  (.O (data_in_int[57]), .I (data_in[57])) ;
    IBUF \data_in_ibuf(58)  (.O (data_in_int[58]), .I (data_in[58])) ;
    IBUF \data_in_ibuf(59)  (.O (data_in_int[59]), .I (data_in[59])) ;
    IBUF \data_in_ibuf(60)  (.O (data_in_int[60]), .I (data_in[60])) ;
    IBUF \data_in_ibuf(61)  (.O (data_in_int[61]), .I (data_in[61])) ;
    IBUF \data_in_ibuf(62)  (.O (data_in_int[62]), .I (data_in[62])) ;
    IBUF \data_in_ibuf(63)  (.O (data_in_int[63]), .I (data_in[63])) ;
    FD \reg_data(63)  (.Q (data_dup_0[63]), .D (data_0n1ss1[63]), .C (clock_int)
       ) ;
    FD \reg_data(62)  (.Q (data_dup_0[62]), .D (data_0n1ss1[62]), .C (clock_int)
       ) ;
    FD \reg_data(61)  (.Q (data_dup_0[61]), .D (data_0n1ss1[61]), .C (clock_int)
       ) ;
    FD \reg_data(60)  (.Q (data_dup_0[60]), .D (data_0n1ss1[60]), .C (clock_int)
       ) ;
    FD \reg_data(59)  (.Q (data_dup_0[59]), .D (data_0n1ss1[59]), .C (clock_int)
       ) ;
    FD \reg_data(58)  (.Q (data_dup_0[58]), .D (data_0n1ss1[58]), .C (clock_int)
       ) ;
    FD \reg_data(57)  (.Q (data_dup_0[57]), .D (data_0n1ss1[57]), .C (clock_int)
       ) ;
    FD \reg_data(56)  (.Q (data_dup_0[56]), .D (data_0n1ss1[56]), .C (clock_int)
       ) ;
    FD \reg_data(55)  (.Q (data_dup_0[55]), .D (data_0n1ss1[55]), .C (clock_int)
       ) ;
    FD \reg_data(54)  (.Q (data_dup_0[54]), .D (data_0n1ss1[54]), .C (clock_int)
       ) ;
    FD \reg_data(53)  (.Q (data_dup_0[53]), .D (data_0n1ss1[53]), .C (clock_int)
       ) ;
    FD \reg_data(52)  (.Q (data_dup_0[52]), .D (data_0n1ss1[52]), .C (clock_int)
       ) ;
    FD \reg_data(51)  (.Q (data_dup_0[51]), .D (data_0n1ss1[51]), .C (clock_int)
       ) ;
    FD \reg_data(50)  (.Q (data_dup_0[50]), .D (data_0n1ss1[50]), .C (clock_int)
       ) ;
    FD \reg_data(49)  (.Q (data_dup_0[49]), .D (data_0n1ss1[49]), .C (clock_int)
       ) ;
    FD \reg_data(48)  (.Q (data_dup_0[48]), .D (data_0n1ss1[48]), .C (clock_int)
       ) ;
    FD \reg_data(47)  (.Q (data_dup_0[47]), .D (data_0n1ss1[47]), .C (clock_int)
       ) ;
    FD \reg_data(46)  (.Q (data_dup_0[46]), .D (data_0n1ss1[46]), .C (clock_int)
       ) ;
    FD \reg_data(45)  (.Q (data_dup_0[45]), .D (data_0n1ss1[45]), .C (clock_int)
       ) ;
    FD \reg_data(44)  (.Q (data_dup_0[44]), .D (data_0n1ss1[44]), .C (clock_int)
       ) ;
    FD \reg_data(43)  (.Q (data_dup_0[43]), .D (data_0n1ss1[43]), .C (clock_int)
       ) ;
    FD \reg_data(42)  (.Q (data_dup_0[42]), .D (data_0n1ss1[42]), .C (clock_int)
       ) ;
    FD \reg_data(41)  (.Q (data_dup_0[41]), .D (data_0n1ss1[41]), .C (clock_int)
       ) ;
    FD \reg_data(40)  (.Q (data_dup_0[40]), .D (data_0n1ss1[40]), .C (clock_int)
       ) ;
    FD \reg_data(39)  (.Q (data_dup_0[39]), .D (data_0n1ss1[39]), .C (clock_int)
       ) ;
    FD \reg_data(38)  (.Q (data_dup_0[38]), .D (data_0n1ss1[38]), .C (clock_int)
       ) ;
    FD \reg_data(37)  (.Q (data_dup_0[37]), .D (data_0n1ss1[37]), .C (clock_int)
       ) ;
    FD \reg_data(36)  (.Q (data_dup_0[36]), .D (data_0n1ss1[36]), .C (clock_int)
       ) ;
    FD \reg_data(35)  (.Q (data_dup_0[35]), .D (data_0n1ss1[35]), .C (clock_int)
       ) ;
    FD \reg_data(34)  (.Q (data_dup_0[34]), .D (data_0n1ss1[34]), .C (clock_int)
       ) ;
    FD \reg_data(33)  (.Q (data_dup_0[33]), .D (data_0n1ss1[33]), .C (clock_int)
       ) ;
    FD \reg_data(32)  (.Q (data_dup_0[32]), .D (data_0n1ss1[32]), .C (clock_int)
       ) ;
    FD \reg_data(31)  (.Q (data_dup_0[31]), .D (data_0n1ss1[31]), .C (clock_int)
       ) ;
    FD \reg_data(30)  (.Q (data_dup_0[30]), .D (data_0n1ss1[30]), .C (clock_int)
       ) ;
    FD \reg_data(29)  (.Q (data_dup_0[29]), .D (data_0n1ss1[29]), .C (clock_int)
       ) ;
    FD \reg_data(28)  (.Q (data_dup_0[28]), .D (data_0n1ss1[28]), .C (clock_int)
       ) ;
    FD \reg_data(27)  (.Q (data_dup_0[27]), .D (data_0n1ss1[27]), .C (clock_int)
       ) ;
    FD \reg_data(26)  (.Q (data_dup_0[26]), .D (data_0n1ss1[26]), .C (clock_int)
       ) ;
    FD \reg_data(25)  (.Q (data_dup_0[25]), .D (data_0n1ss1[25]), .C (clock_int)
       ) ;
    FD \reg_data(24)  (.Q (data_dup_0[24]), .D (data_0n1ss1[24]), .C (clock_int)
       ) ;
    FD \reg_data(23)  (.Q (data_dup_0[23]), .D (data_0n1ss1[23]), .C (clock_int)
       ) ;
    FD \reg_data(22)  (.Q (data_dup_0[22]), .D (data_0n1ss1[22]), .C (clock_int)
       ) ;
    FD \reg_data(21)  (.Q (data_dup_0[21]), .D (data_0n1ss1[21]), .C (clock_int)
       ) ;
    FD \reg_data(20)  (.Q (data_dup_0[20]), .D (data_0n1ss1[20]), .C (clock_int)
       ) ;
    FD \reg_data(19)  (.Q (data_dup_0[19]), .D (data_0n1ss1[19]), .C (clock_int)
       ) ;
    FD \reg_data(18)  (.Q (data_dup_0[18]), .D (data_0n1ss1[18]), .C (clock_int)
       ) ;
    FD \reg_data(17)  (.Q (data_dup_0[17]), .D (data_0n1ss1[17]), .C (clock_int)
       ) ;
    FD \reg_data(16)  (.Q (data_dup_0[16]), .D (data_0n1ss1[16]), .C (clock_int)
       ) ;
    FD \reg_data(15)  (.Q (data_dup_0[15]), .D (data_0n1ss1[15]), .C (clock_int)
       ) ;
    FD \reg_data(14)  (.Q (data_dup_0[14]), .D (data_0n1ss1[14]), .C (clock_int)
       ) ;
    FD \reg_data(13)  (.Q (data_dup_0[13]), .D (data_0n1ss1[13]), .C (clock_int)
       ) ;
    FD \reg_data(12)  (.Q (data_dup_0[12]), .D (data_0n1ss1[12]), .C (clock_int)
       ) ;
    FD \reg_data(11)  (.Q (data_dup_0[11]), .D (data_0n1ss1[11]), .C (clock_int)
       ) ;
    FD \reg_data(10)  (.Q (data_dup_0[10]), .D (data_0n1ss1[10]), .C (clock_int)
       ) ;
    FD \reg_data(9)  (.Q (data_dup_0[9]), .D (data_0n1ss1[9]), .C (clock_int)) ;
    FD \reg_data(8)  (.Q (data_dup_0[8]), .D (data_0n1ss1[8]), .C (clock_int)) ;
    FD \reg_data(7)  (.Q (data_dup_0[7]), .D (data_0n1ss1[7]), .C (clock_int)) ;
    FD \reg_data(6)  (.Q (data_dup_0[6]), .D (data_0n1ss1[6]), .C (clock_int)) ;
    FD \reg_data(5)  (.Q (data_dup_0[5]), .D (data_0n1ss1[5]), .C (clock_int)) ;
    FD \reg_data(4)  (.Q (data_dup_0[4]), .D (data_0n1ss1[4]), .C (clock_int)) ;
    FD \reg_data(3)  (.Q (data_dup_0[3]), .D (data_0n1ss1[3]), .C (clock_int)) ;
    FD \reg_data(2)  (.Q (data_dup_0[2]), .D (data_0n1ss1[2]), .C (clock_int)) ;
    FD \reg_data(1)  (.Q (data_dup_0[1]), .D (data_0n1ss1[1]), .C (clock_int)) ;
    FD \reg_data(0)  (.Q (data_dup_0[0]), .D (data_0n1ss1[0]), .C (clock_int)) ;
    LUT3 ix6767z1530 (.O (data_0n1ss1[63]), .I0 (swap_bytes_int), .I1 (
         data_dup_0[7]), .I2 (data_in_int[63])) ;
         defparam ix6767z1530.INIT = 8'hD8;
    LUT3 ix7764z1530 (.O (data_0n1ss1[62]), .I0 (swap_bytes_int), .I1 (
         data_dup_0[6]), .I2 (data_in_int[62])) ;
         defparam ix7764z1530.INIT = 8'hD8;
    LUT3 ix8761z1530 (.O (data_0n1ss1[61]), .I0 (swap_bytes_int), .I1 (
         data_dup_0[5]), .I2 (data_in_int[61])) ;
         defparam ix8761z1530.INIT = 8'hD8;
    LUT3 ix9758z1530 (.O (data_0n1ss1[60]), .I0 (swap_bytes_int), .I1 (
         data_dup_0[4]), .I2 (data_in_int[60])) ;
         defparam ix9758z1530.INIT = 8'hD8;
    LUT3 ix11754z1530 (.O (data_0n1ss1[59]), .I0 (swap_bytes_int), .I1 (
         data_dup_0[3]), .I2 (data_in_int[59])) ;
         defparam ix11754z1530.INIT = 8'hD8;
    LUT3 ix12751z1530 (.O (data_0n1ss1[58]), .I0 (swap_bytes_int), .I1 (
         data_dup_0[2]), .I2 (data_in_int[58])) ;
         defparam ix12751z1530.INIT = 8'hD8;
    LUT3 ix13748z1530 (.O (data_0n1ss1[57]), .I0 (swap_bytes_int), .I1 (
         data_dup_0[1]), .I2 (data_in_int[57])) ;
         defparam ix13748z1530.INIT = 8'hD8;
    LUT3 ix14745z1530 (.O (data_0n1ss1[56]), .I0 (swap_bytes_int), .I1 (
         data_dup_0[0]), .I2 (data_in_int[56])) ;
         defparam ix14745z1530.INIT = 8'hD8;
    LUT3 ix15742z1530 (.O (data_0n1ss1[55]), .I0 (swap_bytes_int), .I1 (
         data_dup_0[15]), .I2 (data_in_int[55])) ;
         defparam ix15742z1530.INIT = 8'hD8;
    LUT3 ix16739z1530 (.O (data_0n1ss1[54]), .I0 (swap_bytes_int), .I1 (
         data_dup_0[14]), .I2 (data_in_int[54])) ;
         defparam ix16739z1530.INIT = 8'hD8;
    LUT3 ix17736z1530 (.O (data_0n1ss1[53]), .I0 (swap_bytes_int), .I1 (
         data_dup_0[13]), .I2 (data_in_int[53])) ;
         defparam ix17736z1530.INIT = 8'hD8;
    LUT3 ix18733z1530 (.O (data_0n1ss1[52]), .I0 (swap_bytes_int), .I1 (
         data_dup_0[12]), .I2 (data_in_int[52])) ;
         defparam ix18733z1530.INIT = 8'hD8;
    LUT3 ix19730z1530 (.O (data_0n1ss1[51]), .I0 (swap_bytes_int), .I1 (
         data_dup_0[11]), .I2 (data_in_int[51])) ;
         defparam ix19730z1530.INIT = 8'hD8;
    LUT3 ix20727z1530 (.O (data_0n1ss1[50]), .I0 (swap_bytes_int), .I1 (
         data_dup_0[10]), .I2 (data_in_int[50])) ;
         defparam ix20727z1530.INIT = 8'hD8;
    LUT3 ix22723z1530 (.O (data_0n1ss1[49]), .I0 (swap_bytes_int), .I1 (
         data_dup_0[9]), .I2 (data_in_int[49])) ;
         defparam ix22723z1530.INIT = 8'hD8;
    LUT3 ix23720z1530 (.O (data_0n1ss1[48]), .I0 (swap_bytes_int), .I1 (
         data_dup_0[8]), .I2 (data_in_int[48])) ;
         defparam ix23720z1530.INIT = 8'hD8;
    LUT3 ix24717z1530 (.O (data_0n1ss1[47]), .I0 (swap_bytes_int), .I1 (
         data_dup_0[23]), .I2 (data_in_int[47])) ;
         defparam ix24717z1530.INIT = 8'hD8;
    LUT3 ix25714z1530 (.O (data_0n1ss1[46]), .I0 (swap_bytes_int), .I1 (
         data_dup_0[22]), .I2 (data_in_int[46])) ;
         defparam ix25714z1530.INIT = 8'hD8;
    LUT3 ix26711z1530 (.O (data_0n1ss1[45]), .I0 (swap_bytes_int), .I1 (
         data_dup_0[21]), .I2 (data_in_int[45])) ;
         defparam ix26711z1530.INIT = 8'hD8;
    LUT3 ix27708z1530 (.O (data_0n1ss1[44]), .I0 (swap_bytes_int), .I1 (
         data_dup_0[20]), .I2 (data_in_int[44])) ;
         defparam ix27708z1530.INIT = 8'hD8;
    LUT3 ix28705z1530 (.O (data_0n1ss1[43]), .I0 (swap_bytes_int), .I1 (
         data_dup_0[19]), .I2 (data_in_int[43])) ;
         defparam ix28705z1530.INIT = 8'hD8;
    LUT3 ix29702z1530 (.O (data_0n1ss1[42]), .I0 (swap_bytes_int), .I1 (
         data_dup_0[18]), .I2 (data_in_int[42])) ;
         defparam ix29702z1530.INIT = 8'hD8;
    LUT3 ix30699z1530 (.O (data_0n1ss1[41]), .I0 (swap_bytes_int), .I1 (
         data_dup_0[17]), .I2 (data_in_int[41])) ;
         defparam ix30699z1530.INIT = 8'hD8;
    LUT3 ix31696z1530 (.O (data_0n1ss1[40]), .I0 (swap_bytes_int), .I1 (
         data_dup_0[16]), .I2 (data_in_int[40])) ;
         defparam ix31696z1530.INIT = 8'hD8;
    LUT3 ix33692z1530 (.O (data_0n1ss1[39]), .I0 (swap_bytes_int), .I1 (
         data_dup_0[31]), .I2 (data_in_int[39])) ;
         defparam ix33692z1530.INIT = 8'hD8;
    LUT3 ix34689z1530 (.O (data_0n1ss1[38]), .I0 (swap_bytes_int), .I1 (
         data_dup_0[30]), .I2 (data_in_int[38])) ;
         defparam ix34689z1530.INIT = 8'hD8;
    LUT3 ix35686z1530 (.O (data_0n1ss1[37]), .I0 (swap_bytes_int), .I1 (
         data_dup_0[29]), .I2 (data_in_int[37])) ;
         defparam ix35686z1530.INIT = 8'hD8;
    LUT3 ix36683z1530 (.O (data_0n1ss1[36]), .I0 (swap_bytes_int), .I1 (
         data_dup_0[28]), .I2 (data_in_int[36])) ;
         defparam ix36683z1530.INIT = 8'hD8;
    LUT3 ix37680z1530 (.O (data_0n1ss1[35]), .I0 (swap_bytes_int), .I1 (
         data_dup_0[27]), .I2 (data_in_int[35])) ;
         defparam ix37680z1530.INIT = 8'hD8;
    LUT3 ix38677z1530 (.O (data_0n1ss1[34]), .I0 (swap_bytes_int), .I1 (
         data_dup_0[26]), .I2 (data_in_int[34])) ;
         defparam ix38677z1530.INIT = 8'hD8;
    LUT3 ix39674z1530 (.O (data_0n1ss1[33]), .I0 (swap_bytes_int), .I1 (
         data_dup_0[25]), .I2 (data_in_int[33])) ;
         defparam ix39674z1530.INIT = 8'hD8;
    LUT3 ix40671z1530 (.O (data_0n1ss1[32]), .I0 (swap_bytes_int), .I1 (
         data_dup_0[24]), .I2 (data_in_int[32])) ;
         defparam ix40671z1530.INIT = 8'hD8;
    LUT3 ix41668z1530 (.O (data_0n1ss1[31]), .I0 (swap_bytes_int), .I1 (
         data_dup_0[39]), .I2 (data_in_int[31])) ;
         defparam ix41668z1530.INIT = 8'hD8;
    LUT3 ix42665z1530 (.O (data_0n1ss1[30]), .I0 (swap_bytes_int), .I1 (
         data_dup_0[38]), .I2 (data_in_int[30])) ;
         defparam ix42665z1530.INIT = 8'hD8;
    LUT3 ix44661z1530 (.O (data_0n1ss1[29]), .I0 (swap_bytes_int), .I1 (
         data_dup_0[37]), .I2 (data_in_int[29])) ;
         defparam ix44661z1530.INIT = 8'hD8;
    LUT3 ix45658z1530 (.O (data_0n1ss1[28]), .I0 (swap_bytes_int), .I1 (
         data_dup_0[36]), .I2 (data_in_int[28])) ;
         defparam ix45658z1530.INIT = 8'hD8;
    LUT3 ix46655z1530 (.O (data_0n1ss1[27]), .I0 (swap_bytes_int), .I1 (
         data_dup_0[35]), .I2 (data_in_int[27])) ;
         defparam ix46655z1530.INIT = 8'hD8;
    LUT3 ix47652z1530 (.O (data_0n1ss1[26]), .I0 (swap_bytes_int), .I1 (
         data_dup_0[34]), .I2 (data_in_int[26])) ;
         defparam ix47652z1530.INIT = 8'hD8;
    LUT3 ix48649z1530 (.O (data_0n1ss1[25]), .I0 (swap_bytes_int), .I1 (
         data_dup_0[33]), .I2 (data_in_int[25])) ;
         defparam ix48649z1530.INIT = 8'hD8;
    LUT3 ix49646z1530 (.O (data_0n1ss1[24]), .I0 (swap_bytes_int), .I1 (
         data_dup_0[32]), .I2 (data_in_int[24])) ;
         defparam ix49646z1530.INIT = 8'hD8;
    LUT3 ix50643z1530 (.O (data_0n1ss1[23]), .I0 (swap_bytes_int), .I1 (
         data_dup_0[47]), .I2 (data_in_int[23])) ;
         defparam ix50643z1530.INIT = 8'hD8;
    LUT3 ix51640z1530 (.O (data_0n1ss1[22]), .I0 (swap_bytes_int), .I1 (
         data_dup_0[46]), .I2 (data_in_int[22])) ;
         defparam ix51640z1530.INIT = 8'hD8;
    LUT3 ix52637z1530 (.O (data_0n1ss1[21]), .I0 (swap_bytes_int), .I1 (
         data_dup_0[45]), .I2 (data_in_int[21])) ;
         defparam ix52637z1530.INIT = 8'hD8;
    LUT3 ix53634z1530 (.O (data_0n1ss1[20]), .I0 (swap_bytes_int), .I1 (
         data_dup_0[44]), .I2 (data_in_int[20])) ;
         defparam ix53634z1530.INIT = 8'hD8;
    LUT3 ix55630z1530 (.O (data_0n1ss1[19]), .I0 (swap_bytes_int), .I1 (
         data_dup_0[43]), .I2 (data_in_int[19])) ;
         defparam ix55630z1530.INIT = 8'hD8;
    LUT3 ix56627z1530 (.O (data_0n1ss1[18]), .I0 (swap_bytes_int), .I1 (
         data_dup_0[42]), .I2 (data_in_int[18])) ;
         defparam ix56627z1530.INIT = 8'hD8;
    LUT3 ix57624z1530 (.O (data_0n1ss1[17]), .I0 (swap_bytes_int), .I1 (
         data_dup_0[41]), .I2 (data_in_int[17])) ;
         defparam ix57624z1530.INIT = 8'hD8;
    LUT3 ix58621z1530 (.O (data_0n1ss1[16]), .I0 (swap_bytes_int), .I1 (
         data_dup_0[40]), .I2 (data_in_int[16])) ;
         defparam ix58621z1530.INIT = 8'hD8;
    LUT3 ix59618z1530 (.O (data_0n1ss1[15]), .I0 (swap_bytes_int), .I1 (
         data_dup_0[55]), .I2 (data_in_int[15])) ;
         defparam ix59618z1530.INIT = 8'hD8;
    LUT3 ix60615z1530 (.O (data_0n1ss1[14]), .I0 (swap_bytes_int), .I1 (
         data_dup_0[54]), .I2 (data_in_int[14])) ;
         defparam ix60615z1530.INIT = 8'hD8;
    LUT3 ix61612z1530 (.O (data_0n1ss1[13]), .I0 (swap_bytes_int), .I1 (
         data_dup_0[53]), .I2 (data_in_int[13])) ;
         defparam ix61612z1530.INIT = 8'hD8;
    LUT3 ix62609z1530 (.O (data_0n1ss1[12]), .I0 (swap_bytes_int), .I1 (
         data_dup_0[52]), .I2 (data_in_int[12])) ;
         defparam ix62609z1530.INIT = 8'hD8;
    LUT3 ix63606z1530 (.O (data_0n1ss1[11]), .I0 (swap_bytes_int), .I1 (
         data_dup_0[51]), .I2 (data_in_int[11])) ;
         defparam ix63606z1530.INIT = 8'hD8;
    LUT3 ix64603z1530 (.O (data_0n1ss1[10]), .I0 (swap_bytes_int), .I1 (
         data_dup_0[50]), .I2 (data_in_int[10])) ;
         defparam ix64603z1530.INIT = 8'hD8;
    LUT3 ix11027z1530 (.O (data_0n1ss1[9]), .I0 (swap_bytes_int), .I1 (
         data_dup_0[49]), .I2 (data_in_int[9])) ;
         defparam ix11027z1530.INIT = 8'hD8;
    LUT3 ix12024z1530 (.O (data_0n1ss1[8]), .I0 (swap_bytes_int), .I1 (
         data_dup_0[48]), .I2 (data_in_int[8])) ;
         defparam ix12024z1530.INIT = 8'hD8;
    LUT3 ix13021z1486 (.O (data_0n1ss1[7]), .I0 (data_dup_0[63]), .I1 (
         data_in_int[7]), .I2 (swap_bytes_int)) ;
         defparam ix13021z1486.INIT = 8'hAC;
    LUT3 ix14018z1530 (.O (data_0n1ss1[6]), .I0 (swap_bytes_int), .I1 (
         data_dup_0[62]), .I2 (data_in_int[6])) ;
         defparam ix14018z1530.INIT = 8'hD8;
    LUT3 ix15015z1530 (.O (data_0n1ss1[5]), .I0 (swap_bytes_int), .I1 (
         data_dup_0[61]), .I2 (data_in_int[5])) ;
         defparam ix15015z1530.INIT = 8'hD8;
    LUT3 ix16012z1530 (.O (data_0n1ss1[4]), .I0 (swap_bytes_int), .I1 (
         data_dup_0[60]), .I2 (data_in_int[4])) ;
         defparam ix16012z1530.INIT = 8'hD8;
    LUT3 ix17009z1530 (.O (data_0n1ss1[3]), .I0 (swap_bytes_int), .I1 (
         data_dup_0[59]), .I2 (data_in_int[3])) ;
         defparam ix17009z1530.INIT = 8'hD8;
    LUT3 ix18006z1530 (.O (data_0n1ss1[2]), .I0 (swap_bytes_int), .I1 (
         data_dup_0[58]), .I2 (data_in_int[2])) ;
         defparam ix18006z1530.INIT = 8'hD8;
    LUT3 ix19003z1530 (.O (data_0n1ss1[1]), .I0 (swap_bytes_int), .I1 (
         data_dup_0[57]), .I2 (data_in_int[1])) ;
         defparam ix19003z1530.INIT = 8'hD8;
    LUT3 ix20000z1530 (.O (data_0n1ss1[0]), .I0 (swap_bytes_int), .I1 (
         data_dup_0[56]), .I2 (data_in_int[0])) ;
         defparam ix20000z1530.INIT = 8'hD8;
    BUFGP clock_ibuf (.O (clock_int), .I (clock)) ;
endmodule

