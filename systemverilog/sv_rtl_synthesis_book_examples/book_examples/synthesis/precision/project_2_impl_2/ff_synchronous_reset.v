//
// Verilog description for cell ff_synchronous_reset, 
// 09/18/16 01:00:32
//
// Precision RTL Synthesis, 32-bit 2015.1.6//


module ff_synchronous_reset ( q, d, clock, reset ) ;

    output [0:0]q ;
    input [0:0]d ;
    input clock ;
    input reset ;

    wire nx51271z2;
    wire [0:0]nx16;



    DFF reg_q_0 (.Q (q[0]), .D (nx16[0]), .CLK (clock), .CLRN (nx51271z2), .PRN (
        nx51271z2)) ;
    VCC ps_vcc (.Y (nx51271z2)) ;
    assign nx16[0] = (d[0] &&  ~reset) ;
endmodule

