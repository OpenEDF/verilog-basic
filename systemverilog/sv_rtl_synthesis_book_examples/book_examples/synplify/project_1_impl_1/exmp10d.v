//
// Verilog description for cell exmp10d, 
// 02/06/14 23:24:41
//
// Precision RTL Synthesis, 2013a.9//


module exmp10d ( nextstate, state ) ;

    output [2:0]nextstate ;
    input [2:0]state ;

    wire [2:0]nextstate_dup_0;
    wire [2:0]state_int;
    wire nx45479z1;



    OBUF \nextstate_obuf(0)  (.O (nextstate[0]), .I (nextstate_dup_0[0])) ;
    OBUF \nextstate_obuf(1)  (.O (nextstate[1]), .I (nextstate_dup_0[1])) ;
    OBUF \nextstate_obuf(2)  (.O (nextstate[2]), .I (nextstate_dup_0[2])) ;
    IBUF \state_ibuf(0)  (.O (state_int[0]), .I (state[0])) ;
    IBUF \state_ibuf(1)  (.O (state_int[1]), .I (state[1])) ;
    IBUF \state_ibuf(2)  (.O (state_int[2]), .I (state[2])) ;
    LD \lat_nextstate(2)  (.Q (nextstate_dup_0[2]), .D (state_int[1]), .G (
       nx45479z1)) ;
    LD \lat_nextstate(1)  (.Q (nextstate_dup_0[1]), .D (state_int[0]), .G (
       nx45479z1)) ;
    LD \lat_nextstate(0)  (.Q (nextstate_dup_0[0]), .D (state_int[2]), .G (
       nx45479z1)) ;
    LUT3 ix45479z1568 (.O (nx45479z1), .I0 (state_int[2]), .I1 (state_int[1]), .I2 (
         state_int[0])) ;
         defparam ix45479z1568.INIT = 8'hFE;
endmodule

