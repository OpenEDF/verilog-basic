//
// Verilog description for cell count_ones, 
// 08/08/16 13:05:12
//
// Precision RTL Synthesis, 32-bit 2015.1.6//


module count_ones ( data_bus, count ) ;

    input [15:0]data_bus ;
    output [4:0]count ;

    wire [4:0]count_dup_0;
    wire nx59300z2, nx59299z5, nx59298z4, nx53922z1;
    wire [15:0]data_bus_int;
    wire GND;
    wire [1:0]count_0n16s6;
    wire [1:0]count_0n16s7;
    wire [1:0]count_0n16s9;
    wire [1:0]count_0n16s10;
    wire [2:0]count_0n16s8;
    wire nx59301z2, nx59298z3, nx59299z2, nx59299z3, nx59299z4, nx59300z1, 
         nx59301z1, nx59299z1, nx59298z2, nx59298z1;



    XORCY modgen_add_6_xorcy_0 (.O (count_dup_0[0]), .LI (nx59301z1), .CI (GND)
          ) ;
    MUXCY_L modgen_add_6_muxcy_0 (.LO (nx59300z2), .S (nx59301z1), .DI (
            nx59301z2), .CI (GND)) ;
    XORCY modgen_add_6_xorcy_1 (.O (count_dup_0[1]), .LI (nx59300z1), .CI (
          nx59300z2)) ;
    MUXCY_L modgen_add_6_muxcy_1 (.LO (nx59299z5), .S (nx59300z1), .DI (GND), .CI (
            nx59300z2)) ;
    XORCY modgen_add_6_xorcy_2 (.O (count_dup_0[2]), .LI (nx59299z1), .CI (
          nx59299z5)) ;
    MUXCY_L modgen_add_6_muxcy_2 (.LO (nx59298z4), .S (nx59299z1), .DI (
            nx59299z4), .CI (nx59299z5)) ;
    XORCY modgen_add_6_xorcy_3 (.O (count_dup_0[3]), .LI (nx59298z1), .CI (
          nx59298z4)) ;
    MUXCY_L modgen_add_6_muxcy_3 (.LO (nx53922z1), .S (nx59298z1), .DI (GND), .CI (
            nx59298z4)) ;
    XORCY modgen_add_6_xorcy_4 (.O (count_dup_0[4]), .LI (GND), .CI (nx53922z1)
          ) ;
    OBUF \count_obuf(0)  (.O (count[0]), .I (count_dup_0[0])) ;
    OBUF \count_obuf(1)  (.O (count[1]), .I (count_dup_0[1])) ;
    OBUF \count_obuf(2)  (.O (count[2]), .I (count_dup_0[2])) ;
    OBUF \count_obuf(3)  (.O (count[3]), .I (count_dup_0[3])) ;
    OBUF \count_obuf(4)  (.O (count[4]), .I (count_dup_0[4])) ;
    IBUF \data_bus_ibuf(0)  (.O (data_bus_int[0]), .I (data_bus[0])) ;
    IBUF \data_bus_ibuf(1)  (.O (data_bus_int[1]), .I (data_bus[1])) ;
    IBUF \data_bus_ibuf(2)  (.O (data_bus_int[2]), .I (data_bus[2])) ;
    IBUF \data_bus_ibuf(3)  (.O (data_bus_int[3]), .I (data_bus[3])) ;
    IBUF \data_bus_ibuf(4)  (.O (data_bus_int[4]), .I (data_bus[4])) ;
    IBUF \data_bus_ibuf(5)  (.O (data_bus_int[5]), .I (data_bus[5])) ;
    IBUF \data_bus_ibuf(6)  (.O (data_bus_int[6]), .I (data_bus[6])) ;
    IBUF \data_bus_ibuf(7)  (.O (data_bus_int[7]), .I (data_bus[7])) ;
    IBUF \data_bus_ibuf(8)  (.O (data_bus_int[8]), .I (data_bus[8])) ;
    IBUF \data_bus_ibuf(9)  (.O (data_bus_int[9]), .I (data_bus[9])) ;
    IBUF \data_bus_ibuf(10)  (.O (data_bus_int[10]), .I (data_bus[10])) ;
    IBUF \data_bus_ibuf(11)  (.O (data_bus_int[11]), .I (data_bus[11])) ;
    IBUF \data_bus_ibuf(12)  (.O (data_bus_int[12]), .I (data_bus[12])) ;
    IBUF \data_bus_ibuf(13)  (.O (data_bus_int[13]), .I (data_bus[13])) ;
    IBUF \data_bus_ibuf(14)  (.O (data_bus_int[14]), .I (data_bus[14])) ;
    IBUF \data_bus_ibuf(15)  (.O (data_bus_int[15]), .I (data_bus[15])) ;
    GND GND_rename9 (.G (GND)) ;
    LUT3 ix59299z1547 (.O (count_0n16s6[1]), .I0 (data_bus_int[14]), .I1 (
         data_bus_int[13]), .I2 (data_bus_int[6])) ;
         defparam ix59299z1547.INIT = 8'hE8;
    LUT3 ix59299z1467 (.O (count_0n16s6[0]), .I0 (data_bus_int[6]), .I1 (
         data_bus_int[14]), .I2 (data_bus_int[13])) ;
         defparam ix59299z1467.INIT = 8'h96;
    LUT3 ix59298z1547 (.O (count_0n16s7[1]), .I0 (data_bus_int[8]), .I1 (
         data_bus_int[7]), .I2 (data_bus_int[2])) ;
         defparam ix59298z1547.INIT = 8'hE8;
    LUT3 ix59299z1468 (.O (count_0n16s7[0]), .I0 (data_bus_int[2]), .I1 (
         data_bus_int[8]), .I2 (data_bus_int[7])) ;
         defparam ix59299z1468.INIT = 8'h96;
    LUT3 ix59298z1549 (.O (count_0n16s9[1]), .I0 (data_bus_int[12]), .I1 (
         data_bus_int[11]), .I2 (data_bus_int[5])) ;
         defparam ix59298z1549.INIT = 8'hE8;
    LUT3 ix59298z1470 (.O (count_0n16s9[0]), .I0 (data_bus_int[12]), .I1 (
         data_bus_int[11]), .I2 (data_bus_int[5])) ;
         defparam ix59298z1470.INIT = 8'h96;
    LUT3 ix59298z1550 (.O (count_0n16s10[1]), .I0 (data_bus_int[9]), .I1 (
         data_bus_int[4]), .I2 (data_bus_int[3])) ;
         defparam ix59298z1550.INIT = 8'hE8;
    LUT3 ix59298z1471 (.O (count_0n16s10[0]), .I0 (data_bus_int[4]), .I1 (
         data_bus_int[9]), .I2 (data_bus_int[3])) ;
         defparam ix59298z1471.INIT = 8'h96;
    LUT3 ix59298z1548 (.O (count_0n16s8[2]), .I0 (count_0n16s9[1]), .I1 (
         count_0n16s10[1]), .I2 (nx59298z2)) ;
         defparam ix59298z1548.INIT = 8'hE8;
    LUT3 ix59298z1472 (.O (count_0n16s8[1]), .I0 (nx59298z2), .I1 (
         count_0n16s9[1]), .I2 (count_0n16s10[1])) ;
         defparam ix59298z1472.INIT = 8'h96;
    LUT3 ix59299z1469 (.O (count_0n16s8[0]), .I0 (data_bus_int[0]), .I1 (
         count_0n16s9[0]), .I2 (count_0n16s10[0])) ;
         defparam ix59299z1469.INIT = 8'h96;
    LUT3 ix59301z1465 (.O (nx59301z2), .I0 (data_bus_int[10]), .I1 (
         data_bus_int[15]), .I2 (data_bus_int[1])) ;
         defparam ix59301z1465.INIT = 8'h96;
    LUT3 ix59298z1555 (.O (nx59298z3), .I0 (data_bus_int[15]), .I1 (
         data_bus_int[10]), .I2 (data_bus_int[1])) ;
         defparam ix59298z1555.INIT = 8'hE8;
    LUT3 ix59299z1548 (.O (nx59299z2), .I0 (count_0n16s6[0]), .I1 (
         count_0n16s7[0]), .I2 (count_0n16s8[0])) ;
         defparam ix59299z1548.INIT = 8'hE8;
    LUT3 ix59299z1470 (.O (nx59299z3), .I0 (count_0n16s8[1]), .I1 (
         count_0n16s7[1]), .I2 (nx59298z3)) ;
         defparam ix59299z1470.INIT = 8'h96;
    LUT4 ix59299z15253 (.O (nx59299z4), .I0 (count_0n16s7[1]), .I1 (
         count_0n16s8[2]), .I2 (count_0n16s8[1]), .I3 (nx59298z3)) ;
         defparam ix59299z15253.INIT = 16'h366C;
    LUT3 ix59300z1464 (.O (nx59300z1), .I0 (nx59299z3), .I1 (count_0n16s6[1]), .I2 (
         nx59299z2)) ;
         defparam ix59300z1464.INIT = 8'h96;
    LUT4 ix59301z28344 (.O (nx59301z1), .I0 (nx59301z2), .I1 (count_0n16s8[0]), 
         .I2 (count_0n16s6[0]), .I3 (count_0n16s7[0])) ;
         defparam ix59301z28344.INIT = 16'h6996;
    LUT4 ix59299z7434 (.O (nx59299z1), .I0 (count_0n16s6[1]), .I1 (nx59299z2), .I2 (
         nx59299z3), .I3 (nx59299z4)) ;
         defparam ix59299z7434.INIT = 16'h17E8;
    LUT3 ix59298z1551 (.O (nx59298z2), .I0 (count_0n16s9[0]), .I1 (
         count_0n16s10[0]), .I2 (data_bus_int[0])) ;
         defparam ix59298z1551.INIT = 8'hE8;
    LUT4 ix59298z52642 (.O (nx59298z1), .I0 (count_0n16s7[1]), .I1 (
         count_0n16s8[2]), .I2 (count_0n16s8[1]), .I3 (nx59298z3)) ;
         defparam ix59298z52642.INIT = 16'hC880;
endmodule

