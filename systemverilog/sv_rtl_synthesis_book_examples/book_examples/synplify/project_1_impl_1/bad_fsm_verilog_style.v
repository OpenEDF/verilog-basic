//
// Verilog description for cell bad_fsm_verilog_style, 
// 02/06/14 02:54:35
//
// Precision RTL Synthesis, 2013a.9//


module bad_fsm_verilog_style ( clock, resetN, control ) ;

    input clock ;
    input resetN ;
    output [2:0]control ;

    wire [2:1]control_dup_0;



    OBUF \control_obuf(0)  (.O (control[0]), .I (control_dup_0[2])) ;
    OBUF \control_obuf(1)  (.O (control[1]), .I (control_dup_0[1])) ;
    OBUF \control_obuf(2)  (.O (control[2]), .I (control_dup_0[2])) ;
    VCC \control(1)_rename_rename  (.P (control_dup_0[1])) ;
    GND \control(2)_rename_rename  (.G (control_dup_0[2])) ;
endmodule

