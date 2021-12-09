//
// Verilog description for cell srff, 
// 08/19/16 04:27:37
//
// Precision RTL Synthesis, 32-bit 2015.1.6//


module srff ( clk, rstN, preN, d, q ) ;

    input clk ;
    input rstN ;
    input preN ;
    input [0:0]d ;
    output [0:0]q ;

    wire not_rstN, nx51271z1;



    FDCP \reg_q(0)  (.Q (q[0]), .D (d[0]), .C (clk), .CLR (not_rstN), .PRE (
         nx51271z1)) ;
    LUT1 ix51271z1315 (.O (not_rstN), .I0 (rstN)) ;
         defparam ix51271z1315.INIT = 4'h1;
    LUT2 ix51271z1317 (.O (nx51271z1), .I0 (rstN), .I1 (preN)) ;
         defparam ix51271z1317.INIT = 4'h2;
endmodule

