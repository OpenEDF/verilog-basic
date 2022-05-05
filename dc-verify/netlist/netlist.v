/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : L-2016.03-SP1
// Date      : Thu May  5 11:01:37 2022
/////////////////////////////////////////////////////////////


module relation ( a, b, c );
  input [1:0] a;
  input [1:0] b;
  output [0:0] c;
  wire   \eq_x_1/n17 , \eq_x_1/n16 , n1, n3;

  INVXL \eq_x_1/U19  ( .A(b[0]), .Y(\eq_x_1/n16 ) );
  INVXL \eq_x_1/U18  ( .A(b[1]), .Y(\eq_x_1/n17 ) );
  XOR2XL U2 ( .A(\eq_x_1/n17 ), .B(a[1]), .Y(n1) );
  AND2XL U3 ( .A(n1), .B(n3), .Y(c[0]) );
  XOR2XL U4 ( .A(\eq_x_1/n16 ), .B(a[0]), .Y(n3) );
endmodule

