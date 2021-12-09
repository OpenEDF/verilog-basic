//
// Verilog description for cell exmp10c, 
// 02/06/14 23:21:40
//
// Precision RTL Synthesis, 2013a.9//


module exmp10c ( next_state, state ) ;

    output [2:0]next_state ;
    input [2:0]state ;

    wire [2:0]state_int;



    OBUF \next_state_obuf(0)  (.O (next_state[0]), .I (state_int[0])) ;
    OBUF \next_state_obuf(1)  (.O (next_state[1]), .I (state_int[1])) ;
    OBUF \next_state_obuf(2)  (.O (next_state[2]), .I (state_int[2])) ;
    IBUF \state_ibuf(0)  (.O (state_int[1]), .I (state[0])) ;
    IBUF \state_ibuf(1)  (.O (state_int[2]), .I (state[1])) ;
    IBUF \state_ibuf(2)  (.O (state_int[0]), .I (state[2])) ;
endmodule

