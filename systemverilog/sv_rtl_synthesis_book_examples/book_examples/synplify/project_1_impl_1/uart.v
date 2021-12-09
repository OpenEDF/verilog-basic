//
// Verilog description for cell uart, 
// 12/22/13 20:16:24
//
// Precision RTL Synthesis, 2013a.9//


module uart ( data, data_rdy, serial_in, clock, reset ) ;

    output [7:0]data ;
    output data_rdy ;
    input serial_in ;
    input clock ;
    input reset ;

    wire \int_data(7)  , \int_data(6)  , \int_data(5)  , \int_data(4)  , 
         \int_data(3)  , \int_data(2)  , \int_data(1)  , \int_data(0)  , 
         int_data_rdy, int_serial_in, int_clock, int_reset, nx13021z1, 
         \state(0)  , \bit_cnt(2)  , nx22965z4, \bit_cnt(0)  , nx24959z1, 
         \bit_cnt(1)  , nx23962z2, nx23962z1, nx22965z2, nx22965z1, nx28524z1, 
         NOT_p_reset, nx29521z2, nx29521z1, nx22965z3;



    outpad \io_data(7)  (.P (data[7]), .A (\int_data(7)  )) ;
    outpad \io_data(6)  (.P (data[6]), .A (\int_data(6)  )) ;
    outpad \io_data(5)  (.P (data[5]), .A (\int_data(5)  )) ;
    outpad \io_data(4)  (.P (data[4]), .A (\int_data(4)  )) ;
    outpad \io_data(3)  (.P (data[3]), .A (\int_data(3)  )) ;
    outpad \io_data(2)  (.P (data[2]), .A (\int_data(2)  )) ;
    outpad \io_data(1)  (.P (data[1]), .A (\int_data(1)  )) ;
    outpad \io_data(0)  (.P (data[0]), .A (\int_data(0)  )) ;
    outpad io_data_rdy (.P (data_rdy), .A (int_data_rdy)) ;
    inpad io_serial_in (.Q (int_serial_in), .P (serial_in)) ;
    inpad io_reset (.Q (int_reset), .P (reset)) ;
    logic_0 ix13021z53416 (.a (nx13021z1)) ;
    dffc \reg_state(1)  (.Q (int_data_rdy), .D (nx28524z1), .CLK (int_clock), .CLR (
         NOT_p_reset)) ;
    and4i3 ix28524z45174 (.Q (nx28524z1), .A (\state(0)  ), .B (\bit_cnt(2)  ), 
           .C (\bit_cnt(1)  ), .D (\bit_cnt(0)  )) ;
    dffc \reg_state(0)  (.Q (\state(0)  ), .D (nx29521z1), .CLK (int_clock), .CLR (
         NOT_p_reset)) ;
    mux2x2 ix29521z22247 (.Q (nx29521z1), .A (nx29521z2), .B (nx22965z4), .S (
           \state(0)  )) ;
    and2i2 ix29521z1578 (.Q (nx29521z2), .A (int_serial_in), .B (int_data_rdy)
           ) ;
    and3i3 ix22965z56147 (.Q (nx22965z4), .A (\bit_cnt(2)  ), .B (\bit_cnt(1)  )
           , .C (\bit_cnt(0)  )) ;
    dff \reg_bit_cnt(2)  (.Q (\bit_cnt(2)  ), .D (nx22965z1), .CLK (int_clock)
        ) ;
    or3i1 ix22965z13631 (.Q (nx22965z1), .A (nx22965z2), .B (nx22965z4), .C (
          \state(0)  )) ;
    and2i1 ix22965z1579 (.Q (nx22965z2), .A (\bit_cnt(2)  ), .B (nx22965z3)) ;
    and2i2 ix22965z1584 (.Q (nx22965z3), .A (\bit_cnt(1)  ), .B (\bit_cnt(0)  )
           ) ;
    dff \reg_bit_cnt(1)  (.Q (\bit_cnt(1)  ), .D (nx23962z1), .CLK (int_clock)
        ) ;
    or3i1 ix23962z13631 (.Q (nx23962z1), .A (nx23962z2), .B (nx22965z3), .C (
          \state(0)  )) ;
    and2i0 ix23962z1580 (.Q (nx23962z2), .A (\bit_cnt(0)  ), .B (\bit_cnt(1)  )
           ) ;
    dff \reg_bit_cnt(0)  (.Q (\bit_cnt(0)  ), .D (nx24959z1), .CLK (int_clock)
        ) ;
    or2i2 ix24959z24599 (.Q (nx24959z1), .A (\bit_cnt(0)  ), .B (\state(0)  )) ;
    inv ix28524z16351 (.Q (NOT_p_reset), .A (int_reset)) ;
    dffepc \reg_data(0)  (.Q (\int_data(0)  ), .D (\int_data(1)  ), .EN (
           \state(0)  ), .CLK (int_clock), .PRE (nx13021z1), .CLR (NOT_p_reset)
           ) ;
    dffepc \reg_data(1)  (.Q (\int_data(1)  ), .D (\int_data(2)  ), .EN (
           \state(0)  ), .CLK (int_clock), .PRE (nx13021z1), .CLR (NOT_p_reset)
           ) ;
    dffepc \reg_data(2)  (.Q (\int_data(2)  ), .D (\int_data(3)  ), .EN (
           \state(0)  ), .CLK (int_clock), .PRE (nx13021z1), .CLR (NOT_p_reset)
           ) ;
    dffepc \reg_data(3)  (.Q (\int_data(3)  ), .D (\int_data(4)  ), .EN (
           \state(0)  ), .CLK (int_clock), .PRE (nx13021z1), .CLR (NOT_p_reset)
           ) ;
    dffepc \reg_data(4)  (.Q (\int_data(4)  ), .D (\int_data(5)  ), .EN (
           \state(0)  ), .CLK (int_clock), .PRE (nx13021z1), .CLR (NOT_p_reset)
           ) ;
    dffepc \reg_data(5)  (.Q (\int_data(5)  ), .D (\int_data(6)  ), .EN (
           \state(0)  ), .CLK (int_clock), .PRE (nx13021z1), .CLR (NOT_p_reset)
           ) ;
    dffepc \reg_data(6)  (.Q (\int_data(6)  ), .D (\int_data(7)  ), .EN (
           \state(0)  ), .CLK (int_clock), .PRE (nx13021z1), .CLR (NOT_p_reset)
           ) ;
    dffepc \reg_data(7)  (.Q (\int_data(7)  ), .D (int_serial_in), .EN (
           \state(0)  ), .CLK (int_clock), .PRE (nx13021z1), .CLR (NOT_p_reset)
           ) ;
    ckpad io_clock (.Q (int_clock), .P (clock)) ;
endmodule

