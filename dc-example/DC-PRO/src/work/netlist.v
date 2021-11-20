/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : L-2016.03-SP1
// Date      : Sat Nov 20 21:38:09 2021
/////////////////////////////////////////////////////////////


module flowled ( sys_clk, sys_rst_n, led_out );
  output [7:0] led_out;
  input sys_clk, sys_rst_n;
  wire   \counter[0] , n14, n15, n16, n17, n18, n19, n20, n21, n44, n45, n46,
         n47, n48, n49, n50, n51;

  DFFSX1 \counter_reg[1]  ( .D(n44), .CK(sys_clk), .SN(sys_rst_n), .Q(n49) );
  DFFSX1 \counter_reg[0]  ( .D(n45), .CK(sys_clk), .SN(sys_rst_n), .Q(n50), 
        .QN(\counter[0] ) );
  DFFSX1 \led_out_reg[0]  ( .D(n21), .CK(sys_clk), .SN(sys_rst_n), .Q(
        led_out[0]), .QN(n51) );
  DFFSX1 \led_out_reg[7]  ( .D(n14), .CK(sys_clk), .SN(sys_rst_n), .QN(
        led_out[7]) );
  DFFSX1 \led_out_reg[1]  ( .D(n20), .CK(sys_clk), .SN(sys_rst_n), .QN(
        led_out[1]) );
  DFFSX1 \led_out_reg[2]  ( .D(n19), .CK(sys_clk), .SN(sys_rst_n), .QN(
        led_out[2]) );
  DFFSX1 \led_out_reg[3]  ( .D(n18), .CK(sys_clk), .SN(sys_rst_n), .QN(
        led_out[3]) );
  DFFSX1 \led_out_reg[4]  ( .D(n17), .CK(sys_clk), .SN(sys_rst_n), .QN(
        led_out[4]) );
  DFFSX1 \led_out_reg[5]  ( .D(n16), .CK(sys_clk), .SN(sys_rst_n), .QN(
        led_out[5]) );
  DFFSX1 \led_out_reg[6]  ( .D(n15), .CK(sys_clk), .SN(sys_rst_n), .QN(
        led_out[6]) );
  NOR2XL U48 ( .A(\counter[0] ), .B(n49), .Y(n48) );
  MXI2XL U49 ( .A(led_out[7]), .B(led_out[6]), .S0(n48), .Y(n14) );
  NAND2XL U50 ( .A(n49), .B(n50), .Y(n45) );
  MXI2XL U51 ( .A(led_out[6]), .B(led_out[5]), .S0(n48), .Y(n15) );
  MXI2XL U52 ( .A(led_out[5]), .B(led_out[4]), .S0(n48), .Y(n16) );
  MXI2XL U53 ( .A(led_out[4]), .B(led_out[3]), .S0(n48), .Y(n17) );
  MXI2XL U54 ( .A(led_out[3]), .B(led_out[2]), .S0(n48), .Y(n18) );
  MXI2XL U55 ( .A(led_out[2]), .B(led_out[1]), .S0(n48), .Y(n19) );
  MXI2XL U56 ( .A(led_out[1]), .B(led_out[0]), .S0(n48), .Y(n20) );
  NAND2XL U57 ( .A(n48), .B(led_out[7]), .Y(n47) );
  NAND2XL U58 ( .A(n49), .B(n46), .Y(n44) );
  XNOR2XL U59 ( .A(n49), .B(\counter[0] ), .Y(n46) );
  OAI21XL U60 ( .A0(n48), .A1(n51), .B0(n47), .Y(n21) );
endmodule

