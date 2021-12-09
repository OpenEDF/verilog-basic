//
// Verilog description for cell latch, 
// 08/18/16 23:25:56
//
// Precision RTL Synthesis, 32-bit 2015.1.6//


module latch ( ena, in, out ) ;

    input ena ;
    input [3:0]in ;
    output [3:0]out ;




    LD \lat_out(3)  (.Q (out[3]), .D (in[3]), .G (ena)) ;
    LD \lat_out(2)  (.Q (out[2]), .D (in[2]), .G (ena)) ;
    LD \lat_out(1)  (.Q (out[1]), .D (in[1]), .G (ena)) ;
    LD \lat_out(0)  (.Q (out[0]), .D (in[0]), .G (ena)) ;
endmodule

