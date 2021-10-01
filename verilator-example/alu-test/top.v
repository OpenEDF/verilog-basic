/* ---------------------------- */
/* timescale */
`timescale 1ns/10ps

module top (
    input wire [31:0] t_in1,
    input wire [31:0] t_in2,
    input wire [3:0] t_control,
    output wire [31:0] t_out,
    output wire t_zero,
    output wire t_neg
);

// top 
alu alu(
    .in1(t_in1),
    .in2(t_in2),
    .control(t_control),
    .out(t_out),
    .zero(t_zero),
    .neg(t_neg)
);


endmodule

/* ------------END------------- */
