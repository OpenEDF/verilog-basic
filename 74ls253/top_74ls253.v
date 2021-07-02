module top_74ls253 (
    input A, B,
    input [1:0] EN_n,
    input D1_0, D1_1, D1_2, D1_3,
    input D2_0, D2_1, D2_2, D2_3,
    output Y1, Y2
);

/* LEFT MUX 4 - 1 */
mux4_1 left_74ls253 (
    .EN_n(EN_n[0]),
    .A(A),
    .B(B),
    .D0(D1_0),
    .D1(D1_1),
    .D2(D1_2),
    .D3(D1_3),
    .Y(Y1)
);

/* RIGHT MUX 4 - 1 */
mux4_1 right_74ls253 (
    .EN_n(EN_n[1]),
    .A(A),
    .B(B),
    .D0(D2_0),
    .D1(D2_1),
    .D2(D2_2),
    .D3(D2_3),
    .Y(Y2)
);

endmodule
